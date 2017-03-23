package com.vo.fp;

import com.vo.BaseVO;


public class CurrencyPurchaseVO extends BaseVO  {

	// Fields

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		
		
		private Long  id          ;
		private Long  customerId    ;
		private Long  currencyId    ;
		private Long  num     ;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public Long getCustomerId() {
			return customerId;
		}
		public void setCustomerId(Long customerId) {
			this.customerId = customerId;
		}
		public Long getCurrencyId() {
			return currencyId;
		}
		public void setCurrencyId(Long currencyId) {
			currencyId = currencyId;
		}
		public Long getNum() {
			return num;
		}
		public void setNum(Long num) {
			this.num = num;
		}
		@Override
		public String toString() {
			return "CurrencypurchaseVO [id=" + id + ", customerId=" + customerId + ", CurrencyId=" + currencyId + ", num=" + num + "]";
		}



		
	
	
}
