<%-- 
    Document   : home
    Created on : Feb 16, 2023, 10:29:18 AM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diary Online</title>
        <link rel="stylesheet" href="CSS/home.css"/>
        <script>
        </script>
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
        <div class="content">
            <h2 id="test"></h2>
            <h1 style="font-family:  'Open Sans', sans-serif;">SIMPLE.EFFECTIVE.PERSONAL</h1>
            <p>Create your own diary save memorable moments and share it with friends</p>
            <button >
                <span class="text"><a style="color: white;" href="${(account!=null) ? "writeDiary":"login"}">Create diary</a></span>
            </button>
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
