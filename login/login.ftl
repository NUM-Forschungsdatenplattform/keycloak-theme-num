<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <script>
            function togglePassword() {
                var passwordInput = document.getElementById("password");
                var passwordIcon = document.getElementById("toggle-password-icon");
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    passwordIcon.classList.toggle('icon-eye-open', true)
                    passwordIcon.classList.toggle('icon-eye-close', false)
                } else {
                    passwordInput.type = "password";
                    passwordIcon.classList.toggle('icon-eye-open', false)
                    passwordIcon.classList.toggle('icon-eye-close', true)
                }
            }
        </script>
    <#elseif section = "form">
        <div class="login-form-title">
            <i class="icon-signin"></i>
            <span>${msg("loginHeaderTitle")}</span>
        </div>
        <div class="box-container">
        <#if realm.password>
            
            <div class="login-title">${msg("loginAccountTitle")}</div>
            <div>
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                    <label for="username" class="label-title"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    <input id="username" class="login-field" placeholder="${msg("placeholderEmail")}" type="text" name="username" tabindex="1">
                    
                    <label for="password" class="label-title">${msg("password")}</label>
                    <input id="password" class="login-field" placeholder="${msg("placeholderPassword")}" type="password" name="password" tabindex="2">
                    <i id="toggle-password-icon" class="toggle-password icon-eye-close" onclick="togglePassword()"></i>


               <div class="${properties.kcFormOptionsWrapperClass!}">
                   <#if realm.resetPasswordAllowed>
                       <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                   </#if>
               </div>

                <input class="button button-primary" type="submit" value="${msg("doLogIn")}" tabindex="3">
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
    <#elseif section = "title">
        ${msg("titleLogin")}
    </#if>
    
</@layout.registrationLayout>
