<%-- 
    Document   : writeDiary
    Created on : Feb 19, 2023, 4:25:02 PM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/writeDiary.css"/>
    </head>
    <body>
        <c:set var="account" value="${sessionScope.account}"/>
        <div class="top-menu-bar">
            <div class="diary-icon">
                <a href="login"><img src="Images/diary.png" alt="alt"/></a>
            </div>
            <div class="menu-bar">

                <li>
                    <a href="login">HOME</a>
                </li>
                <li>
                    <a href="${(account!=null) ? "diary":"login"}">Diary</a>
                </li>
                <li>
                    <a href="${(account!=null) ? "diaryShared":"login"}">Diary shared</a>
                </li>

                <c:if test="${(account == null)}">
                    <li>
                        <a href="login">Login</a>
                    </li>
                    <li>
                        <a href="signin">Sign in</a>
                    </li>
                </c:if>
                <c:if test="${(account != null)}">
                    <li>
                        <a href="diaryPostShared">Diary post shared</a>
                    </li>
                    <li>
                        <img src="Images/login-icon.png" alt="Sidebar Icon" id="sidebar-icon" onclick="toggleSidebar(event)"/>
                        <div id="sidebar">
                            <ul>
                                <li class="sidebar-element">Name: ${profile.getFullName()}</li>
                                <li class="sidebar-element">Age: ${profile.getAge()}</li>
                                <li class="sidebar-element"><a href="logout">Log out <ion-icon name="log-out-outline"></ion-icon></a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
            </div>
        </div>
        <div class="book">
            <form action="writeDiary" method="post">
                <div class="cover">
                    <h1>Write Your Diary</h1>
                    <p>By You</p>
                    <input id="title" type="text" name="title" value="${param.title}" placeholder="Write title here">
                </div>
                <div class="page">
                    <textarea placeholder="Write your diary here" name="content">${param.content}</textarea>
                </div>
                <button type="submit">
                    Save
                </button>
            </form>
        </div>
        <script>
            function toggleSidebar(event) {
                var sidebar = document.getElementById("sidebar");
                sidebar.classList.toggle("show");

                // Get the height and top position of the clicked image
                var clickedImage = event.target;
                var imageHeight = clickedImage.offsetHeight;
                var imageWidth = clickedImage.offsetWidth;
                var imageTop = clickedImage.getBoundingClientRect().top;
                var imageLeft = clickedImage.getBoundingClientRect().left;

                // Set the top property of the sidebar to the image's height plus its top position
                sidebar.style.top = imageHeight + imageTop + 10 + "px";
                sidebar.style.left = imageLeft - (100 - imageWidth) / 2 + "px";
            }

            document.addEventListener("click", function (event) {
                var sidebar = document.getElementById("sidebar");
                var clickedImage = event.target;
                if (!clickedImage.id.startsWith("sidebar-icon") && !sidebar.contains(event.target)) {
                    sidebar.classList.remove("show");
                }
            });

        </script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
