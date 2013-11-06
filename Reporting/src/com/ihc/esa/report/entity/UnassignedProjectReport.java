package com.ihc.esa.report.entity;

import java.io.Serializable;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries( { @NamedQuery(name = "UnassignedProjectReport.findAll",
                             query = "select o from UnassignedProjectReport o") })
@Table(name = "UNASSIGNED_PROJECT_REPORT")
public class UnassignedProjectReport implements Serializable {
    @Column(name = "PROJECT_ACID#", nullable = false, insertable = false)
    private BigDecimal projectAcid_;
    @Column(name = "PROJECT_NAME", nullable = false, length = 256, insertable = false)
    private String projectName;
    @Column(name = "PROJECT_STATUS", length = 40, insertable = false)
    private String projectStatus;
    @Column(name = "PROJECT_TYPE", length = 40, insertable = false)
    private String projectType;

    public UnassignedProjectReport() {
    }

    public UnassignedProjectReport(BigDecimal projectAcid_, String projectName, String projectStatus,
                                   String projectType) {
        this.projectAcid_ = projectAcid_;
        this.projectName = projectName;
        this.projectStatus = projectStatus;
        this.projectType = projectType;
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
        buffer.append("projectAcid_=");
        buffer.append(getProjectAcid_());
        buffer.append(',');
        buffer.append("projectName=");
        buffer.append(getProjectName());
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
