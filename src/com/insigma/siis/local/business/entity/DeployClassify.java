package com.insigma.siis.local.business.entity;
// Generated 2018-8-20 10:03:34 by Hibernate Tools 3.2.2.GA

import java.math.BigDecimal;

/**
 * DeployClassify generated by hbm2java
 */
public class DeployClassify implements java.io.Serializable {

	private String dc001;
	private String rbId;
	private String dc003;
	private BigDecimal dc004;

	public DeployClassify() {
	}

	public DeployClassify(String dc001, String rbId) {
		this.dc001 = dc001;
		this.rbId = rbId;
	}

	public DeployClassify(String dc001, String rbId, String dc003, BigDecimal dc004) {
		this.dc001 = dc001;
		this.rbId = rbId;
		this.dc003 = dc003;
		this.dc004 = dc004;
	}

	public String getDc001() {
		return this.dc001;
	}

	public void setDc001(String dc001) {
		this.dc001 = dc001;
	}

	public String getRbId() {
		return this.rbId;
	}

	public void setRbId(String rbId) {
		this.rbId = rbId;
	}

	public String getDc003() {
		return this.dc003;
	}

	public void setDc003(String dc003) {
		this.dc003 = dc003;
	}

	public BigDecimal getDc004() {
		return this.dc004;
	}

	public void setDc004(BigDecimal dc004) {
		this.dc004 = dc004;
	}

}
