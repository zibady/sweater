<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-lg-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" value="${filter!}" placeholder="Search by tag"> <#--${filter!} == ${filter?ifExists}-->
            <button type="submit" class="btn btn-primary ml-3">Search</button>
        </form>
        </div>
    </div>

    <#include "parts/editMessage.ftl" />

    <#include "parts/messagesList.ftl" />

</@c.page>