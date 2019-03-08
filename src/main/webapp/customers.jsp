<%@ page import="model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Optional JavaScript: jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link href="css/cupcake.css" rel="stylesheet" type="text/css">
    <script>$(document).ready(function ($) {
        $(".table-row").click(function () {
            window.document.location = $(this).data("href");
        });
    });</script>
</head>
<body>
<div class="container">

    <img src="img/cupcakeBanner.png" alt="Logo" class="img-fluid"/>

    <div class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="index.jsp">
            <img src="img/cupcake.svg" width="30" height="30" class="d-inline-block align-top" alt="logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <a href="index.jsp">Shop</a>
                <a class="active" href="servlet?destination=customers.jsp">Kunder</a>
                <a href="servlet?destination=orders.jsp">Ordrer</a>
            </ul>

            <!-- Login popup -->
            <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>

            <div id="id01" class="modal">
                <form class="modal-content animate" action="/action_page.php"><!-- TODO: Login controller -->
                    <div class="container">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close"
                          title="Close Modal">&times;</span>
                        <label for="email"><b>Email</b></label>
                        <input type="text" placeholder="Enter Email" id="email" required>
                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" id="psw" required>
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Remember me
                        </label>
                        <button type="submit">Login</button>
                        <button type="button" onclick="document.getElementById('id01').style.display='none'"
                                class="cancelbtn">Cancel
                        </button>
                    </div>

                </form>
            </div>
        </div>
        <script>
            // Get the modal
            var modal = document.getElementById('id01');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
        <a class="nav-link" href="shoppingBasket.jsp">
            <img src="img/shopping-basket.svg" width="30" height="30" class="d-inline-block align-top"
                 alt="logo">
        </a>
    </div>

    <h3>Kundeliste</h3>
    <%
        ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
        StringBuilder stringBuilder = new StringBuilder();

        for (User user :
                users) {
            String template = "<tr class=\"table-row\"data-href=\"customerPageController?userid=_userid_\">" +
                    "    <td>_email_</td>\n" +
                    "    <td>_userid_</td> \n" +
                    "    <td>_balance_</td>\n" +
                    "  </tr>";
            template = template.replace("_email_", user.getEmail());
            template = template.replace("_userid_", Integer.toString(user.getUserID()));
            template = template.replace("_balance_", Integer.toString(user.getSaldo()));
            stringBuilder.append(template);
        }
    %>
    <div class="container-fluid">
        <table class='table table-bordered table-condensed table-striped table-hover'>
            <tr>
                <th>E-mail</th>
                <th>Kunde-ID</th>
                <th>Saldo</th>
            </tr>
            <%=stringBuilder.toString()%>
        </table>
    </div>
</div>
</body>
</html>