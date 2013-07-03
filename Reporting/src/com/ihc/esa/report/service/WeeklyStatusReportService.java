package com.ihc.esa.report.service;

import com.ihc.esa.report.entity.WeeklyStatusReport;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import javax.persistence.Persistence;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("report/weeklyStatus")
public class WeeklyStatusReportService {
    public WeeklyStatusReportService() {
    }
    
    @GET
    @Path("run/{esaId}")
    @Produces({MediaType.APPLICATION_XHTML_XML})
    public Response runReport(@PathParam("esaId") String esaId){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jdbc/esa");
        EntityManager em = emf.createEntityManager();
        Collection<WeeklyStatusReport> dataList = em.createNamedQuery("WeeklyStatusReport.byArchitectId")
                                                    .setParameter("id", Long.valueOf(esaId))
                                                    .getResultList();
        
        String report = 
        "<html>" +
        "  <head>\n" + 
        "    <meta http-equiv=\"content-type\" " +
        "          content=\"text/html;" +
        "          charset=Cp1252\">\n" + 
        "    <!-- base href=\"http://apexdev.us.oracle.com:7778/pls/apx11w/\" -->\n" + 
        "    <style type=\"text/css\">" +
        "    </style>" +
        "  </head>" +
        "  <body>" +
        "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">" +
        "      <tr>" +
        "        <th>PARTY_ID</th>\n" +
        "        <th>ARCHITECT_NAME</th>\n" + 
        "        <th>PROJECT_ACID#</th>\n" + 
        "        <th>PROJECT_NAME</th>\n" + 
        "        <th>STATUS</th>\n" + 
        "        <th>TYPE</th>\n" + 
        "        <th>NOTE</th>\n" +
        "      </tr>" +
        "      <tbody id=\"data\">";
        
        for( WeeklyStatusReport row: dataList ){
            report += 
                "        <tr><td align=\"right\">"+row.getArchitectPartyId()+"</td>"+
                "<td>"+row.getArchitectName()+"</td>"+
                "<td align=\"right\">"+row.getProjectAcid_()+"</td>"+
                "<td>"+row.getProjectName()+"</td>"+
                "<td>"+row.getProjectStatus()+"</td>"+
                "<td>"+row.getProjectType()+"</td>"+
                "<td>"+row.getProjectNote()+"</td>"+
                "</tr>\n";
        }
        
        report+=
        "      </tbody>\n" +
        "    </table>\n" +
        "  </body>\n" +
        "</html>\n";
        
        em.close();
        return( Response.status(200).entity(report).build() );
    }
}
