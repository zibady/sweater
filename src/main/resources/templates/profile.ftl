<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<h3 class="h3 mb-3 font-weight-normal">${name}</h3>
<form method="post" class="form-signin">
       <div class="form-group row">
        <label class="col-sm-3 col-md-2 col-form-label">New password:</label>
        <div class="col-sm-6">
            <input type="password" name="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Enter your new password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                ${passwordError}
                </div>
            </#if>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-3 col-md-2 col-form-label">New password:</label>
        <div class="col-sm-6">
            <input type="password" name="password2"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Confirm your new password"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail" class="col-sm-3 col-md-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input id="inputEmail" type="email" name="email" <#if email??>value="${email}"</#if>
                   class="form-control ${(emailError??)?string('is-invalid', '')}"
                   placeholder="Enter your email address"/>
            <#if emailError??>
                <div class="invalid-feedback">
                ${emailError}
                </div>
            </#if>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <input type="hidden" name="username" value="${name}" />
    <button type="submit" class="btn btn-primary">Save</button>
</form>
</@c.page>
