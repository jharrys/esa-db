package com.ihc.esa.report.entity;

import java.io.Serializable;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries( { @NamedQuery(name = "UserAuthorityList.findAll", query = "select o from UserAuthorityList o") })
@Table(name = "USER_AUTHORITY_LIST")
public class UserAuthorityList implements Serializable {
    @Column(length = 1024, insertable = false)
    private String authority;
    @Column(name = "FULL_NAME", length = 128, insertable = false)
    private String fullName;
    @Column(name = "PARTY_ID", nullable = false, insertable = false)
    private BigDecimal partyId;

    public UserAuthorityList() {
    }

    public UserAuthorityList(String authority, String fullName, BigDecimal partyId) {
        this.authority = authority;
        this.fullName = fullName;
        this.partyId = partyId;
    }


    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public BigDecimal getPartyId() {
        return partyId;
    }

    public void setPartyId(BigDecimal partyId) {
        this.partyId = partyId;
    }

    @Override
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(getClass().getName()+"@"+Integer.toHexString(hashCode()));
        buffer.append('[');
        buffer.append("authority=");
        buffer.append(getAuthority());
        buffer.append(',');
        buffer.append("fullName=");
        buffer.append(getFullName());
        buffer.append(',');
        buffer.append("partyId=");
        buffer.append(getPartyId());
        buffer.append(']');
        return buffer.toString();
    }
}
