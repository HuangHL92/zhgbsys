<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/odin.tld" prefix="odin"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@include file="/comOpenWinInit2.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/picCut/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="basejs/helperUtil.js"></script>
<script type="text/javascript" src="js/lengthValidator.js"></script>
<style>
/**
 * 页面样式CSS
 */
#tag_container {
	width: 774px;
	height: 538px;
	margin: 1px;
	border-width: 1px 1px;
	border-style: solid;
	border-color: #74A6CC;
	padding: 2px 0 2px 2px;
}

#left_div {
	width: 240px;
	height: 536px;
	float: left;
	padding-right: 4px; overflow-x : hidden;
	overflow-y: auto;
	overflow-x: hidden;
}

#left_div div {
	width: 100%;
	height: 26px;
	font-size: 14px;
	border-width: 0 1px 1px 1px;
	border-style: solid;
	border-color: #74A6CC;
	line-height: 26px;
	padding-left: 2px;
}

#right_div {
	width: 520px;
	height: 520px;
	float: left;
	padding-left: 10px;
}

#right_div table {
	font-size: 14px;
}

#right_div div {
	display: none;
	width: 100%;
	height: 536px;
	overflow-y: auto;
}

#right_div div table {
	font-size: 14px;
}

#right_div table tr td {
	height: 26px;
	line-height: 26px;
}

#right_div table tr td input[type=text] {
	width: 50px;
	height: 21px;
}

#bottom_div {
	width: 100%;
	height: 40px;
	padding-top: 5px;
}

#bottom_div table {
	width: 100%;
}
</style>
<div id="tag_container">
	<div id="left_div">
		<div class="leftMenu" onclick="changeTag(this, '01');" id="firstTag" style="border-width: 1px; background: #1E90FF">企业经历</div>
		<!-- <div class="leftMenu" onclick="changeTag(this, '02');">省区市职务</div>
		<div class="leftMenu" onclick="changeTag(this, '03');">副省级城市职务</div>
		<div class="leftMenu" onclick="changeTag(this, '04');">地（市、州、盟）职务</div>
		<div class="leftMenu" onclick="changeTag(this, '05');">县（市、区、旗）职务</div>
		<div class="leftMenu" onclick="changeTag(this, '06');">乡镇（街道）职务</div>
		<div class="leftMenu" onclick="changeTag(this, '07');">金融企业职务</div>
		<div class="leftMenu" onclick="changeTag(this, '08');">企业职务</div>
		<div class="leftMenu" onclick="changeTag(this, '09');">高校职务</div>
		<div class="leftMenu" onclick="changeTag(this, '10');">科研院所职务</div>
		<div class="leftMenu" onclick="changeTag(this, '11');">公立医院职务</div>
		<div class="leftMenu" onclick="changeTag(this, '12');">困难艰苦地区工作经历</div> -->
		<div class="leftMenu" onclick="changeTag(this, '13');">团口经历</div>
		<div class="leftMenu" onclick="changeTag(this, '15');">法律工作经历</div>
		<div class="leftMenu" onclick="changeTag(this, '16');">秘书经历</div>
		<div class="leftMenu" onclick="changeTag(this, '24');">上挂下派工作经历</div>
		
		<div class="leftMenu" onclick="changeTag(this, '18');">其他经历</div>
		<div class="leftMenu" onclick="changeTag(this, '21');">特殊身份</div>
		<!-- <div class="leftMenu" onclick="changeTag(this, '14');">曾任两代表一委员情况</div>
		
		
		<div class="leftMenu" onclick="changeTag(this, '17');">开发区、高新区、自贸区等经历</div>
		<div class="leftMenu" onclick="changeTag(this, '20');">海外工作经历</div> -->
