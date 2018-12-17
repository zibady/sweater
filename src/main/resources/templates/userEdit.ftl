<#import "parts/common.ftl" as c>

<@c.page>
    <img class="mx-3 my-2 rounded-circle" src="/img/${user.avatarPhoto}" width="60" height="60" alt="">
    <h5 class="h3 mx-3 font-weight-normal text-success">@${user.username}</h5>
    <form method="post">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" name="userId" value="${user.id}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</@c.page>