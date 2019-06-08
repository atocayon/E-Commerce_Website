/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pakage;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author actwhitehat27
 */
@WebServlet(name = "AddUser", urlPatterns = {"/AddUser"})
public class AddUser extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");
        String address = request.getParameter("add");
        String status = "0";
        
        UserDAO req = new UserDAO();
        
       
            if(req.Register_Check(uname, email)){
                out.println("Inputed data already exist");
            }else{
                req.save(email,uname,pass,address,status);
                response.sendRedirect("index.jsp");
            }
       
        
    }

 
    

}
