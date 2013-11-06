package com.ihc.esa.report.entity;

import java.io.Serializable;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries( { @NamedQuery(name = "ExceptionSummaryReport.findAll",
                             query = "select o from ExceptionSummaryReport o") })
@Table(name = "EXCEPTION_SUMMARY_REPORT")
public class ExceptionSummaryReport implements Serializable {
    @Column(name = "ACTIVE_EXCEPTIONS", insertable = false)
    private BigDecimal activeExceptions;
    @Column(name = "ARCHITECT_NAME", length = 128, insertable = false)
    private String architectName;
    @Column(name = "ARCHITECT_PARTY_ID", nullable = false, insertable = false)
    private BigDecimal architectPartyId;
    @Column(name = "CLOSED_EXCEPTIONS", insertable = false)
    private BigDecimal closedExceptions;
    @Column(name = "ON_HOLD_EXCEPTIONS", insertable = false)
    private BigDecimal onHoldExceptions;

    public ExceptionSummaryReport() {
    }

    public ExceptionSummaryReport(BigDecimal activeExceptions, String architectName, BigDecimal architectPartyId,
                                  BigDecimal closedExceptions, BigDecimal onHoldExceptions) {
        this.activeExceptions = activeExceptions;
        this.architectName = architectName;
        this.architectPartyId = architectPartyId;
        this.closedExceptions = closedExceptions;
        this.onHoldExceptions = onHoldExceptions;
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

    public void setClosedExceptions(BigDecimal closedExceptions) {
        this.closedExceptions = closedExceptions;
    }

    public BigDecimal getOnHoldExceptions() {
        return onHoldExceptions;
    }

    public void setOnHoldExceptions(BigDecimal onHoldExceptions) {
        this.onHoldExceptions = onHoldExceptions;
    }

    @Override
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(getClass().getName()+"@"+Integer.toHexString(hashCode()));
        buffer.append('[');
        buffer.append("activeExceptions=");
        buffer.append(getActiveExceptions());
        buffer.append(',');
        buffer.append("architectName=");
        buffer.append(getArchitectName());
        buffer.append(',');
        buffer.append("architectPartyId=");
        buffer.append(getArchitectPartyId());
        buffer.append(',');
        buffer.append("closedExceptions=");
        buffer.append(getClosedExceptions());
        buffer.append(',');
        buffer.append("onHoldExceptions=");
        buffer.append(getOnHoldExceptions());
        buffer.append(']');
        return buffer.toString();
    }
}
