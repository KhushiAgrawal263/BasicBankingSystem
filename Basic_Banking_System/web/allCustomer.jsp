<%@page import="com.bank.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.helper.ConnectionProvider"%>
<%@page import="com.bank.dao.customerDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Users</title>
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
                           <li><a href="transactionHistory.jsp">Transaction History</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <% 
           customerDao dao=new customerDao(ConnectionProvider.getConnection());
           ArrayList<User> list1=dao.allCustomer();
        %>
        
        <table class="table table-striped" >
            <thead class="thead-dark">
                <tr>
                  <th scope="col" class="th th-font">ID</th>
                  <th scope="col" class="th-font">Name</th>
                  <th scope="col" class="th-font">Email Address</th>
                  <th scope="col" class="th-font">Current Balance</th>
                  <th scope="col" class="th-font">Operations</th>
                </tr>
            </thead>
            <tbody>
                <%         
                    for(User u:list1){
                %>
                <tr>
                  <th scope="row" class="th"><%= u.getId()%></th>
                  <td><%=u.getName() %></td>
                  <td><%=u.getEmail()%></td>
                  <td ><%=u.getBalance()%></td>
                  <td><a onclick="transact(<%= u.getId() %>)" href="transactUser.jsp" class="btn btn-outline-primary btn-<%= u.getId() %>">Transact</a></td>
                </tr> 
                <%
                  }
                %>
            </tbody>
        </table>
         
        <section>
            <footer class="footer all-user-footer">
                <div class="info">
                    <p> &COPY;2021. Made by Khushi Agrawal<br>The Sparks Foundation</p>
                </div>
            </footer>
        </section>
        <!---------------- javascript ---------------->
        <script src="js/script.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
          
        <script>
            function transact(uID) {
                console.log(uID);
                const d={
                     u:uID
                }
                $.ajax({
                    url: "transactServlet",
                    data: d,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log();
                    }
                }) 
            }
        </script>
    </body>
</html>