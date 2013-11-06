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
@NamedQueries( { @NamedQuery(name = "AllTypesSummaryReport.findAll",
                             query = "select o from AllTypesSummaryReport o where o.active > 0 or o.onHold > 0 order by o.active desc") })
@Table(name = "ALL_TYPES_SUMMARY_REPORT")
public class AllTypesSummaryReport implements Serializable {
    @Id
    @Column(name = "VIEW_ROW_ID", insertable = false)
    private BigDecimal viewRowId;
    @Column(name = "ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name = "ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name = "ACTIVE", insertable = false)
    private BigDecimal active;
    @Column(name = "CLOSED", insertable = false)
    private BigDecimal closed;
    @Column(name = "ON_HOLD", insertable = false)
    private BigDecimal onHold;

    public AllTypesSummaryReport() {
    }

    public AllTypesSummaryReport(
            BigDecimal viewRowId,
            BigDecimal architectPartyId,
            String architectName,
            BigDecimal active,
            BigDecimal closed,
            BigDecimal onHold) {
        this.viewRowId = viewRowId;
        this.architectPartyId = architectPartyId;
        this.architectName = architectName;
        this.active = active;
        this.closed = closed;
        this.onHold = onHold;
    }


    public BigDecimal getActive() {
        return active;
    }

    public void setActive(BigDecimal active) {
        this.active = active;
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

    public BigDecimal getClosed() {
        return closed;
    }

    public void setClosed(BigDecimal closedEvaluations) {
        this.closed = closedEvaluations;
    }

    public BigDecimal getOnHold() {
        return onHold;
    }

    public void setOnHold(BigDecimal onHold) {
        this.onHold = onHold;
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
               "<td class=\"tableField\" align=\"right\">"+this.active+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.closed+"</td>\n"+
               "<td class=\"tableField\" align=\"right\">"+this.onHold+"</td>\n"+
               "</tr>");
    }
    
    public static String getHtmlTableHeaders(){
        return("<tr><th>Architect Party Id</th><th>Architect Name</th><th>Active</th><th>Closed</th><th>On Hold</th></tr>");
    }
}
