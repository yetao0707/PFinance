package com.dao;

import java.util.List;

import com.commons.page.Page;



/*
 *所有模块的基础dao
 *每个模块dao必须继承它将泛型T改为相应的
 *类型 如 demoVo 
 */
public interface BaseDao<T> {
	/**
	 * 增加...
	 * @param demoVo
	 * @return
	 */
	public void add(T t) throws Exception;
	
	/**
	 * 更新...
	 * @param demoVo
	 * @return
	 */
	public void update(T t) throws Exception;
	
	/**
	 * 删除...
	 * @param demoVo
	 * @return
	 */
	public void delete(T t) throws Exception;
	
	/**
	 * 分页查询/条件查询...
	 * @param demoVo
	 * @return
	 */
	public List<T> findList(Page<T> page)throws Exception;
	
	/**
	 * 根据主键查询...
	 * @param demoVo
	 * @return
	 */
	public T findEntity(T t)throws Exception;
	
	/**
	 * 逻辑删除...
	 * @param demoVo
	 * @return
	 */
	public void logicDelete(T t) throws Exception;
	
	/**
	 * 批量删除
	 * @param ids 要删除的实体主键集合
	 */
	public void batchDelete(List<Long> ids) throws Exception;
}
