<#include "security.ftl">

<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sweater</title>
    <link rel="icon" href="/static/favicon.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>

<body>
    <#include "navbar.ftl">
    <div class="container-fluid mt-3"> <!-- Bootstrap aligning content -->
        <div class="row">
                <nav class="col-md-2 d-none d-md-block sidebar">
                <#if known>
                <img src="/img/${photo}" class="rounded-circle my-4" style="width:100%">
                    <div class="sidebar-sticky ml-3 mt-4">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="/user-messages/${currentUserId}">My message</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="/user/dialogs">My Dialogs</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="/users">All users</a>
                            </li>
                        </ul>
                    </div>
                </#if>
                </nav>
            <main class="col-md-9 ml-sm-auto col-lg-10 px-4" role="main">
            <#nested>
            </main>
        </div>
    </div>
</body>
</html>
</#macro>