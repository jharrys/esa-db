/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ihc.esa.report.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import org.apache.commons.lang3.StringEscapeUtils;

/**
 *
 * @author tssimpso
 */
@Entity
@NamedQueries( { @NamedQuery(name = "DaysSinceLastUpdateReport.findAll",
                             query = "select o from DaysSinceLastUpdateReport o") })
@Table(name = "DAYS_SINCE_LAST_UPDATE_REPORT")
public class DaysSinceLastUpdateReport implements Serializable {
    @Id
    @Column(name = "VIEW_ROW_ID", insertable = false)
    private BigDecimal viewRowId;
    @Column(name="ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name="ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name="PROJECT_NAME", nullable = false, length = 256, insertable = false)
    private String projectName;
    @Column(name="DAYS_SINCE_LAST_UPDATE", nullable = false, insertable = false)
    private BigDecimal daysSinceLastUpdate;
    
    public DaysSinceLastUpdateReport(){
    }

    public DaysSinceLastUpdateReport(BigDecimal viewRowId, BigDecimal architectPartyId, String architectName, String projectName, BigDecimal daysSinceLastUpdate) {
        this.viewRowId = viewRowId;
        this.architectPartyId = architectPartyId;
        this.architectName = architectName;
        this.projectName = projectName;
        this.daysSinceLastUpdate = daysSinceLastUpdate;
    }

    public BigDecimal getViewRowId() {
        return viewRowId;
    }

    public void setViewRowId(BigDecimal viewRowId) {
        this.viewRowId = viewRowId;
    }

    public BigDecimal getArchitectPartyId() {
        return architectPartyId;
    }

    public void setArchitectPartyId(BigDecimal architectPartyId) {
        this.architectPartyId = architectPartyId;
    }

    public String getArchitectName() {
        return architectName;
    }

    public void setArchitectName(String architectName) {
        this.architectName = architectName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public BigDecimal getDaysSinceLastUpdate() {
        return daysSinceLastUpdate;
    }

    public void setDaysSinceLastUpdate(BigDecimal daysSinceLastUpdate) {
        this.daysSinceLastUpdate = daysSinceLastUpdate;
    }
    
    public String toHtmlTableRow(){
        return("<tr id=\""+this.viewRowId+"\" class=\"tableRow\">"+
                "<td class=\"tableField\" align=\"right\">"+this.viewRowId+"</td>\n"+
                "<td class=\"tableField\" align=\"right\">"+this.architectPartyId+"</td>\n"+
                "<td class=\"tableField\">"+this.architectName+"</td>\n"+
                "<td class=\"tableField\">"+this.projectName+"</td>\n"+
                "<td class=\"tableField\">"+this.daysSinceLastUpdate+"</td>\n"+
                "</tr>\n");
    }
    
    public static String getHtmlTableHeaders(){
        return("<tr>"
                + "<th>View Row Id</th>"
                + "<th>Architect Party Id</th>"
                + "<th>Architect Name</th>"
                + "<th>Project Name</th>"
                + "<th>Days Since Last Update</th>"
                + "</tr>");
    }
}
