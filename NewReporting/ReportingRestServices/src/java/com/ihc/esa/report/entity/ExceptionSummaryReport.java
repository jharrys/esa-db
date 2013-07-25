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
@NamedQueries( { @NamedQuery(name = "ExceptionSummaryReport.findAll",
                             query = "select o from ExceptionSummaryReport o where o.activeExceptions > 0 or o.onHoldExceptions > 0 order by o.activeExceptions desc") })
@Table(name = "EXCEPTION_SUMMARY_REPORT")
public class ExceptionSummaryReport implements Serializable {
    @Id
    @Column(name = "VIEW_ROW_ID", insertable = false)
    private BigDecimal viewRowId;
    @Column(name = "ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name = "ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name = "ACTIVE_EXCEPTIONS", insertable = false)
    private BigDecimal activeExceptions;
    @Column(name = "CLOSED_EXCEPTIONS", insertable = false)
    private BigDecimal closedExceptions;
    @Column(name = "ON_HOLD_EXCEPTIONS", insertable = false)
    private BigDecimal onHoldExceptions;

    public ExceptionSummaryReport() {
    }

    public ExceptionSummaryReport(
            BigDecimal viewRowId,
            BigDecimal architectPartyId,
            String architectName,
            BigDecimal activeEvaluations,
            BigDecimal closedEvaluations,
            BigDecimal onHoldEvaluations) {
        this.viewRowId = viewRowId;
        this.architectPartyId = architectPartyId;
        this.architectName = architectName;
        this.activeExceptions = activeEvaluations;
        this.closedExceptions = closedEvaluations;
        this.onHoldExceptions = onHoldEvaluations;
    }


    public BigDecimal getActiveExceptions() {
        return activeExceptions;
    }

    public void setActiveExceptions(BigDecimal activeExceptions) {
        this.activeExceptions = activeExceptions;
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

    public BigDecimal getClosedExceptions() {
        return closedExceptions;
    }

    public void setClosedExceptions(BigDecimal closedEvaluations) {
        this.closedExceptions = closedEvaluations;
    }

    public BigDecimal getOnHoldExceptions() {
        return onHoldExceptions;
    }

    public void setOnHoldExceptions(BigDecimal onHoldExceptions) {
        this.onHoldExceptions = onHoldExceptions;
    }

    public BigDecimal getViewRowId() {
        return viewRowId;
    }

    public void setViewRowId(BigDecimal viewRowId) {
        this.viewRowId = viewRowId;
    }
    
    public String toHtmlTableRow(){
        return("<tr id=\""+this.viewRowId+"\" class=\"tableRow\">"+
               "<td class=\"tableField\" align=\"right\">"+this.architectPartyId+"</td>\n"+
               "<td class=\"tableField\">"+this.architectName+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.activeExceptions+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.closedExceptions+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.onHoldExceptions+"</td>\n"+
               "</tr>");
    }
    
    public static String getHtmlTableHeaders(){
        return("<tr><th>Architect Party Id</th><th>Architect Name</th><th>Active Exceptions</th><th>Closed Exceptions</th><th>On Hold Exceptions</th></tr>");
    }
}
