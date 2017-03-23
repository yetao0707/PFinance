package com.commons.page;


import com.google.gson.annotations.Expose;
import com.vo.BaseVO;


/**
 *     
 * 项目名称：fmallApp    
 * 类名称：PageUtils    
 * 类描述：    
 * 创建人：ex_kjkfb_lvrz    
 * 创建时间：2014年3月10日 上午10:38:47    
 * 修改人：ex_kjkfb_lvrz    
 * 修改时间：2014年3月10日 上午10:38:47    
 * 修改备注：    
 * @version     
 *     
 */
public class PageUtils extends BaseVO{
	private static final long serialVersionUID = -3197489083400592116L;
	@Expose
	private int currentPage;//当前页
	@Expose
	private int numPerPage;
	@Expose
	private int totalPage;
	@Expose
	private int totalCount;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
}
