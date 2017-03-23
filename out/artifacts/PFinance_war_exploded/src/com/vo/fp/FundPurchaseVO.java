package com.vo.fp;

import java.util.Date;
import java.util.List;

import com.vo.BaseVO;


public class FundPurchaseVO extends BaseVO  {

	// Fields

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		
		
		private Long   id              ;
		private Long   fundId        ;
		private Long   customerId        ;
		private Date   purchaseDate   ;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		/**
		 * @return the fundId
		 */
		public Long getFundId() {
			return fundId;
		}
		/**
		 * @param fundId the fundId to set
		 */
		public void setFundId(Long fundId) {
			this.fundId = fundId;
		}
		/**
		 * @return the customerId
		 */
		public Long getCustomerId() {
			return customerId;
		}
		/**
		 * @param customerId the customerId to set
		 */
		public void setCustomerId(Long customerId) {
			this.customerId = customerId;
		}
		/**
		 * @return the purchaseDate
		 */
		public Date getPurchaseDate() {
			return purchaseDate;
		}
		/**
		 * @param purchaseDate the purchaseDate to set
		 */
		public void setPurchaseDate(Date purchaseDate) {
			this.purchaseDate = purchaseDate;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "FundPurchaseVO [id=" + id + ", fundId=" + fundId
					+ ", customerId=" + customerId + ", purchaseDate="
					+ purchaseDate + "]";
		}

		
	
}
