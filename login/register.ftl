<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
    <#elseif section = "form">

        <div class="box-container">
            <div class="login-form-title">
                <i class="icon-user"></i>
                <span>${msg("registerHeaderTitle")}</span>
            </div>
            <div>
                <p class="login-title">${msg("loginAccountTitle")}</p>
            </div>
            <div>
                <form id="kc-register-form" class="form" action="${url.registrationAction}" method="post">
                    <div class="register-input-section">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="firstName" class="label-title">${msg("firstName")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="firstName" class="login-field" name="firstName"
                                   value="${(register.formData.firstName!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                            />

                            <#if messagesPerField.existsError('firstName')>
                                <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </span>
                            </#if>
                        </div>
                    </div>

                    <div class="register-input-section">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="lastName" class="label-title">${msg("lastName")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="lastName" class="login-field" name="lastName"
                                   value="${(register.formData.lastName!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                            />

                            <#if messagesPerField.existsError('lastName')>
                                <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </span>
                            </#if>
                        </div>
                    </div>

                    <div class="register-input-section">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="email" class="label-title">${msg("email")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="email" class="login-field" name="email"
                                   value="${(register.formData.email!'')}" autocomplete="email"
                                   aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                            />

                            <#if messagesPerField.existsError('email')>
                                <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </span>
                            </#if>
                        </div>
                    </div>

                    <#if !realm.registrationEmailAsUsername>
                        <div class="register-input-section">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="username" class="label-title">${msg("username")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="username" class="login-field" name="username"
                                       value="${(register.formData.username!'')}" autocomplete="username"
                                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                />

                                <#if messagesPerField.existsError('username')>
                                    <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                                </#if>
                            </div>
                        </div>
                    </#if>

                    <#if passwordRequired??>
                        <div class="register-input-section">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password" class="label-title">${msg("password")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="password" id="password" class="login-field" name="password"
                                       autocomplete="new-password"
                                       aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                />

                                <#if messagesPerField.existsError('password')>
                                    <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                                </#if>
                            </div>
                        </div>

                        <div class="register-input-section">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password-confirm"
                                       class="label-title">${msg("passwordConfirm")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="password" id="password-confirm" class="login-field"
                                       name="password-confirm"
                                       aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                />

                                <#if messagesPerField.existsError('password-confirm')>
                                    <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                                </#if>
                            </div>
                        </div>
                    </#if>

                    <#if recaptchaRequired??>
                        <div class="form-group">
                            <div class="${properties.kcInputWrapperClass!}">
                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                            </div>
                        </div>
                    </#if>

                    <div class="${properties.kcFormGroupClass!}">

                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <input class="submit" type="submit" value="${msg("doRegister")}"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div id="kc-registration-container" class="register">
            <div id="kc-registration">
                <span>${msg("registeredAccount")}
                    <a tabindex="6" href="${url.loginUrl}">${msg("backToLogin")}</a>
                </span>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
