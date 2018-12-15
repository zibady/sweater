<#include "security.ftl">

<h5 class="mx-2">List of users</h5>
<table class="table table-bordered table-hover" style="width: 70%">
    <thead class="thead-light">
    <tr>
        <th></th>
        <th>Name</th>
        <#if isAdmin>
            <th>Role</th>
        </#if>
        <th></th>
    </tr>
    </thead>
    <tbody class="">
        <#list users as user>
            <tr>
                <td align="center">
                    <a href="#">
                        <img class="rounded-circle" src="/img/${user.avatarPhoto}" width="32" height="32" alt="">
                    </a>
                </td>
                <td>${user.username}</td>
                <#if isAdmin>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td>
                    <a class="mx-2" href="/user/${user.id}">Edit</a>
                    <a href="/user/dialogs?cr=true&user=${user.id}">Write message</a>
                </td>
                <#else>
                <td><a href="/user/dialogs?cr=true&user=${user.id}">Write message</a></td>
                </#if>
            </tr>
        </#list>
    </tbody>
</table>
