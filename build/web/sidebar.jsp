<%-- 
    Document   : sidebar
    Created on : 04 29, 19, 9:11:46 AM
    Author     : actwhitehat27
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="form-control" style="height:520px;overflow:auto;background-color:#EEC434;">
                    <h3><label style="color:black;">BRAND</label></h3>
                    <ul style="list-style-type: none;">
                        <li style="margin:30px;">
                            <a href="#" style="color:black;">
                                <img src="intel.png" style="width: 30px;" /> <b>Intel</b>
                            </a>
                        </li>
                        <li style="margin:30px;">
                            <a href="#" style="color:black;">
                                <img src="hp.png" style="width: 30px;" /> <b>HP</b>
                            </a>
                        </li>
                        <li style="margin:30px;">
                            <a href="#" style="color:black;">
                                <img src="toshiba.png" style="width: 30px;" /> <b>Toshiba</b>
                            </a>
                        </li>
                        <li style="margin:30px;">
                            <a href="#" style="color:black;">
                                <img src="dell.png" style="width: 30px;" /> <b>Dell</b>
                            </a>
                        </li>
                        <li style="margin:30px;">
                            <a href="#" style="color:black;">
                                <img src="lenovo.png" style="width: 30px;" /> <b>Lenovo</b>
                            </a>
                        </li>
                        <li style="margin:30px;">
                            <a href="#" style="color:black;">
                                <img src="acer.png" style="width: 30px;" /> <b>Acer</b>
                            </a>
                        </li>
                        <li style="margin:30px;">
                            <a href="#" style="color:black;">
                                <img src="amd.png" style="width: 30px;" /> <b>AMD</b>
                            </a>
                        </li>
                        <li style="margin:30px;"><a href="#" style="color:black;"><b>Others...</b></a></li>
                    </ul> 
                </div>
                
                <div class="form-control" style="height:200px;width:100%; background-color:#187DC7">
                    <h4 style="color:white;"><label>PRICE</label></h4>
                   <div class="row">
                       <div class="col-md-5">
                           <label></label>
                           <input type="text" name="priceStart" class="form-control" placeholder="Php" />
                       </div>
                       <div class="col-md-2">
                           <br/>
                           <label style="color:white;">to</label>
                       </div>
                       <div class="col-md-5">
                           <label></label>
                           <input type="text" name="priceEnd" class="form-control" placeholder="Php" />
                       </div>
     
                   </div>
                   <br/>
                   
                   <center>
                       <button type="submit" class="btn btn-sm" style="background-color:#EEC434;color:black;"><span class="glyphicon glyphicon-arrow-right"></span> Go</button>
                   </center>
                   
                </div>
