package controller;

import dao.AccountDAO;
import dao.RegisterDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Random;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import model.Account;
import model.User;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "emailSender", urlPatterns = {"/emailSender"})
public class emailSender extends HttpServlet {

    private static final String PHONE_NUMBER_REGEX = "^(0|\\+84)[0-9]{9}$";
    private static final String EMAIL_REGEX = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$";
    private static final String PASSWORD_REGEX = "^(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RegisterDAO dao = new RegisterDAO();
        UserDAO userDAO = new UserDAO();
        AccountDAO accountDAO = new AccountDAO();

        // Lấy dữ liệu từ form
        String email = request.getParameter("email").trim().toLowerCase();
        String phone = request.getParameter("phone").trim();
        String username = request.getParameter("username").trim();
        String gender = request.getParameter("gender").trim();
        String dob = request.getParameter("dob").trim();
        String password = request.getParameter("password").trim();
        String repassword = request.getParameter("repassword").trim();
        String address = request.getParameter("address").trim();
        int role = Integer.parseInt(request.getParameter("role").trim());

        String errEmail = "";
        String errPhone = "";
        if (accountDAO.isExistEmail(email)) {
            request.setAttribute("errEmail", "Email is registed by another account.");
        }

        if (userDAO.isExistPhone(phone)) {
            request.setAttribute("errPhone", "Phone number is registed by another account.");

        }

        Account acc = new Account(username, password, role);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate userBirth = LocalDate.parse(dob, formatter);
        User u = new User(username, gender, userBirth, address, errPhone, email);
        u.setAccount(acc);

        if (!errEmail.isEmpty() || !errPhone.isEmpty()) {
            request.setAttribute("user", u);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Random OTP
        String code = generateRandomCode();
        // Send email
        boolean emailSent = sendEmail(email, code);

        if (emailSent) {
            // Save the confirmation code and send to session
            HttpSession session = request.getSession();
            session.setAttribute("authCode", code);
            session.setAttribute("codeGeneratedTime", System.currentTimeMillis());

            session.setAttribute("email", email);
            session.setAttribute("phone", phone);
            session.setAttribute("username", username);
            session.setAttribute("gender", gender);
            session.setAttribute("dob", userBirth);
            session.setAttribute("password", password);
            session.setAttribute("address", address);
            session.setAttribute("role", role); // Lưu role vào session

            // Send redirect to verify page
            request.getRequestDispatcher("verifyCode.jsp").forward(request, response);
        } else {
            response.getWriter().println("Sending email failed. Please try again.");
        }
    }

    private boolean sendEmail(String recipient, String code) throws UnsupportedEncodingException {
        // Email account information
        String email = "huyphqhe170146@fpt.edu.vn";
        String appPassword = "hnvm cprk dgio llqh";
        String smtpHost = "smtp.gmail.com";
        int smtpPort = 587;

        Properties props = new Properties();
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", smtpPort);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, appPassword);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email, "Admin"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject("Verification");
            message.setText("Your verification code is: " + code);

            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace(); // Log error details to the console
            log("Error sending email: " + e.getMessage(), e); // Write errors to the servlet log
            return false;
        }
    }

    private String generateRandomCode() {
        String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder code = new StringBuilder();
        Random rnd = new Random();
        while (code.length() < 6) {
            int index = rnd.nextInt(chars.length());
            code.append(chars.charAt(index));
        }
        return code.toString();
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
        return "Short description";
    }
}
