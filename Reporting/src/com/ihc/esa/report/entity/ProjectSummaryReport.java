package com.ihc.esa.report.entity;

import java.io.Serializable;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries( { @NamedQuery(name = "ProjectSummaryReport.findAll", query = "select o from ProjectSummaryReport o") })
@Table(name = "PROJECT_SUMMARY_REPORT")
public class ProjectSummaryReport implements Serializable {
    @Column(name = "ACTIVE_PROJECTS", insertable = false)
    private BigDecimal activeProjects;
    @Column(name = "ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name = "ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name = "CLOSED_PROJECTS", insertable = false)
    private BigDecimal closedProjects;
    @Column(name = "ON_HOLD_PROJECTS", insertable = false)
    private BigDecimal onHoldProjects;

    public ProjectSummaryReport() {
    }

    public ProjectSummaryReport(BigDecimal activeProjects, String architectName, BigDecimal architectPartyId,
                                BigDecimal closedProjects, BigDecimal onHoldProjects) {
        this.activeProjects = activeProjects;
        this.architectName = architectName;
        this.architectPartyId = architectPartyId;
        this.closedProjects = closedProjects;
        this.onHoldProjects = onHoldProjects;
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

    public void setClosedProjects(BigDecimal closedProjects) {
        this.closedProjects = closedProjects;
    }

    public BigDecimal getOnHoldProjects() {
        return onHoldProjects;
    }

    public void setOnHoldProjects(BigDecimal onHoldProjects) {
        this.onHoldProjects = onHoldProjects;
    }

    @Override
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(getClass().getName()+"@"+Integer.toHexString(hashCode()));
        buffer.append('[');
        buffer.append("activeProjects=");
        buffer.append(getActiveProjects());
        buffer.append(',');
        buffer.append("architectName=");
        buffer.append(getArchitectName());
        buffer.append(',');
        buffer.append("architectPartyId=");
        buffer.append(getArchitectPartyId());
        buffer.append(',');
        buffer.append("closedProjects=");
        buffer.append(getClosedProjects());
        buffer.append(',');
        buffer.append("onHoldProjects=");
        buffer.append(getOnHoldProjects());
        buffer.append(']');
        return buffer.toString();
    }
}