<!-- 		
		<div class="leftMenu" onclick="changeTag(this, '22');">下级企业正职任职经历</div>
		<div class="leftMenu" onclick="changeTag(this, '23');">总部职能部门任职经历</div>
		 -->
		
	</div>
	<div id="right_div">
	    <!-- 企业经历 -->
		<table id="tag01" style="display: block;">
			<tr>
				<td>
					<input type="checkbox" name="tag0101" id="tag0101" >
					<label>民营企业</label>
				</td>	
			</tr>	
			
			
		</table>
		<table id="tag02" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag0201" id="tag0201" >
					<label>省直部门正职领导职务</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0202" id="tag0202" >
					<label>省直部门副职领导职务 </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0203" id="tag0203" >
					<label>省直部门县处级正职领导职务</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0204" id="tag0204" >
					<label>省直部门县处级副职领导职务</label>
				</td>	
			</tr>
		</table>
		<!-- 副省级城市职务 -->
		<table id="tag03" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag0301" id="tag0301" >
					<label>副省级城市不兼任政府正职的副书记</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0302" id="tag0302" >
					<label>副省级城市政府常务副职 </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0303" id="tag0303" >
					<label>副省级城市党政副职 </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0308" id="tag0308" >
					<label>副省级城市法检“两长”</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0304" id="tag0304" >
					<label>副省级城市直属部门正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0305" id="tag0305" >
					<label>副省级城市直属部门副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0306" id="tag0306" >
					<label>副省级城市直属部门中层正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0307" id="tag0307" >
					<label>副省级城市直属部门中层副职</label>
				</td>	
			</tr>
		</table>	
		<!-- 地（市、州、盟）职务 -->
		<table id="tag04" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag0401" id="tag0401" >
					<label>地（市、州、盟）党委正职&nbsp;&nbsp;</label>
					<label>任职年限:</label>
					<input type="text" name="tag0401n" id="tag0401n" style="width:50px;height:21px;" >
					<label>年</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0402" id="tag0402" >
					<label>地（市、州、盟）政府正职&nbsp;&nbsp;</label>
					<label>任职年限:</label>
					<input type="text" name="tag0402n" id="tag0402n" style="width:50px;height:21px;" >
					<label>年</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0403" id="tag0403" >
					<label>地（市、州、盟）不兼任政府正职的副书记</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0404" id="tag0404" >
					<label>地（市、州、盟）政府常务副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0405" id="tag0405" >
					<label>地（市、州、盟）党政副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0410" id="tag0410" >
					<label>地（市、州、盟）法检“两长” </label>
				</td>	
			</tr>	
			<tr>
				<td>
					<input type="checkbox" name="tag0406" id="tag0406" >
					<label>地（市、州、盟）直属部门正职 </label>
				</td>	
			</tr>
<!-- 			<tr>
				<td>
					<input type="checkbox" name="tag0407" id="tag0407" >
					<label>市直属部门班子成员（副职） </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0408" id="tag0408" >
					<label>市直属部门中层正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0409" id="tag0409" >
					<label>市直属部门中层副职 </label>
				</td>	
			</tr>	 -->								
			<tr>
				<td>
					<input type="checkbox" name="tag0411" id="tag0411" >
					<label>地（市、州、盟）直属部门班子成员(副职)</label>
				</td>	
			</tr>					
		</table>	
		<!-- 县（市、区、旗）职务 -->
		<table id="tag05" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag0501" id="tag0501" >
					<label>县（市、区、旗）党委正职&nbsp;&nbsp;</label>
					<label>任职年限:</label>
					<input type="text" name="tag0501n" id="tag0501n" style="width:50px;height:21px;" >
					<label>年</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0502" id="tag0502" >
					<label>县（市、区、旗）政府正职&nbsp;&nbsp;</label>
					<label>任职年限:</label>
					<input type="text" name="tag0502n" id="tag0502n" style="width:50px;height:21px;" >
					<label>年</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0504" id="tag0504" >
					<label>县（市、区、旗）脱贫攻坚期间贫困县党政正职 </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0503" id="tag0503" >
					<label>县（市、区、旗）党政副职 </label>
				</td>	
			</tr>
