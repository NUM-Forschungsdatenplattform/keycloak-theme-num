<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true; section>
    <#if section = "header">
    <#elseif section = "form">
        <div class="login-form-title">
            <i class="icon-key"></i>
            <span>${msg("updatePasswordHeaderTitle")}</span>
        </div>
        <div class="box-container">
            <div class="login-title">
                <p>${msg("updatePasswordTitle")}</p>
            </div>

            <div>
                <form id="kc-passwd-update-form" class="form" action="${url.loginAction}" method="post">
                    <label for="password-new" class="label-title">${msg("passwordNew")}</label>
                    <input type="password" id="password-new" name="password-new" class="login-field"/>

                    <label for="password-confirm" class="label-title">${msg("passwordConfirm")}</label>
                    <input type="password" id="password-confirm" name="password-confirm" class="login-field"/>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <input class="button button-primary" id="update-password-submit" type="submit" type="submit" value="${msg("doSubmit")}"/>
                    </div>
                </form>
            </div>
        </div>
        
    </#if>
</@layout.registrationLayout>