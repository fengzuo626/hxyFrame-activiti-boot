<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>我的待办</title>
    <%@include file="/common/commonCSS.jsp" %>
    <%@include file="/common/commonJS.jsp" %>
    <%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
</head>

<body>
<div class="main-container" id="main-container">
    <div class="row" style="margin-top: 20px;">
        <form class="layui-form" id="search-from" action="${webRoot}/act/deal/myUpcoming">
            <div class="layui-form-item">
                <label class="layui-form-label" style="width:6%;">业务编号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="code" value="${code}"  placeholder="请输入业务编号"  class="layui-input" >
                </div>
                <button class="layui-btn" id="searchSubmit"><i class="layui-icon">&#xe615;</i>搜 索</button>
                <button class="layui-btn layui-btn-warm" type="button" id="refresh">重 置</button>
            </div>
        </form>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <table id="table-list" class="layui-table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>任务名称</th>
                    <th>业务编号</th>
                    <th>业务名称</th>
                    <th>流程发起人</th>
                    <th>任务创建时间</th>
                    <th>等待处理人</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.result}" var="task" varStatus="i">
                    <tr name="task_${task.taskId }">
                        <td>${i.index+1 }</td>
                        <td>${task.taskName}</td>
                        <td>${task.code}</td>
                        <td>${task.busName}</td>
                        <td>${task.startUserName}</td>
                        <td><fmt:formatDate value="${task.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>${task.dealName}</td>
                        <td>
                            <button class="layui-btn layui-btn-small" type="button" onclick="doTaskTab('${task.actKey}','${task.busId}','${task.instanceId}','${task.taskId}','${task.defId}','${task.nodeType}')"><i class="layui-icon">&#xe60a;</i>办理</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <sys:page page="${page}"></sys:page>
        </div>
    </div>
</div>
</body>

<script>
    /**
     * 任务办理Tab
     */
    function doTaskTab(actKey,busId,instanceId,taskId,defid,nodeType) {
        var url="${webRoot}/act/deal/flowInfoTab?flag=2&actKey="+actKey+"&busId="+busId+"&instanceId="+instanceId+"&taskId="+taskId+"&defId="+defid+"&nodeType="+nodeType ;
        //弹框层
        layer.open({
            scrollbar: false,
            type: 2,
            title : ["办理任务" , true],
            area: ['90%', '90%'], //宽高
            content: [url,'yes'],
            shadeClose : false,
        });
    }


</script>

</html>