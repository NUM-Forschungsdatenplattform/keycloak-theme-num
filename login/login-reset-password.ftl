<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "form">

        <div class="box-container">
            <div class="login-form-title">
                <i class="icon-key"></i>
                <span>${msg("resetPasswordHeaderTitle")}</span>
            </div>
            <div>
                <p class="login-title">${msg("resetPasswordTitle")}</p>
            </div>
            <div>
                <form id="kc-reset-password-form" class="form" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="username" class="label-title"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <#if auth?has_content && auth.showUsername()>
                                <input type="text" id="username" name="username" class="login-field" autofocus value="${auth.attemptedUsername}"/>
                            <#else>
                                <input type="text" id="username" name="username" class="login-field" autofocus/>
                            </#if>
                        </div>
                    </div>
                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                            </div>
                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <input class="submit" id="forget-password-submit" type="submit" type="submit" value="${msg("doSubmit")}"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container" class="register">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>

    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
