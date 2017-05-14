<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>



<script type="text/javascript">
    function confirmAction(id) {
        if (confirm("Вы действительно хотите удалить запрос № " + id + " ?")) {
            return true;
        } else {
            return false;
        }
    }
</script>


<script type="text/javascript">
    function onSearchClick(){
        var searchStr = $("#idSearch").val();
        document.location.href = "/requestList/list?pageNumber=1&sortBy=id&sortOrder=desc&findText=" + searchStr;
    }
</script>


<c:url var="root_url" value="/"/>
<div class="container">
    <div class="table-header">
        <a href="${root_url}requestList/add?pageNumber=${pageNumber}&sortBy=${sortBy}&sortOrder=${sortOrder}&sortOrderHeader=${sortOrderHeader}"
           class="create-btn btn-danger">НОВЫЙ</a>


        <div style="display: inline-block; width: 300px; float: right; margin-top: -5px;">
               <div class="input-group">
                    <input type="text" class="form-control" id="idSearch" placeholder="Поиск">
                    <div class="input-group-btn">
                        <a class="btn btn-default" title="Поиск"
                           href="#" onclick="onSearchClick(); return false;" role="button">
                            <i class="glyphicon glyphicon-search"></i>
                        </a>
                    </div>
               </div>
        </div>

    </div>

    <div class="table-wrapper">
        <table class="list-table">
            <thead>

            <th style="width: 3%">#</th>
            <th style="width: 8%">
                <a href="/requestList/list?pageNumber=${pageNumber}&sortBy=status&sortOrder=${sortOrderHeader}"
                   class="${sortBy.equals('status')? imgBy : ''}">СТАТУС</a>
            </th>
            <th style="width: 14%">
                <a href="/requestList/list?pageNumber=${pageNumber}&sortBy=title&sortOrder=${sortOrderHeader}&findText=${findText}"
                   class="${sortBy.equals('title')? imgBy : ''}">НАЗВАНИЕ</a>
            </th>
            <th style="width: 14%">
               <a href="/requestList/list?pageNumber=${pageNumber}&sortBy=description&sortOrder=${sortOrderHeader}&findText=${findText}"
                   class="${sortBy.equals('description')? imgBy : ''}">ОПИСАНИЕ</a>
            </th>
            <th style="width: 8%">
                <a href="/requestList/list?pageNumber=${pageNumber}&sortBy=createdBy&sortOrder=${sortOrderHeader}"
                   class="${sortBy.equals('createdBy')? imgBy : ''}">СОЗДАТЕЛЬ</a>
            </th>
            <th style="width: 10%">
                <a href="/requestList/list?pageNumber=${pageNumber}&sortBy=assignedTo&sortOrder=${sortOrderHeader}"
                   class="${sortBy.equals('assignedTo')? imgBy : ''}">ИСПОЛНИТЕЛЬ</a>
            </th>
            <th style="width: 10%">
                <a href="/requestList/list?pageNumber=${pageNumber}&sortBy=department&sortOrder=${sortOrderHeader}"
                   class="${sortBy.equals('department')? imgBy : ''}">ДЕПАРТАМЕНТ</a>
            </th>
            <th style="width: 8%">
                <a href="/requestList/list?pageNumber=${pageNumber}&sortBy=requestType&sortOrder=${sortOrderHeader}"
                   class="${sortBy.equals('requestType')? imgBy : ''}">ТИП</a>
            </th>
            <th style="width: 5%">УДАЛИТЬ</th>

            </thead>
            <tbody>
            <c:forEach items="${requestAll}" var="lists" step="1" varStatus="loopStatus">

                <tr class="${loopStatus.index % 2 == 0 ? 'alt' : ''}">

                    <td><c:out value="${lists.requestId}"/></td>
                    <td><c:out value="${lists.status.requestStatusName}"/></td>
                    <td>
                        <a title="Редактирование запроса"
                           href="/requestList/edit?requestid=${lists.requestId}&pageNumber=${pageNumber}&sortBy=${sortBy}&sortOrder=${sortOrder}&sortOrderHeader=${sortOrderHeader}">
                            <c:out value="${lists.title}"/>
                        </a>
                    </td>

                    <td><c:out value="${lists.description}"/></td>
                    <td><c:out value="${lists.createdBy}"/></td>
                    <td><c:out value="${lists.assignedTo.fio}"/></td>
                    <td><c:out value="${lists.department.title}"/></td>
                    <td><c:out value="${lists.requestType.title}"/></td>
                    <td class="del-cell"><a class="del-btn" href="/requestList/delete?requestid=${lists.requestId}"
                                            onclick="return confirmAction(${lists.requestId})"></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="table-footer">
            <table>
                <tr>
                    <td>Страницы:</td>
                    <td>
                        <ul class="pagination">
                            <li>
                                <a href="" aria-label="Previous"><span aria-hidden="true">&laquo</span></a>
                            </li>
                            <c:forEach items="${pageTotal}" var="pageNumber" step="1">
                                <li>
                                    <a href="/requestList/list?pageNumber=${pageNumber.intValue()}&sortBy=${sortBy}&sortOrder=${sortOrder}&findText=${findText}">
                                        <c:out value="${pageNumber.intValue()}"/>
                                    </a>
                                </li>
                            </c:forEach>
                            <li>
                                <a href="" aria-label="Previous"><span aria-hidden="true">&raquo</span></a>
                            </li>
                        </ul>

                    </td>
                </tr>
            </table>
        </div>
    </div>

</div>

