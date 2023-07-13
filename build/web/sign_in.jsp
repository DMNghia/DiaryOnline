<%-- 
    Document   : login
    Created on : Feb 16, 2023, 4:51:59 PM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
        <link rel="stylesheet" href="./CSS/login.css"/>
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <form action="signin" method="post">
                        <h2>Login</h2>
                        <div class="inputbox">
                            <ion-icon name="key-outline"></ion-icon>
                            <input type="text" required name="username">
                            <label for="">Username</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" required name="password">
                            <label for="">Password</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" required name="passwordag">
                            <label for="">Confirm Password</label>
                        </div>
                        
                        <button type="submit">Sign up</button>
                        <br>
                        <h3 style="color: white">${err}</h3>
                        <div class="register">
                            <p>Don't have a account <a href="login">Log in</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
