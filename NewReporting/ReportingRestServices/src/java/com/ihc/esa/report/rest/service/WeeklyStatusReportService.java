/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ihc.esa.report.rest.service;

import com.ihc.esa.report.entity.WeeklyStatusReport;
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
@Path("weeklyStatusReport")
@RequestScoped
public class WeeklyStatusReportService {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of WeeklyStatusReportService
     */
    public WeeklyStatusReportService() {
    }

    @GET
    @Path("run/{esaId}")
    @Produces({MediaType.APPLICATION_XHTML_XML})
    public String runReport(@PathParam("esaId") String esaId){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jdbc/esa");
        EntityManager em = emf.createEntityManager();
        Collection<WeeklyStatusReport> dataList = em.createNamedQuery("WeeklyStatusReport.byArchitectId")
                                                    .setParameter("id", Long.valueOf(esaId))
                                                    .getResultList();
        
        StringBuilder report = new StringBuilder();
        
        for( WeeklyStatusReport row: dataList ){
            report.append(row.toTableRow());
        }
        
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
        return("hello this is the weekly status report");
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
