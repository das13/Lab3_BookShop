<%--
  Created by IntelliJ IDEA.
  User: Veleri
  Date: 31.03.2016
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books information</title>
    <style type="text/css">
        <!--
        @import url("css/style.css");
        -->
    </style>
</head>
<br>
<jsp:include page="Head.jsp" />
<jsp:include page="Footer.jsp" />
<div class="bookInf">
    <table class="table">
        <tr>
            <td>Book's name:</td>
            <td></td>
        </tr>
        <tr>
            <th></th>
            <td>Rubric:</td>
            <td></td>
    </table>
</div>


<div class="sideBook">



    <table class="table">
        <tr>
            <td>Price:</td>  <td></td>
        </tr>
    <tr>
        <td>Pages:</td>  <td></td>
    </tr>
    <tr>
        <td>Amount:</td>  <td></td>
    </tr>
        <tr>
            <td>Buy now:</td> <th><form name="buyBook" method="GET" action="Buy"><p>
            <p align="right">
                <input type="submit" value="Buy" style="width:100px;height: 60px;align-content: center">
            </p>
        </form>
        </th>
        </tr>
    </table>
    </div>
<br>
<div class="bookInf">
    <table class="table">

        <tr>
            <th></th>
            <td>Author:</td>
            <td></td>
        </tr>
    </table>
</div>

<div class="sideBook2">

            <table>
                <tr>
                <td>Discription:</td>
                </tr>
                <tr>
                    <th></th>
                    <td>Demo discription of book. Demo discription of book. Demo discription of book. Demo discription of book.</td>
                </tr>
            </table>



</div>

</br>
</body>
</html>