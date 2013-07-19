/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ihc.esa.report.rest.service;

import com.ihc.esa.report.entity.ExceptionSummaryReport;
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
@Path("exceptionSummaryReport")
@RequestScoped
public class ExceptionSummaryReportService {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of WeeklyStatusReportService
     */
    public ExceptionSummaryReportService() {
    }

    @GET
    @Path("run")
    @Produces({MediaType.TEXT_HTML})
    public String runFindAll(@PathParam("esaId") String esaId){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jdbc/esa");
        EntityManager em = emf.createEntityManager();
        Collection<ExceptionSummaryReport> dataList = em.createNamedQuery("ExceptionSummaryReport.findAll",com.ihc.esa.report.entity.ExceptionSummaryReport.class)
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
        report.append(ExceptionSummaryReport.getHtmlTableHeaders());
        for( ExceptionSummaryReport row: dataList ){
            report.append(row.toHtmlTableRow());
        }
        report.append("</table>\n</body>\n</html>\n");
        
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
        return("hello this is the exception summary report");
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
