<%-- 
    Document   : myOrders
    Created on : 05 3, 19, 1:27:25 AM
    Author     : actwhitehat27
--%>

<%@page import="java.util.ArrayList"%>
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
            <div class="col-md-8">
                <% 
                            String user = (String) session.getAttribute("username");
                            UserDAO product = new UserDAO();
                            int userID = product.selectSeller(user);
                            List<GetSetProducts> list = product.selectUsersOrderedProduct(userID);
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
                                
                                <div style="background-color:#353535;padding: 10px;color:white;margin: 0px;">
                                    
                                        <input type="text" name="prodID" value="<%= prodList.getProductID() %>" hidden/>
                                        <input type="text" name="shipping" value="<%= prodList.getShippingFee() %>" hidden/>
                                        <input type="text" name="buyer" value="<%= session.getAttribute("username") %>" hidden/>
                                        <h5><b>Product Name:</b> <%= prodList.getModel() %></h5>
                                        <input type="text" name="model" value="<%= prodList.getModel() %>" hidden />
                                        <h5><b>Price:</b> <%= prodList.getPrice() %></h5>
                                        <input type="text" name="price" value="<%= prodList.getPrice() %>" hidden />

                                        <h5><b>Rating:</b> <%= prodList.getRating() %></h5>
                                        <input type="text" name="rating" value="<%= prodList.getRating() %>" hidden />
                                        <% int sellerID = prodList.getSellerID(); String productSeller = product.Seller(sellerID); %>
                                        <input type="text" name="seller" value="<%= prodList.getSellerID() %>" hidden />
                                        <h5><b>Seller:</b>  <%= productSeller %></h5>
                                        <h5><b>Status:</b><% if(prodList.getStatus() == 2){
                                            out.print("Order has been Receive");
                                        }else if(prodList.getStatus() == 1){
                                            out.print("Order is being Shipped");
                                        }else{
                                            out.print("Processing");
                                        } %></h5>
                                        <% 
                                            if(prodList.getStatus() == 1){
                                            %>
                                            <form action="receive" method="POST">
                                                 <input type="text" name="prodID" value="<%= prodList.getProductID() %>" hidden/>
                                                  <input type="text" name="seller" value="<%= prodList.getSellerID() %>" hidden />
                                                    <input type="text" name="shipping" value="<%= prodList.getShippingFee() %>" hidden/>
                                                    <input type="text" name="buyer" value="<%= session.getAttribute("username") %>" hidden/>
                                                <input type="submit" name="submit" class="btn btn-sm btn-success" value="Order Receive" />
                                            </form>
                                            <%
                                            }else if(prodList.getStatus() == 2){
                                               out.print("Done"); 
}else{
%>
<form action="cancel" method="POST">
     <input type="text" name="prodID" value="<%= prodList.getProductID() %>" hidden/>
      <input type="text" name="seller" value="<%= prodList.getSellerID() %>" hidden />
                                        <input type="text" name="shipping" value="<%= prodList.getShippingFee() %>" hidden/>
                                        <input type="text" name="buyer" value="<%= session.getAttribute("username") %>" hidden/>
    <input type="submit" name="submit" class="btn btn-sm btn-danger" value="Cancel Order" />
</form>
    <%
}
                                        %>
                                        
                                    
                                        
                                    
                                </div>
                                
                            </div>
            
                                    
                        </div>
                                        
                        <%
                            }
                            
                                     
                                  
                        %>
                        
                        
            </div>
                        
                        
        </div>
                            
    </body>
</html>
