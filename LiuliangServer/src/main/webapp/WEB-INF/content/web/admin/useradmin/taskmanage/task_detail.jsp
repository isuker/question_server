<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.foal.liuliang.pojo.LLTask"%>
<%@page import="org.apache.commons.lang3.math.NumberUtils"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
    <meta http-equiv="expires" content="0">
	<title>流量符-个人中心，汇聚更多流量</title>
    <meta name="keywords" content="流量符、买流量、搜索流量、流量精灵、淘流量、流量查询、刷人气、刷流量网站、淘宝流量、京东流量、手机淘宝流量">
    <meta name="description" content="流量符是一个专业的刷流量网站，通过搜索关键词，将流量导入网店中，来提高网店排名，刷淘宝排名、京东排名、网店访问量和刷人气，是网店推广、网络营销必备的流量推广神器！">
	<link rel="shortcut icon" type="image/x-icon" href="${ctx}/images/favicon.ico" media="screen">
	<script type="text/javascript" src="${ctx}/js/base.js"></script>
  	<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
	<link rel="stylesheet" href="${ctx}/static_shop/style/common.css">
    <link rel="stylesheet" href="${ctx}/static_shop/style/person_center.css">
    <link rel="stylesheet" href="${ctx}/static_shop/style/popup.css">
    <link rel="stylesheet" href="${ctx}/static_shop/style/register.css">
    <link rel="stylesheet" href="${ctx}/static_shop/style/release.css">
    <link rel="stylesheet" href="${ctx}/static_shop/style/detail.css">
	<script type="text/javascript">

	$('document').ready(function() {
		var pageStayCostScore = parseInt($("#pageStayCostScore").val());
		var visitTimeCostScore = parseInt($("#visitTimeCostScore").val());
		var quickVerifyCostScore = parseInt($("#quickVerifyCostScore").val());
		var quickExecuteCostScore = parseInt($("#quickExecuteCostScore").val());
		var oneKeywordCostScore_4 = parseInt($("#oneKeywordCostScore_4").val());
		var oneKeywordCostScore_5 = parseInt($("#oneKeywordCostScore_5").val());
		var addedCostScore = pageStayCostScore + visitTimeCostScore + quickVerifyCostScore + quickExecuteCostScore + oneKeywordCostScore_4 + oneKeywordCostScore_5;
		$("#addedCostScore").html(addedCostScore);
		$("#addedCostScoreVal").val(addedCostScore);
		var visitCostScore = parseInt($("#visitCostScoreVal").val());
		var allCostScore = parseInt($("#allCostScoreVal").val());
		var adjustCostScore = allCostScore - visitCostScore - addedCostScore;
		$("#adjustCostScore").html(adjustCostScore);
	});
	
	function isOutTime(result) {
		if (result.indexOf("win.location.href='${ctx}/web/admin/index'") > 0) {
			alert("登录超时,请重新登录.");
			var win = window;
			while (win != window.parent) {
				win = window.parent;
			}
			win.location.href='${ctx}/web/admin/index';
			return true;
		}
		return false;
	}
	
	function check_task(taskId){
		var url = "${ctx}/web/admin/useradmin/taskmanage/check_task";
		$.ajax( {
			url : url,
			type : 'post',
			data : {
				taskId : taskId,
				costScore : $("#costScore").val()
			},
			dataType : 'text',
			timeout : 60000,
			error : function(e) {
				alert("审核失败，连接异常");
			},
			success : function(result) {
				if (!isOutTime(result)) {
					result = eval("("+result+")");
					if (result.success) {
						$("#task_status").html("执行中");
						$("#task_op").remove();
						$("#status_op_div").removeAttr("style");
						alert(result.msg);
					} else {
						alert(result.msg);
					}
				}
			}
		});
	}
	
	
	function check_fail_task(taskId){
		var url = "${ctx}/web/admin/useradmin/taskmanage/check_fail_task";
		$.ajax( {
			url : url,
			type : 'post',
			data : {
				taskId : taskId,
				remark : $("#remark").val()
			},
			dataType : 'text',
			timeout : 60000,
			error : function(e) {
				alert("审核失败，连接异常");
			},
			success : function(result) {
				if (!isOutTime(result)) {
					result = eval("("+result+")");
					if (result.success) {
						$("#task_status").html("审核不通过");
						$("#task_op").remove();
						$("#status_op_div").removeAttr("style");
						alert(result.msg);
					} else {
						alert(result.msg);
					}
				}
			}
		});
	}
