<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div class="text-warning text-center font-weight-bold mb-3">
${message!}
</div>
<div class="mb-1 text-info">Create ACCOUNT</div>
    <@l.login "/registration" "Create" true />
</@c.page>