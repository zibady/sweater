<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<h5>Hey, ${name}, it's your dialog!</h5>
<div class="my-3 p-3 bg-white rounded box-shadow">
    <h6 class="border-bottom border-gray pb-2 mb-0">
    <#list users as u>
        @${u.username}<#sep>
    </#list>
    </h6>
    <#list messages as m>
        <div class="media text-muted pt-3">
            <img class="mr-3 rounded-circle" src="/img/${m.author.avatarPhoto}<#---->" width="60" height="60" alt="">
            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <strong class="d-block text-gray-dark">@${m.author.username}</strong>
                ${m.text}
            </p>
        </div>
    <#else>
        <div class="media text-muted pt-3">
            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <strong class="d-block text-gray-dark"></strong>
                There are no messages yet...
            </p>
        </div>
    </#list>
</div>
<form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="putMsg">Your answer:</label>
        <textarea class="form-control" name="text" id="putMsg" rows="3" placeholder="Write a message..."></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Send</button>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
</@c.page>