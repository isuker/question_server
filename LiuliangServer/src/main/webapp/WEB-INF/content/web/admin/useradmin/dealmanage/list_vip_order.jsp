<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:if test="#request.pageBean.allRow == 0">
<div class='no-found'>无结果.</div>
</s:if>
<s:else>

                        <table width="95%" class="tablelist" style="table-layout:fixed; word-wrap:break-word;">
				<thead>
					<tr>
						<th width="10%">
							平台帐号
						</th>
						<th width="5%">
							月数
						</th>
						<th width="5%">
							价格
						</th>
						<th width="15%">
							转账交易号
						</th>
						<th width="10%">
							理由
						</th>
						<th width="10%">
							付款时间
						</th>
						<th width="15%">
							付款截图
						</th>
						<th width="10%">
							创建时间
						</th>
						<th width="10%">
							状态
						</th>
						<th width="10%">
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#request.pageBean.list" id="order">
					<tr>
						<td>
							${order.serverUser.username }
						</td>
						<td>
							${order.num }
						</td>
						<td>
							${order.price}
						</td>
						<td>
							${order.dealId}
						</td>
						<td>
							${order.reason}
						</td>
						<td>
							<s:date name="payTime" format="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							<img style="max-width: 50px; max-height: 80px;" alt="" src="${ctx}${order.payImgUrl}" onclick="javascript:showImg('${ctx}${order.payImgUrl}');" />
						</td>
						<td>
							<s:date name="createTime" format="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td id="status_${order.orderId}">
							<s:if test="status == 0">待审核</s:if>
							<s:else>
								<s:if test="status == 1">审核通过</s:if>
								<s:else>审核失败</s:else>
							</s:else>
						</td>
						<td id="op_${order.orderId}">
							<s:if test="status == 1">
								无
							</s:if>
							<s:else>
								<button class="btn btn-link" type="button" onclick="javascript:editInput('${order.orderId}');" data-toggle="button" data-loading-text="<i class='icon-pencil'></i>&nbsp;编辑"><i class="icon-pencil"></i>&nbsp;编辑</button>
							</s:else>
						</td>
					</tr>
					</s:iterator>
				</tbody>
			</table>
			<jsp:include page="../../include/ajax_pager.jsp" flush="true"></jsp:include>
</s:else>
