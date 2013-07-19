package com.ihc.esa.report.entity;

import java.io.Serializable;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries( { @NamedQuery(name = "ProjectSummaryReport.findAll",
                             query = "select o from ProjectSummaryReport o") })
@Table(name = "PROJECT_SUMMARY_REPORT")
public class ProjectSummaryReport implements Serializable {
    @Id
    @Column(name = "VIEW_ROW_ID", insertable = false)
    private BigDecimal viewRowId;
    @Column(name = "ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name = "ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name = "ACTIVE_PROJECTS", insertable = false)
    private BigDecimal activeProjects;
    @Column(name = "CLOSED_PROJECTS", insertable = false)
    private BigDecimal closedProjects;
    @Column(name = "ON_HOLD_PROJECTS", insertable = false)
    private BigDecimal onHoldProjects;

    public ProjectSummaryReport() {
    }

    public ProjectSummaryReport(
            BigDecimal viewRowId,
            BigDecimal architectPartyId,
            String architectName,
            BigDecimal activeEvaluations,
            BigDecimal closedEvaluations,
            BigDecimal onHoldEvaluations) {
        this.viewRowId = viewRowId;
        this.architectPartyId = architectPartyId;
        this.architectName = architectName;
        this.activeProjects = activeEvaluations;
        this.closedProjects = closedEvaluations;
        this.onHoldProjects = onHoldEvaluations;
    }


    public BigDecimal getActiveProjects() {
        return activeProjects;
    }

    public void setActiveProjects(BigDecimal activeProjects) {
        this.activeProjects = activeProjects;
    }

    public String getArchitectName() {
        return architectName;
    }

    public void setArchitectName(String architectName) {
        this.architectName = architectName;
    }

    public BigDecimal getArchitectPartyId() {
        return architectPartyId;
    }

    public void setArchitectPartyId(BigDecimal architectPartyId) {
        this.architectPartyId = architectPartyId;
    }

    public BigDecimal getClosedProjects() {
        return closedProjects;
    }

    public void setClosedProjects(BigDecimal closedEvaluations) {
        this.closedProjects = closedEvaluations;
    }

    public BigDecimal getOnHoldProjects() {
        return onHoldProjects;
    }

    public void setOnHoldProjects(BigDecimal onHoldProjects) {
        this.onHoldProjects = onHoldProjects;
    }

    public BigDecimal getViewRowId() {
        return viewRowId;
    }

    public void setViewRowId(BigDecimal viewRowId) {
        this.viewRowId = viewRowId;
    }
    
    public String toHtmlTableRow(){
        return("<tr id=\""+this.viewRowId+"\" class=\"tableRow\">"+
               "<td class=\"tableField\" align=\"right\">"+this.viewRowId+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.architectPartyId+"</td>\n"+
               "<td class=\"tableField\">"+this.architectName+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.activeProjects+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.closedProjects+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.onHoldProjects+"</td>\n"+
               "</tr>");
    }
    
    public static String getHtmlTableHeaders(){
        return("<tr><th>View Row Id</th><th>Architect Party Id</th><th>Architect Name</th><th>Active Projects</th><th>Closed Projects</th><th>On Hold Projects</th></tr>");
    }
}
