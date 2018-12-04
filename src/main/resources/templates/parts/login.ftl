<#macro login path button_name isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label for="inputUsername" class="col-sm-2 col-form-label">User Name:</label>
        <div class="col-sm-5">
            <input id="inputUsername" type="text" name="username" class="form-control" placeholder="User name"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputPassword" class="col-sm-2 col-form-label">Password:</label>
        <div class="col-sm-5">
            <input id="inputPassword" type="password" name="password" class="form-control" placeholder="Password"/>
        </div>
    </div>
    <div class="form-inline">
        <button type="submit" class="btn btn-primary">${button_name}</button>
        <div class="mx-3">
            <#if !isRegisterForm><a href="/registration">Registration</a></#if>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <button type="submit" class="btn btn-primary">Sign Out</button>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
</#macro>