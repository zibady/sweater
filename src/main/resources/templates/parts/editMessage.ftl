<button class="btn btn-primary mb-3" type="button" data-toggle="collapse" data-target="#collapseMsg" aria-expanded="false" aria-controls="collapseMsg">
    Message
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
            <button type="submit" class="btn btn-primary">Save message</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
        </form>
    </div>
</div>

<script type="text/javascript">
    $('#customFile').on('change', function() {
        var fileName = $(this).val().split('\\').pop();
        $(this).siblings('.custom-file-label').addClass('selected').html(fileName);
    });
</script>