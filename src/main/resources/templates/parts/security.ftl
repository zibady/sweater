
<#assign
    <#--if session exists = true -->
    known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    <#-- get current user from DB -->
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    <#-- we can use users methods -->
        name = user.getUsername()
        isAdmin = user.isAdmin()
        photo = user.getAvatarPhoto()
        currentUserId = user.getId()
    >
<#else>
    <#assign
        name = "Guest"
        isAdmin = false
        currentUserId = -1
    >
</#if>
