<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.entities.transaction"%>
<%@page import="com.bank.helper.ConnectionProvider"%>
<%@page import="com.bank.dao.customerDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction History</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="nav ">
            <div class="navbar nav-user">
                <div class="nav-items">
                    <div class="logo">
                        <h2 style="color: white">Sparks Bank</h2>
                    </div>
                    <div class="items">
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="allCustomer.jsp">All Users</a></li>
                            <li><a href="transactUser.jsp">Transfer Money</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
       
       <%
           customerDao dao=new customerDao(ConnectionProvider.getConnection());
           ArrayList<transaction> trans=dao.DataFromTransHstry();
       %>    
       
       <section>
            <table class="table table-striped t">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col" class="th th-font">Sender</th>
                    <th scope="col" class="th-font">Receiver</th>
                    <th scope="col" class="th-font">Amount</th>
                    <th scope="col" class="th-font">Date & Time</th>
                  </tr>
                </thead>
                <tbody>
                    <%         
                        for(transaction u:trans){
                    %>
                    <tr>
                      <td class="th"><%=u.getsName()%></td>
                      <td><%=u.getrName()%></td>
                      <td><%=u.getAmount()%></td>
                      <td><%= u.getDate() %></td>
                    </tr> 
                    <%
                      }
                    %>
                </tbody>
           </table>
        </section>
          
        <section>
            <footer class="footer trans-footer">
                <div class="info">
                    <p> &COPY;2021. Made by Khushi Agrawal<br>The Sparks Foundation</p>
                </div>
            </footer>
        </section>
    </body>
</html>
