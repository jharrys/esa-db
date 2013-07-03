package com.ihc.esa.report.entity;

import java.io.Serializable;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries( { @NamedQuery(name = "EvaluationSummaryReport.findAll",
                             query = "select o from EvaluationSummaryReport o") })
@Table(name = "EVALUATION_SUMMARY_REPORT")
public class EvaluationSummaryReport implements Serializable {
    @Column(name = "ACTIVE_EVALUATIONS", insertable = false)
    private BigDecimal activeEvaluations;
    @Column(name = "ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name = "ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name = "CLOSED_EVALUATIONS", insertable = false)
    private BigDecimal closedEvaluations;
    @Column(name = "ON_HOLD_EVALUATIONS", insertable = false)
    private BigDecimal onHoldEvaluations;

    public EvaluationSummaryReport() {
    }

    public EvaluationSummaryReport(BigDecimal activeEvaluations, String architectName, BigDecimal architectPartyId,
                                   BigDecimal closedEvaluations, BigDecimal onHoldEvaluations) {
        this.activeEvaluations = activeEvaluations;
        this.architectName = architectName;
        this.architectPartyId = architectPartyId;
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

    @Override
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(getClass().getName()+"@"+Integer.toHexString(hashCode()));
        buffer.append('[');
        buffer.append("activeEvaluations=");
        buffer.append(getActiveEvaluations());
        buffer.append(',');
        buffer.append("architectName=");
        buffer.append(getArchitectName());
        buffer.append(',');
        buffer.append("architectPartyId=");
        buffer.append(getArchitectPartyId());
        buffer.append(',');
        buffer.append("closedEvaluations=");
        buffer.append(getClosedEvaluations());
        buffer.append(',');
        buffer.append("onHoldEvaluations=");
        buffer.append(getOnHoldEvaluations());
        buffer.append(']');
        return buffer.toString();
    }
}
