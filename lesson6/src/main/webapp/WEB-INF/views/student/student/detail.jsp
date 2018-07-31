<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="lesson" tagdir="/WEB-INF/tags" %>
<lesson:page title="student.title.detail">
 <jsp:attribute name="script">
   	<script type="application/javascript">
	    var demo1 = $("#duallist").bootstrapDualListbox(
	    		{
      			  nonSelectedListLabel: '未选的课程',
      			  selectedListLabel: '已选的课程',
      			  preserveSelectionOnMove: 'moved',
      			}			
	    );
	</script>
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
                <spring:message code="student.title.detail" />
            </li>
        </ul><!-- /.breadcrumb -->
    </div>

    <div class="page-content">

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="profile-user-info profile-user-info-striped">
                            <div class="profile-info-row">
                                <div class="profile-info-name">
                                    <spring:message code="student.name"/>
                                </div>
                                <div class="profile-info-value">
                                    <span>${student.name}</span>
                                </div>
                            </div>

                            <div class="profile-info-row">
                                <div class="profile-info-name">
                                    <spring:message code="student.code"/>
                                </div>

                                <div class="profile-info-value">
                                    <span>${student.code}</span>
                                </div>
                            </div>
                        </div>
                        <h3 class="header smaller lighter blue"><spring:message code="student.course.list"/>
                    <div class="form-group">
                    <form action="student/student/save_detail.do" method="post">    
                    <input name="id" type="hidden" value="${student.id}">
					<div class="col-sm-11">
					    <select multiple="multiple" size="5" name="str" id="duallist">
					        <c:forEach items="${courses}" var="cour">
						        		<option value="${cour.id}" 
						        <c:forEach items="${student.courses}" var="stu">
						        	<c:if test="${stu.id==cour.id}">
						        		selected="selected"
						        	</c:if>
						        </c:forEach>
						        >${cour.name}</option>
					        </c:forEach>
					    </select>
					<div class="clearfix form-actions">
                       <div class="text-center">
                           <button class="btn btn-info" type="submit">
                               <i class="ace-icon fa fa-check bigger-110"></i>
                               <spring:message code="button.submit"/>
                           </button>
                       </div>
                   </div>
					</div>
                   </form> 
                   </div>   
                    </div><!-- /.span -->
                </div><!-- /.row -->

                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
    </jsp:body>
</lesson:page>