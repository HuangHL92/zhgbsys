package com.insigma.siis.local.pagemodel.publicServantManage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.beanutils.PropertyUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONException;

import com.insigma.odin.framework.AppException;
import com.insigma.odin.framework.persistence.HBSession;
import com.insigma.odin.framework.persistence.HBUtil;
import com.insigma.odin.framework.radow.PageModel;
import com.insigma.odin.framework.radow.RadowException;
import com.insigma.odin.framework.radow.annotation.GridDataRange;
import com.insigma.odin.framework.radow.annotation.NoRequiredValidate;
import com.insigma.odin.framework.radow.annotation.PageEvent;
import com.insigma.odin.framework.radow.annotation.Synchronous;
import com.insigma.odin.framework.radow.annotation.Transaction;
import com.insigma.odin.framework.radow.event.EventRtnType;
import com.insigma.odin.framework.radow.util.PMPropertyCopyUtil;
import com.insigma.siis.local.business.entity.A01;
import com.insigma.siis.local.business.entity.A05;
import com.insigma.siis.local.business.entity.LogMain;
import com.insigma.siis.local.business.helperUtil.SysManagerUtils;
import com.insigma.siis.local.epsoft.util.LogUtil;
import com.insigma.siis.local.pagemodel.comm.CommQuery;
import com.insigma.siis.local.pagemodel.customquery.CustomQueryBS;
import com.insigma.siis.local.pagemodel.dataverify.Map2Temp;
import com.utils.DBUtils;

public class RankAddPagePageModel extends PageModel {
	private LogUtil applog = new LogUtil();

	@Override
	@NoRequiredValidate
	public int doInit() throws RadowException {
		this.setNextEventName("initX");
		//this.setNextEventName("TrainingInfoAddBtn.onclick");
		return EventRtnType.NORMAL_SUCCESS;
	}
	
	
	@PageEvent("initX")
	@NoRequiredValidate
	public  int  initX() throws RadowException{
		String a0000=this.getPageElement("subWinIdBussessId").getValue();
		this.getExecuteSG().addExecuteCode("document.getElementById('a0000').value='"+a0000+"';");
		if (a0000 == null || "".equals(a0000)) {//
			this.setMainMessage("请先保存人员基本信息！");
			return EventRtnType.NORMAL_SUCCESS;
		}
		
		//人员已审核则锁定
		if(DBUtils.isAudit(a0000)){
			this.getExecuteSG().addExecuteCode("lockINFO()");
		}
		
		try {
			HBSession sess = HBUtil.getHBSession();
			String sql = "from A05 where a0000='" + a0000+ "' and a0531='0' order by a0524 desc,a0504 desc";
			List list = sess.createQuery(sql).list();
			A05 a05 = null;
			if(list != null && list.size()>0){
				a05 = (A05) list.get(0);
				a05.setA0000(a0000);
			}

			if (a05 != null) {
				PMPropertyCopyUtil.copyObjValueToElement(a05, this);
				// 旧值 判断是否修改
				String json = objectToJson(a05);
				// this.getExecuteSG().addExecuteCode("parent.A61value="+json+";");
			}

		} catch (Exception e) {
			e.printStackTrace();
			this.setMainMessage("查询失败！");
			return EventRtnType.FAILD;
		}
		this.setNextEventName("TrainingInfoGrid.dogridquery");// 信息列表
		this.getExecuteSG().addExecuteCode("setA0517Disabled();");
		return EventRtnType.NORMAL_SUCCESS;
	}

