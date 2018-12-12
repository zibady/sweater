<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">
        <img src="/static/sweater_white.png" width="40" height="40" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse " id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Messages</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user/profile">My profile</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">Control panel</a>
            </li>
            </#if>
        </ul>
        <div class="navbar-text text-white mr-3">${name}</div>
        <#if known>
            <@l.logout />
        </#if>
        <#if !known>
            <a class="btn btn-outline-light" role="button" href="/login">Log in</a>
        </#if>
    </div>
</nav>
