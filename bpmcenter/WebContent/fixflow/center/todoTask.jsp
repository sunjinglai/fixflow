<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>待办任务</title>
<jsp:include page="head.jsp" flush="true" />
<script type="text/javascript">
/*  
 * "userId" 用户编号
 * "pdkey" 流程编号
 * "pageIndex" 第几页
 * "rowNum" 有几行
 * "agentUserId" 有几行
 * "agentType" 0我代理别人，1别人委托给我
 * "title" 查询主题
 * "processVeriy" 查询变量
 * "arrivalTimeS" 到达时间开始
 * "arrivalTimeE" 到达时间结束
 * "initor" 发起人
 * @param @return
 * "dataList" 数据列表
 * "pageNumber" 总行数
 * "agentUsers" 代理用户
 * "agentToUsers" 委托用户
 * "pageIndex" 第几页
 * "rowNum" 有几行
 */
$(function(){
  var agentType = $("input[name=agentType]").val();
  var userId = $("input[name=userId]").val();
  $("a[name=myTask]").click(function(){
    $("#agentUserId").val('');
    $("#agentType").val('');
    $("#subForm").submit();
  });
  $("a[name=agentUsers]").click(function(){
    var userId = $(this).attr("userId");
    $("#agentUserId").val(userId);
    $("#agentType").val('1');
    $("#subForm").submit();
  });
  $("a[name=agentToUsers]").click(function(){
    var userId = $(this).attr("userId");
    $("#agentUserId").val(userId);
    $("#agentType").val('0');
    $("#subForm").submit();
  });
  $("a[name=flowGraph]").click(function(){
    var pdk = $(this).attr("pdk");
    var pii = $(this).attr("pii");
    var obj = {};
    window.open("FlowCenter?action=getTaskDetailInfo&processDefinitionKey="+pdk+"&processInstanceId="+pii);
  });
  $("a[name=doTask]").click(function(){
    var tii = $(this).attr("tii");
    var pdk = $(this).attr("pdk");
    var pii = $(this).attr("pii");
    var bizKey = $(this).attr("bk");
    
    var obj = {};
    var formUrl = $(this).attr("formUri");//"FlowCenter?action=startOneTask";
    var url = formUrl;
    if(formUrl.indexOf("?")!=-1){
   	 url+="&";
   	
    }else{
   	 url+="?";
    }
    url+="taskId="+tii+"&processInstanceId="+pii+"&bizKey="+bizKey+"&processDefinitionKey="+pdk,obj,"dialogWidth=800px;dialogHeight=600px";
   	window.showModalDialog(url,obj,"dialogWidth=800px;dialogHeight=600px");
  });
});
</script>
</head>

