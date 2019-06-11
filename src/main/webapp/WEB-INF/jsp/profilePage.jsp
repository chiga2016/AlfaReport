<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ProfilePage</title>

    <!--<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">-->

    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="/resources/css/profilepage.css" rel="stylesheet">
    <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">

        <script type="text/javascript">
            location="http://localhost:8090/admin";
        </script>
        <!--<meta http-equiv="refresh" content="0;http://localhost:8090/admin">-->
    </c:if>
</head>
<body>


<div class="container">


    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm"  method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>

        <h2>Добро пожаловать ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>

        <h1>Личный кабинет</h1>
        <%--<input type="submit" value="Редактирование вашего профиля" class="main gen">--%>
        <%--<input type="text" name="email" size="35" value="chiga_@bk.ru" readonly="readonly" style="color: gray;">--%>

        <%--<style>--%>
            <%--#In {--%>
                <%--position: relative;--%>
                <%--z-index: -1;--%>
            <%--}--%>

            <%--#InDa:checked ~ #In,--%>
            <%--#InDa:checked ~ * #In,--%>
            <%--#InDa:checked ~ * * #In {--%>
                <%--z-index: auto;--%>
            <%--}--%>
        <%--</style>--%>

        <%--<input type="checkbox" id="InDa" hidden /> <input id="In"/>--%>
<div class="profileInfo">
        <table>
            <tr>
                <td>id</td>
                <td class="prof">${u.id}</td>
            </tr>
            <tr>
                <td >Имя пользователя</td>
                <td class="prof">${u.username}</td>
            </tr>
            <tr>
                <td>Фамилия</td>
                <td class="prof">${u.fam}</td>
            </tr>
            <tr>
                <td>Имя</td>
                <td class="prof">${u.name}</td>
            </tr>
            <tr>
                <td>Отчество</td>
                <td class="prof">${u.ot}</td>
            </tr>
            <tr>
                <td>Дата рождения</td>
                <td class="prof">${u.dr}</td>
            </tr>
            <tr>
                <td>Водительское удостоверение</td>
                <td class="prof">${u.vuNumber}</td>
            </tr>
            <tr>
                <td>Телефон</td>
                <td class="prof">${u.phone}</td>
            </tr>
            <tr hidden>
                <td>Пароль</td>
                <td class="prof">${u.password}</td>
            </tr>
            <tr hidden>
                <td>Подтвердите пароль</td>
                <td class="prof">${u.confirmPassword}</td>
            </tr>
            <tr>
                <td>currentCar</td>
                <td class="prof">${u.currentCar}</td>
            </tr>
            <tr hidden>
                <td>enabled</td>
                <td class="prof">${u.enabled}</td>
            </tr>
            <tr>
                <td>Дата регистрации</td>
                <td class="prof">${u.dateCreate}</td>
            </tr>
            <tr hidden>
                <td>Роль</td>
                <td class="prof">
                    <ul>
                        <c:forEach var="x" items="${u.roles}" >
                            <li>${x.name}</li>
                        </c:forEach>
                    </ul>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </table>

</div>
        <div class="selectCar">
            <table>
                <caption> Каталог автомобилей </caption>
                <c:forEach var="car" items="${allCars}">
                    <tr  onclick="window.location.href='/cars/' + ${car.id} ; return false"><td> ${car.id}  ${car.name} ${car.model} ${car.transmission} ${car.year} ${car.price} </td></tr>
                    <%--<tr><a style="display: block;" href="">Иванов И.И.</a></tr>--%>
                </c:forEach>
            </table>

            <form action="addCarToUser" method="post">
                <input name="idUser" hidden value=${u.id} >
                <h3> Доступные автомобили </h3>
                <select name="idCar" >
                    <c:forEach var="y" items="${cars}">
                        <option  value=${y.id}>${y.id} ${y.name} ${y.model} ${y.transmission} ${y.year} ${y.price}</option>
                    </c:forEach>
                </select>
                <input type="datetime" />

                <input type="submit" value="Арендовать">
            </form>

                    <form action="delCarToUser" method="post">
                        <input name="idUser" hidden value=${u.id}  >
                        <br>
                        <h3> На данный момент за вами автомобиль: </h3>
                        <input type="text" value="${u.currentCar.name}" size="50"> </input>
                        <input type="submit" value="Освободить">
                    </form>
                    <%--<button onclick="remove(${u.id})">Remove</button>--%>
                    <%--<script>--%>
                        <%--function deleteCat(id) {--%>
                            <%--fetch('http://localhost:8090/delCarToUser/'+id, {method: 'DELETE'}).catch(function(err) {alert(err);})--%>
                        <%--}--%>
                    <%--</script>--%>
        </div>
    </c:if>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