<!-- 			<tr>
				<td>
					<input type="checkbox" name="tag0505" id="tag0505" >
					<label>县级部门正职 </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0506" id="tag0506" >
					<label>县级部门班子成员（副职） </label>
				</td>	
			</tr> -->
			<tr>
				<td>
					<input type="checkbox" name="tag0507" id="tag0507" >
					<label>县（市、区、旗）法检“两长” </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0508" id="tag0508" >
					<label>县（市、区、旗）直属部门正职 </label>
				</td>	
			</tr>
		</table>	
		<!-- 乡镇（街道）职务 -->
		<table id="tag06" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag0601" id="tag0601" >
					<label>乡镇（街道）党政正职  </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0602" id="tag0602" >
					<label>乡镇（街道）党政班子成员 </label>
				</td>	
			</tr>
		</table>	
		<!-- 金融企业职务  -->
		<table id="tag07" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag0701" id="tag0701" >
					<label>中管金融企业副职  </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0702" id="tag0702" >
					<label>中管金融企业二级正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0703" id="tag0703" >
					<label>中管金融企业二级副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0704" id="tag0704" >
					<label>中央单位所属金融企业正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0705" id="tag0705" >
					<label>中央单位所属金融企业副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0708" id="tag0708" >
					<label>省属金融企业正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0709" id="tag0709" >
					<label>省属金融企业副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0713" id="tag0713" >
					<label>省属金融企业党委委员</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0714" id="tag0714" >
					<label>省属金融企业保留待遇人员</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0712" id="tag0712" >
					<label>市属金融企业正职</label>
				</td>	
			</tr>
		</table>	
		<!-- 企业职务 -->
		<table id="tag08" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag0801" id="tag0801" >
					<label>中管企业副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0802" id="tag0802" >
					<label>中管企业二级正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0803" id="tag0803" >
					<label>中管企业二级副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0820" id="tag0820" >
					<label>中管企业三级正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0804" id="tag0804" >
					<label>国务院国资委管理的企业正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0805" id="tag0805" >
					<label>国务院国资委管理的企业副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0806" id="tag0806" >
					<label>国务院国资委管理的企业二级正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0813" id="tag0813" >
					<label>中央单位所属企业正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0814" id="tag0814" >
					<label>中央单位所属企业副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0808" id="tag0808" >
					<label>省属企业正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0809" id="tag0809" >
					<label>省属企业副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0810" id="tag0810" >
					<label>省属企业党委委员</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0811" id="tag0811" >
					<label>省属企业保留待遇人员</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag0812" id="tag0812" >
					<label>市属企业正职</label>
				</td>	
			</tr>
		</table>	
		<!-- 高校职务 -->
		<div id="tag09" style="display: none;">
			<table>
				<tr>
					<td>
						<input type="checkbox" name="tag0901" id="tag0901" >
						<label>中管高校副职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0902" id="tag0902" >
						<label>中管高校中层正职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0903" id="tag0903" >
						<label>中管高校中层副职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0904" id="tag0904" >
						<label>部属高校正职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0905" id="tag0905" >
						<label>部属高校副职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0906" id="tag0906" >
						<label>部属高校中层正职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0907" id="tag0907" >
						<label>省属高校正职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0908" id="tag0908" >
						<label>省属高校副职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0909" id="tag0909" >
						<label>省属高校中层正职</label>
					</td>	
				</tr>
				<!-- <tr>
					<td>
						<input type="checkbox" name="tag0910" id="tag0910" >
						<label>国家“双一流”建设高校</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0911" id="tag0911" >
						<label>省重点建设高校</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0912" id="tag0912" >
						<label>本科高校党委书记</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0913" id="tag0913" >
						<label>本科高校校长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0914" id="tag0914" >
						<label>本科党委副书记</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0915" id="tag0915" >
						<label>本科高校副校长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0916" id="tag0916" >
						<label>本科高校党委委员</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0917" id="tag0917" >
						<label>高职院校党委书记</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0918" id="tag0918" >
						<label>高职院校校长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0919" id="tag0919" >
						<label>高职院校党委副书记</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0920" id="tag0920" >
						<label>高职院校副校长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0921" id="tag0921" >
						<label>本科高校二级学院党委书记</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0922" id="tag0922" >
						<label>本科高校二级学院院长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0923" id="tag0923" >
						<label>本科高校部门正职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0924" id="tag0924" >
						<label>本科高校部门副职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0925" id="tag0925" >
						<label>有地方领导工作经历</label>
					</td>	
				</tr> -->
				<tr>
					<td>
						<input type="checkbox" name="tag0926" id="tag0926" >
						<label>“双肩挑”干部</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0927" id="tag0927" >
						<label>国家级高层次人才</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0928" id="tag0928" >
						<label>具有高校二级院(系)正职经历</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag0929" id="tag0929" >
						<label>具有国(境)外留学经历</label>
					</td>	
				</tr>
			</table>	
		</div>
		<!-- 科研院所职务  -->
		<table id="tag10" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag1001" id="tag1001" >
					<label>党中央和国务院直属科研院所内设机构正职&nbsp;&nbsp;</label>
					<label>任职年限:</label>
					<input type="text" name="tag1001n" id="tag1001n" style="width:50px;height:21px;" >
					<label>年</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1002" id="tag1002" >
					<label>党中央和国务院直属科研院所内设机构副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1003" id="tag1003" >
					<label>中央单位所属科研院所正职&nbsp;&nbsp;</label>
					<label>任职年限:</label>
					<input type="text" name="tag1003n" id="tag1003n" style="width:50px;height:21px;" >
					<label>年</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1004" id="tag1004" >
					<label>中央单位所属科研院所副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1005" id="tag1005" >
					<label>省属科研院所正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1006" id="tag1006" >
					<label>省属科研院所副职</label>
				</td>	
			</tr>
		</table>	
		<!-- 公立医院职务 -->
		<table id="tag11" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag1101" id="tag1101" >
					<label>国家卫健委直属医院正职&nbsp;&nbsp;</label>
					<label>任职年限:</label>
					<input type="text" name="tag1101n" id="tag1101n" style="width:50px;height:21px;" >
					<label>年</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1102" id="tag1102" >
					<label>国家卫健委直属医院副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1103" id="tag1103" >
					<label>国家卫健委直属医院中层正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1104" id="tag1104" >
					<label>中管高校附属医院正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1105" id="tag1105" >
					<label>中管高校附属医院副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1106" id="tag1106" >
					<label>部属高校附属医院正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1107" id="tag1107" >
					<label>部属高校附属医院副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1108" id="tag1108" >
					<label>省属公立医院正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1109" id="tag1109" >
					<label>省属公立医院副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1111" id="tag1111" >
					<label>省属高校附属医院正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1112" id="tag1112" >
					<label>省属高校附属医院副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1110" id="tag1110" >
					<label>市属公立医院正职</label>
				</td>	
			</tr>
		</table>	
		<!-- 困难艰苦地区工作经历  -->
		<table id="tag12" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag1201" id="tag1201" >
					<label>新疆工作经历&nbsp;&nbsp;</label>
					<label>备注:</label>
					<input type="text" name="tag1201n" id="tag1201n" style="width:150px;height:21px;" >
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1202" id="tag1202" >
					<label>西藏工作经历&nbsp;&nbsp;</label>
					<label>备注:</label>
					<input type="text" name="tag1202n" id="tag1202n" style="width:150px;height:21px;" >
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1203" id="tag1203" >
					<label>青海工作经历&nbsp;&nbsp;</label>
					<label>备注:</label>
					<input type="text" name="tag1203n" id="tag1203n" style="width:150px;height:21px;" >
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1208" id="tag1208" >
					<label>四川工作经历</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1209" id="tag1209" >
					<label>吉林工作经历</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1204" id="tag1204" >
					<label>贫困地区工作经历&nbsp;&nbsp;</label>
					<label>备注:</label>
					<input type="text" name="tag1204n" id="tag1204n" style="width:150px;height:21px;" >
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1205" id="tag1205" >
					<label>西部地区、老工业基地和革命老区</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1206" id="tag1206" >
					<label>赣南中央苏区 </label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1207" id="tag1207" >
					<label>其他困难艰苦或对口援建地区工作经历</label>
				</td>	
			</tr>
		</table>	
		<!-- 团口经历  -->
		<table id="tag13" style="display: none;">
			<tr>
				<td style="display: none;">
					<input type="checkbox" name="tag1301" id="tag1301" >
					<label>团中央书记处书记</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1302" id="tag1302" >
					<label>团中央部门（单位）正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1303" id="tag1303" >
					<label>团中央部门（单位）副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1304" id="tag1304" >
					<label>团省委正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1305" id="tag1305" >
					<label>团省委副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1306" id="tag1306" >
					<label>团省委中层正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1307" id="tag1307" >
					<label>团省委中层副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1308" id="tag1308" >
					<label>团市委正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1309" id="tag1309" >
					<label>团市委副职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1310" id="tag1310" >
					<label>团县委正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1311" id="tag1311" >
					<label>团县委副职</label>
				</td>	
			</tr>
		</table>	
		<!-- 曾任两代表一委员情况 -->
		<table id="tag14" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag1401" id="tag1401" >
					<label>党的全国代表大会代表</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1402" id="tag1402" >
					<label>全国人大代表</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1403" id="tag1403" >
					<label>全国人大专门委员会委员</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1404" id="tag1404" >
					<label>全国政协委员</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1405" id="tag1405" >
					<label>全国政协各专门委员会副主任</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1406" id="tag1406" >
					<label>党的全省代表大会代表</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1407" id="tag1407" >
					<label>全省人大代表</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1408" id="tag1408" >
					<label>全省人大专门委员会委员</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1409" id="tag1409" >
					<label>全省政协委员</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1410" id="tag1410" >
					<label>全省政协各专门委员会副主任</label>
				</td>	
			</tr>
		</table>	
		<!-- 政法工作经历  -->
		<div id="tag15" style="display: none;">
			<table>
				<tr>
					<td>
						<input type="checkbox" name="tag1511" id="tag1511" >
						<label>担任过助理审判员或助理检察员以上职务</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1501" id="tag1501" >
						<label>律师工作</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1509" id="tag1509" >
						<label>法律教学和研究工作</label>
					</td>	
				</tr>
				<!-- 
				<tr>
					<td>
						<input type="checkbox" name="tag1502" id="tag1502" >
						<label>检察院工作&nbsp;&nbsp;</label>
						<label>任职年限:</label>
						<input type="text" name="tag1502n" id="tag1502n" style="width:50px;height:21px;" >
						<label>年</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1503" id="tag1503" >
						<label>法院工作&nbsp;&nbsp;</label>
						<label>任职年限:</label>
						<input type="text" name="tag1503n" id="tag1503n" style="width:50px;height:21px;" >
						<label>年</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1504" id="tag1504" >
						<label>公安机关工作&nbsp;&nbsp;</label>
						<label>任职年限:</label>
						<input type="text" name="tag1504n" id="tag1504n" style="width:50px;height:21px;" >
						<label>年</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1505" id="tag1505" >
						<label>司法监所系统工作&nbsp;&nbsp;</label>
						<label>任职年限:</label>
						<input type="text" name="tag1505n" id="tag1505n" style="width:50px;height:21px;" >
						<label>年</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1506" id="tag1506" >
						<label>国家安全机关工作&nbsp;&nbsp;</label>
						<label>任职年限:</label>
						<input type="text" name="tag1506n" id="tag1506n" style="width:50px;height:21px;" >
						<label>年</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1507" id="tag1507" >
						<label>国家或地方立法工作&nbsp;&nbsp;</label>
						<label>任职年限:</label>
						<input type="text" name="tag1507n" id="tag1507n" style="width:50px;height:21px;" >
						<label>年</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1508" id="tag1508" >
						<label>律师&nbsp;&nbsp;</label>
						<label>任职年限:</label>
						<input type="text" name="tag1508n" id="tag1508n" style="width:50px;height:21px;" >
						<label>年</label>
					</td>	
				</tr>
				
				<tr>
					<td>
						<input type="checkbox" name="tag1510" id="tag1510" >
						<label>政法单位主要领导任职经历</label>
					</td>	
				</tr>
				
				<tr>
					<td>
						<input type="checkbox" name="tag1512" id="tag1512" >
						<label>担任过法检“两长”&nbsp;&nbsp;</label>
						<label>备注（注明市、县）:</label>
						<input type="text" name="tag1512n" id="tag1512n" style="width:50px;height:21px;" >
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1513" id="tag1513" >
						<label>担任过公安局长&nbsp;&nbsp;</label>
						<label>备注（注明市、县）:</label>
						<input type="text" name="tag1513n" id="tag1513n" style="width:50px;height:21px;" >
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1514" id="tag1514" >
						<label>担任过司法局长&nbsp;&nbsp;</label>
						<label>备注（注明市、县）:</label>
						<input type="text" name="tag1514n" id="tag1514n" style="width:50px;height:21px;" >
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1515" id="tag1515" >
						<label>政法单位班子成员任职经历</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1516" id="tag1516" >
						<label>政法单位常务副职&nbsp;&nbsp;</label>
						<label>备注（注明省、市、县）:</label>
						<input type="text" name="tag1516n" id="tag1516n" style="width:50px;height:21px;" >
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1517" id="tag1517" >
						<label>政法单位班子成员&nbsp;&nbsp;</label>
						<label>备注（注明省、市、县）:</label>
						<input type="text" name="tag1517n" id="tag1517n" style="width:50px;height:21px;" >
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1518" id="tag1518" >
						<label>在政法单位任现职领导岗位任职情况</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1519" id="tag1519" >
						<label>现领导岗位任职时间</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1520" id="tag1520" >
						<label>现班子任职时间</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1521" id="tag1521" >
						<label>现领导职务层次任职时间</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1522" id="tag1522" >
						<label>从事法律工作时间</label>
					</td>	
				</tr> 
				<tr>
					<td>
						<input type="checkbox" name="tag1523" id="tag1523" >
						<label>法律工作经历五年以上</label>
					</td>	
				</tr>
				 <tr>
					<td>
						<input type="checkbox" name="tag1524" id="tag1524" >
						<label>从事法律工作两年至五年</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1525" id="tag1525" >
						<label>从事法律工作一年至两年</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1526" id="tag1526" >
						<label>政法系统领导干部交流任职情况</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1527" id="tag1527" >
						<label>同一单位上下级之间交流任职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1528" id="tag1528" >
						<label>从政法系统内交流任职</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1529" id="tag1529" >
						<label>从政法系统外交流任职</label>
					</td>	
				</tr> 
				<tr>
					<td>
						<input type="checkbox" name="tag1530" id="tag1530" >
						<label>通过国家统一法律职业资格考试取得法律职业资格</label>
					</td>	
				</tr>
				 <tr>
					<td>
						<input type="checkbox" name="tag1534" id="tag1534" >
						<label>二级大法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1535" id="tag1535" >
						<label>一级高级法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1536" id="tag1536" >
						<label>二级高级法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1537" id="tag1537" >
						<label>三级高级法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1538" id="tag1538" >
						<label>四级高级法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1539" id="tag1539" >
						<label>一级法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1540" id="tag1540" >
						<label>二级法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1541" id="tag1541" >
						<label>三级法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1542" id="tag1542" >
						<label>四级法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1543" id="tag1543" >
						<label>五级法官、检察官</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1545" id="tag1545" >
						<label>一级警务专员</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1546" id="tag1546" >
						<label>二级警务专员</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1547" id="tag1547" >
						<label>一级高级警长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1548" id="tag1548" >
						<label>二级高级警长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1549" id="tag1549" >
						<label>三级高级警长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1550" id="tag1550" >
						<label>四级高级警长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1552" id="tag1552" >
						<label>一级警长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1553" id="tag1553" >
						<label>二级警长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1554" id="tag1554" >
						<label>三级警长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1555" id="tag1555" >
						<label>四级警长</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1557" id="tag1557" >
						<label>一级警员</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1558" id="tag1558" >
						<label>二级警员</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1560" id="tag1560" >
						<label>警务技术一级总监</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1561" id="tag1561" >
						<label>警务技术二级总监</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1562" id="tag1562" >
						<label>警务技术一级主任</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1563" id="tag1563" >
						<label>警务技术二级主任</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1564" id="tag1564" >
						<label>警务技术三级主任</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1565" id="tag1565" >
						<label>警务技术四级主任</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1566" id="tag1566" >
						<label>警务技术一级主管</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1567" id="tag1567" >
						<label>警务技术二级主管</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1568" id="tag1568" >
						<label>警务技术三级主管</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1569" id="tag1569" >
						<label>警务技术四级主管</label>
					</td>	
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="tag1570" id="tag1570" >
						<label>警务技术员</label>
					</td>	
				</tr> -->
			</table>	
		</div>
		<!-- 秘书经历 -->
		<table id="tag16" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag1601" id="tag1601" >
					<label>现职党和国家领导人秘书</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1602" id="tag1602" >
					<label>现职正省级领导秘书</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1603" id="tag1603" >
					<label>现职副省级领导秘书</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1604" id="tag1604" >
					<label>非现职党和国家领导人秘书</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1605" id="tag1605" >
					<label>非现职正省级领导秘书</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1606" id="tag1606" >
					<label>非现职副省级领导秘书</label>
				</td>	
			</tr>
			<tr style="display: none;">
				<td>
					<input type="checkbox" name="tag1607" id="tag1607" >
					<label>中管金融企业、中管企业现职主要负责人秘书</label>
				</td>	
			</tr>
			<tr style="display: none;">
				<td>
					<input type="checkbox" name="tag1608" id="tag1608" >
					<label>中管金融企业、中管企业非现职主要负责人秘书</label>
				</td>	
			</tr>
		</table>	
		<!-- 开发区、高新区、自贸区等经历  -->
		<table id="tag17" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag1701" id="tag1701" >
					<label>国家级开发区、高新区、自贸区</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1702" id="tag1702" >
					<label>省级开发区、高新区、自贸区</label>
				</td>	
			</tr>
		</table>
		<!-- 海外工作经历  -->
		<table id="tag20" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag2001" id="tag2001" >
					<label>大使</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2002" id="tag2002" >
					<label>公使</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2003" id="tag2003" >
					<label>公使衔参赞</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2004" id="tag2004" >
					<label>总领事</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2005" id="tag2005" >
					<label>副总领事</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2006" id="tag2006" >
					<label>海外工作</label>
				</td>	
			</tr>
		</table>
  		<!-- 特殊身份 -->
		<table id="tag21" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag2101" id="tag2101" >
					<label>具备侨的身份</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2102" id="tag2102" >
					<label>具备法检有关任职资格</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2103" id="tag2103" >
					<label>具备金融机构有关任职资格</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2104" id="tag2104" >
					<label>裸官</label>
				</td>	
			</tr>
		<!-- 	<tr>
				<td>
					<input type="checkbox" name="tag2105" id="tag2105" >
					<label>工会主席工作</label>
				</td>	
			</tr>-->
		</table>	
