package controller;

import dao.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/new-password")
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("new-password.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("newpassword");

        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)
                && (newPassword.length() >= 6 && newPassword.length() <= 32)
                && (confPassword.length() >= 6 && confPassword.length() <= 32)) {
            try {
                if (!newPassword.matches("^(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$")) {
                    request.setAttribute("status", "Please just enter your password at least 8 characters long "
                            + "and include at least one uppercase letter and one special character");
                    request.getRequestDispatcher("new-password.jsp").forward(request, response);
                } else {
                    AccountDAO accountDAO = new AccountDAO();
                    accountDAO.updateUserPassword(email, newPassword);
                    request.setAttribute("status", "Reset Success");
                    request.getRequestDispatcher("login.jsp").forward(request, response);;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (newPassword == null || newPassword.isEmpty() || confPassword == null || confPassword.isEmpty()) {
            request.setAttribute("errorMessage", "Please enter your password here");
            request.getRequestDispatcher("new-password.jsp").forward(request, response);
        } else {
            request.setAttribute("status", "Reset Failed");
            request.getRequestDispatcher("new-password.jsp").forward(request, response);

        }
    }

}
