<%-- 
    Document   : home
    Created on : 04 28, 19, 8:43:23 PM
    Author     : actwhitehat27
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="pakage.GetSetProducts"%>
<%@page import="pakage.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="logo.png">
        <title>Geek Hub</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    </head>
    <body>
        <div class="row">
            <div class = "col-md-12">
                <%@include file="navbar.jsp" %>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-2" style="padding-left:50px;">
                <%@include file="sidebar.jsp" %>
                
            </div>
            <div class="col-md-10">
                <% 
                            String user = (String) session.getAttribute("username");
                            UserDAO product = new UserDAO();
                            
                            List<GetSetProducts> list = product.selectAllProduct();
                            Iterator<GetSetProducts> my_list= list.iterator();
                        
                            while(my_list.hasNext()){
                                GetSetProducts prodList =  new GetSetProducts();
                                prodList = my_list.next();
                        %>
                        <div class="col-md-3"> 
                            <div class="form-control" style="height: 400px;padding: 0px;">
                                <center>
                                <img src="<%= prodList.getFileDir() %>" style="height: 200px;width:250px;padding: 10px;" />
                                </center>
                                <form action="Cart" method="POST">
                                    <input type="text" name="buyer" value="<%= session.getAttribute("username") %>" hidden/>
                                <div style="background-color:#353535;padding: 10px;color:white;margin: 0px;">
                                    <h5><b>Product Name:</b> <%= prodList.getModel() %></h5>
                                    <input type="text" name="model" value="<%= prodList.getModel() %>" hidden />
                                    <h5><b>Price:</b> <%= prodList.getPrice() %></h5>
                                    <input type="text" name="price" value="<%= prodList.getPrice() %>" hidden />
                                    <h5><b>Stock:</b> <%= prodList.getQty() %></h5>
                                    <input type="text" name="qty" value="<%= prodList.getQty() %>" hidden />
                                    <h5><b>Rating:</b> <%= prodList.getRating() %></h5>
                                    <input type="text" name="rating" value="<%= prodList.getRating() %>" hidden />
                                    <% int sellerID = prodList.getSellerID(); String productSeller = product.Seller(sellerID); %>
                                    <input type="text" name="seller" value="<%= prodList.getSellerID() %>" hidden />
                                    <h5><b>Seller:</b>  <%= productSeller %></h5>
                                    <%
                                    if(session.getAttribute("username") == null){
                                    %>
                                    <a type="button" data-toggle='modal' data-target='#loginModal' style='color:white;' class="btn btn-sm btn-success">My Cart</a>
                                    
                                    <%
                                    }else{
                                    %>
                                    <input type="submit" name="submit" class="btn btn-sm btn-success" value="Add to cart" />
                                    <%
                                        
}
                                    %>
                                </div>
                                </form>
                            </div>
            
                                    
                        </div>
                                
                        <%
                            }
                        %>
            </div>
        </div>
    </body>
    
    <script>
        function reg() {
            var createAccount = document.getElementById("createAccount");
            var login = document.getElementById("login");
            if (createAccount.style.display === "none") {
              createAccount.style.display = "block";
              login.style.display = "none";
            } else {
              createAccount.style.display = "none";
              login.style.display = "block";
            }
          }
          
          function login() {
            var createAccount = document.getElementById("createAccount");
            var login = document.getElementById("login");
            if (login.style.display === "none") {
              login.style.display = "block";
              createAccount.style.display = "none";
            } else {
              login.style.display = "none";
              createAccount.style.display = "block";
            }
          }
    </script>
</html>