<!-- 
		<table id="tag22" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag2201" id="tag2201" >
					<label>担任过二级企业正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2202" id="tag2202" >
					<label>担任过三级企业正职</label>
				</td>	
			</tr>
		</table>
		<table id="tag23" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag2301" id="tag2301" >
					<label>担任过部门正职</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2302" id="tag2302" >
					<label>担任过部门副职</label>
				</td>	
			</tr>
		</table>   -->
		<!-- 上挂下派工作经历 -->
		<table id="tag24" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag2401" id="tag2401" >
					<label>挂职担任过中央国家机关副处以上职务</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2402" id="tag2402" >
					<label>挂职担任过省直单位副处以上职务</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2403" id="tag2403" >
					<label>挂职担任过市县副处以上职务</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag2404" id="tag2404" >
					<label>挂职担任过其他基层职务</label>
				</td>	
			</tr>
		</table>
		<!-- 其他经历 -->
		<table id="tag18" style="display: none;">
			<tr>
				<td>
					<input type="checkbox" name="tag1801" id="tag1801" >
					<label>中组部双向交流任职干部</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1802" id="tag1802" >
					<label>中组部双向交流挂职干部</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1803" id="tag1803" >
					<label>两年及以上基层工作经历</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1821" id="tag1821" >
					<label>具有高级专业技术职务（职称）</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1822" id="tag1822" >
					<label>具有国(境)外留学经历</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1805" id="tag1805" >
					<label>破格提拔</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1806" id="tag1806" >
					<label>公开选拔</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1823" id="tag1823" >
					<label>副师职以上军转</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1824" id="tag1824" >
					<label>团职及以下军转</label>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="tag1807" id="tag1807" >
					<label>选调生</label>
				</td>	
			</tr>
			<tr style="display: none;">
				<td>
					<input type="checkbox" name="tag1809" id="tag1809" onclick="disableInputTag(this,'tag1809n')">
					<label>其它</label>
				</td>	
			</tr>
			<tr style="display: none;">
				<td>
					<textarea rows="3" cols="70"  name="tag1809n" id="tag1809n" disabled="disabled"></textarea>
				</td>	
			</tr>
		</table>		
	</div>
