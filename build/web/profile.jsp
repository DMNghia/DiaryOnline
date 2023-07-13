<%-- 
    Document   : profile
    Created on : Feb 28, 2023, 10:25:04 PM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Profile</title>
        <link rel="stylesheet" href="./CSS/login.css"/>
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <form action="createProfile" method="post">
                        <h2>Login</h2>
                        <div class="inputbox">
                            <ion-icon name="key-outline"></ion-icon>
                            <input type="text" required name="name">
                            <label for="">Full name</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="number" required name="age">
                            <label for="">Age</label>
                        </div>

                        <button type="submit">OK</button>
                        <br>
                        <h3 style="color: white">${err}</h3>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
