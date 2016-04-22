<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OracleDataAccess" %>
<%@ page import="model.Customer" %>
<%@ page import="controller.processors.AddCustomer" %>
<%@ page import="controller.processors.LoginUser" %>
<%@ page import="model.Order" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Слава
  Date: 19.04.2016
  Time: 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/order.css">
    <title>Title</title>
</head>
<body>
<div class="admin_order_content">
    <%List<Order> listOrders = null;
        try {
            //System.out.println(cus);
            listOrders = (List<Order>) request.getSession().getAttribute("listOfAllOrders");
            //System.out.println(listOrders);
        } catch (Exception e) {
            listOrders = null;
        }
        if (listOrders != null && listOrders.size() > 0) {%>
    <table >
        <tr>
            <td>Book name</td>
            <td>Amount</td>
            <td>Price</td>
            <td>Phone</td>
            <td>Email</td>
        </tr>
        <%for (Order order : listOrders) {%>

        <%for(Order.ContentOrder con:order.getContents()){
            if(con.getBooks()!=null){%>
        <tr>
            <td><%=con.getBooks().getName()%></td>
            <td><%=con.getAmount()%></td>
            <td><%=con.getBooks().getPrice()%></td>
            <td><%=order.getCustomer().getPhone()%></td>
            <td><%=order.getCustomer().getMail()%></td>
                <th><p align="right">
                    <a href="#" id="<%="go" + order.getIdOrder()%>" >
                        <input class="btn"  type="submit" value="Delete">
                    </a>
                    <style>
                        #modal_form<%=order.getIdOrder()%> #modal_close {
                            width: 21px;
                            height: 21px;
                            position: absolute;
                            top: 10px;
                            right: 10px;
                            cursor: pointer;
                            display: block;
                        }
                        #modal_form<%=order.getIdOrder()%> {
                            text-align: center;
                            width: 300px;
                            height: 80px;
                            border-radius: 5px;
                            border: 3px #000 solid;
                            background: #fff;
                            position: fixed;
                            top: 45%;
                            left: 50%;
                            margin-top: -150px;
                            margin-left: -150px;
                            display: none;
                            opacity: 0;
                            z-index: 5;
                            padding: 20px 10px;
                        }

                    </style>

                    <script> $(document).ready(function() { // вся мaгия пoсле зaгрузки стрaницы
                        $('a#go' + '<%=order.getIdOrder()%>').click( function(event){ // лoвим клик пo ссылки с id="go"
                            event.preventDefault(); // выключaем стaндaртную рoль элементa
                            $('#overlay').fadeIn(400, // снaчaлa плaвнo пoкaзывaем темную пoдлoжку
                                    function(){ // пoсле выпoлнения предъидущей aнимaции
                                        $('#modal_form'+ '<%=order.getIdOrder()%>')
                                                .css('display', 'block') // убирaем у мoдaльнoгo oкнa display: none;
                                                .animate({opacity: 1, top: '50%'}, 200); // плaвнo прибaвляем прoзрaчнoсть oднoвременнo сo съезжaнием вниз
                                    });
                        });
                        /* Зaкрытие мoдaльнoгo oкнa, тут делaем тo же сaмoе нo в oбрaтнoм пoрядке */
                        $('#modal_close, #overlay').click( function(){ // лoвим клик пo крестику или пoдлoжке
                            $('#modal_form'+ '<%=order.getIdOrder()%>')
                                    .animate({opacity: 0, top: '45%'}, 200,  // плaвнo меняем прoзрaчнoсть нa 0 и oднoвременнo двигaем oкнo вверх
                                            function(){ // пoсле aнимaции
                                                $(this).css('display', 'none'); // делaем ему display: none;
                                                $('#overlay').fadeOut(400); // скрывaем пoдлoжку
                                            }
                                    );
                        });
                    });</script>

                    <%@include file="DeleteOrder.jsp"%>

</div>
<br>
</th>


        </tr>
        <%}
        }
        }%>
    </table>
    <%} else { %>
    List of books is empty.
    <br>
    <br>
    <%}%>
    <br>
    <br>

</div>
</body>
</html>
