<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<#if Session?? && SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
        ${SPRING_SECURITY_LAST_EXCEPTION.message}
    </div>
</#if>
<div class="text-info text-center font-weight-bold mb-3">
${message!}
</div>
<@l.login "/login" "Sign in" false />
</@c.page>
