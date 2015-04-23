<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
	<script type="text/javascript">
	
	$(document).ready(function(){
	    priceChange($("input[name='score_type'][checked]").val());
	});
	
	function priceChange(price){
		$("#price").val(price);
	}
	
	function submit() {
		if($("#dealId").val().trim() == ""){
			alert("请输入转账交易号");
			$("#dealId").select();
			return;
		}
		var url = "${ctx}/web/shop/accountmanage/dealmanage/add_score_order";
		$.ajax({
			url:url,
			type:'post',
			data:{
				price : $("#price").val().trim(),
				dealId : $("#dealId").val().trim()
			},
			dataType:'text',
			timeout:60000,
			error: function(e) {
				alert("连接服务器超时,请稍后再试.");
			},
			success: function(result){
				if (!isOutTime(result)) {
					result = eval("("+result+")");
					alert(result.msg);
					if (result.success) {
						$("#price").val("taobao");
						$("#dealId").val("");
					}
				}
			}
		});
	}
	
</script>
</head>
<body>
			<jsp:include page="/include/top.jsp" flush="true"></jsp:include>
<div class="breadcrumbs">
    <div class="wrap"><a href="${ctx}">首页</a> &gt; <a href="${ctx }/web/shop/accountmanage/dealmanage/get_score">购买积分</a></div>
</div>
    <div class="container">
    <div class="Shadowbox">
        <div class="Shadowboxp"></div>
        <div class="register">
        
            <div class="register-title">
            	<span class="bram-title">购买积分</span>
                
                <div class="Process">
                    <ul class="clearfix">
                        <li class="cur" style="width:25%"><em class="Processyes">1<i></i></em><span class="processspan">注册账号</span><strong></strong></li>
                        <li class="cur" style="width:25%"><em class="Processyes">2<i></i></em><span class="processspan">购买会员</span><strong></strong></li>
                        <li class="cur" style="width:25%"><em class="Processyes">3<i></i></em><span class="processspan">绑定店铺</span><strong></strong></li>
                        <li class="" style="width:25%"><em class="Processing">4<i></i></em><span class="processspan">购买积分</span><strong></strong></li>
                        <li class="Processlast" style="width:82px"><em>5<i></i></em><span>发布流量任务</span><strong></strong></li>
                    </ul>
                </div>
            </div>    
            <div class="register-main">
              
                  <div class="register">
                    <div class="register_info">
                        <form id="pay_form" action="#" method="post" target="_blank">
                        <div class="pay-integral">
                            <h1>1.请选择积分<span>因每月所售积分有限，<em>建议提前一次性选择足够1个月使用的积分数量</em></span></h1>
                            <div class="pay-integral-input">
                            	<input type="hidden" id="price" value="">
                                                                <div><label>
                                    <input type="radio" onclick="priceChange(1000);" name="score_type" value="1000">&nbsp;&nbsp;支付&nbsp;<span><em>1,000</em></span>&nbsp;元，总计获得:&nbsp;<span>10,000</span>&nbsp;积分<em style="color:#999;">&nbsp;(含:&nbsp;购买10000积分 )</em>
                                </label></div>
                                                                <div><label>
                                    <input type="radio" onclick="priceChange(2000);" name="score_type" value="2000">&nbsp;&nbsp;支付&nbsp;<span><em>2,000</em></span>&nbsp;元，总计获得:&nbsp;<span>21,818</span>&nbsp;积分<em style="color:#999;">&nbsp;(含:&nbsp;购买20000积分 + 系统赠送1818积分)</em>
                                </label></div>
                                                                <div><label>
                                    <input type="radio" onclick="priceChange(5000);" name="score_type" value="5000" checked="checked">&nbsp;&nbsp;支付&nbsp;<span><em>5,000</em></span>&nbsp;元，总计获得:&nbsp;<span>60,000</span>&nbsp;积分<em style="color:#999;">&nbsp;(含:&nbsp;购买50000积分 + 系统赠送10000积分)</em>
                                </label></div>
                                                                <div><label>
                                    <input type="radio" onclick="priceChange(10000);" name="score_type" value="10000">&nbsp;&nbsp;支付&nbsp;<span><em>10,000</em></span>&nbsp;元，总计获得:&nbsp;<span>133,333</span>&nbsp;积分<em style="color:#999;">&nbsp;(含:&nbsp;购买100000积分 + 系统赠送33333积分)</em>
                                </label></div>
                                                                <div><label>
                                    <input type="radio" onclick="priceChange(20000);" name="score_type" value="20000">&nbsp;&nbsp;支付&nbsp;<span><em>20,000</em></span>&nbsp;元，总计获得:&nbsp;<span>300,000</span>&nbsp;积分<em style="color:#999;">&nbsp;(含:&nbsp;购买200000积分 + 系统赠送100000积分)</em>
                                </label></div>
                                                                <div><label>
                                    <input type="radio" onclick="priceChange(30000);" name="score_type" value="30000">&nbsp;&nbsp;支付&nbsp;<span><em>30,000</em></span>&nbsp;元，总计获得:&nbsp;<span>450,000</span>&nbsp;积分<em style="color:#999;">&nbsp;(含:&nbsp;购买300000积分 + 系统赠送150000积分)</em>
                                </label></div>
                                                            </div>
                        </div>
                        
                        <div class="pay_des">
                            <h1 style="margin-bottom:20px;">2.输入转账交易号</h1>
                            
                        <div>                            
                                <div class="item clearfix">
                                    <label class="tit">交易号:</label>
                                    <div class="inp">
                                        <em class="inpbox">
                                            <i class="icon-TXM"></i>
                                            <input type="text" id="dealId" name="dealId" autocomplete="off" cname="one" placeholder="请输入交易号" warn=" " checkurl="ture" class="txt placebox" regname="dealId" emptyerr="交易号不能为空">
                                        </em>
                                    </div>
                                </div>
                            <div>
                            	<img id="jiaoyihao_img" alt="交易号" src="${ctx}/images/jiaoyihao.jpg">
                            </div>
                        </div>
                        </div>
                        </form>
                        
                            <div class="btn-box tc">
                                <input type="button" onclick="submit();" name="submit" class="buttons-vip-confirm buttons" value="立即购买">
                            </div>
                    </div>
                </div>
              
              <div class="pay-problem">
                  <h3 class="f18 cor555">常见问题</h3>
                  <p class="f14 cor555">问：会员续费能使用支付宝续费吗？ </p>
                  <p class="f14 cor555">答：为了保证交易的安全性，平台不能够使用支付宝付款，只能使用网上银行付款</p><br>
                  <p class="f14 cor555">问：购买完积分之后，不想用了或者用不完还可以退款吗？</p>
                  <p class="f14 cor555">答：不可以。网站购买的积分，只能消费，无法退款和提现。</p>
              </div>
            
            </div>  
        </div>
        <div class="Shadowboxb"></div>
    </div>
</div>			<jsp:include page="/include/footer.jsp" flush="true"></jsp:include>


</body></html>