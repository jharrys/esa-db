package org.intermountain.esa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GenGroovyObjects {
    
    private String hostIp = "192.168.56.101";
    private String port = "1521";
    private String sid = "esa";
    private String user = "esa";
    private String password = "esa";
    
    private String url = "jdbc:oracle:thin:@"+this.hostIp+":"+this.port+":"+this.sid;
    
    private Connection connection = null;
    
    public GenGroovyObjects() throws ClassNotFoundException, SQLException {
        this.getDatabaseConnection();
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
            "                         'NUMBER', 'Integer', \n" + 
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
            temp += "    "+rs.getString(1)+"\n";
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
            temp += "        "+rs.getString(1)+"\n";
        }
        
        ps.close();
        
        return(temp);
    }

    private String getListOfConstraints(String tableName) throws SQLException {
        String temp = "";
        PreparedStatement ps;
        ResultSet rs;
        String sql = 
            "select\n" +
            "  lower(substr(ucc.column_name,1,1))||\n" +
            "  substr(replace(initcap(ucc.column_name),'_',''),2)||\n" +
            "  ' nullable: false' as attribute,\n" +
            "  uc.search_condition\n" + 
            "from user_constraints uc,\n" + 
            "  user_cons_columns ucc\n" + 
            "where uc.table_name= ? \n" + 
            "  and ucc.constraint_name = uc.constraint_name\n" + 
            "  and uc.constraint_type='C'";

        ps = this.connection.prepareStatement(sql);
        ps.setString(1, tableName );
        
        rs = ps.executeQuery();
        
        while( rs.next() ){
            if( rs.getString(2).contains("IS NOT NULL") ){
                temp += "    "+rs.getString(1)+"\n";
            }
        }
        
        ps.close();
        
        return(temp);    }

    private String getListOfObjects() throws SQLException {
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
            temp = "";
            temp = "package org.ihc.esa.domain\n\n";
            temp+= "import java.util.Date\n";
            temp+= "import java.util.BigDecimal\n\n";
            temp+= "class "+rs.getString(1)+" {\n\n";
            temp+= this.getListOfColumns(rs.getString(2))+"\n";
            temp+= "    static mapping = {\n\n";
            temp+= "        id generator:'sequence', params:[sequence:'"+rs.getString(2)+"_SEQ']\n";
            temp+= "        table '"+rs.getString(2)+"'\n";
            temp+= "        version false\n\n";
            temp+= this.getListOfMappings(rs.getString(2))+"\n";
            temp+= "    }\n\n";
            temp+= "    static constraints = {\n\n";
            temp+= this.getListOfConstraints(rs.getString(2))+"\n";
            temp+= "    }\n\n";
            temp+= "}";
        }
        
        ps.close();
        
        return(temp);
    }
    
    protected void finalize() throws SQLException {
        this.connection.close();
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        GenGroovyObjects genGroovyObjects = new GenGroovyObjects();
        System.out.println(genGroovyObjects.getListOfObjects());
    }
}
