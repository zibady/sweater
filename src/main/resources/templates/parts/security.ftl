
<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
>

<#--Якщо сесія існує виконуємо дії, інакше відображаємо заглушку-->
<#if known>
    <#assign
    <#--Це значення користувача з  БД і дозволяє використовувати його методи-->
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        isAdmin = user.isAdmin()
    >
<#else>
    <#assign
        name = "Guest"
        isAdmin = false
    >
</#if>