	//
	@PageEvent("saveA11.onclick")
	@Transaction
	@Synchronous(true)
	@NoRequiredValidate
	public int saveTrainingInfo() throws RadowException, AppException {
		A05 a05 = new A05();
		this.copyElementsValueToObj(a05, this);
		String a0000=this.getPageElement("subWinIdBussessId").getValue();
		a05.setA0531("0");
		if (a0000 == null || "".equals(a0000)) {
			this.getExecuteSG().addExecuteCode("$h.alert('系统提示','请先保存人员基本信息！',null,'220')");
			return EventRtnType.NORMAL_SUCCESS;
		}
		if (a05.getA0501b() == null || "".equals(a05.getA0501b())) {
			this.getExecuteSG().addExecuteCode("$h.alert('系统提示','职务层次不能为空！',null,'220')");
			return EventRtnType.NORMAL_SUCCESS;
		}
		a05.setA0000(a0000);
		String a0500 = a05.getA0500();
		String a0504 = a05.getA0504();// 
		String a0517 = a05.getA0517();//
		String a0524 = a05.getA0524();//获取页面的状态值
		String a0501b = a05.getA0501b();//职务层次
		a05.setA0525(a0524);//调整后，a0525==a0524
		int start = 0;
		int end = 0;
		if(a0504 != null && !"".equals(a0504)){
			start = Integer.valueOf((a0504+"01").substring(0, 8));
			a05.setA0504(a0504);
		}else{
			a05.setA0504(null);
		}
		if(a0517 != null && !"".equals(a0517)){
			end = Integer.valueOf((a0517+"01").substring(0, 8));
			a05.setA0517(a0517);
		}else{
			a05.setA0517(null);
		}
		
		
		//判断批准时间不能早于参加工作时间
		String a0134 = this.getPageElement("a0134").getValue();//参加工作时间
		if(a0134!=null&&!"".equals(a0134)){
			if (a0134.length() == 6) {
				a0134 += "01";
			}
			
			if(a0134!=null&&!"".equals(a0134)){
				int startWork = Integer.valueOf(a0134);      	//出生日期
				
				if (start < startWork) {
					this.setMainMessage("批准日期不能早于参加工作时间");
					return EventRtnType.NORMAL_SUCCESS;
				}
				
			}
		}
		
		if(start!=0 && end!=0 && start>end){
			this.getExecuteSG().addExecuteCode("$h.alert('系统提示','批准时间不能大于结束时间！',null,'220')");
			return EventRtnType.NORMAL_SUCCESS;
		}
		
		HashMap map1 =new HashMap();
		map1.put("0121", "3");
		map1.put("0122", "4");
		map1.put("012201", "4");
		map1.put("012202", "4");
		map1.put("0131", "6");
		map1.put("013102", "5");
		map1.put("013103", "5");
		map1.put("013104", "4");
		map1.put("013105", "6");
		map1.put("0132", "7");
		map1.put("013201", "5");
		map1.put("013202", "7");
		map1.put("0141", "8");
		map1.put("014101", "8");
		map1.put("0142", "9");
		map1.put("014201", "9");
		map1.put("QY01", "3");
		map1.put("QY02", "4");
		map1.put("QY03", "5");
		map1.put("QY04", "6");
		map1.put("QY05", "4");
		map1.put("QY06", "5");
		map1.put("QY07", "6");
		map1.put("QY08", "7");
		
		String type=map1.get(a0501b)==null?"":map1.get(a0501b).toString();
		if(!"".equals(type)) {
			HashMap map2 =new HashMap();
			map2.put("3", "'0121','QY01'");
			map2.put("4", "'0122','012201','012202','013104','QY02','QY05'");
			map2.put("5", "'013102','013103','013201','QY03','QY06'");
			map2.put("6", "'0131','013105','QY04','QY07'");
			map2.put("7", "'0132','013202','QY08'");
			map2.put("8", "'0141','014101'");
			map2.put("9", "'0142','014201'");
			String cond=map2.get(type)==null?"":map2.get(type).toString();
			CommQuery commQuery =new CommQuery();
			String sql="select * from a05 where a0501b in ("+cond+") and a0000='"+a0000+"' and a0500<>'"+a0500+"' order by a0504 ";
			List<HashMap<String, Object>> list = commQuery.getListBySQL(sql); 
			if(list!=null&&list.size()>0) {
				if(Integer.valueOf(list.get(0).get("a0504").toString().substring(0, 6))<Integer.valueOf(a0504.substring(0, 6))) {
					a0504=list.get(0).get("a0504").toString();
					a0501b=list.get(0).get("a0501b").toString();
				}
			}
		}
		
		HBSession sess = null;
		A05 a05_old = null;
		try {
			sess = HBUtil.getHBSession();
			A01 a01 = (A01) sess.get(A01.class, a0000);
			if (a0500 == null || "".equals(a0500)) {
				a05_old = new A05();
				if("1".equals(a0524)){//状态为在任
					List list_a05 = sess.createSQLQuery("select a0524,a0500 from a05 where a0524='1' and a0531='0' and a0000='"+a0000+"'").list();//检测是否之前有状态为在任的
					if(list_a05.size()>0){//检测到之前有状态为在任的
						this.getExecuteSG().addExecuteCode("$h.alert('系统提示','现职务层次不可重复在任！',null,'220')");
						return EventRtnType.NORMAL_SUCCESS;
					}else{//检测到之前没有状态为在任的
						String sql = "update a05 set a0525 = '0' where a0000='"+a0000+"' and a0531='0' ";//将同一人的其他职务层次状态设为0
						sess.createSQLQuery(sql).executeUpdate();
						sess.flush();
						a01.setA0221(a0501b);//数据库设置 人物信息表的现职务层次 当前被选的职务层次
						a01.setA0288(a0504==null?"":a0504);
						sess.saveOrUpdate(a01);
						sess.flush();
						
						//获得职务层次名称
						String a0501bName = "";
						
						if(a0501b!=null){
							a0501bName = HBUtil.getValueFromTab("CODE_NAME", "CODE_VALUE", " code_type='ZB09' and code_value = '"+a0501b+"'");
							
						}
						this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+(a0501b==null?"":a0501b)+"','"+a0501bName+"')");//页面设置 人物信息表的现职务层次
						
						
						//this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+(a0501b==null?"":a0501b)+"')");//页面设置 人物信息表的现职务层次
						this.getExecuteSG().addExecuteCode("realParent.setA0288Value('"+(a0504==null?"":a0504)+"')");//页面设置 人物信息表的现职务层次时间
					}
				}else {
					String a0221=a01.getA0221()==null?"":a01.getA0221();
					String a0288=a01.getA0288()==null?"":a01.getA0288();
					String type2=map1.get(a0221)==null?"":map1.get(a0221).toString();
					if(type2.equals(type)&&a0288.length()>=6&&
							Integer.valueOf(a0288.substring(0, 6))>Integer.valueOf(a0504.substring(0, 6))) {
						a01.setA0221(a0501b);
						a01.setA0288(a0504==null?"":a0504);
						sess.saveOrUpdate(a01);
						sess.flush();
						//获得职务层次名称
						String a0501bName = "";
						if(a0501b!=null){
							a0501bName = HBUtil.getValueFromTab("CODE_NAME", "CODE_VALUE", " code_type='ZB09' and code_value = '"+a0501b+"'");
						}
						this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+(a0501b==null?"":a0501b)+"','"+a0501bName+"')");//页面设置 人物信息表的现职务层次
						this.getExecuteSG().addExecuteCode("realParent.setA0288Value('"+(a0504==null?"":a0504)+"')");//页面设置 人物信息表的现职务层次时间
					}

				}
				/*applog.createLog("", "A05", a01.getA0000(), a01.getA0101(), "新增记录",
						new Map2Temp().getLogInfo(a05_old, a05));*/
				
				applog.createLogNew("3A05","现职务层次新增","现职务层次",a0000,a01.getA0101(), new Map2Temp().getLogInfo(new A05(),a05));
				
				sess.save(a05);
				sess.flush();
			} else {
				a05_old = (A05) sess.get(A05.class, a0500);
				if("1".equals(a0524)){//状态为在任时，进行判断，若之前有在任的则提示
					List list_a05 = sess.createSQLQuery("select a0524,a0500 from a05 where a0524='1' and a0531='0' and a0000='"+a0000+"' and a0500<> '"+a0500+"'").list();//检测是否之前有状态为在任的
					if(list_a05.size()>0){//检测到其他职级有状态为在任的
						this.getExecuteSG().addExecuteCode("$h.alert('系统提示','现职级不可重复在任！',null,'220')");
						return EventRtnType.NORMAL_SUCCESS;
					}else{
						String sql = "update a05 set a0525 = '0' where a0000='"+a0000+"' and a0531='0' ";//将同一人的其他职级状态设为0
						sess.createSQLQuery(sql).executeUpdate();
						sess.flush();
						a01.setA0221(a0501b); //数据库设置 人物信息表的现职务层次 当前被选的职务层次
						a01.setA0288(a0504==null?"":a0504);
						sess.saveOrUpdate(a01);
						sess.flush();
						
						//获得职务层次名称
						String a0501bName = "";
						
						if(a0501b!=null){
							a0501bName = HBUtil.getValueFromTab("CODE_NAME", "CODE_VALUE", " code_type='ZB09' and code_value = '"+a0501b+"'");
							
						}
						this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+(a0501b==null?"":a0501b)+"','"+a0501bName+"')");//页面设置 人物信息表的现职务层次
						
						//this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+(a0501b==null?"":a0501b)+"')");//页面设置 人物信息表的现职务层次
						
						this.getExecuteSG().addExecuteCode("realParent.setA0288Value('"+(a0504==null?"":a0504)+"')");//页面设置 人物信息表的现职务层次时间
					}
				}else if("0".equals(a0524)){//状态为以免时
					if("1".equals(a05_old.getA0524())){//原本是在任
						a01.setA0221(null);//设置 人物信息表的现职务层次 为空
						a01.setA0288(null);
						sess.saveOrUpdate(a01);
						sess.flush();
						this.getExecuteSG().addExecuteCode("realParent.setA0221Value('','')");//页面设置 人物信息表的现职务为空
						this.getExecuteSG().addExecuteCode("realParent.setA0288Value('')");//页面设置 人物信息表的现职务层次时间
					}else {
						String a0221=a01.getA0221()==null?"":a01.getA0221();
						String a0288=a01.getA0288()==null?"":a01.getA0288();
						
						String a0501b_old=a05_old.getA0501b();
						String a0504_old=a05_old.getA0504();

						String type2=map1.get(a0221)==null?"":map1.get(a0221).toString();
						
						if(a0221.equals(a0501b_old)&&a0504.equals(a0504_old)&&!type2.equals(type)) {
							HashMap map2 =new HashMap();
							map2.put("3", "'0121','QY01'");
							map2.put("4", "'0122','012201','012202','013104','QY02','QY05'");
							map2.put("5", "'013102','013103','013201','QY03','QY06'");
							map2.put("6", "'0131','013105','QY04','QY07'");
							map2.put("7", "'0132','013202','QY08'");
							map2.put("8", "'0141','014101'");
							map2.put("9", "'0142','014201'");
							String cond=map2.get(type2)==null?"":map2.get(type2).toString();
							CommQuery commQuery =new CommQuery();
							String sql="select * from a05 where a0501b in ("+cond+") and a0000='"+a0000+"' and a0500<>'"+a0500+"' order by a0504 ";
							List<HashMap<String, Object>> list = commQuery.getListBySQL(sql); 
							if(list!=null&&list.size()>0) {
								a0504=list.get(0).get("a0504").toString();
								a0501b=list.get(0).get("a0501b").toString();
								
								a01.setA0221(a0501b);
								a01.setA0288(a0504==null?"":a0504);
								sess.saveOrUpdate(a01);
								sess.flush();
								String a0501bName = "";
								if(a0501b!=null){
									a0501bName = HBUtil.getValueFromTab("CODE_NAME", "CODE_VALUE", " code_type='ZB09' and code_value = '"+a0501b+"'");
								}
								this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+(a0501b==null?"":a0501b)+"','"+a0501bName+"')");//页面设置 人物信息表的现职务层次
								this.getExecuteSG().addExecuteCode("realParent.setA0288Value('"+(a0504==null?"":a0504)+"')");//页面设置 人物信息表的现职务层次时间
							}
						}
						if(type2.equals(type)&&a0288.length()>=6&&
								Integer.valueOf(a0288.substring(0, 6))>Integer.valueOf(a0504.substring(0, 6))) {
							a01.setA0221(a0501b);
							a01.setA0288(a0504==null?"":a0504);
							sess.saveOrUpdate(a01);
							sess.flush();
							//获得职务层次名称
							String a0501bName = "";
							if(a0501b!=null){
								a0501bName = HBUtil.getValueFromTab("CODE_NAME", "CODE_VALUE", " code_type='ZB09' and code_value = '"+a0501b+"'");
							}
							this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+(a0501b==null?"":a0501b)+"','"+a0501bName+"')");//页面设置 人物信息表的现职务层次
							this.getExecuteSG().addExecuteCode("realParent.setA0288Value('"+(a0504==null?"":a0504)+"')");//页面设置 人物信息表的现职务层次时间
						}
					}
				}
				/*applog.createLog("先职务层次修改", "A05", a01.getA0000(), a01.getA0101(), "修改记录",
						new Map2Temp().getLogInfo(a05_old, a05));*/
				//生成日志记录
				a05_old.setA0525(a05.getA0525());
				applog.createLogNew("32","现职务层次修改","现职务层次",a0000,a01.getA0101(), new Map2Temp().getLogInfo(a05_old,a05));
				PropertyUtils.copyProperties(a05_old, a05);
				sess.update(a05_old);
				sess.flush();
				
				//已免的职务中如果有跟在任的同级的时间  时间算已免的那个时间
