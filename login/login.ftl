<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>
    <#elseif section = "form">
        <div class="box-container">
        <#if realm.password>
            <div class="login-form-title">
                <i class="icon-signin"></i>
                <span>${msg("loginHeaderTitle")}</span>
            </div>
            <div>
                <p class="login-title">${msg("loginAccountTitle")}</p>
            </div>
            <div>
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                    <label for="username" class="label-title"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    <input id="username" class="login-field" placeholder="${msg("placeholderEmail")}" type="text" name="username" tabindex="1">
                    <div>
                        <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                    </div>
                    <label for="password" class="label-title">${msg("password")}</label>
                    <input id="password" class="login-field" placeholder="${msg("placeholderPassword")}" type="password" name="password" tabindex="2">


               <div class="${properties.kcFormOptionsWrapperClass!}">
                   <#if realm.resetPasswordAllowed>
                       <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                   </#if>
               </div>

                <input class="submit" type="submit" value="${msg("doLogIn")}" tabindex="3">
                </form>
            </div>
        </#if>
        </div>
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container" class="register">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
