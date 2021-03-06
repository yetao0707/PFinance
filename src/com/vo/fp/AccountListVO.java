package com.vo.fp;

import java.util.Date;

import com.vo.BaseVO;


public class AccountListVO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private Long accountId;
    private Date itemDate;
    private String itemContent;
    private Double itemVolume;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the accountId
     */
    public Long getAccountId() {
        return accountId;
    }

    /**
     * @param accountId the accountId to set
     */
    public void setAccountId(Long accountId) {
        this.accountId = accountId;
    }

    /**
     * @return the itemDate
     */
    public Date getItemDate() {
        return itemDate;
    }

    /**
     * @param itemDate the itemDate to set
     */
    public void setItemDate(Date itemDate) {
        this.itemDate = itemDate;
    }

    /**
     * @return the itemContent
     */
    public String getItemContent() {
        return itemContent;
    }

    /**
     * @param itemContent the itemContent to set
     */
    public void setItemContent(String itemContent) {
        this.itemContent = itemContent;
    }

    /**
     * @return the itemVolume
     */
    public Double getItemVolume() {
        return itemVolume;
    }

    /**
     * @param itemVolume the itemVolume to set
     */
    public void setItemVolume(Double itemVolume) {
        this.itemVolume = itemVolume;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "AccountListVO [id=" + id + ", accountId=" + accountId
                + ", itemDate=" + itemDate + ", itemContent=" + itemContent
                + ", itemVolume=" + itemVolume + "]";
    }


}