//				String zrsql="select * from a05 where a0000='"+a0000+"' and a0524='1'";
//				A05 zra05=(A05) sess.createSQLQuery(zrsql).addEntity(A05.class).uniqueResult();
//				if(zra05!=null) {
//					String timesql="select a0504 from a05 where a0000='"+a0000+"' and a0501b in (" + 
//							"select code_value from code_value where code_type='ZB09' and code_remark in ( " + 
//							"select code_remark from code_value  where code_type='ZB09' and code_value='"+zra05.getA0501b()+"' ) ) order by a0504";
//					List<String> timelist=sess.createSQLQuery(timesql).list();
//					if(timelist!=null&&timelist.size()>0) {
//						String time=timelist.get(0);
//						a01.setA0288(time);
//						sess.saveOrUpdate(a01);
//						sess.flush();
//						this.getExecuteSG().addExecuteCode("realParent.setA0288Value('"+time+"')");//页面设置 人物信息表的现职务层次时间
//					}
//
//				}

				
				
				
				CustomQueryBS.setA01(a0000);
		    	A01 a01F = (A01)sess.get(A01.class, a0000);
				this.getExecuteSG().addExecuteCode(AddRmbPageModel.setTitle(a01F));
				
				
			}
			sess.flush();
			this.getExecuteSG().addExecuteCode("$h.alert('系统提示','保存成功！',null,'220')");
		} catch (Exception e) {
			e.printStackTrace();
			this.getExecuteSG().addExecuteCode("$h.alert('系统提示','保存失败！',null,'220')");
			return EventRtnType.FAILD;
		}
		
		
		this.getPageElement("a0500").setValue(a05.getA0500());// 保存成功将id返回到页面上。
		// this.getExecuteSG().addExecuteCode("Ext.getCmp('TrainingInfoGrid').getStore().reload()");//刷新专业技术职务列表
		this.getExecuteSG().addExecuteCode("radow.doEvent('TrainingInfoGrid.dogridquery')");
		//this.setNextEventName("TrainingInfoAddBtn.onclick");
		return EventRtnType.NORMAL_SUCCESS;
	}

	@PageEvent("deleteRow")
	@Transaction
	@Synchronous(true)
	@NoRequiredValidate
	public int deleteRow(String a0500) throws RadowException, AppException {
/*		Map map = this.getRequestParamer();
		int index = map.get("eventParameter") == null ? null
				: Integer.valueOf(String.valueOf(map.get("eventParameter")));
		String a0500 = this.getPageElement("TrainingInfoGrid").getValue("a0500", index).toString();*/
		String a0000=this.getPageElement("subWinIdBussessId").getValue();
		HBSession sess = null;
		try {
			sess = HBUtil.getHBSession();
			A05 a05 = (A05) sess.get(A05.class, a0500);
			a05.setA0000(a0000);
			A01 a01 = (A01) sess.get(A01.class, a05.getA0000());
			
			//applog.createLogNew("3A05","现职务层次删除","现职务层次",a0000,a01.getA0101(), new ArrayList<Object[]>());
			
			//记录删除哪个
			applog.createLogNew("3A05","现职务层次删除","现职务层次",a0000,a01.getA0101(), new Map2Temp().getLogInfo(a05, new A05()));

			
			String a0524 = a05.getA0524();
			if("1".equals(a0524)){
				a01.setA0288(null);
				a01.setA0221(null);//设置 人物信息表的现职务层次 为空
				sess.saveOrUpdate(a01);
				sess.flush();
				this.getExecuteSG().addExecuteCode("realParent.setA0221Value('','')");//页面设置 人物信息表的现职务为空
				this.getExecuteSG().addExecuteCode("realParent.setA0288Value('')");//页面设置 人物信息表的现职务层次时间
			}else {
				String a0221=a01.getA0221()==null?"":a01.getA0221();
				String a0288=a01.getA0288()==null?"":a01.getA0288();
				if(a0221.equals(a05.getA0501b())&&a0288.equals(a05.getA0504())) {
					HashMap map1 =new HashMap();
					map1.put("0121", "3");
					map1.put("0122", "4");
					map1.put("012201", "4");
					map1.put("012202", "4");
					map1.put("0131", "6");
					map1.put("013102", "5");
					map1.put("013103", "5");
					map1.put("013104", "4");
					map1.put("013105", "6");
					map1.put("0132", "7");
					map1.put("013201", "5");
					map1.put("013202", "7");
					map1.put("0141", "8");
					map1.put("014101", "8");
					map1.put("0142", "9");
					map1.put("014201", "9");
					map1.put("QY01", "3");
					map1.put("QY02", "4");
					map1.put("QY03", "5");
					map1.put("QY04", "6");
					map1.put("QY05", "4");
					map1.put("QY06", "5");
					map1.put("QY07", "6");
					map1.put("QY08", "7");
					
					String type=map1.get(a0221)==null?"":map1.get(a0221).toString();
					if(!"".equals(type)) {
						HashMap map2 =new HashMap();
						map2.put("3", "'0121','QY01'");
						map2.put("4", "'0122','012201','012202','013104','QY02','QY05'");
						map2.put("5", "'013102','013103','013201','QY03','QY06'");
						map2.put("6", "'0131','013105','QY04','QY07'");
						map2.put("7", "'0132','013202','QY08'");
						map2.put("8", "'0141','014101'");
						map2.put("9", "'0142','014201'");
						String cond=map2.get(type)==null?"":map2.get(type).toString();
						CommQuery commQuery =new CommQuery();
						String sql="select * from a05 where a0501b in ("+cond+") and a0000='"+a0000+"' and a0500<>'"+a0500+"' order by a0504 ";
						List<HashMap<String, Object>> list = commQuery.getListBySQL(sql); 
						if(list!=null&&list.size()>0) {
							a0221=list.get(0).get("a0501b").toString();
							a0288=list.get(0).get("a0504").toString();
							a01.setA0221(a0221);
							a01.setA0288(a0288);
							sess.saveOrUpdate(a01);
							sess.flush();
							//获得职务层次名称
							String a0501bName = HBUtil.getValueFromTab("CODE_NAME", "CODE_VALUE", " code_type='ZB09' and code_value = '"+a0221+"'");
							this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+a0221+"','"+a0501bName+"')");//页面设置 人物信息表的现职务层次
							this.getExecuteSG().addExecuteCode("realParent.setA0288Value('"+a0288+"')");//页面设置 人物信息表的现职务层次时间
						}
					}
					
				}
			}
			
			sess.delete(a05);
			this.getExecuteSG().addExecuteCode("radow.doEvent('TrainingInfoGrid.dogridquery')");
			a05 = new A05();
			PMPropertyCopyUtil.copyObjValueToElement(a05, this);
			
			CustomQueryBS.setA01(a01.getA0000());
	    	A01 a01F = (A01)sess.get(A01.class, a01.getA0000());
			this.getExecuteSG().addExecuteCode(AddRmbPageModel.setTitle(a01F));
			
		} catch (Exception e) {
			this.getExecuteSG().addExecuteCode("window.$h.alert('系统提示','删除失败！',null,'220')");
			return EventRtnType.FAILD;
		}
		return EventRtnType.NORMAL_SUCCESS;
	}

	@PageEvent("selectFun.click")
	@Transaction
	public int selectFuns(String index) throws RadowException{
		//String a0000 = this.getPageElement("a0000").getValue();
		String a0525 = this.getPageElement("a0525").getValue();
		//int index = this.getPageElement("TrainingInfoGrid").getCueRowIndex();
		String[] arr = index.split("_");
		String a0500 = this.getPageElement("TrainingInfoGrid").getValue("a0500", Integer.parseInt(arr[0])).toString();
		String a0000=this.getPageElement("subWinIdBussessId").getValue();
		HBSession sess = null;
		try{
			sess = HBUtil.getHBSession();
			A05 a05 = (A05) sess.get(A05.class, a0500);
			a05.setA0000(a0000);
			String sql = "update a05 set a0525 = '0' where a0000='"+a05.getA0000()+"'";
			sess.createSQLQuery(sql).executeUpdate();
			sess.flush();
			a05.setA0525(a0525);
			sess.saveOrUpdate(a05);
			sess.flush();
			A01 a01 = (A01) sess.get(A01.class, a0000);
			if(arr[1] != null && arr[1].equals("0")){
				a01.setA0221(null);
				sess.saveOrUpdate(a01);
				sess.flush();
			}else if(arr[1] != null && arr[1].equals("1")){
				String a0501b = a05.getA0501b();
				a01.setA0221(a0501b);
				sess.saveOrUpdate(a01);
				sess.flush();
			}
			
			String a0501b = a05.getA0501b();
			
			//获得职务层次名称
			String a0501bName = "";
			
			if(a0501b!=null){
				a0501bName = HBUtil.getValueFromTab("CODE_NAME", "CODE_VALUE", " code_type='ZB09' and code_value = '"+a0501b+"'");
				
			}
			this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+(a0501b==null?"":a0501b)+"','"+a0501bName+"')");//页面设置 人物信息表的现职务层次
			
			//this.getExecuteSG().addExecuteCode("realParent.setA0221Value('"+(a01.getA0221()==null?"":a01.getA0221())+"')");
			return EventRtnType.NORMAL_SUCCESS;
		}catch (Exception e) {
			this.getExecuteSG().addExecuteCode("window.$h.alert('系统提示','设置输出标识失败！',null,'220')");
			return EventRtnType.FAILD;
		}
	}
	/**
	 * 显示职务职级grid表格
	 * 
	 * @param start
	 * @param limit
	 * @return
	 * @throws RadowException
	 */
	@PageEvent("TrainingInfoGrid.dogridquery")
	@NoRequiredValidate
	public int trainingInforGridQuery(int start, int limit) throws RadowException {
		// String a0000 = this.getPageElement("a0000").getValue();
		String a0000=this.getPageElement("subWinIdBussessId").getValue();
		String sql = "select * from A05 where a0000='" + a0000 + "' and a0531='0'";
		this.pageQuery(sql, "SQL", start, limit); // 处理分页查询
		return EventRtnType.SPE_SUCCESS;
	}

	/**
	 * 
	 * 点击新增按钮事件
	 * @param start
	 * @param limit
	 * @return
	 * @throws RadowException
	 */
	@PageEvent("TrainingInfoAddBtn.onclick")
	@NoRequiredValidate
	public int trainingInforAddBtnWin(String id) throws RadowException {
		// String a0000 = this.getPageElement("a0000").getValue();//获取页面人员内码
		String a0000=this.getPageElement("subWinIdBussessId").getValue();
		if (a0000 == null || "".equals(a0000)) {//
			this.getExecuteSG().addExecuteCode("window.$h.alert('系统提示','请先保存人员基本信息！',null,'220')");
			return EventRtnType.NORMAL_SUCCESS;
		}
		A05 a05 = new A05();
		a05.setA0000(a0000);
		PMPropertyCopyUtil.copyObjValueToElement(a05, this);
		this.getExecuteSG().addExecuteCode("setA0517Disabled();");
		return EventRtnType.NORMAL_SUCCESS;
	}

	/**
	 * 修改事件
	 * 
	 * @return
	 * @throws RadowException
	 */
	@PageEvent("TrainingInfoGrid.rowclick")
	@GridDataRange
	@NoRequiredValidate
	public int trainingInforGridOnRowClick() throws RadowException {
		int index = this.getPageElement("TrainingInfoGrid").getCueRowIndex();
		String a0500 = this.getPageElement("TrainingInfoGrid").getValue("a0500", index).toString();
		String a0000=this.getPageElement("subWinIdBussessId").getValue();
		HBSession sess = null;
		try {
			sess = HBUtil.getHBSession();
			A05 a05 = (A05) sess.get(A05.class, a0500);
			a05.setA0000(a0000);
			PMPropertyCopyUtil.copyObjValueToElement(a05, this);
		} catch (Exception e) {
			this.getExecuteSG().addExecuteCode("window.$h.alert('系统提示','查询失败！',null,'220')");
			return EventRtnType.FAILD;
		}
		this.getExecuteSG().addExecuteCode("setA0517Disabled();");
		//this.getExecuteSG().addExecuteCode("a0501bChange();");
		return EventRtnType.NORMAL_SUCCESS;
	}

	/**
	 * 将实体POJO转化为JSON
	 * 
	 * @param obj
	 * @return
	 * @throws JSONException
	 * @throws IOException
	 */
	public static <T> String objectToJson(T obj) throws JSONException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		// Convert object to JSON string
		String jsonStr = "{}";
		try {
			jsonStr = mapper.writeValueAsString(obj);
		} catch (IOException e) {
			throw e;
		}
		return jsonStr;
	}

}
