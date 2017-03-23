package com.commons.page;


import java.util.List;

import com.google.gson.annotations.Expose;
import com.vo.BaseVO;

/**    
 *     
 * 项目名称：fmallApp    
 * 类名称：Page    
 * 类描述：   分页对象
 * 创建人：ex_kjkfb_lvrz    
 * 创建时间：2014年3月10日 上午10:10:29    
 * 修改人：ex_kjkfb_lvrz    
 * 修改时间：2014年3月10日 上午10:10:29    
 * 修改备注：    
 * @version     
 *     
 */
public class Page<T> extends BaseVO{
	private static final long serialVersionUID = 8438822835100171582L;
	@Expose
	private PageUtils page = new PageUtils();
	@Expose
	private List<T> list;
	private  T objectT;
	
	public T getObjectT() {
		return objectT;
	}
	public void setObjectT(T objectT) {
		this.objectT = objectT;
	}
	
	public PageUtils getPage() {
		return page;
	}
	public void setPage(PageUtils page) {
		this.page = page;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "Page [page=" + page + ", list=" + list + ", objectT=" + objectT
				+ "]";
	}
}
