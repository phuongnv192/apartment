package controller;

import dao.AccountDAO;
import model.*;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgot-password")
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        RequestDispatcher dispatcher = null;
        int otpvalueLength = 6;
        Random rand = new Random();
        String string = "0123456789";
        String randomOtp = "";
        HttpSession mySession = request.getSession();

        if (email != null || !email.equals("")) {
            AccountDAO accountDAO = new AccountDAO();
            if (!accountDAO.isExistEmail(email)) {
                request.setAttribute("message", "Email is not existed.");
                request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
                return;
            }

            for (int i = 0; i < otpvalueLength; i++) {
                char c = string.charAt(rand.nextInt(string.length()));
                randomOtp = randomOtp + c;
            }
            Cookie cookie = new Cookie("otpR", randomOtp);
            cookie.setMaxAge(5 * 60); // 5 phut
            response.addCookie(cookie);
            String to = email;

            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("huyphqhe170146@fpt.edu.vn", "hnvm cprk dgio llqh");
                }
            });
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email, "Admin"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Request to reset password ");
                message.setText("Please don't share OTP code with anyone, OTP code will expired in 5 minute\n");
                message.setText("Hi, for security, please verify your account with the OPT below. \n"
                        + "Your OTP is ==========>" + randomOtp + "<==========\n"
                        + "Click the link to verify OTP: " + "http://localhost:8080/SWP391_2025_Spring_M1_BL5_Group1/confirm-otp");
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                e.printStackTrace();
            }

            dispatcher = request.getRequestDispatcher("forgot-password.jsp");
            request.setAttribute("message", "OTP is sent to your email");
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
        }

    }

}
