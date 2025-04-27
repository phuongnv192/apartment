<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="images/favicon.png">
        <title>Forgot Password</title>
        <link href="forgotpassword/rspassword.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/register.css">
        <style>
            /*            body {
                            background: linear-gradient(135deg, #30BD36, #5A84E6);
                            font-family: sans-serif;
                            height: 100vh;
                        }
                        .container {
                            max-width: 700px;
                            max-height: 300px;
                            margin: 10% auto 0;
                            padding: 20px;
                            background-color: white;
                            border-radius: 5px;
                            border-color: white;
                            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
                        }*/

            .get-password {
                background-color: #5A84E6;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                text-align: center;
                text-decoration: none; /* Remove underline for anchor tag */
                display: inline-block; /* To make anchor tag behave like a button */
                font-size: 16px; /* Adjust font size as needed */
                cursor: pointer;
                margin: 5px;
            }

            .get-password:hover {
                background-color: #4a6bbf; /* Darker shade for hover effect */
            }

            .back-login {
                display: inline-block; /* Ensure the link behaves like a button */
            }
            .step-reset {
                margin-left: 15px;
            }
            .button {
                height: 45px;
                width: 400px;
                border-radius: 5px;
                border: none;
                color: #fff;
                font-size: 18px;
                font-weight: 500;
                letter-spacing: 1px;
                cursor: pointer;
                transition: all 0.3s ease;
                background: linear-gradient(135deg, #30BD36, #5A84E6);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="title">Forgot password</div>
            <div class="content">
                <div class="user-details">
                    <br/>
                    <p>Change your password in three easy steps. This will help you to secure your password!</p>
                    <ol class="step-reset">
                        <li> Enter your email address below.</li>
                        <li> Our system will send you an OTP to your email.</li>
                        <li> Enter the OTP on the next page.</li>
                    </ol>
                    <form action="forgot-password" method="POST" id="forgot-pwd">
                        <br>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="email" placeholder="Enter your email" 
                                   name="email" id="email" required maxlength="100"
                                   value="${user.account.userMail}">
                        </div>
                        <small class="form-text">(Enter the email you used when registration. Then we'll email an OTP to this address.)</small>
                        <br>
                        <br>
                        <p id="emailError" style="color: red">${message}</p>
                        <br>
                        <div class="submit-password">
                            <button class="button get-password" type="submit" style="width: 650px;">
                                Get New Password
                            </button>
                            <a class="button get-password" href="login" style="width: 650px;">
                                Back to Login
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const form = document.getElementById('forgot-pwd');
                const emailInput = document.querySelector('input[name="email"]');
                const messageElement = document.querySelector('#message');

                let timeoutId;

                // Validate on input
                emailInput.addEventListener("input", () => validateField(emailInput, "emailError", validateEmail));
                // Validate on form submit
                form.addEventListener('submit', function (event) {
                    let isValid = true;
                    if (!validateEmail(emailInput.value)) {
                        document.getElementById("emailError").textContent = "Invalid email format";
                        isValid = false;
                    }
                    if (!isValid) {
                        event.preventDefault();
                    }
                });

                function validateField(input, errorId, validateFunc) {
                    clearTimeout(timeoutId);
                    timeoutId = setTimeout(() => {
                        const errorElement = document.getElementById(errorId);
                        if (!validateFunc(input.value)) {
                            errorElement.textContent = getErrorMessage(errorId);
                        } else {
                            errorElement.textContent = "";
                        }
                    }, 1000);
                }

                function getErrorMessage(errorId) {
                    switch (errorId) {
                        case "emailError":
                            return "Invalid email format";
                        default:
                            return "";
                    }
                }

                function validateEmail(email) {
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    return email && emailRegex.test(email);
                }
            });
        </script>
    </body>
</html>
