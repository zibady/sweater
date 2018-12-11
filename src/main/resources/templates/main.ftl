<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" value="${filter!}" placeholder="Search by tag"> <#--${filter!} == ${filter?ifExists}-->
            <button type="submit" class="btn btn-primary ml-3">Search</button>
        </form>
        </div>
    </div>

    <button class="btn btn-primary mb-3" type="button" data-toggle="collapse" data-target="#collapseMsg" aria-expanded="false" aria-controls="collapseMsg">
        Add new message
    </button>
    <div class="collapse <#if message??>show</#if>" id="collapseMsg">
        <div class="form-group">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.text}</#if>" placeholder="Enter message" />
                <#if textError??>
                    <div class="invalid-feedback">
                    ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" name="tag" class="form-control ${(tagError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.tag}</#if>" placeholder="Tag" />
                <#if tagError??>
                    <div class="invalid-feedback">
                    ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" value="file" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Add message</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </form>
        </div>
    </div>

    <div class="card-columns">
    <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                <div class="card-text" align="right">
                    ${message.authorName}
                </div>
            </div>
        </div>
    <#else>
    No message
    </#list>
    </div>
</@c.page>