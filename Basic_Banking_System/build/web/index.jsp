<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sparks Bank</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <script src="js/script.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $(document).ready(function(){
              // Add smooth scrolling to all links
              $("a").on('click', function(event) {
            
                // Make sure this.hash has a value before overriding default behavior
                if (this.hash !== "") {
                  // Prevent default anchor click behavior
                  event.preventDefault();
                  var hash = this.hash;
                  $('html, body').animate({
                    scrollTop: $(hash).offset().top
                  }, 800, function(){
                    window.location.hash = hash;
                  });
                } 
              });
              
              $(window).scroll(function(){
                    if(window.scrollY > 600){
                        $(".navbar").css({"background-color":"black"}); 
                    }
                    else{
                        $(".navbar").css({"background-color":"transparent"});
                    }
              });    
            })
        </script>
    </head>
    <body>
        <section class="section-1" id="section_1">
            <div class="bg"></div>
        </section>
        <nav class="nav">
            <div class="navbar fixed-top ">
              <div class="nav-items">
                <div class="logo">
                    <h2 style="color: white">Sparks Bank</h2>
                </div>
                <div class="items">
                  <ul>
                      <li><a href="#section_1">Home</a></li>
                      <li><a href="#section_2">Services</a></li>
                      <li><a href="#section_3">About Us</a></li>
                  </ul>
                </div>
              </div>
            </div>
        </nav>
        
        <div class="pEl">
            <h2>BANKING SOLUTIONS</h2>
            <p>Transfer money to anyone, instantly! No fees, No BS.</p>
        </div>
        
        <section class="section-2" id="section_2">
            <div class="card-deck text-center">
                <div class="card" style="width: 51rem">
                    <div class="card-header title">
                        <h5 class="card-title">View All Users</h5>
                    </div>
                    <img class="card-img-top image" src="images/user-3331258_1280.png" alt="Card image cap"/>
                    <div class="card-body">
                        <div class="btn-d">
                            <a class="btn btn-primary btn-user" href="allCustomer.jsp" role="button">View</a>
                        </div>
                    </div>
                </div>

                <div class="card offset-1" style="width: 51rem">
                    <div class="card-header title" style="text-align: center">
                      <h5 class="card-title" style="text-align: center">Transfer Money</h5>
                    </div>
                    <img class="card-img-top image" src="images/money-transfer.jpg" alt="Card image cap"/>
                    <div class="card-body">
                        <div class="btn-d">
                            <a class="btn btn-primary btn-transfer" href="transactUser.jsp" role="button">Transfer</a>
                        </div>
                    </div>
                </div>

                <div class="card" style="width: 51rem">
                    <div class="card-header title">
                        <h5 class="card-title" style="text-align: center">Transaction History</h5>
                    </div>
                    <img class="card-img-top image" src="images/images.jpg" alt="Card image cap"/>
                    <div class="card-body">
                        <div class="btn-d">
                            <a class="btn btn-primary " id="btn-history" href="transactionHistory.jsp" role="button">View</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section>
            <footer class="footer">
                <div class="info">
                    <p> &COPY;2021. Made by Khushi Agrawal<br>The Sparks Foundation</p>
                </div>
            </footer>
        </section>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function (){
               $(".btn-user").on("click",function(){
                    location.href='allCustomer.jsp';
                })
            })
        </script>
    </body>
</html>