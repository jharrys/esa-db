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
@NamedQueries( { @NamedQuery(name = "EvaluationSummaryReport.findAll",
                             query = "select o from EvaluationSummaryReport o where o.activeEvaluations > 0 or o.onHoldEvaluations > 0 order by o.activeEvaluations desc") })
@Table(name = "EVALUATION_SUMMARY_REPORT")
public class EvaluationSummaryReport implements Serializable {
    @Id
    @Column(name = "VIEW_ROW_ID", insertable = false)
    private BigDecimal viewRowId;
    @Column(name = "ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name = "ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name = "ACTIVE_EVALUATIONS", insertable = false)
    private BigDecimal activeEvaluations;
    @Column(name = "CLOSED_EVALUATIONS", insertable = false)
    private BigDecimal closedEvaluations;
    @Column(name = "ON_HOLD_EVALUATIONS", insertable = false)
    private BigDecimal onHoldEvaluations;

    public EvaluationSummaryReport() {
    }

    public EvaluationSummaryReport(
            BigDecimal viewRowId,
            BigDecimal architectPartyId,
            String architectName,
            BigDecimal activeEvaluations,
            BigDecimal closedEvaluations,
            BigDecimal onHoldEvaluations) {
        this.viewRowId = viewRowId;
        this.architectPartyId = architectPartyId;
        this.architectName = architectName;
        this.activeEvaluations = activeEvaluations;
        this.closedEvaluations = closedEvaluations;
        this.onHoldEvaluations = onHoldEvaluations;
    }


    public BigDecimal getActiveEvaluations() {
        return activeEvaluations;
    }

    public void setActiveEvaluations(BigDecimal activeEvaluations) {
        this.activeEvaluations = activeEvaluations;
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

    public BigDecimal getClosedEvaluations() {
        return closedEvaluations;
    }

    public void setClosedEvaluations(BigDecimal closedEvaluations) {
        this.closedEvaluations = closedEvaluations;
    }

    public BigDecimal getOnHoldEvaluations() {
        return onHoldEvaluations;
    }

    public void setOnHoldEvaluations(BigDecimal onHoldEvaluations) {
        this.onHoldEvaluations = onHoldEvaluations;
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
               "<td class=\"tableField\" align=\"right\">"+this.activeEvaluations+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.closedEvaluations+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.onHoldEvaluations+"</td>\n"+
               "</tr>");
    }
    
    public static String getHtmlTableHeaders(){
        return("<tr><th>View Row Id</th><th>Architect Party Id</th><th>Architect Name</th><th>Active Evaluations</th><th>Closed Evaluations</th><th>On Hold Evaluations</th></tr>");
    }
}