</script>
</head>
<body>
<div class="breadcrumbs">
    <div class="wrap"><a href="#">任务详情</a></div>
</div>
<div class="task-detail">
    <div class="task-detail-left">
    	<h3>任务信息</h3>
        <p>任务编号：${llTask.taskId }</p>
        <p>任务发布时间：<s:date name="#request.llTask.createTime" format="yyyy-MM-dd HH:mm:ss"/></p>
        <p>店铺名：<i class="plat_small plat_tmall"></i>${llTask.llShop.bindName }</p>
        <p>客户端类型：
		<s:if test="#request.llTask.clientType == 'pc'">pc端</s:if>
		<s:else>
			<s:if test="#request.llTask.clientType == 'phone'">手机端</s:if>
			<s:else>
				未知端
			</s:else>
		</s:else>
        </p>
        <p>流量类型：
            <s:if test="#request.llTask.taskType == 0">自然搜索流量</s:if>
            <s:else>自然搜索流量</s:else>
        </p>
        <p>任务计划总流量：<span id="total_visitNumber">
        ${(llTask.orderNumberOneDay1 + llTask.orderNumberOneDay2 
			+llTask.orderNumberOneDay3 + llTask.orderNumberOneDay4 
			+ llTask.orderNumberOneDay5) * llTask.durationDay}
		</span>访客</p>
        <p>计划访客数：<span id="">
        ${llTask.orderNumberOneDay1 + llTask.orderNumberOneDay2 
			+llTask.orderNumberOneDay3 + llTask.orderNumberOneDay4 
			+ llTask.orderNumberOneDay5}
		</span>访客/日</p>
        <!-- <p>流量起止时间：-0001-11-30 - -0001-11-30</p> -->
        
        <s:if test="#request.llTask.llShop.bindPlat == 'taobao' || #request.llTask.llShop.bindPlat == 'tmall'">
	        <div class="source">
		        <label>流量来源：</label>
		        <div>淘宝自然搜索率 ${llTask.searchSource }%</div>
		        <label>流量来源：</label>
		        <div>天猫自然搜索率 ${100 - llTask.searchSource }%</div>
	        </div>
        </s:if>
        <p>${llTask.keyword1 } : ${llTask.orderNumberOneDay1 } 访客 / 天</p>
        <p>${llTask.keyword2 } : ${llTask.orderNumberOneDay2 } 访客 / 天</p>
        <p>${llTask.keyword3 } : ${llTask.orderNumberOneDay3 } 访客 / 天</p>
        <s:if test="#request.llTask.orderNumberOneDay4 > 0">
        	<p>${llTask.keyword4 } : ${llTask.orderNumberOneDay4 } 访客 / 天</p>
		</s:if>
        <s:if test="#request.llTask.orderNumberOneDay5 > 0">
        	<p>${llTask.keyword5 } : ${llTask.orderNumberOneDay5 } 访客 / 天</p>
		</s:if>
    </div>
    <div class="task-detail-right">
    	<div id="status_op_div" class="task-state" <s:if test="#request.llTask.status == 1 || #request.llTask.status == 6">style="padding-top: 10px;"</s:if>>
        	<h4 class="f16"><i></i>任务状态：
        		<span id="task_status">
		            <s:if test="#request.llTask.statusCurrent == 0">未发布</s:if>
		            <s:if test="#request.llTask.statusCurrent == 1">待审核</s:if>
		            <s:if test="#request.llTask.statusCurrent == 2">任务进行中</s:if>
		            <s:if test="#request.llTask.statusCurrent == 3">已完成</s:if>
		            <s:if test="#request.llTask.statusCurrent == 4">已取消</s:if>
		            <s:if test="#request.llTask.statusCurrent == 5">审核不通过</s:if>
		            <s:if test="#request.llTask.statusCurrent == 6">任务修改,待审核</s:if>
	            </span>
			</h4>
			<s:if test="#request.llTask.status == 1 || #request.llTask.status == 6">
            	<div id="task_op" class="main-f">您还可以：
            		<br>
            		
            		<div style="margin-left: 50px;">
	                    <div class="item clearfix">
	                        <label class="tit">修改消耗积分：</label>
	                        <div class="inp">
	                            <em class="inpbox" style="padding-left: 0px;">
	                                <input type="text" id="costScore" name="costScore" value="${llTask.costScore}" onkeyup="this.value=this.value.replace(/\D/g,'')" class="txt placebox">
	                            </em>
	                        </div>
	                    </div>
	            		<br>
	            		<a href="javascript:check_task('${llTask.taskId}');"><em>通过审核</em></a>
                    </div>
            		<br>
            		<br>
            		<hr style="margin-left: -20px;">
            		<div style="margin-left: 50px;">
	            		<a href="javascript:check_fail_task('${llTask.taskId}');"><em>拒绝审核</em></a>
	            		<br>
	            		<br>
	            		备注：（请填写拒绝理由）
	            		<br>
	            		<textarea style="width:300px; height:100px; border:solid 1px gray; resize:none;" id="remark" rows="5" cols="50"></textarea>
           	    	</div>
            	</div>
            </s:if>
        </div>
    </div>
