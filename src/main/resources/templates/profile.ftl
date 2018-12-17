<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<img class="mx-3 my-2 rounded-circle" src="/img/${photo}" width="60" height="60" alt="">
<h5 class="h3 mx-3 font-weight-normal text-success">@${name}</h5>
<form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <div class="custom-file col-sm-8">
            <input type="file" name="file" value="file" class="custom-file-input" id="avatarPhoto">
            <label class="custom-file-label" for="avatarPhoto">Choose avatar photo</label>
        </div>
    </div>
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
    <div class="form-group row">
        <label class="col-sm-3 col-md-2 col-form-label">Sex:</label>
        <div class="col-sm-6">
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="customRadioInline1" name="sex" value="MALE"
                       class="custom-control-input" <#if sex == "MALE">checked</#if> ><#--${sex??}?string('checked', '')>-->
                <label class="custom-control-label" for="customRadioInline1">Male</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="customRadioInline2" name="sex" value="FEMALE"
                       class="custom-control-input" <#if sex == "FEMALE">checked</#if> >
                <label class="custom-control-label" for="customRadioInline2">Female</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="customRadioInline3" name="sex" value="UNKNOWN"
                       class="custom-control-input" <#if sex == "UNKNOWN">checked</#if> >
                <label class="custom-control-label" for="customRadioInline3">Unknown</label>
            </div>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <input type="hidden" name="username" value="${name}" />
    <button type="submit" class="btn btn-primary">Save</button>
</form>
<script>
    $('#avatarPhoto').on('change',function(){
        //get the file name
        var fileName = $(this).val();
        //replace the "Choose a file" label
        $(this).next('.custom-file-label').html(fileName);
    })
</script>
</@c.page>
