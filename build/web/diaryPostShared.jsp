<%-- 
    Document   : showDiary
    Created on : Feb 16, 2023, 9:18:13 PM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/diaryShared.css"/>

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
        <ul>
            <c:forEach var="diary" items="${requestScope.listDiaryShared}">
                <a href="viewDiaryPostShared?id=${diary.getId()}" class="diary-link">

                    <div class="info">
                        <div style="margin-left: 30px; font-size: 15px;"><h2><ion-icon name="person-circle-outline"></ion-icon> ${diary.getUsername()}</h2></div>
                        <div class="listDiary">
                            <li><h2>${diary.getTitle()}</h2></h2></li>
                            <li><p>${diary.getTime()}</p></li>
                            <li class="content-diary"><p class="content-diary">${diary.getContent()}</p></li>
                        </div>
                    </div></a>
            </c:forEach>
        </ul>
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
