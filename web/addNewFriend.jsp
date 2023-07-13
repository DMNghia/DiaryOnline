<%-- 
    Document   : addNewFriend
    Created on : Mar 7, 2023, 10:45:41 PM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS/login.css"/>
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <form action="diaryPostShared" method="post">
                        <h2>New Friend</h2>
                        <div class="inputbox">
                            <ion-icon name="key-outline"></ion-icon>
                            <input type="text" required name="username" value="${requestScope.username}">
                            <label for="">Friend username</label>
                        </div>
                        <button type="submit" name="status" value="${err.equals("You already have this friend")?"ok":""}">OK</button>
                        <h4 style="color: white">${err}</h4>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
