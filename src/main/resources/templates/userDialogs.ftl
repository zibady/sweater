<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<h5>Hey, <strong>${name}</strong>, it's your dialogs!</h5>
    <#list dialogs as dialog>
    <ul class="list-unstyled">
        <li class="media">
            <a href="/user/dialogs/${dialog.id}">
                <img class="mr-3 rounded-circle" src="/img/message.jpg" width="60" height="60" alt="">
            </a>
            <div class="media-body">
                <h6 class="mt-0 mb-1 text-success">
                    <#list dialog.users as u>
                        @${u.username}<#sep>
                    </#list></h6>
                Go speak!
            </div>
        </li>
    </ul>
    <#else>
    <div class="alert alert-success" align="center" role="alert">
        No dialogs!
    </div>
        <#include "parts/usersList.ftl">
    </#list>
</@c.page>