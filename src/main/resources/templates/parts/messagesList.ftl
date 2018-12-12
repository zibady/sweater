<#include "security.ftl">

<div class="card-columns">
<#list messages as message>
    <div class="card my-3">
        <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top img-thumbnail">
        </#if>
        <div class="m-2">
            <span>${message.text}</span><br/>
            <i>#${message.tag}</i>
        </div>
        <div class="card-footer text-muted">
            <div class="card-text" align="right">
                <a class="card-link" href="/user-messages/${message.author.id}">${message.authorName}</a>
                <#if message.author.id == currentUserId>
                    <a class="card-link btn btn-primary ml-2"
                       href="/user-messages/${message.author.id}?message=${message.id}">Edit</a>
                </#if>
            </div>
        </div>
    </div>
<#else>
    No message!
</#list>
</div>