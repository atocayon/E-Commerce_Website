<%-- 
    Document   : products
    Created on : 04 29, 19, 9:03:11 AM
    Author     : actwhitehat27
--%>

<%@page import="java.util.Iterator"%>
<%@page import="pakage.GetSetProducts"%>
<%@page import="java.util.List"%>
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
            <div class="col-md-12">
                <%@include file="navbar.jsp" %>
            </div>
        </div>
            
        <div class="row">
            <div class="col-md-2" style="padding-left:50px;">
                <%@include file="sidebar.jsp" %>
                
            </div>
            <div class="col-md-8" style="overflow:auto">
                 
                
                <div id="viewProducts">
                    <div class="row">
                        <% 
                            String user = (String) session.getAttribute("username");
                            UserDAO product = new UserDAO();
                            int user_id = product.selectSeller(user);
                            List<GetSetProducts> list = product.selectUsersProduct(user_id);
                            Iterator<GetSetProducts> my_list= list.iterator();
                        
                            while(my_list.hasNext()){
                                GetSetProducts prodList =  new GetSetProducts();
                                prodList = my_list.next();
                        %>
                        <div class="col-md-3"> 
                            <div class="form-control" style="height: 350px;padding: 0px;">
                                <center>
                                <img src="<%= prodList.getFileDir() %>" style="height: 200px;width:250px;padding: 10px;" />
                                </center>
                                <div style="background-color:#353535;padding: 10px;color:white;margin: 0px;">
                                <h5><b>Product Name:</b> <%= prodList.getModel() %></h5>
                                <h5><b>Price:</b> <%= prodList.getPrice() %></h5>
                                <h5><b>QTY:</b> <%= prodList.getQty() %></h5>
                                <h5><b>Rating:</b> <%= prodList.getRating() %></h5>
                                </div>
                            </div>
            
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                
                <div id="updateProducts" style="display:none;">
                    <div class="row">
                        <% 
                            String user1 = (String) session.getAttribute("username");
                            UserDAO product1 = new UserDAO();
                            int user_id1 = product1.selectSeller(user1);
                            List<GetSetProducts> list1 = product1.selectUsersProduct(user_id1);
                            Iterator<GetSetProducts> my_list1= list1.iterator();
                        
                            while(my_list1.hasNext()){
                                GetSetProducts prodList1 =  new GetSetProducts();
                                prodList1 = my_list1.next();
                        %>
                        <div class="col-md-3"> 
                            <div class="form-control" style="height: 450px;padding: 0px;">
                                <center>
                                <img src="<%= prodList1.getFileDir() %>" style="height: 200px;width:250px;padding: 10px;" />
                                </center>
                                <form action="updateProduct" method="POST">
                                    <div style="background-color:#353535;padding: 10px;margin: 0px;">
                                    <input type="text" name="productID" value="<%= prodList1.getProductID() %>" hidden />
                                    <h5><b style="color:white;">Product Name:</b> <input type="text" name="model" value="<%= prodList1.getModel() %>" /></h5>
                                    <h5><b style="color:white;">Price:</b> <input type="text" name="price" value="<%= prodList1.getPrice() %>" /></h5>
                                    <h5><b style="color:white;">QTY:</b> <input type="text" name="qty" value="<%= prodList1.getQty() %>" /></h5>
                                    <h5><b style="color:white;">Rating:</b> <input type="text" name="rating" value="<%= prodList1.getRating() %>" /></h5>
                                    <center>
                                        <input type="submit" name="submit" class="btn btn-success" value="Update" />
                                    </center>
                                    </div>
                                </form>
                            </div>
            
                        </div>
                        <%
                            }
                        %>
                        
                    </div>
                </div>
                
                <div id="deleteProducts" style="display:none;">
                    <div class="row">
                        <% 
                            String user2 = (String) session.getAttribute("username");
                            UserDAO product2 = new UserDAO();
                            int user_id2 = product2.selectSeller(user2);
                            List<GetSetProducts> list2 = product2.selectUsersProduct(user_id2);
                            Iterator<GetSetProducts> my_list2= list2.iterator();
                        
                            while(my_list2.hasNext()){
                                GetSetProducts prodList2 =  new GetSetProducts();
                                prodList2 = my_list2.next();
                        %>
                        <div class="col-md-3"> 
                            <div class="form-control" style="height: 400px;padding: 0px;">
                                <center>
                                    <img src="<%= prodList2.getFileDir() %>" style="height: 200px;width:250px;padding: 10px;" />
                                </center>
                                <form action="deleteProduct" method="POST">
                                    <div style="background-color:#353535;color:white;;padding: 10px;margin: 0px;">
                                    <input type="text" name="productID" value="<%= prodList2.getProductID() %>" hidden />
                                    <h5><b>Product Name:</b> <%= prodList2.getModel() %></h5>
                                    <h5><b>Price:</b> <%= prodList2.getPrice() %></h5>
                                    <h5><b>QTY:</b> <%= prodList2.getQty() %></h5>
                                    <h5><b>Rating:</b> <%= prodList2.getRating() %></h5>
                                    <br/>
                                    <center>
                                    <input type="submit" name="submit" value="Delete" class="btn btn-sm btn-danger" />
                                    </center>
                                    </div>
                                </form>
                            </div>
            
                        </div>
                        <%
                            }
                        %>
                        
                    </div>
                </div>
                
                <div id="addProducts" style="display:none;">
                    <div class="row">
                        <div class="col-md-4">
                            
                        </div>
                     
                        <div class="col-md-4">
                            <form action="addProduct" method="POST" enctype="multipart/form-data">
                                <h3 class="text-center"><b>Product Information</b></h3>
                                <hr/>
                                <label>Product Image</label>
                                <input type="text" name="user" value="<%= session.getAttribute("username") %>" hidden />
                                <input type="file" name="file"/>
                                <label>Brand</label>
                                <select class="form-control" name="brand">
                                    <option>Intel</option>
                                    <option>HP</option>
                                    <option>Toshiba</option>
                                    <option>Dell</option>
                                    <option>Lenovo</option>
                                    <option>Acer</option>
                                    <option>AMD</option>
                                    <option>Others</option>
                                </select>
                                <label>Model</label>
                                <input type="text" name="model" class="form-control" />
                                <label>Type</label>
                                <select class="form-control" name="type">
                                    <option>Laptop</option>
                                    <option>Desktop</option>
                                    <option>CPU</option>
                                    <option>Motherboard</option>
                                    <option>GPU</option>
                                    <option>RAM</option>
                                </select>
                                <label>Price (Php)</label>
                                <input type="number" name="productPrice" class="form-control" />
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>QTY</label>
                                        <input type="number" name="qty" class="form-control" />
                                    </div>
                                    <div class="col-md-6">
                                        <label>Sale Percent</label>
                                        <input type="text" name="sale" class="form-control" />
                                    </div>
                                </div>
                                <label>Shipping Fee (Php)</label>
                                <input type="number" name="shippingFee" class="form-control" />
                                <br/>
                                <br/>
                                <hr/>
                                <center>
                                    <input type="submit" name="submit" value="Add Product" class="btn btn-md btn-primary" />
                                </center>
                            </form>
                        </div>
                        </form>
                        <div class="col-md-4">
                            
                        </div>
                    </div>
                </div>
               
                
            </div>
                
                <div class="col-md-2">
                    <div class="row">
                        <div class="col-md-12 ">
                            <button class="btn btn-primary btn-lg pull-left" onclick="viewProducts()" style="margin-bottom: 30px;border-radius: 50px;" title="View Products"><span class="glyphicon glyphicon-eye-open" ></span></button>
                        </div>
                        
                        <div class="col-md-12">
                            <button class="btn btn-warning btn-lg pull-left" onclick="updateProducts()" style="margin-bottom: 30px;border-radius: 50px;" title="Update Products"><span class="glyphicon glyphicon-edit"></span></button>
                        </div>
                        
                        <div class="col-md-12">
                            <button class="btn btn-danger btn-lg pull-left" onclick="deleteProducts()" style="margin-bottom: 30px;border-radius: 50px;" title="Delete Products"><span class="glyphicon glyphicon-trash"></span></button>
                        </div>
                        
                        <div class="col-md-12">
                            <button class="btn btn-lg btn-success pull-left" onclick="addProducts()" style="margin-bottom: 30px;border-radius: 50px;" title="Add Products"><span class="glyphicon glyphicon-plus"></span></button>
                        </div>
                    </div>
                </div>
        </div>
                
     <script>
        function viewProducts() {
            var viewProducts = document.getElementById("viewProducts");
            var updateProducts = document.getElementById("updateProducts");
            var deleteProducts = document.getElementById("deleteProducts");
            var addProducts = document.getElementById("addProducts");
            
            viewProducts.style.display = "block";
            updateProducts.style.display = "none";
            deleteProducts.style.display = "none";
            addProducts.style.display = "none";
            
            }
            
        function updateProducts(){
            var viewProducts = document.getElementById("viewProducts");
            var updateProducts = document.getElementById("updateProducts");
            var deleteProducts = document.getElementById("deleteProducts");
            var addProducts = document.getElementById("addProducts");
            
            viewProducts.style.display = "none";
            updateProducts.style.display = "block";
            deleteProducts.style.display = "none";
            addProducts.style.display = "none";
        }
        
        function deleteProducts(){
            var viewProducts = document.getElementById("viewProducts");
            var updateProducts = document.getElementById("updateProducts");
            var deleteProducts = document.getElementById("deleteProducts");
            var addProducts = document.getElementById("addProducts");
            
            viewProducts.style.display = "none";
            updateProducts.style.display = "none";
            deleteProducts.style.display = "block";
            addProducts.style.display = "none";
        }
        
        function addProducts(){
            var viewProducts = document.getElementById("viewProducts");
            var updateProducts = document.getElementById("updateProducts");
            var deleteProducts = document.getElementById("deleteProducts");
            var addProducts = document.getElementById("addProducts");
            
            viewProducts.style.display = "none";
            updateProducts.style.display = "none";
            deleteProducts.style.display = "none";
            addProducts.style.display = "block";
        }
          
          
    </script>           
    </body>
</html>
