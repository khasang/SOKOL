
<html lang="ru">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <title>Request</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css" rel="stylesheet" >
</head>
<body>

<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/i18n/defaults-*.min.js"></script>

<form action="addRequestPerformer" method="post" >
    <style>
    p {
        margin-top: 0.5em; /* Отступ сверху */
        margin-bottom: 1.5em; /* Отступ снизу */
        text-align: right;
        font-weight: 600;
    }
</style>

    <div class="panel panel-default">
        <div class="panel-heading">СОКОЛ</div>
        <div class="panel-body">Редактирование запроса</div>
    </div>

    <div class="row">
        <div class="col-sm-2">
            <p>Название</p>
        </div>

        <div class="col-sm-5">
        <input name="name" class="form-control" id="id" placeholder="${request.title}"/>

        </div>

        <div class="col-sm-1">
            <p>Создатель</p>
        </div>

        <div class="col-sm-3">
            <input name="creator" class="form-control" id="idCreator" placeholder="${request.assignedTo}" readonly/>
         </div>
    </div>


    <div class="row">
        <div class="col-sm-2">
            <p>Описание</p>
        </div>

        <div class="col-sm-5">
           <textarea class="form-control" name = "description2"  id="description2" rows="3"
                     placeholder="${request.description}"></textarea>
        </div>

        <div class="col-sm-1">
            <p>Дата создания</p>
        </div>

        <div class="col-sm-3">
            <input name="dateCreator" class="form-control" id="idDateCreator" placeholder="${request.createdDate}" readonly/>
        </div>
    </div>

    <div class="panel-body"></div>

    <div class="row">
        <div class="col-sm-2">
            <p>Тип запроса</p>
        </div>

        <div class="col-sm-4">
            <select name="typerequest" class="selectpicker" placeholder="${request.requestType.title}">
                <option>ИТ</option>
                <option>Бухгалтерия</option>
                <option>Кадры</option>
            </select>
        </div>
    </div>


    <div class="panel-body"></div>
    <div class="panel-body"></div>
    <div class="panel-body"></div>
    <div class="panel-body"></div>

    <div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-1">
            <button type="submit" class="btn btn-success">Подтвердить</button>
        </div>

        <div class="col-sm-1">
            <a class="btn btn-danger" href="/addRequestCreator">Отменить</a>
        </div>

        <div class="col-sm-5"></div>
    </div>



</form>




</body>
</html>