</div>
<%-- <div id="bottom_div">
	<table>
		<tr>
			<td align="center" >
				<odin:button text="保&nbsp;&nbsp;存" property="save" />
			</td>		
		</tr>		
	</table>
</div>  --%>
<table align="center" width="96%">	
			<td align="center">
				<img src="<%=request.getContextPath()%>/images/bc.png" onclick="radow.doEvent('save')">
			</td>
</table>
<script type="text/javascript">
//根据父节点切换子节点
function changeTag(node, codevalue){
	var codevaluelist = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17','20','21','18','24'];
	for(var i = 0,len=codevaluelist.length; i < len; i++) {
		document.getElementById("tag" + codevaluelist[i]).style.display = "none";
	}
	document.getElementById("tag" + codevalue).style.display = "block";
	changeTagMenuHover(node);
}

//标签用
function disableInputTag(check,inputId) {
	var obj = $('#'+inputId);
	if($(check).is(':checked')) {
		obj.attr("disabled",false);
	} else {
		obj.val("");
		obj.attr("disabled","disabled");
	}
}
/**
 * ******************************************此处以下所有方法用于修改左侧菜单鼠标悬停样式【成套使用】*******************************************************
 */
Ext.onReady(function() {
	leftMenuHover();
	unbindOnmouseEvent(document.getElementById("firstTag"));
});

