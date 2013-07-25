/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ihc.esa.report.rest.service;

import com.ihc.esa.report.entity.DaysSinceLastUpdateReport;
import java.util.Collection;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author tssimpso
 */
@Path("daysSinceLastUpdateReport")
public class DaysSinceLastUpdateReportService {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of DaysSinceLastUpdateReportService
     */
    public DaysSinceLastUpdateReportService() {
    }

    @GET
    @Path("run")
    @Produces({MediaType.TEXT_HTML})
    public String runFindAll(@PathParam("esaId") String esaId){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jdbc/esa");
        EntityManager em = emf.createEntityManager();
        Collection<DaysSinceLastUpdateReport> dataList = em.createNamedQuery("DaysSinceLastUpdateReport.findAll",com.ihc.esa.report.entity.DaysSinceLastUpdateReport.class)
                                                    .getResultList();
        
        StringBuilder report = new StringBuilder();
        report.append("<!DOCTYPE html>\n");
        report.append("<html>\n");
        report.append("<head>\n");
        report.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"../../public/css/ReportTableStyle.css\"/>\n");
        report.append("</head>\n");
        report.append("<body>\n");
        report.append("<table>\n");
        report.append(DaysSinceLastUpdateReport.getHtmlTableHeaders());
        for( DaysSinceLastUpdateReport row: dataList ){
            report.append(row.toHtmlTableRow());
        }
        report.append("</table>\n</body>\n</html>\n");
        
        em.close();
        return( report.toString() );
    }
    

    @GET
    @Path("runByArchitect/{esaId}")
    @Produces({MediaType.TEXT_HTML})
    public String runByArchitectReport(@PathParam("esaId") String esaId){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jdbc/esa");
        EntityManager em = emf.createEntityManager();
        Collection<DaysSinceLastUpdateReport> dataList = em.createNamedQuery("DaysSinceLastUpdateReport.byArchitectId",com.ihc.esa.report.entity.DaysSinceLastUpdateReport.class)
                                                    .setParameter("id", Long.valueOf(esaId))
                                                    .getResultList();
        
        StringBuilder report = new StringBuilder();
        report.append("<!DOCTYPE html>\n");
        report.append("<html>\n");
        report.append("<head>\n");
        report.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"../../../public/css/ReportTableStyle.css\"/>\n");
        report.append("</head>\n");
        report.append("<body>\n");
        report.append("<table>\n");
        report.append(DaysSinceLastUpdateReport.getHtmlTableHeaders());
        for( DaysSinceLastUpdateReport row: dataList ){
            report.append(row.toHtmlTableRow());
        }
        report.append("</table>\n</body>\n</html>\n");
        
        em.close();
        return( report.toString() );
    }

    /**
     * Retrieves representation of an instance of com.ihc.esa.report.rest.service.DaysSinceLastUpdateReportService
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("text/html")
    public String getHtml() {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }

    /**
     * PUT method for updating or creating an instance of DaysSinceLastUpdateReportService
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @PUT
    @Consumes("text/html")
    public void putHtml(String content) {
    }
}
