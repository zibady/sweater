<#macro login path button_name isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label for="inputUsername" class=" col-sm-3 col-md-2 col-form-label">User Name:</label>
        <div class="col-sm-6">
            <input id="inputUsername" type="text" name="username" value="<#if user??>${user.username}</#if>"
                   class="form-control ${(usernameError??)?string('is-invalid', '')}"
                   placeholder="Enter your username"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                ${usernameError}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputPassword" class="col-sm-3 col-md-2 col-form-label">Password:</label>
        <div class="col-sm-6">
            <input id="inputPassword" type="password" name="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Enter a password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                ${passwordError}
                </div>
            </#if>
        </div>
    </div>
    <#if isRegisterForm>
    <div class="form-group row">
        <label for="inputPassword2" class="col-sm-3 col-md-2 col-form-label">Password:</label>
        <div class="col-sm-6">
            <input id="inputPassword2" type="password" name="password2"
                   class="form-control ${(password2Error??)?string('is-invalid', '')}"
                   placeholder="Confirm a password"/>
            <#if password2Error??>
                <div class="invalid-feedback">
                ${password2Error}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail" class="col-sm-3 col-md-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input id="inputEmail" type="email" name="email" value="<#if user??>${user.email}</#if>"
                   class="form-control ${(emailError??)?string('is-invalid', '')}"
                   placeholder="Enter your email address"/>
            <#if emailError??>
                <div class="invalid-feedback">
                ${emailError}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-3 col-md-2 col-form-label">Sex:</label>
        <div class="col-sm-6">
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="customRadioInline1" name="sex" value="MALE" class="custom-control-input">
                <label class="custom-control-label" for="customRadioInline1">Male</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="customRadioInline2" name="sex" value="FEMALE" class="custom-control-input">
                <label class="custom-control-label" for="customRadioInline2">Female</label>
            </div>
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
    <button type="submit" class="btn btn-outline-light">Sign Out</button>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
</#macro>
