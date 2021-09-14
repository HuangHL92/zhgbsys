package com.insigma.siis.local.pagemodel.xbrm;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.fr.third.org.hsqldb.lib.StringUtil;
import com.insigma.odin.framework.AppException;
import com.insigma.odin.framework.persistence.HBSession;
import com.insigma.odin.framework.persistence.HBUtil;
import com.insigma.odin.framework.radow.PageModel;
import com.insigma.odin.framework.radow.RadowException;
import com.insigma.odin.framework.radow.annotation.NoRequiredValidate;
import com.insigma.odin.framework.radow.annotation.PageEvent;
import com.insigma.odin.framework.radow.event.EventRtnType;
import com.insigma.siis.local.business.entity.A57;
import com.insigma.siis.local.business.entity.Js01;
import com.insigma.siis.local.business.entity.JsAtt;
import com.insigma.siis.local.business.entity.RecordBatch;
import com.insigma.siis.local.business.helperUtil.PhotosUtil;
import com.insigma.siis.local.business.helperUtil.SysManagerUtils;
import com.insigma.siis.local.business.utils.SQLiteUtil;
import com.insigma.siis.local.pagemodel.dataverify.Zip7z;
import com.insigma.siis.local.pagemodel.xbrm.expword.ExpJSGLRMB;
import com.utils.CommonQueryBS;

import sun.misc.BASE64Encoder;

public class QuitWarningPageModel extends PageModel {
	
	JSGLBS bs = new JSGLBS();
	
	@Override
	public int doInit() throws RadowException {
		
		this.setNextEventName("querybyid");
		//this.setNextEventName("jggwInfoGrid.dogridquery");
		return EventRtnType.NORMAL_SUCCESS;
	}
	
	/**
	 * 职位信息
	 * @param start
	 * @param limit
	 * @return
	 * @throws RadowException
	 */
	@PageEvent("jggwInfoGrid.dogridquery")
	public int jggwInfoGriddoMemberQuery(int start,int limit) throws RadowException{
		
		//String bm = this.getPageElement("orgref").getValue();
		//String jgid = this.getPageElement("a0201b").getValue();
		String where = "";
		/*if(bm!=null&&!"".equals(bm)){
			where += " and p.grouptype = '"+bm+"'";
		}
		if(jgid!=null&&!"".equals(jgid)){
			where += " and f.b0111 = '"+jgid+"'";
		}*/
		//String sql = "select b0101,b0114, from b01 b,jggwconfig";
		String ereaid = this.getPageElement("ereaid").getValue();    //选择的机构id
		if(ereaid!=null&&!"".equals(ereaid)){
			where += " and f.b0111 = '"+ereaid+"'";
		}
		String sql = "select jggwconfid,b0111,b0101,b0114,b0104,b0194,sortid,gwname,gwnum,gwcode,countnum,decode(sign(cz),1,cz,0) cz1,decode(sign(cz),-1,abs(cz),0) cz2 from (select f.jggwconfid,b.b0111,b.b0101,b.b0114,b.b0104,b.b0194,b.sortid,f.gwname,f.gwcode,f.gwnum,nvl(a.countnum,0) countnum,f.gwnum-nvl(a.countnum,0) cz "
				+ " from b01 b join Jggwconf f on b.b0111=f.b0111 left join (select A0215A_c,get_B0111NS(a0201b) a0201b,count(1) countnum from a02 where a0255='1' and A0215A_c is not null "
				+ " group by A0215A_c,get_B0111NS(a0201b)) a on f.gwcode=a.A0215A_c and f.b0111=get_B0111NS(a.a0201b) left join refb01group p on f.b0111=p.b0111 where 1=1 "
				+ where +") order by length(b0111),b0111,SORTID asc,cz ";
		System.out.println(sql);
		this.pageQuery(sql, "SQL", start, limit);
		return EventRtnType.SPE_SUCCESS;
	}	
	