<body>
	<div class="main-panel">
		<jsp:include page="top.jsp" flush="true" />

		<div class="center-panel">
			<form id="subForm" method="post" action="FlowCenter">
				<!-- 左 -->
				<div class="left">
					<div class="left-nav-box">
						<div class="left-nav">
							<a name="myTask" href="#">我的待办任务</a>
						</div>
						<div class="left-nav-orange-line">&nbsp;</div>



						<div class="left-nav m-top">
							<h1>代理人</h1>
						</div>
						<c:if
							test="${result.agentUsers!= null && fn:length(result.agentUsers) != 0}">
							<c:forEach items="${result.agentUsers}" var="agentUsers"
								varStatus="index">
								<div class="left-nav">
									<a name="agentUsers" userId="${agentUsers.userid}" href="#"><img
										src="${agentUsers.userid}" height="30" width="30" alt="头像"
										onerror="miniImgNotFound('${pageContext.request.contextPath}',this);" />${agentUsers.username}</a>
								</div>
							</c:forEach>
						</c:if>

						<div class="left-nav m-top">
							<h1>委托人</h1>
						</div>
						<c:if
							test="${result.agentToUsers!= null && fn:length(result.agentToUsers) != 0}">
							<c:forEach items="${result.agentToUsers}" var="agentToUsers"
								varStatus="index">
								<div class="left-nav">
									<a name="agentToUsers" userId="${agentToUsers.userid}" href="#"><img
										src="icon/${agentToUsers.userid}_small.png" height="30"
										width="30" alt="头像"
										onerror="miniImgNotFound('${pageContext.request.contextPath}',this);" />${agentToUsers.username}</a>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div class="message">
						<div class="title">
							<a href="#"><em class="icon-message"></em>消息中心</a>
						</div>
						<div class="message-content">
							<div class="msg">
								<img src="images/temp/user01.jpg"
									onerror="miniImgNotFound('${pageContext.request.contextPath}',this);" />张飞：今天还没吃午饭！
								<div class="time">一小时前</div>
							</div>
							<div class="msg">
								<img src="images/temp/user01.jpg"
									onerror="miniImgNotFound('${pageContext.request.contextPath}',this);" />曹操：煮酒论英雄！谁一起吃饭啊
								<div class="time">一小时前</div>
							</div>
							<div class="msg">
								<img src="images/temp/user01.jpg"
									onerror="miniImgNotFound('${pageContext.request.contextPath}',this);" />张飞：今天还没吃午饭！
								<div class="time">一小时前</div>
							</div>
							<div class="msg">
								<img src="images/temp/user01.jpg"
									onerror="miniImgNotFound('${pageContext.request.contextPath}',this);" />张飞：今天还没吃午饭！
								<div class="time">一小时前</div>
							</div>
							<div class="msg">
								<img src="images/temp/user01.jpg"
									onerror="miniImgNotFound('${pageContext.request.contextPath}',this);" />张飞：今天还没吃午饭！
								<div class="time">一小时前</div>
							</div>
						</div>
					</div>
				</div>
				<div class="right">
					<!-- 隐藏参数部分 -->
					<input type="hidden" id="agentUserId" name="agentUserId"
						value="<c:out value="${result.agentUserId}"/>"><input
						type="hidden" id="agentType" name="agentType"
						value="<c:out value="${result.agentType}"/>"><input
						type="hidden" name="action" value="getMyTask" />
					<div class="search">
						<table width="100%">
							<tr>
								<td class="title-r">任务主题：</td>
								<td style="width: 180px;"><input type="text" id="text_0"
									name="title" class="fix-input" style="width: 160px;"
									value="${result.title}" /></td>
								<td class="title-r">流程变量：</td>
								<td style="width: 180px;"><input type="text" id="text_1"
									name="text_1" class="fix-input" style="width: 160px;" value="" /></td>
								<td class="title-r">单 据 号：</td>
								<td style="width: 180px;"><input type="text" id="text_2"
									name="bizKey" class="fix-input" style="width: 160px;"
									value="${result.bizKey}" /></td>
								<td><div class="btn-normal">
										<a href="#" onclick="$('#subForm').submit();">查 找<em
											class="arrow-small"></em></a>
									</div></td>
							</tr>
							<tr>
								<td class="title-r">发 起 人：</td>
								<td><input type="text" id="text_3" name="initor"
									class="fix-input" style="width: 160px;"
									value="${result.initor}" /></td>
								<td class="title-r">到达时间：</td>
								<td><input type="text" id="text_4" name="arrivalTimeS"
									class="fix-input" style="width: 69px;"
									value="${result.arrivalTimeS}" onClick="WdatePicker()" /> - <input
									type="text" id="text_5" name="arrivalTimeE" class="fix-input"
									style="width: 69px;" value="${result.arrivalTimeE}"
									onClick="WdatePicker()" /></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
					<div class="content">
						<table width="100%" class="fix-table">
							<thead>
								<th width="30">&nbsp;</th>
								<th width="30"></th>
								<th>流程</th>
								<th>单据号</th>
								<th>任务主题</th>
								<th>发起人</th>
								<th>发起时间</th>
								<th>当前步骤</th>
								<th width="160">到达时间</th>
								<th width="60">流程状态</th>
							</thead>
							<c:forEach items="${result.dataList}" var="dataList"
								varStatus="index">
								<tr>
									<td style="text-align: center;"><c:out value="${index.index+1}" /></td>

									<td><img src="icon/${dataList.PI_START_AUTHOR}_small.png"
										height="30" width="30" alt="头像"
										onerror="miniImgNotFound('${pageContext.request.contextPath}',this);"></td>
									<td>${dataList.processDefinitionName}</td>
									<td>${dataList.bizKey}</td>
									<td><a name="doTask" href="#"
										formUri="${dataList.formUri}" tii="${dataList.taskInstanceId}"
										pii="${dataList.processInstanceId}" bk="${dataList.bizKey}"
										pdk="${dataList.processDefinitionKey}">${dataList.description}</a>
									</td>
									<td>${dataList.userName}</td>
									<td><fmt:formatDate value="${dataList.PI_START_TIME}"
											type="both" /></td>
									<td>${dataList.nodeName}</td>
									<td><fmt:formatDate value="${dataList.createTime}"
											type="both" />
									</td>
									<td><a name="flowGraph" href="#"
										pii="${dataList.processInstanceId}"
										pdk="${dataList.processDefinitionKey}">查看</a></td>
								</tr>
							</c:forEach>
						</table>

					</div>
				</div>
				<!-- 分页 -->
				<div id="page">
					<jsp:include page="../common/page.jsp" flush="true" />
				</div>

			</form>
		</div>
	</div>

</body>
</html>
