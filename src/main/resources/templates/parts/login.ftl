<#macro login path button_name isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label for="inputUsername" class=" col-sm-3 col-md-2 col-form-label">User Name:</label>
        <div class="col-sm-6">
            <input id="inputUsername" type="text" name="username" class="form-control" placeholder="Enter your username"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputPassword" class="col-sm-3 col-md-2 col-form-label">Password:</label>
        <div class="col-sm-6">
            <input id="inputPassword" type="password" name="password" class="form-control" placeholder="Enter a password"/>
        </div>
    </div>
    <#if isRegisterForm>
        <div class="form-group row">
            <label for="inputEmail" class="col-sm-3 col-md-2 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input id="inputEmail" type="email" name="email" class="form-control" placeholder="Enter your email address"/>
            </div>
        </div>
    </#if>
    <div class="form-inline mb-3">
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