	@PageEvent("xzgw")
	public int xzgw() throws RadowException{
		String userid = SysManagerUtils.getUserId();
		HBSession sess = HBUtil.getHBSession();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String ids = "";
			
			BigDecimal c = (BigDecimal) sess.createSQLQuery("select max(nvl(sortid,0)) from fy22 where "
    				+ " fy22.userid in ('"+userid+"')").uniqueResult();
			int sortid = (c==null ? 0:c.intValue()) + 1;
			String sql = "insert into fy22(fy2200,fy2201,fy2202,fy2203,fy2204,"
					+ "fy2201a,fy2201b,fy2201c,sortid,userid) values(?,?,?,?,?, ?,?,?,?,?)";
			conn = sess.connection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			List<HashMap<String, Object>> list = this.getPageElement("jggwInfoGrid").getValueList();
			int count = 0;
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> map = list.get(i);
				if(map.get("personcheck")!=null && !map.get("personcheck").toString().equals("") 
						&& (Boolean)(map.get("personcheck"))==true) {
					count ++ ;
					String fy2201 = map.get("b0101").toString();
					String fy2202 = map.get("b0111").toString();
					String fy2203 = map.get("gwname").toString();
					String fy2204 = map.get("gwcode").toString();
					String b0194 = map.get("b0194").toString();
					String b0104 = map.get("b0104")!=null ? map.get("b0104").toString():"";//简称
					//B01 b01 = (B01) sess.get(B01.class, fy2202);
					//String b0104 = b01.getB0104();//简称
		    		//String b0194 = b01.getB0194();//单位类型
		    		
		    		if(b0194.equals("3")) {
		    			throw new RadowException(fy2201+"为机构纷组，请去除！");
		    		} else {
		    			String id = UUID.randomUUID().toString();
		    			
		    			pstmt.setString(1, id);
		    			pstmt.setString(2, fy2201);
		    			pstmt.setString(3, fy2202);
		    			pstmt.setString(4, fy2203);
		    			pstmt.setString(5, fy2204);
		    			pstmt.setString(6, b0104);
		    			if(b0194.equals("2")) {
		    				String name[] = {"",""};
		    				getFrdwName(fy2202, name, conn);
		    				pstmt.setString(7, name[1]);
			    			pstmt.setString(8, name[0]);
		    			} else {
		    				pstmt.setString(7, b0104);
			    			pstmt.setString(8, fy2201);
		    			}
		    			pstmt.setInt(9, sortid);
		    			pstmt.setString(10, userid);
		    			pstmt.addBatch();
		    		}
				}
			}
			if(count == 0) {
				this.setMainMessage("请至少选择一个职位。");
			} else {
				pstmt.executeBatch();
				conn.commit();
				this.getExecuteSG().addExecuteCode("$h.alert('系统提示','选择成功');radow.doEvent('jggwSelGrid.dogridquery');");
			}
		} catch (Exception e) {
			e.printStackTrace();
			if(conn != null) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			throw new RadowException("系统异常:"+e.getMessage());
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return EventRtnType.NORMAL_SUCCESS;
	}
	
	private String[] getFrdwName(String codevalueparameter2, String name[], Connection conn) throws RadowException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from b01 where b0111='"+codevalueparameter2+"'");
			if(rs.next()) {
				String b0194 = rs.getString("b0194");
				String b0101 = rs.getString("b0101");
				String b0104 = rs.getString("b0104");
				String b0121 = rs.getString("b0121");
				
				if(b0194.equals("1") || codevalueparameter2.equals("001.001")) {
					name[0] = b0101+name[0];
					name[1] = b0104+name[1];
					return name;
				} else {
					name[0] = b0101+name[0];
					name[1] = b0104+name[1];
					return getFrdwName(b0121, name, conn);
				}
			} else {
				return name;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RadowException("数据异常!");
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
	}
	
	//点击树查询事件
	@PageEvent("querybyid")
	@NoRequiredValidate
	public int query(String id) throws RadowException, AppException {
		if(id==null||"".equals(id)){
			id = "001.001";
		}
		this.getPageElement("ereaid").setValue(id);
		String onedate = this.getPageElement("onedate").getValue();
		String twodate = this.getPageElement("twodate").getValue();
		String threedate = this.getPageElement("threedate").getValue();
		String warndate = this.getPageElement("warndate").getValue();		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		if(warndate==null||"".equals(warndate)) {
			warndate = formatter.format(date);
		}		
		CommonQueryBS cq=new CommonQueryBS();
		//this.setNextEventName("jggwInfoGrid.dogridquery");
		String sql = "select sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd'))>= 60-to_number('"+onedate+"') and" + 
				"                  a.a0221 = '1A21'  and" + 
				"                  b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) zt," + 
				"       sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd')) >= 60-to_number('"+onedate+"') and" + 
				"                  a.a0221 = '1A22'  and" + 
				"                  b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) ft," + 
				"       sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd')) >= 60-to_number('"+onedate+"') and" + 
				"                  a.a0221 = '1A31'  and" + 
				"                  b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) zc," + 
				"       sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd')) >= 60-to_number('"+onedate+"') and" + 
				"                  a.a0221 = '1A32'  and" + 
				"                  b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) fc" + 
				"  from A01 a" + 
				"  left join (select *" + 
				"               from A02" + 
				"              where A0279 = '1'" + 
				"                and A0255 = '1') b" + 
				"    on a.a0000 = b.a0000" + 
				" where substr(a.a0163, 0, 1) = '1' " + 
				"   and a.status != '4'" + 
				//"   and a.a0195 like '001.001%'" + 
				//"   and a.a0221 like '1A%'" + 
				//"   and a.A0160 in ('1', '5', '6')" + 
				"   and b.a0243 is not null " + 
				"   and months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd')) <= 60";
		HashMap<String, Object> mapBySQL = cq.getMapBySQL(sql);
		String zt1=(String)mapBySQL.get("zt");
		String ft1=(String)mapBySQL.get("ft");
		String zc1=(String)mapBySQL.get("zc");
		String fc1=(String)mapBySQL.get("fc");
		
		String sql2 = "select sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd'))>= 120-to_number('"+twodate+"') and" + 
				"                  a.a0221 = '1A21'  and" + 
				"                  b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) zt," + 
				"       sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd')) >= 120-to_number('"+twodate+"') and" + 
				"                  a.a0221 = '1A22'  and" + 
				"                  b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) ft," + 
				"       sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd')) >= 120-to_number('"+twodate+"') and" + 
				"                  a.a0221 = '1A31'  and" + 
				"                  b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) zc," + 
				"       sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd')) >= 120-to_number('"+twodate+"') and" + 
				"                  a.a0221 = '1A32'  and" + 
				"                  b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) fc" + 
				"  from A01 a" + 
				"  left join (select *" + 
				"               from A02" + 
				"              where A0279 = '1'" + 
				"                and A0255 = '1') b" + 
				"    on a.a0000 = b.a0000" + 
				" where substr(a.a0163, 0, 1) = '1' " + 
				"   and a.status != '4'" + 
				//"   and a.a0195 like '001.001%'" + 
				//"   and a.a0221 like '1A%'" + 
				//"   and a.A0160 in ('1', '5', '6')" + 
				"   and b.a0243 is not null " + 
				"   and months_between(to_date('"+warndate+"','yyyy-mm-dd')," + 
				"                                       to_date(substr(b.a0243, 0, 6) || '01'," + 
				"                                               'yyyymmdd')) <= 120";
		HashMap<String, Object> mapBySQL2 = cq.getMapBySQL(sql2);
		String zt2=(String)mapBySQL2.get("zt");
		String ft2=(String)mapBySQL2.get("ft");
		String zc2=(String)mapBySQL2.get("zc");
		String fc2=(String)mapBySQL2.get("fc");
		
		String sql3 = "select sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"', 'yyyy-mm-dd')," + 
				"                               to_date(substr(nvl(c.a0504,replace('"+warndate+"','-','')), 0, 6) || '01'," + 
				"                                       'yyyymmdd')) >= 180 - to_number('"+threedate+"') and " + 
				"                  a.a0221 = '1A21' and b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) zt," + 
				"       sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"', 'yyyy-mm-dd')," + 
				"                               to_date(substr(nvl(c.a0504,replace('"+warndate+"','-','')), 0, 6) || '01'," + 
				"                                       'yyyymmdd')) >= 180 - to_number('"+threedate+"') and " + 
				"                  a.a0221 = '1A22' and b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) ft," + 
				"       sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"', 'yyyy-mm-dd')," + 
				"                               to_date(substr(nvl(c.a0504,replace('"+warndate+"','-','')), 0, 6) || '01'," + 
				"                                       'yyyymmdd')) >= 180 - to_number('"+threedate+"') and " + 
				"                  a.a0221 = '1A31' and b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) zc," + 
				"       sum(CASE" + 
				"             WHEN months_between(to_date('"+warndate+"', 'yyyy-mm-dd')," + 
				"                               to_date(substr(nvl(c.a0504,replace('"+warndate+"','-','')), 0, 6) || '01'," + 
				"                                       'yyyymmdd')) >= 180 - to_number('"+threedate+"') and " + 
				"                  a.a0221 = '1A32' and b.a0201b like '"+id+"%' THEN" + 
				"              1" + 
				"             ELSE" + 
				"              0" + 
				"           END) fc" + 
				"" + 
				"  from A01 a" + 
				"  left join (select *" + 
				"               from A02" + 
				"              where A0279 = '1'" + 
				"                and A0255 = '1') b" + 
				"    on a.a0000 = b.a0000" + 
				"  left join (select *" + 
				"               from A05" + 
				"              where A0524 = '1'" + 
				"                and A0531 = '0') c" + 
				"    on a.a0000 = c.a0000            " + 
				" where substr(a.a0163, 0, 1) = '1'" + 
				"   and a.status != '4'" + 
				"   and b.a0201b like '"+id+"%'"+
				"   and c.a0504 is not null " + 
				" and months_between(to_date('"+warndate+"', 'yyyy-mm-dd')," + 
				"                               to_date(substr(nvl(c.a0504,replace('"+warndate+"','-','')), 0, 6) || '01'," + 
				"                                       'yyyymmdd')) <= 180 ";
		HashMap<String, Object> mapBySQL3 = cq.getMapBySQL(sql3);
		String zt3=(String)mapBySQL3.get("zt");
		String ft3=(String)mapBySQL3.get("ft");
		String zc3=(String)mapBySQL3.get("zc");
		String fc3=(String)mapBySQL3.get("fc");
		
		this.getExecuteSG().addExecuteCode("initAllChart("+zt1+","+ft1+","+zc1+","+fc1+","+zt2+","+ft2+","+zc2+","+fc2+","+zt3+","+ft3+","+zc3+","+fc3+");");
		return EventRtnType.NORMAL_SUCCESS;
	}
}
