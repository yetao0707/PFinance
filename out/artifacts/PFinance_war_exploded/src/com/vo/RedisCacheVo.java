package com.vo;

public class RedisCacheVo {

	private String key ;//key
	private Object value ;//值
	private int timeout = 120;//超时s


	public RedisCacheVo() {
		
	}
	public RedisCacheVo(String key, Object value) {
		super();
		this.key = key;
		this.value = value;
	}

	public RedisCacheVo(String key, Object value, int timeout) {
		super();
		this.key = key;
		this.value = value;
		this.timeout = timeout;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public int getTimeout() {
		return timeout;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	@Override
	public String toString() {
		return "RedisCacheVo [key=" + key + ", value=" + value + ", timeout="
				+ timeout + "]";
	}
}
