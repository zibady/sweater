<#import "parts/common.ftl" as c>

<@c.page>
    <#if isCurrentUser>
        <#include "parts/editMessage.ftl" />
    </#if>

    <#include "parts/messagesList.ftl" />
</@c.page>