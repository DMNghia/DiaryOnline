<%-- 
    Document   : modifyDiary
    Created on : Mar 2, 2023, 3:10:02 PM
    Author     : dmngh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/modifyDiary.css"/>
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
            <form action="modifyDiary?id=${diary.getId()}" method="post">
                <div class="cover">
                    <h1>Your Diary</h1>
                    <input id="title" type="text" name="title" value="${diary.getTitle()}" placeholder="Write title here">
                </div>
                <div class="page">
                    <textarea placeholder="Write your diary here" name="content">${diary.getContent()}</textarea>
                </div>
                <button style="margin-right: 20px;" type="submit" name="save">
                    Save
                </button>
                <button type="submit" name="delete">
                    Delete
                </button>
                <button id="sidebar-button" style="margin-left: 20px;" type="button" name="share" onclick="toogleFriendSideBar()">
                    Share
                </button>
            </form>
        </div>
        <div id="friendSideBar">
            <a href="addNewFriend.jsp"><button type="button" style="height: fit-content"><ion-icon name="person-add-outline"></ion-icon> Add new</button></a>
            <ul>
                <c:forEach var="i" items="${listFriends}">
                    <li><a href="diaryPostShared?user=${i.getUsername()}&id=${param.id}" class="tooltip" data-tooltip="${i.getUsername()}"><ion-icon name="person-outline"></ion-icon>${i.getFullName()}</a></li>
                            </c:forEach>
            </ul>
        </div>
        <script>
            function toogleFriendSideBar() {
                var friendSideBar = document.getElementById("friendSideBar");
                friendSideBar.classList.toggle("show");
                document.addEventListener("click", function (event) {
                    var sidebar = document.getElementById("friendSideBar");
                    var clickedImage = event.target;
                    if (!clickedImage.id.startsWith("sidebar-button") && !sidebar.contains(event.target)) {
                        sidebar.classList.remove("show");
                    }
                });
            }
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
