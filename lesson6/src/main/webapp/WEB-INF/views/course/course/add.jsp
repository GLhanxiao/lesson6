<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="lesson" tagdir="/WEB-INF/tags" %>
<lesson:page title="course.title.${cmd}">
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
                <a href="course/course/list.do">
                    <spring:message code="course.title.list" />
                </a>
            </li>
            <li class="active">
                <spring:message code="course.title.${cmd}" />
            </li>
        </ul><!-- /.breadcrumb -->
    </div>

    <div class="page-content">

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <h3 class="header smaller lighter blue"><spring:message code="course.title.${cmd}" />
                            <span class="hidden-sm hidden-xs btn-group pull-right">
                                <a href="course/course/list.do" class="btn btn-sm btn-primary"><i class="ace-icon fa fa-angle-left"></i>
                                    <spring:message code="common.back"/>
                                </a>
                            </span>
                        </h3>
                     <form action="course/course/save_${cmd}.do" method="post" class="form-horizontal" role="form">
                            <input type="hidden" name="cmd" id="cmd" value="${cmd}"/>
                            <input type="hidden" name="id" id="id" value="${course.id}"/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="account">
                                    <spring:message code="course.name"/>
                                </label>

                                <div class="col-sm-6">
                                    <input type="text" autocomplete="off" name="name"  maxlength="50" minlength="2"  value="${course.name}" class="required form-control">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="description">
                                    <spring:message code="course.description"/>
                                </label>

                                <div class="col-sm-6">
                                    <textarea type="text" autocomplete="off" id="description"  maxlength="255" name="description"  class="form-control">${course.description}</textarea>
                                </div>
                            </div>

                            <sec:authorize ifAnyGranted="OPT_COURSE_COURSE_ADD,OPT_COURSE_COURSE_EDIT">
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