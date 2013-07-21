/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ihc.esa.report.rest.service;

import com.ihc.esa.report.entity.AllTypesSummaryReport;
import java.util.Collection;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author tssimpso
 */
@Path("allTypesSummaryReport")
@RequestScoped
public class AllTypesSummaryReportService {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of WeeklyStatusReportService
     */
    public AllTypesSummaryReportService() {
    }

    @GET
    @Path("run")
    @Produces({MediaType.TEXT_HTML})
    public String runFindAll(@PathParam("esaId") String esaId){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jdbc/esa");
        EntityManager em = emf.createEntityManager();
        Collection<AllTypesSummaryReport> dataList = em.createNamedQuery("AllTypesSummaryReport.findAll",com.ihc.esa.report.entity.AllTypesSummaryReport.class)
                                                    .getResultList();
        
        StringBuilder report = new StringBuilder();
        report.append("<!DOCTYPE html>\n");
        report.append("<html>\n");
        report.append("<head>\n");
        report.append("<META http-equiv=\"refresh\" content=\"5;\">\n");
        report.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"../../public/css/ReportTableStyle.css\"/>\n");
        report.append("</head>\n");
        report.append("<body>\n");
        report.append("<table>\n");
        report.append(AllTypesSummaryReport.getHtmlTableHeaders());
        for( AllTypesSummaryReport row: dataList ){
            report.append(row.toHtmlTableRow());
        }
        report.append("</table>\n</body>\n</html>\n");
        
        em.close();
        return( report.toString() );
    }

    @GET
    @Path("runJSONData")
    @Produces({MediaType.TEXT_PLAIN})
    public String runJSONData(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jdbc/esa");
        EntityManager em = emf.createEntityManager();
        Collection<AllTypesSummaryReport> dataList = em.createNamedQuery("AllTypesSummaryReport.findAll",com.ihc.esa.report.entity.AllTypesSummaryReport.class)
                                                    .getResultList();
        
        StringBuilder legend = new StringBuilder();
        legend.append("\"legend\" : [");
        StringBuilder dataSets = new StringBuilder();
        dataSets.append("\"datasets\" : [\n");
        int i = 1;
        
        int stepSize = 255/dataList.size();
        int nextBlue = 255;
        int nextRed = 0;
        String fillColor;
        String pointColor;
        for( AllTypesSummaryReport row: dataList ){
            fillColor = "rgba("+nextRed+",0,"+nextBlue+",.75)";
            pointColor = "rgba("+nextRed+",0,"+nextBlue+",1)";
            if(i == 1){ 
                legend.append("{\"architectName\":\"");
                legend.append(row.getArchitectName());
                legend.append("\",\"architectPartyId\":");
                legend.append(row.getArchitectPartyId());
                legend.append(",\"rgbaColor\":\"");
                legend.append(pointColor);
                legend.append("\"}");
                dataSets.append("{");
                dataSets.append("\"fillColor\" : \"");
                dataSets.append(fillColor);
                dataSets.append("\",");
                dataSets.append("\"strokeColor\" : \"");
                dataSets.append(pointColor);
                dataSets.append("\",");
                dataSets.append("\"strokeColor\" : \"");
                dataSets.append(pointColor);
                dataSets.append("\",");
                dataSets.append("\"pointStrokeColor\" : \"#fff\",");
                dataSets.append("\"data\" : [");
                dataSets.append(row.getActive());
                dataSets.append(",");
                dataSets.append(row.getClosed());
                dataSets.append(",");
                dataSets.append(row.getOnHold());
                dataSets.append("]}");
            }
            else{
                legend.append(",\n{\"architectName\":\"");
                legend.append(row.getArchitectName());
                legend.append("\",\"architectPartyId\":");
                legend.append(row.getArchitectPartyId());
                legend.append(",\"rgbaColor\":\"");
                legend.append(pointColor);
                legend.append("\"}");
                dataSets.append(",\n{");
                dataSets.append("\"fillColor\" : \"");
                dataSets.append(fillColor);
                dataSets.append("\",");
                dataSets.append("\"strokeColor\" : \"");
                dataSets.append(pointColor);
                dataSets.append("\",");
                dataSets.append("\"strokeColor\" : \"");
                dataSets.append(pointColor);
                dataSets.append("\",");
                dataSets.append("\"pointStrokeColor\" : \"#fff\",");
                dataSets.append("\"data\" : [");
                dataSets.append(row.getActive());
                dataSets.append(",");
                dataSets.append(row.getClosed());
                dataSets.append(",");
                dataSets.append(row.getOnHold());
                dataSets.append("]}");
            }
            i++;
            nextBlue -= stepSize;
            nextRed += stepSize;
        }
        
        legend.append("]");
        dataSets.append("]");
        StringBuilder labels = new StringBuilder();
        labels.append("\"labels\" : [\"Active\",\"Closed\",\"On Hold\"]");
        StringBuilder report = new StringBuilder();
        report.append("{");
        report.append(legend);
        report.append(",\n");
        report.append(labels);
        report.append(",\n");
        report.append(dataSets);
        report.append("}");
        em.close();
        
        return( report.toString() );
    }

    /**
     * Retrieves representation of an instance of com.ihc.esa.report.rest.service.WeeklyStatusReportService
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("text/html")
    public String getHtml() {
        //TODO return proper representation object
        return("hello this is the all types summary report");
    }

    /**
     * PUT method for updating or creating an instance of WeeklyStatusReportService
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @PUT
    @Consumes("text/html")
    public void putHtml(String content) {
    }
}
