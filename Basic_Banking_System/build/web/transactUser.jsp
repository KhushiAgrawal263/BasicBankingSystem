<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.helper.ConnectionProvider"%>
<%@page import="com.bank.dao.customerDao"%>
<%@page import="com.bank.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        
<% 
    User user= (User)session.getAttribute("TransactData");
     session.setAttribute("transferID", user.getId());
%> 

<%
    customerDao dao=new customerDao(ConnectionProvider.getConnection());
    ArrayList<User> allUser = dao.allCustomer();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer Money</title>

        <!--CSS-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body class="trans-body">
        <!-------------------- body---------------->
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
                           <li><a href="transactionHistory.jsp">Transaction History</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
       
        <form class="form" id="add-form" method="post" action="transferAmountServlet">
            <div class="center-form">
                <div class="form-group user">
                    <label for="staticEmail2" class="label">Transfer To :</label>
                    <select name="receiver" class="custom-select selector">
                        <option selected disabled>--- Select---</option>
                        <% 
                            for(User u:allUser){
                                if (u.getId()!=user.getId()){
                         %>   
                        <option value="<%= u.getEmail() %>"><%= u.getEmail() %></option>
                        <%
                             }
                           }
                        %>
                     </select>
                </div>

                <div class="form-group amount">
                  <label for="inputPassword2" class="label" >Amount : </label>
                  <input name="amount" class=" selector form-control" id="amt" placeholder="Amount">
                </div>
                <button onclick="fun()" type="submit" class="btn btn-primary button">Transfer</button>        
            </div>  
        </form>
        <br>    
        <h4>Details</h4>

<!-------------------------------- details --------------->

        <form class="form detail-form">
            <div class="center-detail">
                <div class="detail-user">
                    <label for="inputPassword2" class="label" >ID <span class="i">:</span>  </label>
                    <label  class="selector form-control form-control-plaintext" id="amt"><%= user.getId() %></label>
                </div>
                <div class="detail-user">
                    <label for="inputPassword2" class="label" >Name<span class="n">:</span>  </label>
                    <label  class="selector form-control form-control-plaintext" id="amt"><%= user.getName()%></label>
                </div>
                <div class="detail-user ">
                    <label for="inputPassword2" class="label" >Email<span class="e">:</span>  </label>
                    <label  class="selector form-control form-control-plaintext" id="amt"><%= user.getEmail() %></label>
                </div>
                <div class="detail-user ">
                    <label for="inputPassword2" class="label" >Current Balance<span class="c">:</span> </label>
                    <label  class="selector form-control form-control-plaintext" id="amt"><%= user.getBalance() %></label>
                </div>
            </div>
        </form>
    
        <section>
            <footer class="footer">
                <div class="info">
                    <p> &COPY;2021. Made by Khushi Agrawal<br>The Sparks Foundation</p>
                </div>
            </footer>
        </section>

<!------------------ javascript ----------------------->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script>
            if(${f}){
                console.log("success");
                swal("Money Transfered Successfully !", "", "success");
            }else{
                swal("Error!", "Insufficient Balance", "error");
            }
            function fun(){
               document.getElementById()('amt').value='';
            }
        </script>
    </body>
</html>
     