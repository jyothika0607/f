index.html:
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action = "LoginIn" method="post">
            <h1>Login Page</h1>
            <label for="uname">Enter username</label>
            <input type="text" name = "uname"/><br><br>
            <label for="pwd">Enter password:</label>
            <input type="password" name="pwd"/><br><br>
            <button>Login</button>
           
           
        </form>
    </body>
</html>
web.xml:
<web-app version="3.1" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd">
    <servlet>
        <servlet-name>LoginIn</servlet-name>
        <servlet-class>LoginPage.LoginIn</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>HelloPage</servlet-name>
        <servlet-class>LoginPage.HelloPageServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>LogOut</servlet-name>
        <servlet-class>LoginPage.LogOut</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>LoginIn</servlet-name>
        <url-pattern>/LoginIn</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>HelloPage</servlet-name>
        <url-pattern>/HelloPage</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>LogOut</servlet-name>
        <url-pattern>/LogOut</url-pattern>
    </servlet-mapping>
    <session-config>
        <session-timeout>30</session-timeout>
    </session-config>
</web-app>
LoginIn.java:
package LoginPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginIn extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get username and password from form
        String uname = request.getParameter("uname");
        String pwd = request.getParameter("pwd");

        // Here you can validate the password if required
        // For simplicity, we're skipping password validation

        // Store the name and time of login in the session
        HttpSession session = request.getSession();
        session.setAttribute("username", uname);
        session.setAttribute("loginTime", new Date());

        // Redirect to the HelloPageServlet (not just "hello")
        response.sendRedirect("HelloPage");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "LoginIn Servlet";
    }
}
LogOut.java:
package LoginPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOut extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session != null) {
            String uname = (String) session.getAttribute("username");
            Date loginTime = (Date) session.getAttribute("loginTime");
            Date logoutTime = new Date();

            // Calculate session duration in seconds
            long durationInSeconds = (logoutTime.getTime() - loginTime.getTime()) / 1000;

            // Invalidate the session
            session.invalidate();

            // Display thank you message
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Logout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Thank You, " + uname + "!</h1>");
            out.println("<p>Your session lasted for: " + durationInSeconds + " seconds</p>");
            out.println("</body>");
            out.println("</html>");
        } else {
            response.sendRedirect("index.html");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Logout Servlet";
    }
}
HelloPageServlet.java:
package LoginPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HelloPageServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("index.html");
            return;
        }

        String uname = (String) session.getAttribute("username");
        Date loginTime = (Date) session.getAttribute("loginTime");
        Date currentTime = new Date();
       

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Welcome " + uname + "</title>");
        out.println("<style>");
        out.println("body {font-family: Arial, sans-serif;}");
        out.println(".logout-btn {position: absolute; top: 10px; right: 10px;}");
       
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Welcome, " + uname + "!</h1>");
        out.println("<p class='logout-btn'>Start Time: " + loginTime.toString() + "</p><br>");
   
        out.println("<form action='LogOut' method='post'>");
        out.println("<button class='logout-btn'>Logout</button <br><br>>");
        out.println("</form>");
        out.println("</body>");
        out.println("</html>");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Hello Page Servlet";
    }
}
