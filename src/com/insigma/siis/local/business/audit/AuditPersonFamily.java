package com.insigma.siis.local.business.audit;
// Generated 2021-4-1 15:43:02 by Hibernate Tools 5.4.14.Final

/**
 * AuditPersonFamily generated by hbm2java
 */
public class AuditPersonFamily implements java.io.Serializable {

	private String oid;
	private String familyType;
	private String a0101;
	private String a0184;
	private String a0192a;
	private String POid;

	public AuditPersonFamily() {
	}

	public AuditPersonFamily(String oid) {
		this.oid = oid;
	}

	public AuditPersonFamily(String oid, String familyType, String a0101, String a0184, String a0192a, String POid) {
		this.oid = oid;
		this.familyType = familyType;
		this.a0101 = a0101;
		this.a0184 = a0184;
		this.a0192a = a0192a;
		this.POid = POid;
	}

	public String getOid() {
		return this.oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getFamilyType() {
		return this.familyType;
	}

	public void setFamilyType(String familyType) {
		this.familyType = familyType;
	}

	public String getA0101() {
		return this.a0101;
	}

	public void setA0101(String a0101) {
		this.a0101 = a0101;
	}

	public String getA0184() {
		return this.a0184;
	}

	public void setA0184(String a0184) {
		this.a0184 = a0184;
	}

	public String getA0192a() {
		return this.a0192a;
	}

	public void setA0192a(String a0192a) {
		this.a0192a = a0192a;
	}

	public String getPOid() {
		return this.POid;
	}

	public void setPOid(String POid) {
		this.POid = POid;
	}

}
