package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/confirm-otp")
public class ValidateOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("confirm-otp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String value = request.getParameter("otp");
        Cookie[] cookies = request.getCookies();
        String otpR = "";
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("otpR")) {
                otpR = cooky.getValue();
                break;
            }
        }
        RequestDispatcher dispatcher = null;

        if (value.equals(otpR)) {
            request.setAttribute("email", request.getParameter("email"));
            request.getSession().setAttribute("forgotPwd", true);
            response.sendRedirect(request.getContextPath() + "/new-password");
        } else {
            request.setAttribute("message", "OTP wrong or expired.");
            dispatcher = request.getRequestDispatcher("confirm-otp.jsp");
            dispatcher.forward(request, response);
        }
    }
}
