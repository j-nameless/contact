<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
    <head>
    	<base href="<%=basePath%>"/>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>修改用户</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <div class="container" style="width: 400px;">
        <h3 style="text-align: center;">修改联系人</h3>
        <form action="/web/update" method="get">
            <input type="hidden" name="id" value="${user.id}">
            <div class="modal-body">
                <div class="form-group">
                    <label for="addusernameid">姓名:</label>
                    <input type="text" class="form-control" id="addusernameid" name="name" placeholder="请输入姓名" value="${user.name}">
                </div>
                <div class="form-group">
                    <label>性别:</label>
                    <input type="radio" name="sex" value="男" <c:if test="${user.sex == '男'}">
                            checked="checked"
                    </c:if> >男
                    <input type="radio" name="sex" value="女" <c:if test="${user.sex == '女'}">
                           checked="checked"
                    </c:if>>女
                </div>
                <div class="form-group">
                    <label for="addageid">年龄:</label>
                    <input type="text" class="form-control" id="addageid" name="age" placeholder="请输入年龄" value="${user.age}">
                </div>
                <div class="form-group">
                    <label for="addplaceid">籍贯:</label>
                    <select class="form-control" id="addplaceid" name="place">
                        <option value="广东" <c:if test="${user.place=='广东'}">selected="selected"</c:if>>广东</option>
                        <option value="广西" <c:if test="${user.place=='广西'}">selected="selected"</c:if>>广西</option>
                        <option value="湖南" <c:if test="${user.place=='湖南'}">selected="selected"</c:if>>湖南</option>
                        <option value="北京" <c:if test="${user.place=='北京'}">selected="selected"</c:if>>北京</option>
                        <option value="四川" <c:if test="${user.place=='四川'}">selected="selected"</c:if>>四川</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="addqqid">QQ:</label>
                    <input type="text" class="form-control" id="addqqid" name="qq" placeholder="请输入QQ" value="${user.QQ}">
                </div>
                <div class="form-group">
                    <label for="addemailid">邮箱:</label>
                    <input type="text" class="form-control" id="addemailid" name="email" placeholder="请输入邮箱" value="${user.email}">
                </div>
            </div>

         <div class="form-group" style="text-align: center">
			<input class="btn btn-primary" type="submit" value="提交" />
			<input class="btn btn-default" type="reset" value="重置" />
             <a class="btn btn-default" type="button" href="/web/page">返回</a>
         </div>
        </form>
        </div>
    </body>
</html>