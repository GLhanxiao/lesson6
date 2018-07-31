<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="lesson" tagdir="/WEB-INF/tags" %>
<lesson:page title="student.title.${cmd}">
 <jsp:attribute name="script">
		<link rel="stylesheet" href="static-resource/ace/assets/css/bootstrap-datepicker3.min.css"/>
		<script src="static-resource/ace/assets/js/bootstrap-datepicker.min.js"></script>

        <script type="text/javascript">
            jQuery(function ($) {
                $('.date-picker').datepicker({
                    autoclose: true,
                    format: 'yyyy-mm-dd',
                    todayHighlight: true,
                    zIndex: 9999,
                    'z-index': 9999,
                })
                //show datepicker when clicking on the icon
                    .next().on(ace.click_event, function () {
                    $(this).prev().focus();
                });
            });


        </script>
    </jsp:attribute>
    <jsp:attribute name="css">
         <style type="text/css">
             .datepicker {
                 z-index: 9999
             }
         </style>
    </jsp:attribute>

    <jsp:body>

    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="welcome.do">
                    <spring:message code="common.homepage" />
                </a>
            </li>

            <li>
                <a href="student/student/list.do">
                    <spring:message code="student.title.list" />
                </a>
            </li>
            <li class="active">
                <spring:message code="student.title.${cmd}" />
            </li>
        </ul><!-- /.breadcrumb -->
    </div>

    <div class="page-content">

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <h3 class="header smaller lighter blue"><spring:message code="student.title.${cmd}" />
                            <span class="hidden-sm hidden-xs btn-group pull-right">
                                <a href="student/student/list.do" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-angle-left"></i>
                                    <spring:message code="common.back"/>
                                </a>
                            </span>
                        </h3>
                     <form action="student/student/save_${cmd}.do" method="post" class="form-horizontal" role="form">
                            <input type="hidden" name="cmd" id="cmd" value="${cmd}"/>
                            <input type="hidden" name="id" id="id" value="${student.id}"/>
 							<div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="account">
                                    <spring:message code="student.code"/>
                                </label>

                                <div class="col-sm-6">
                                    <input type="text" autocomplete="off" name="code" maxlength="50" minlength="3" value="${student.code}" class="required form-control ">
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="account">
                                    <spring:message code="student.name"/>
                                </label>

                                <div class="col-sm-6">
                                    <input type="text" autocomplete="off" name="name"  maxlength="50" minlength="2"  value="${student.name}" class="required form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="nameEn">
                                    <spring:message code="student.birthday"/>
                                </label>

                                <div class="col-sm-6">
                                	<div class="input-group">
	                                    <input type="text" class="required form-control date-picker datepicker col-xs-12 col-sm-12"  autocomplete="off" id="birthday" name="birthday" value="${student.birthday}" data-date-format="yyyy-mm-dd" class="date-picker">
	                                    <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                           			</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="icon">
                                    <spring:message code="student.gender"/>
                                </label>

                                <div class="col-sm-6">
                                	<select name="gender" id=""gender"" class="col-xs-12 chosen-select" >
                                		<option ${student.gender==1 ? "selected" : ""} value="1"><spring:message code="student.gender.1"/></option>
                                		<option ${student.gender==2 ? "selected" : ""}value="2"><spring:message code="student.gender.2"/></option>
                            		</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="description">
                                    <spring:message code="student.description"/>
                                </label>

                                <div class="col-sm-6">
                                    <textarea type="text" autocomplete="off" id="description"  maxlength="255" name="description"  class="form-control">${student.description}</textarea>
                                </div>
                            </div>

                            <sec:authorize ifAnyGranted="OPT_STUDENT_STUDENT_ADD,OPT_STUDENT_STUDENT_EDIT">
                                <div class="clearfix form-actions">
                                    <div class="text-center">
                                        <button class="btn btn-info" type="submit">
                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                            <spring:message code="button.submit"/>
                                        </button>
                                    </div>
                                </div>
                            </sec:authorize>

                        </form>
                    </div><!-- /.span -->
                </div><!-- /.row -->

                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</jsp:body>    
</lesson:page>