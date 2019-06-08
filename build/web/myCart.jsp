<%-- 
    Document   : myCart
    Created on : 04 30, 19, 2:13:51 PM
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
                            List<GetSetProducts> list = product.selectUsersCartProduct(userID);
                            Iterator<GetSetProducts> my_list= list.iterator();
                            List<Integer> total = new ArrayList<Integer>();
                            List<Integer> totalFee = new ArrayList<Integer>();
                            int sumPrice = 0;
                            int sumFee = 0;
                           
                            while(my_list.hasNext()){
                                GetSetProducts prodList =  new GetSetProducts();
                                prodList = my_list.next();
                                int Price = prodList.getPrice();
                                total.add(Price);
                                int Fee = prodList.getShippingFee();
                                totalFee.add(Fee);
                                
                                
                        %>
                        <div class="col-md-3"> 
                            <div class="form-control" style="height: 450px;padding: 0px;">
                                <center>
                                <img src="<%= prodList.getFileDir() %>" style="height: 200px;width:250px;padding: 10px;" />
                                </center>
                                
                                <div style="background-color:#353535;padding: 10px;color:white;margin: 0px;">
                                    <form action="purchase" method="POST">
                                        <input type="text" name="prodID" value="<%= prodList.getProductID() %>" hidden/>
                                        <input type="text" name="shipping" value="<%= Fee %>" hidden/>
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
                                        Qty:<input type="number" name="qty" style="width: 50px;color: black;margin-right: 10px;" onchange="myFunction()" id="qty" value="1" /><input type="submit" name="submit" class="btn btn-sm btn-success" value="Purchase" />
                                    </form>
                                        <form action="deleteProductCart" method="POST">
                                            <input type="text" name="prodId" value="<%= prodList.getProductID() %>" style="color:black;" hidden />
                                            
                                            <input type="text" name="buyer" value="<%= session.getAttribute("username") %>" hidden/>
                                            <input type="submit" name="submit" value="Remove" class="btn btn-sm btn-danger" />
                                       </form>
                                    
                                </div>
                                
                            </div>
            
                                    
                        </div>
                                            
                        <%
                            }
                            
                                      for(int valuePrice:total){
                                      sumPrice += valuePrice;
                                      }  
                                  
                        %>
                        
                        
            </div>
                        
                        <div class="col-md-2" >
                            <div  style="width: 100%;background-color:#EEC434;border: solid black;padding-left: 20px;">
                                
                            
                                <h3><b>Price:</b>
                                </h3>
                                <input id="price" type="text" value="<%= sumPrice %>" class="form-control   "/>
                                
                            <h3>
                                <b>Shipping:</b>
                            </h3>
                            <h3 id="shipping">
                                <%
                                 for(int valueFee:totalFee){
                                 out.print(sumFee += valueFee);
                                 }  
                               %> 
                            </h3>
                            <h3><b>Total:</b>
                            </h3>
                            <h3 id="total">
                                <%= sumPrice+sumFee %>
                            </h3>
                            </div>
                        </div>
        </div>
                            <script>
                                function myFunction(){
                                    var qty = document.getElementById("qty").value;
                                    var price = document.getElementById("price").value;
                                   
                                    document.getElementById("price").value = qty *= price;
                                    
                                }
                            </script>
    </body>
</html>
