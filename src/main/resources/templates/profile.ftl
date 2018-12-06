<#import "parts/common.ftl" as c>

<@c.page>
<h5>${username}</h5>
<form method="post">
    <div class="form-group row">
        <label for="inputPassword" class="col-sm-3 col-md-2 col-form-label">Password:</label>
        <div class="col-sm-6">
            <input id="inputPassword" type="password" name="password" class="form-control" placeholder="Enter a password"/>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail" class="col-sm-3 col-md-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input id="inputEmail" type="email" name="email" class="form-control" value="${email! 'some@some.com'}" placeholder="Enter your email address"/>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Save</button>
</form>
</@c.page>