function changeTagMenuHover(node){
	var nodes = getElementsByClassName("leftMenu", "div");
	for(i = 0,len=nodes.length; i < len; i++) {
		nodes[i].style.backgroundColor = "#FFFFFF";
		bindOnmouseEvent(nodes[i]);
	}
	unbindOnmouseEvent(node);
	node.style.backgroundColor = "#1E90FF";
}

//菜单鼠标悬浮，点击，离开事件
function leftMenuHover(){
	var nodes = getElementsByClassName("leftMenu", "div");
	for(i = 0,len=nodes.length; i < len; i++) {
		bindOnmouseEvent(nodes[i]);
	}
}

/*
 * 重写getElementsByClassName()方法，IE8及以下没有该方法
 */
function getElementsByClassName(className, tagName) {
    if (document.getElementsByClassName) {
        // 使用现有方法
        return document.getElementsByClassName(className);
    } else {
        // 循环遍历所有标签，返回带有相应类名的元素
        var rets = [], nodes = document.getElementsByTagName(tagName);
        for (var i = 0, len = nodes.length; i < len; i++) {
            if (hasClass(nodes[i],className)) {
            	rets.push(nodes[i]);
            }
        }
        return rets;
    }
}

function hasClass(tagStr,className){  
    var arr=tagStr.className.split(/\s+/ );  //这个正则表达式是因为class可以有多个,判断是否包含  
    for (var i=0;i<arr.length;i++){  
           if (arr[i]==className){  
                 return true ;  
           }  
    }  
    return false ;  
}

function bindOnmouseEvent(node){
	node.onmouseover=function(){ node.style.backgroundColor = "#1E90FF"; };//鼠标悬停事件
	node.onmouseout=function(){ node.style.backgroundColor = "#FFFFFF"; };//鼠标离开事件
	node.onmousedown=function(){node.style.backgroundColor = "#1E90FF";};//鼠标点击时触发事件
}

function unbindOnmouseEvent(node){
	node.onmouseover=function(){ node.style.backgroundColor = "#1E90FF"; };//鼠标悬停事件
	node.onmouseout=function(){ node.style.backgroundColor = "#1E90FF"; };//鼠标离开事件
	node.onmousedown=function(){ node.style.backgroundColor = "#1E90FF"; };//鼠标点击时触发事件
}
</script>
