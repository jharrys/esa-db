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
        
        StringBuffer report = new StringBuffer();
        
        for( WeeklyStatusReport row: dataList ){
            report.append(row.toTableRow());
        }
        
        em.close();
        return( Response.status(200).entity(report.toString()).build() );
    }
}
