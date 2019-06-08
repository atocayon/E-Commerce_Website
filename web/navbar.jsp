<%-- 
    Document   : navbar
    Created on : 04 29, 19, 9:03:55 AM
    Author     : actwhitehat27
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar" style="background-color:#187DC7">
                    <div class="container-fluid">
                      <div class="navbar-header">
                        <a class="navbar-brand" href="#" style="color:white;">Geek HUB</a>
                      </div>
                        
                      <ul class="nav navbar-nav" >
                        <li class="active"><a href="index.jsp" style="color:white;"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                         <li><a href="#" style="color:white;"><span class="glyphicon glyphicon-fire"></span> New Arrival</a></li>
                        <li><a href="#" style="color:white;"><span class="glyphicon glyphicon-tags"></span> Sale</a></li>
                        <li><a href="#" style="color:white;"><span class="glyphicon glyphicon-pushpin"></span> Top Items</a></li>
                      </ul>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <center>
                                    <form class="navbar-form" action="search.jsp" method="POST">
                                    <div class="input-group">
                                      <input type="text" class="form-control" placeholder="Search" name="search" style="height:50px;width:500px;">
                                      <div class="input-group-btn">
                                        <button class="btn btn-lg" type="submit" style="background-color:#EEC434;">
                                          <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                      </div>
                                    </div>
                                  </form>                             
                                </center>
                               
                            </div>
                        </div>
                        
                        <ul class="nav navbar-nav pull-right" style="color:white;">
                        
                               <!--<li><a type="button" data-toggle="modal" data-target="#loginModal" style="color:white;">Sign-in</a></li>-->
                               
                          
                         <li>
                                    <div class="dropdown">
                                      <a class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="background-color:#EEC434;color: black;"><span class="glyphicon glyphicon-user"></span> 
                                          <% 
                                          if(session.getAttribute("username") == null){
                                              out.println("Sign-in");
                                          }else{
                                              out.println("Sign-in as "+ session.getAttribute("username"));
                                          }

                                          %>

                                      <span class="caret"></span></a>
                                      <ul class="dropdown-menu">
                                        <li>
                                            <%
                                              if(session.getAttribute("username") == null){
                                                  out.print("<a type='button' data-toggle='modal' data-target='#loginModal'>Login</a>");
                                              }else{
                                                  out.print("<a href='Logout'>Logout</a>");
                                                  
                                              }
                                            %>

                                        </li>
                                        <%
                                            if(session.getAttribute("username") == null){
                                               out.print("<li><a type='button' data-toggle='modal' data-target='#loginModal'>My Products</a></li>");
                                               out.print("<li><a type='button' data-toggle='modal' data-target='#loginModal'>My Orders</a></li>");
                                               out.print("<li><a type='button' data-toggle='modal' data-target='#loginModal'>My Customers</a></li>");
                                               out.print("<li><a type='button' data-toggle='modal' data-target='#loginModal'>Settings</a></li>");
                                            }else{
                                               out.print("<li><a href='products.jsp'>My Products</a></li>");
                                               out.print("<li><a href='myOrders.jsp'>My Orders</a></li>");
                                               out.print("<li><a href='myCostumers.jsp'>My Customers</a></li>");
                                               out.print("<li><a href='#'>Settings</a></li>");
                                            }
                                        %>
                                      </ul>
                                    </div> 
                               </li>
                        <% 
                            if(session.getAttribute("username") == null){
                                out.print("<li><a type='button' data-toggle='modal' data-target='#loginModal' style='color:white;'><span class='glyphicon glyphicon-shopping-cart'></span> My Cart</a></li>");
                            }else{
                                out.print("<li><a href='myCart.jsp' style='color:white;'><span class='glyphicon glyphicon-shopping-cart'></span> My Cart</a></li>");
                            }
                        %>
                        
                       
                      </ul>
                        
                      
                    </div>
                  </nav>
                
                <!-- Modal -->
                <div id="loginModal" class="modal fade" role="dialog">
                  <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Geek HUB</h4>
                      </div>
                      <div class="modal-body">
                          <div class="row">
                              <div class="col-md-12">
                                  <div id="createAccount" style="display: none;">
                                      <form action="AddUser"  method="POST">
                                          <center>
                                            <b>Sign up</b><br/><br/>
                                          </center>
                                            <label>Email</label>
                                                <input type="text" class="form-control" name="email" /><br/>
                                            <label>Username</label>
                                                <input type="text" class="form-control" name="uname" /><br/>
                                            <label>Password</label>
                                                <input type="password" class="form-control" name="pass" /><br/>
                                            <label>Address</label>
                                                <input type="text" class="form-control" name="add" /><br/>
                                            <center>
                                                <a onclick="login()" >Sign-in</a>
                                                <input type="submit" class="btn btn-sm btn-primary" value="Create" /><br/>
                                            </center>
                                      </form>
                                  </div>
                                  
                                  <div id="login">
                                      <center><b>LOGIN</b><br/><br/></center>
                                        <form action="Login" method="POST">
                                              <label>Username</label>
                                                <input type="text" class="form-control" name="uname" />
                                              <label>Password</label>
                                                <input type="password" class="form-control" name="pass" />
                                              <br/>
                                              <center>
                                                  <a onclick="reg()" >Sign up?</a>
                                                  <input type="submit" name="submit" class="btn btn-primary btn-sm" value="Sign in" />
                                              </center>
                                        </form> 
                                  </div>
                                  
                              </div>
                              
                          </div>
                          
                      </div>
                      <div class="modal-footer">
                          <center>&copy; Geek HUB 2019</center>
                      </div>
                    </div>

                  </div>
                </div>
