/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pakage;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author actwhitehat27
 */
@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10mb
        maxFileSize = 1024 * 1024 * 1000, //1gb
        maxRequestSize = 1024 * 1024 * 1000)//1gb
public class addProduct extends HttpServlet {
    
    PrintWriter out= null;
    HttpSession session = null;
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        
        try {
          out = response.getWriter();
          session = request.getSession(false);
          String folderName = "resources";
          String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;
          File dir = new File(uploadPath);
          
          if(!dir.exists()){
              dir.mkdirs();
          }
          Part file = request.getPart("file");
          String seller = request.getParameter("user");
          String brand = request.getParameter("brand");
          String model = request.getParameter("model");
          String type = request.getParameter("type");
          String price = request.getParameter("productPrice");
          String qty = request.getParameter("qty");
          String sale = request.getParameter("sale");
          String shippingFee = request.getParameter("shippingFee");
          String filename = file.getSubmittedFileName();
          String path = folderName + File.separator + filename;
          Timestamp added_date = new Timestamp(System.currentTimeMillis());
          InputStream is = file.getInputStream();
          Files.copy(is, Paths.get(uploadPath + File.separator + filename), StandardCopyOption.REPLACE_EXISTING);
          
          UserDAO objProduct = new UserDAO();
          
          int userID = objProduct.selectSeller(seller);
          
          objProduct.insertProduct(userID, brand, model, type, qty, price, sale, shippingFee, 0, path);
          session.setAttribute("fileName", filename);
          response.sendRedirect("products.jsp");
        }catch(Exception e){
            System.out.println(e);
        }
        
    }

   

}
