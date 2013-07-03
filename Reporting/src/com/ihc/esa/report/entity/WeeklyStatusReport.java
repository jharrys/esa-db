package com.ihc.esa.report.entity;

import java.io.Serializable;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({
  @NamedQuery(name = "WeeklyStatusReport.findAll", query = "select o from WeeklyStatusReport o"),
  @NamedQuery(name = "WeeklyStatusReport.byArchitectId", query = "select o from WeeklyStatusReport o where c.architectPartyId = :id")
})
@Table(name = "WEEKLY_STATUS_REPORT")
public class WeeklyStatusReport implements Serializable {
    @Column(name="ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name="ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name="PROJECT_ACID#", nullable = false, insertable = false)
    private BigDecimal projectAcid_;
    @Column(name="PROJECT_NAME", nullable = false, length = 256, insertable = false)
    private String projectName;
    @Column(name="PROJECT_NOTE", length = 4000, insertable = false)
    private String projectNote;
    @Column(name="PROJECT_STATUS", length = 40, insertable = false)
    private String projectStatus;
    @Column(name="PROJECT_TYPE", length = 40, insertable = false)
    private String projectType;

    public WeeklyStatusReport() {
    }

    public WeeklyStatusReport(String architectName, BigDecimal architectPartyId, BigDecimal projectAcid_,
                              String projectName, String projectNote, String projectStatus, String projectType) {
        this.architectName = architectName;
        this.architectPartyId = architectPartyId;
        this.projectAcid_ = projectAcid_;
        this.projectName = projectName;
        this.projectNote = projectNote;
        this.projectStatus = projectStatus;
        this.projectType = projectType;
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

    public BigDecimal getProjectAcid_() {
        return projectAcid_;
    }

    public void setProjectAcid_(BigDecimal projectAcid_) {
        this.projectAcid_ = projectAcid_;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectNote() {
        return projectNote;
    }

    public void setProjectNote(String projectNote) {
        this.projectNote = projectNote;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

    public String getProjectType() {
        return projectType;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType;
    }

    @Override
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(getClass().getName()+"@"+Integer.toHexString(hashCode()));
        buffer.append('[');
        buffer.append("architectName=");
        buffer.append(getArchitectName());
        buffer.append(',');
        buffer.append("architectPartyId=");
        buffer.append(getArchitectPartyId());
        buffer.append(',');
        buffer.append("projectAcid_=");
        buffer.append(getProjectAcid_());
        buffer.append(',');
        buffer.append("projectName=");
        buffer.append(getProjectName());
        buffer.append(',');
        buffer.append("projectNote=");
        buffer.append(getProjectNote());
        buffer.append(',');
        buffer.append("projectStatus=");
        buffer.append(getProjectStatus());
        buffer.append(',');
        buffer.append("projectType=");
        buffer.append(getProjectType());
        buffer.append(']');
        return buffer.toString();
    }
}
