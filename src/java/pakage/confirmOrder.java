/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pakage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author actwhitehat27
 */
@WebServlet(name = "confirmOrder", urlPatterns = {"/confirmOrder"})
public class confirmOrder extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prodID = request.getParameter("prodID");
        
        
        UserDAO confirmOrder = new UserDAO();
 
        confirmOrder.confirmOrders(prodID);
        response.sendRedirect("myCostumers.jsp");
    }

   

}
