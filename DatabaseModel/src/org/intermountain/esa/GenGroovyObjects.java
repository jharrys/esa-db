package org.intermountain.esa;

import java.io.BufferedWriter;
import java.io.FileWriter;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GenGroovyObjects {
    
    private String hostIp = "192.168.56.101";
    private String port = "1521";
    private String sid = "esa";
    private String user = "esa";
    private String password = "esa";
    private String fileLocation = "C:\\crap\\";
        
    private String url = "jdbc:oracle:thin:@"+this.hostIp+":"+this.port+":"+this.sid;
    
    private Connection connection = null;
    
    public GenGroovyObjects() throws ClassNotFoundException, SQLException {
        this.getDatabaseConnection();
    }
    
    private void saveGroovyObject( String objectName, String objectSource ) throws IOException {
        BufferedWriter out = new BufferedWriter(new FileWriter(this.fileLocation+objectName+".groovy"));
        out.write(objectSource);
        out.close();
    }
    
    private void getDatabaseConnection() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.OracleDriver");
        this.connection = DriverManager.getConnection(this.url, this.user, this.password);
    }
    
    private String getListOfColumns(String tableName) throws SQLException {
        String temp = "";
        PreparedStatement ps;
        ResultSet rs;
        String sql = 
            "select decode(data_type, 'VARCHAR2','String',\n" + 
            "                         'NUMBER', 'BigDecimal', \n" + 
            "                         'DATE', 'Date',\n" + 
            "                         'FLOAT', 'BigDecimal', \n" + 
            "                         data_type||' not supported')||' '||\n" +
            "       lower(substr(column_name,1,1))||\n" +
            "       substr(replace(initcap(column_name),'_',''),2)\n" + 
            "from user_tab_columns\n" + 
            "where table_name= ? \n" + 
            "order by column_id";

        ps = this.connection.prepareStatement(sql);
        ps.setString(1, tableName );
        
        rs = ps.executeQuery();
        
        while( rs.next() ){
        	String s = rs.getString(1);
        	
        	// GORM likes to handle id's itself
        	if (s.equalsIgnoreCase("BigDecimal id"))
        		continue;
        	
            temp += "    " + s + "\n";
        }
        
        ps.close();
        
        return(temp);
    }
    
    private String getListOfMappings(String tableName) throws SQLException {
        String temp = "";
        PreparedStatement ps;
        ResultSet rs;
        String sql = 
            "select\n" +
            "  lower(substr(column_name,1,1))||\n" +
            "  substr(replace(initcap(column_name),'_',''),2)||\n" +
            "  ' column: '''||column_name||''''\n" + 
            "from user_tab_columns\n" + 
            "where table_name= ? \n" + 
            "order by column_id";

        ps = this.connection.prepareStatement(sql);
        ps.setString(1, tableName );
        
        rs = ps.executeQuery();
        
        while( rs.next() ){
        	String s = rs.getString(1);
        	
        	// GORM likes to handle id's itself
        	if (s.equalsIgnoreCase("id column: 'ID'"))
        		continue;
        	
            temp += "        " + s +"\n";
        }
        temp += "\n";
        
        ps.close();
        
        return(temp);
    }

    private String getListOfConstraints(String tableName) throws SQLException {
        String temp = "";
        PreparedStatement ps;
        ResultSet rs;
        String sql = 
            "select\n" + 
            "  lower(substr(tc.column_name,1,1))||\n" + 
            "  substr(replace(initcap(tc.column_name),'_',''),2)||\n" + 
            "  ' nullable: '||decode( uc.constraint_type, NULL,'true','false') as attribute,\n" + 
            "  uc.search_condition\n" + 
            "from user_constraints uc, \n" + 
            "  user_cons_columns ucc,\n" + 
            "  user_tab_columns tc\n" + 
            "where tc.table_name= ?\n" + 
            "  and ucc.table_name(+) = tc.table_name\n" + 
            "  and ucc.column_name(+) = tc.column_name\n" + 
            "  and ucc.constraint_name = uc.constraint_name(+)\n" + 
            "  and ( uc.constraint_type = 'C' or uc.constraint_type is null )\n" + 
            "order by tc.column_id";

        ps = this.connection.prepareStatement(sql);
        ps.setString(1, tableName );
        
        rs = ps.executeQuery();
        
        while( rs.next() ){
        	String s = rs.getString(1);
        	
        	// GORM likes to handle id's itself
        	if (s.startsWith("id "))
        		continue;
        	
        	// For GORM to autotimestamp we need to NOT declare constraints on creationDate or updateDat
        	if (s.startsWith("creationDate ") || s.startsWith("updateDate "))
        		continue;
        	
            temp += "        " + s + "\n";
        }
        
        ps.close();
        
        return(temp);
    }

    private String getListOfHasMany(String tableName) throws SQLException {
        String temp = "";
        PreparedStatement ps;
        ResultSet rs;
        int rowCount = 0;
        
        String sql = 
            "select\n" + 
            "  lower(substr(ucc_fk.constraint_name,1,1))||\n" + 
            "  substr(replace(initcap(replace(ucc_fk.constraint_name,'_FK','')),'_',''),2)||': '||\n" + 
            "  replace(initcap(ucc_fk.table_name),'_','') hasMany\n" + 
            "from user_constraints uc,\n" + 
            "  user_constraints uc_fk,\n" + 
            "  user_cons_columns ucc_pk,\n" + 
            "  user_cons_columns ucc_fk\n" + 
            "where uc.table_name= ? \n" + 
            "  and uc_fk.r_constraint_name = uc.constraint_name\n" + 
            "  and ucc_pk.constraint_name = uc.constraint_name\n" + 
            "  and ucc_fk.constraint_name = uc_fk.constraint_name\n" + 
            "  and uc.constraint_type='P'";

        ps = this.connection.prepareStatement(sql);
        ps.setString(1, tableName );
        
        rs = ps.executeQuery();
        
        temp = "    static hasMany = [\n";
        while( rs.next() ){
            rowCount++;
            
            temp += "        "+rs.getString(1)+",\n";;
        }
        temp = temp.substring(0,temp.length()-2);
        temp += "\n    ]\n\n";
        
        ps.close();
        
        if( rowCount == 0 ){ return(""); }
        
        return(temp);
    }

    private String getListOfBelongsTo(String tableName) throws SQLException {
        String temp = "";
        PreparedStatement ps;
        ResultSet rs;
        int rowCount = 0;
        
        String sql = 
            "select\n" +
            "  lower(substr(ucc_fk.column_name,1,1))||\n" +
            "  substr(replace(initcap(replace(ucc_fk.column_name,'_ID','')),'_',''),2)||\n" +
            "  ': '||replace(initcap(uc_pk.table_name),'_','')\n" + 
            "from\n" + 
            "  user_constraints uc_fk,\n" + 
            "  user_cons_columns ucc_fk,\n" + 
            "  user_constraints uc_pk\n" + 
            "where uc_fk.table_name= ? \n" + 
            "  and ucc_fk.constraint_name = uc_fk.constraint_name\n" + 
            "  and uc_pk.constraint_name = uc_fk.r_constraint_name\n" + 
            "  and uc_fk.constraint_type='R'";

        ps = this.connection.prepareStatement(sql);
        ps.setString(1, tableName );
        
        rs = ps.executeQuery();
        
        temp = "    static belongsTo = [\n";
        while( rs.next() ){
            rowCount++;
       
            temp += "        "+rs.getString(1)+",\n";
        }
        temp = temp.substring(0,temp.length()-2);
        temp += "\n    ]\n\n";
        
        ps.close();
        
        if( rowCount == 0 ){ return(""); }

        return(temp);
    }

    private String getListOfHasManyMappings(String tableName) throws SQLException {
        String temp = "";
        PreparedStatement ps;
        ResultSet rs;
        int rowCount = 0;
        
        String sql = 
            "select\n" + 
            "  lower(substr(ucc_fk.constraint_name,1,1))||substr(replace(initcap(replace(ucc_fk.constraint_name,'_FK','')),'_',''),2)||\n" + 
            "  ' joinTable: [ name: '''||ucc_fk.table_name||''', key: '''||ucc_fk.column_name||''']'\n" + 
            "from user_constraints uc,\n" + 
            "  user_constraints uc_fk,\n" + 
            "  user_cons_columns ucc_pk,\n" + 
            "  user_cons_columns ucc_fk\n" + 
            "where uc.table_name= ? \n" + 
            "  and uc_fk.r_constraint_name = uc.constraint_name\n" + 
            "  and ucc_pk.constraint_name = uc.constraint_name\n" + 
            "  and ucc_fk.constraint_name = uc_fk.constraint_name\n" + 
            "  and uc.constraint_type='P'";

        ps = this.connection.prepareStatement(sql);
        ps.setString(1, tableName );
        
        rs = ps.executeQuery();
        
        while( rs.next() ){
            rowCount++;
            temp += "        "+rs.getString(1)+"\n";
        }
        temp += "\n";
        
        ps.close();
        
        if(rowCount == 0 ){ return(""); }
        
        return(temp);
    }

    private String getListOfBelongsToMappings(String tableName) throws SQLException {
        String temp = "";
        PreparedStatement ps;
        ResultSet rs;
        int rowCount = 0;
        
        String sql = 
            "select\n" + 
            "  lower(substr(ucc_fk.column_name,1,1))||\n" + 
            "  substr(replace(initcap(replace(ucc_fk.column_name,'_ID','')),'_',''),2)||\n" + 
            "  ' joinTable: [ name:'''||uc_pk.table_name||''', key: '''||ucc_fk.column_name||''' ]'\n" + 
            "from \n" + 
            "  user_constraints uc_fk, \n" + 
            "  user_cons_columns ucc_fk, \n" + 
            "  user_constraints uc_pk \n" + 
            "where uc_fk.table_name= ?\n" + 
            "  and ucc_fk.constraint_name = uc_fk.constraint_name \n" + 
            "  and uc_pk.constraint_name = uc_fk.r_constraint_name \n" + 
            "  and uc_fk.constraint_type='R'";

        ps = this.connection.prepareStatement(sql);
        ps.setString(1, tableName );
        
        rs = ps.executeQuery();
        
        while( rs.next() ){
            rowCount++;
            temp += "        "+rs.getString(1)+"\n";
        }
        temp += "\n";
        
        ps.close();
        
        if(rowCount == 0 ){ return(""); }
        
        return(temp);
    }

    private String getListOfObjects() throws SQLException, IOException {
        String temp = "";
        PreparedStatement ps;
        ResultSet rs;
        String sql = 
            "select\n" + 
            "  replace(initcap(table_name),'_','') object, table_name\n" + 
            "from user_tables";

        ps = this.connection.prepareStatement(sql);
        
        rs = ps.executeQuery();
        
        while( rs.next() ){
            System.out.println("Building object "+rs.getString(1));
            temp = "";
            temp = "package org.ihc.esa.domain\n\n";
            temp+= "import java.util.Date\n";
            temp+= "class "+rs.getString(1)+" {\n\n";
            temp+= this.getListOfColumns(rs.getString(2))+"\n";
            temp+= this.getListOfHasMany(rs.getString(2));
            temp+= this.getListOfBelongsTo(rs.getString(2));
            temp+= "    static mapping = {\n\n";
            temp+= "        id generator:'sequence', params:[sequence:'"+rs.getString(2)+"_SEQ']\n";
            temp+= "        table '"+rs.getString(2)+"'\n";
            temp+= "        version false\n\n";
            temp+= this.getListOfHasManyMappings(rs.getString(2));
            temp+= this.getListOfBelongsToMappings(rs.getString(2));
            temp+= this.getListOfMappings(rs.getString(2));
            temp+= "    }\n\n";
            temp+= "    static constraints = {\n\n";
            temp+= this.getListOfConstraints(rs.getString(2))+"\n";
            temp+= "    }\n\n";
            temp+= "}";
            
            this.saveGroovyObject(rs.getString(1), temp);
        }
        
        ps.close();
        
        return(temp);
    }
    
    protected void finalize() throws SQLException {
        this.connection.close();
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException, IOException {
        GenGroovyObjects genGroovyObjects = new GenGroovyObjects();
        System.out.println(genGroovyObjects.getListOfObjects());
    }
}
