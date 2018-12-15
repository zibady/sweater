<#import "parts/common.ftl" as c>

<@c.page>
    <h3 class="h3 mb-3 font-weight-normal">${user.username}</h3>
    <form action="/user" method="post">
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