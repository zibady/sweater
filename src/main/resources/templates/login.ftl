<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div class="text-info text-center font-weight-bold mb-3">
${message!}
</div>
<@l.login "/login" "Sign in" false />
</@c.page>
