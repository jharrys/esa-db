package com.ihc.esa.report.entity;

import java.io.Serializable;

import java.math.BigDecimal;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({
  @NamedQuery(name = "WeeklyStatusReport.findAll", query = "select o from WeeklyStatusReport o"),
  @NamedQuery(name = "WeeklyStatusReport.byArchitectId", query = "select o from WeeklyStatusReport o where o.architectPartyId = :id"),
  @NamedQuery(name = "WeeklyStatusReport.byType", query = "select o from WeeklyStatusReport o where o.projectType = :type")
})
@Table(name = "WEEKLY_STATUS_REPORT")
public class WeeklyStatusReport implements Serializable {
    @Column(name="ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name="ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name="PROJECT_ACID_NUMBER", nullable = false, insertable = false)
    private BigDecimal projectAcidNumber;
    @Column(name="PROJECT_NAME", nullable = false, length = 256, insertable = false)
    private String projectName;
    @Column(name="LAST_NOTE", length = 4000, insertable = false)
    private String lastNote;
    @Column(name="PROJECT_STATUS", length = 40, insertable = false)
    private String projectStatus;
    @Column(name="PROJECT_TYPE", length = 40, insertable = false)
    private String projectType;
    @Column(name = "DATE_CREATED", insertable = false)
    private Date dateCreated;
    @Column(name = "LAST_UPDATED", insertable = false)
    private Date lastUpdated;
    @Column(name = "DATE_START", insertable = false)
    private Date dateStart;
    @Column(name = "DATE_COMPLETED", insertable = false)
    private Date dateCompleted;
    @Column(name = "PROJECT_DURATION", insertable = false)
    private BigDecimal projectDuration;
    @Column(name = "PROJECT_ACTIVITY_DURATION", insertable = false)
    private BigDecimal projectActivityDuration;

    

    public WeeklyStatusReport() {
    }

    public WeeklyStatusReport(String architectName, BigDecimal architectPartyId, BigDecimal projectAcidNumber,
                              String projectName, String lastNote, String projectStatus, String projectType,
                              Date dateCreated, Date lastUpdated, Date dateStart, Date dateCompleted,
                              BigDecimal projectDuration) {
        super();
        this.architectName = architectName;
        this.architectPartyId = architectPartyId;
        this.projectAcidNumber = projectAcidNumber;
        this.projectName = projectName;
        this.lastNote = lastNote;
        this.projectStatus = projectStatus;
        this.projectType = projectType;
        this.dateCreated = dateCreated;
        this.lastUpdated = lastUpdated;
        this.dateStart = dateStart;
        this.dateCompleted = dateCompleted;
        this.projectDuration = projectDuration;
    }

    public void setArchitectName(String architectName) {
        this.architectName = architectName;
    }

    public String getArchitectName() {
        return architectName;
    }

    public void setArchitectPartyId(BigDecimal architectPartyId) {
        this.architectPartyId = architectPartyId;
    }

    public BigDecimal getArchitectPartyId() {
        return architectPartyId;
    }

    public void setProjectAcidNumber(BigDecimal projectAcidNumber) {
        this.projectAcidNumber = projectAcidNumber;
    }

    public BigDecimal getProjectAcidNumber() {
        return projectAcidNumber;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setLastNote(String lastNote) {
        this.lastNote = lastNote;
    }

    public String getLastNote() {
        return lastNote;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType;
    }

    public String getProjectType() {
        return projectType;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateCompleted(Date dateCompleted) {
        this.dateCompleted = dateCompleted;
    }

    public Date getDateCompleted() {
        return dateCompleted;
    }

    public void setProjectDuration(BigDecimal pojectDuration) {
        this.projectDuration = pojectDuration;
    }

    public BigDecimal getProjectDuration() {
        return projectDuration;
    }

    public void setProjectActivityDuration(BigDecimal projectActivityDuration) {
        this.projectActivityDuration = projectActivityDuration;
    }

    public BigDecimal getProjectActivityDuration() {
        return projectActivityDuration;
    }
    
    public String toTableRow(){
        return( "<tr>"+
                "<td align=\"right\">"+this.architectPartyId+"</td>"+
                "<td>"+this.architectName+"</td>"+
                "<td align=\"right\">"+this.projectAcidNumber+"</td>"+
                "<td>"+this.projectName+"</td>"+
                "<td>"+this.projectStatus+"</td>"+
                "<td>"+this.projectType+"</td>"+
                "<td>"+this.dateCreated+"</td>"+
                "<td>"+this.lastUpdated+"</td>"+
                "<td>"+this.dateStart+"</td>"+
                "<td>"+this.dateCompleted+"</td>"+
                "<td align=\"right\">"+this.projectDuration+"</td>"+
                "<td align=\"right\">"+this.projectActivityDuration+"</td>"+
                "<td>"+this.lastNote+"</td>"+
                "<tr>\n"
              );
    }
}
