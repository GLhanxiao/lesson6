<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="lesson" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<lesson:page title="student.title.list">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="welcome.do">
                    <spring:message code="common.homepage"/>
                </a>
            </li>
            <li class="active"><spring:message code="student.title.list"/></li>
        </ul><!-- /.breadcrumb -->
    </div>

    <div class="page-content">

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <h3 class="header smaller lighter blue"><spring:message code="student.title.list"/>
                            <span class="hidden-sm hidden-xs btn-group pull-right">
                                <a href="student/student/add.do" class="btn btn-sm btn-primary"><i
                                        class="ace-icon glyphicon glyphicon-plus"></i>
                                    <spring:message code="button.add"/>
                                </a>
                            </span>
                        </h3>
                        
                        <form action="student/student/search.do">
                        	
                        	学号：<input type="text" autocomplete="off" name="code" maxlength="50" minlength="2" >
                        	姓名：<input type="text" autocomplete="off" name="name" maxlength="50" minlength="2" >
                        	
                        	 <input type="submit" value="提交">
                        </form>
                        
                        <table id="simple-table" class="table  table-bordered table-hover">
                            <thead>
                            <tr> <th class="center"><spring:message code="student.code"/></th>
                                <th class="center"><spring:message code="student.name"/></th>
                                <th class="center"><spring:message code="student.birthday"/></th>
                                <th class="center"><spring:message code="student.gender"/></th>
                                <th class="hidden-md hidden-sm hidden-xs" class="center"><spring:message code="student.description"/></th>
                                <th class="center">选课/操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${student.content}" var="student">
                                <tr id="tr-${student.id}">
                                	<td><a href="student/student/listByCode.do?code=${student.code}"><c:out value="${student.code}"/></a></td>
                                    <td><a href="student/student/listLikeName.do?name=${student.name}"><c:out value="${student.name }"/></a></td>
                                    <td>${student.birthday}</td>
                                    <td>${student.gender}</td>
                                    <td class="hidden-md hidden-sm hidden-xs">${student.description}</td>
                                    <td class="center">
                                        <div class="hidden-sm hidden-xs btn-group action-buttons">
                                            <a href="student/student/detail.do?id=${student.id}"
                                               class="blue2">
                                                <i class="ace-icon glyphicon glyphicon-list bigger-120"></i>
                                            </a>
                                            <a href="student/student/edit.do?id=${student.id}"
                                               class="green">
                                                <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                            </a>
                                            <a data-id="${student.id}"
                                               data-url="student/student/save_delete.do"
                                               class="red btn-delete-modal">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </a>
                                        </div>
                                        <div class="hidden-md hidden-lg">
                                            <div class="inline pos-rel">
                                                <button class="btn btn-minier btn-primary dropdown-toggle"
                                                        data-toggle="dropdown" data-position="auto">
                                                    <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                                </button>
                                                <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                    <li>
                                                        <a class="green bigger-140 show-details-btn">
                                                            <span class="green"><i class="ace-icon fa fa-angle-double-down"></i></span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="studnet/studnet/manage/mainMenus/detail.do?id=${student.id}">
                                                			<span class="blue2"><i class="ace-icon glyphicon glyphicon-list bigger-120"></i></span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="studnet/student/manage/mainMenus/edit.do?id=${student.id}">
                                                            <span class="green"><i class="ace-icon fa fa-pencil-square-o bigger-120"></i></span>
                                                        </a></li>
                                                    <li>
                                                        <a data-id="${student.id}"
                                                           data-url="/studnet/studnet/manage/mainMenus/save_delete.do" class="red btn-delete-modal">
                                                            <span class="red"><i class="ace-icon fa fa-trash-o bigger-120"></i></span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="detail-row" id="tr-detail-${student.id}">
                                    <td colspan="8" id="td-detail-${student.id}">
                                        <div class="table-detail">
                                            <div class="profile-user-info profile-user-info-striped">
                                                <div class="profile-info-row">
                                                    <div class="profile-info-name"><spring:message
                                                            code="mainmenu.description"/></div>
                                                    <div class="profile-info-value">
                                                        <span><c:out value="${student.description}"/></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <lesson:springPagePagination url="student/student/list.do" defaultPageSize="200" springPage="${student}"/>
                    </div><!-- /.span -->
                </div><!-- /.row -->

                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</lesson:page>