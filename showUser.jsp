<%@ page import="java.util.List" %>
<%@ page import="com.kevin.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2018/8/28
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>表格</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <style>
        td {
            text-align: center;
        }

        th {
            text-align: center;
        }
    </style>
    <script>
        function init() {
            document.getElementById("ckbox").onclick = function () {
                var cks = document.getElementsByName("ck");
                for (var i = 0; i < cks.length; i++) {
                    cks[i].checked = this.checked;
                }
            }
            document.getElementById("delbutton").onclick = function () {
                var a = document.getElementById("delform");
                a.submit();
            }
        }
    </script>
</head>
<body onload="init()">
<div class="container">
    <div style="text-align: center"><h2>显示所有联系人</h2></div>
    <table class="table table-bordered table-hover">
        <tr>
            <td colspan="9">
                <%--检索查询表单--%>
                <form action="/web/page">
                    联系人姓名：<input type="text" name="searchname" value="${searchname}">
                    联系人QQ：<input type="text" name="searchqq" value="${searchqq}">
                    <input type="submit" value="查询">
                </form>
            </td>
        </tr>
        <tr class="success">
            <th><input type="checkbox" id="ckbox"></th>
            <th>编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>籍贯</th>
            <th>QQ</th>
            <th>邮箱</th>
            <th>操作</th>
        </tr>
        <form action="/web/delAll" id="delform">
            <c:if test="${not empty pageBean.list}">
                <c:forEach items="${pageBean.list}" var="user" varStatus="vs">
                    <tr>
                        <td><input type="checkbox" name="ck" value="${user.id}"></td>
                        <td>${vs.count}
                        </td>
                        <td>${user.name}
                        </td>
                        <td>${user.sex}
                        </td>
                        <td>${user.age}
                        </td>
                        <td>${user.place}
                        </td>
                        <td>${user.QQ}
                        </td>
                        <td>${user.email}
                        </td>
                        <td>
                            <a class="btn btn-default" href="/web/query?id=${user.id}">修改</a>
                            <a class="btn btn-default" href="/web/delete?id=${user.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </form>
    </table>
    <div style="text-align: center">
        <button class="btn btn-primary" id="delbutton">删除所选联系人</button>
        <button class="btn btn-primary" data-toggle="modal" data-target="#addUserModal">添加联系人</button>
    </div>
    <br/>
    <br/>
    <br/>
    <%--分页--%>
    <div style="text-align: center">
        <c:if test="${pageBean.pageNum > 1}">
        <a href="/web/page?pageNum=1&searchname=${searchname}&searchqq=${searchqq}">首页</a>
        <a href="/web/page?pageNum=${pageBean.pageNum -1}&searchname=${searchname}&searchqq=${searchqq}">上一页</a>
        </c:if>
        <c:if test="${pageBean.pageNum < pageBean.totalPage}">
        <a href="/web/page?pageNum=${pageBean.pageNum +1}&searchname=${searchname}&searchqq=${searchqq}">下一页</a>
        <a href="/web/page?pageNum=${pageBean.totalPage}&searchname=${searchname}&searchqq=${searchqq}">尾页</a>
        </c:if>
        一共有${pageBean.count}条数据
        当前第${pageBean.totalPage}页
    </div>

</div>
<%-- 添加联系人模态框 --%>
<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="addUserLable">添加联系人</h4>
            </div>
            <%--添加联系人表单--%>
            <form action="/web/addUser" method="get">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="addusernameid">姓名:</label>
                        <input type="text" class="form-control" id="addusernameid" name="name" placeholder="请输入姓名">
                    </div>
                    <div class="form-group">
                        <label>性别:</label>
                        <input type="radio" name="sex" value="男">男
                        <input type="radio" name="sex" value="女">女
                    </div>
                    <div class="form-group">
                        <label for="addageid">年龄:</label>
                        <input type="text" class="form-control" id="addageid" name="age" placeholder="请输入年龄">
                    </div>
                    <div class="form-group">
                        <label for="addplaceid">籍贯:</label>
                        <select class="form-control" id="addplaceid" name="place">
                            <option value="广东">广东</option>
                            <option value="广西">广西</option>
                            <option value="湖南">湖南</option>
                            <option value="北京">北京</option>
                            <option value="四川">四川</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="addqqid">QQ:</label>
                        <input type="text" class="form-control" id="addqqid" name="qq" placeholder="请输入QQ">
                    </div>
                    <div class="form-group">
                        <label for="addemailid">邮箱:</label>
                        <input type="text" class="form-control" id="addemailid" name="email" placeholder="请输入邮箱">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <input type="submit" class="btn btn-primary" value="添加"></input>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>