</div>
<div class="task-list">
	<h3>任务商品</h3>
    <table>
    	<tbody><tr>
        	<td width="65%" style="text-align:left; padding-left:80px;">商品名</td>
            <td width="35%">每日计划访客数</td>
        </tr>
        <tr>
        	<td>
            	<div class="intableProList">
                    <img class="img" width="50" height="50" src="${ctx }${llTask.goodsImg }">
                    <p class="text">${llTask.goodsName }</p>
                </div>
            </td>
            <td>
	            <span>
		            ${llTask.orderNumberOneDay1 + llTask.orderNumberOneDay2 
						+llTask.orderNumberOneDay3 + llTask.orderNumberOneDay4 
						+ llTask.orderNumberOneDay5}
				</span>访客/日
			</td>
        </tr>
    </tbody></table>
</div>
<div class="task-detail-fee">
	<h3>费用合计</h3>
		<table>
			<tbody>
				<tr>
					<th width="20%">
						分类
					</th>
					<th width="25%">
						费用明细
					</th>
					<th width="30%">
						小计
					</th>
					<th width="25%">
						合计
					</th>
				</tr>
				<tr>
					<td>
						总访客数
					</td>
					<td>
						<p>
							访客数：${(llTask.orderNumberOneDay1 + llTask.orderNumberOneDay2
							+llTask.orderNumberOneDay3 + llTask.orderNumberOneDay4 +
							llTask.orderNumberOneDay5) * llTask.durationDay}访客
						</p>
					</td>
					<td>
						${oneVisitCostScore }积分/访客
					</td>
					<td>
						${(llTask.orderNumberOneDay1 + llTask.orderNumberOneDay2
						+llTask.orderNumberOneDay3 + llTask.orderNumberOneDay4 +
						llTask.orderNumberOneDay5) * llTask.durationDay}访客 X
						${oneVisitCostScore } =
						<span id="visitCostScore">${(llTask.orderNumberOneDay1 +
							llTask.orderNumberOneDay2 +llTask.orderNumberOneDay3 +
							llTask.orderNumberOneDay4 + llTask.orderNumberOneDay5) *
							llTask.durationDay * oneVisitCostScore}</span>（ 积分 ）
						<input id="visitCostScoreVal" type="hidden" value="${(llTask.orderNumberOneDay1 +
							llTask.orderNumberOneDay2 +llTask.orderNumberOneDay3 +
							llTask.orderNumberOneDay4 + llTask.orderNumberOneDay5) *
							llTask.durationDay * oneVisitCostScore}">
					</td>
				</tr>
				<tr>
					<td>
						增值服务
					</td>
					<td>
						<s:if test="#request.llTask.pageStayType == 1">
			            	【页面停留时间优化（停留时间60~120秒，${pageStayCostScoreMap['1'] }积分）】<br>
			            </s:if>
						<s:if test="#request.llTask.pageStayType == 2">
			            	【页面停留时间优化（停留时间120~180秒，${pageStayCostScoreMap['2'] }积分）】<br>
			            </s:if>
						<s:if test="#request.llTask.visitTimeType == 1">
			            	【流量访问时间优化（随机分布，${visitTimeCostScoreMap['1'] }积分）】<br>
			            </s:if>
						<s:if test="#request.llTask.visitTimeType == 2">
			            	【流量访问时间优化（网购用户习惯曲线分布，${visitTimeCostScoreMap['2'] }积分）】<br>
			            </s:if>
						<s:if test="#request.llTask.isQuickVerify > 0">
			            	【快速完成任务（优先审单，${quickVerifyCostScore }积分）】<br>
			            </s:if>
						<s:if test="#request.llTask.isQuickExecute > 0">
			            	【快速完成任务（流量优先执行，${quickExecuteCostScore }积分）】<br>
			            </s:if>
						<s:if test="#request.llTask.orderNumberOneDay4 > 0">
			            	【添加关键词（每个${oneKeywordCostScore }积分）】<br>
			            </s:if>
						<s:if test="#request.llTask.orderNumberOneDay5 > 0">
			            	【添加关键词（每个${oneKeywordCostScore }积分）】<br>
			            </s:if>
					</td>
					<td>
						<s:if test="#request.llTask.pageStayType == 1">
			            	【+ ${pageStayCostScoreMap['1'] }】
							<input type="hidden" id="pageStayCostScore" value="${pageStayCostScoreMap['1'] }">
			            </s:if>
			            <s:elseif  test="#request.llTask.pageStayType == 2">
			            	【+ ${pageStayCostScoreMap['2'] }】
							<input type="hidden" id="pageStayCostScore" value="${pageStayCostScoreMap['2'] }">
			            </s:elseif>
						<s:else>
							<input type="hidden" id="pageStayCostScore" value="0">
			            </s:else>
						<s:if test="#request.llTask.visitTimeType == 1">
			            	【+ ${visitTimeCostScoreMap['1'] }】
							<input type="hidden" id="visitTimeCostScore" value="${visitTimeCostScoreMap['1'] }">
			            </s:if>
						<s:elseif test="#request.llTask.visitTimeType == 2">
			            	【+ ${visitTimeCostScoreMap['2'] }】
							<input type="hidden" id="visitTimeCostScore" value="${visitTimeCostScoreMap['2'] }">
			            </s:elseif>
			            <s:else>
							<input type="hidden" id="visitTimeCostScore" value="0">
			            </s:else>
						<s:if test="#request.llTask.isQuickVerify > 0">
			            	【+ ${quickVerifyCostScore }】
							<input type="hidden" id="quickVerifyCostScore" value="${quickVerifyCostScore }">
			            </s:if>
			            <s:else>
							<input type="hidden" id="quickVerifyCost" value="0">
			            </s:else>
						<s:if test="#request.llTask.isQuickExecute > 0">
			            	【+ ${quickExecuteCostScore }】
							<input type="hidden" id="quickExecuteCostScore" value="${quickExecuteCostScore }">
			            </s:if>
			            <s:else>
							<input type="hidden" id="quickExecuteCostScore" value="0">
			            </s:else>
						<s:if test="#request.llTask.orderNumberOneDay4 > 0">
			            	【+ ${oneKeywordCostScore }】<br>
							<input type="hidden" id="oneKeywordCostScore_4" value="${oneKeywordCostScore }">
			            </s:if>
			            <s:else>
							<input type="hidden" id="oneKeywordCostScore_4" value="0">
			            </s:else>
						<s:if test="#request.llTask.orderNumberOneDay5 > 0">
			            	【+ ${oneKeywordCostScore }】<br>
							<input type="hidden" id="oneKeywordCostScore_5" value="${oneKeywordCostScore }">
			            </s:if>
			            <s:else>
							<input type="hidden" id="oneKeywordCostScore_5" value="0">
			            </s:else>
						积分
					</td>
					<td>
						积分
						<span id="addedCostScore">0</span>（ 积分 ）
						<input id="addedCostScoreVal" type="hidden" value="">
					</td>
				</tr>
				<tr>
					<td>
						管理员调整
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
						积分
						<span id="adjustCostScore">0</span>（ 积分 ）
					</td>
				</tr>
			</tbody>
		</table>
		<div class="task-detail-bott">费用合计：<span id="allCostScore">${llTask.costScore }</span>积分</div>
		<input id="allCostScoreVal" type="hidden" value="${llTask.costScore }">
</div>
			<jsp:include page="/include/footer.jsp" flush="true"></jsp:include>

</body></html>