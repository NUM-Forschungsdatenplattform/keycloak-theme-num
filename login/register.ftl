<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "form">
        <div class="box-container">
            <div class="login-form-title">
                <i class="icon-user"></i>
                <span>${msg("registerHeaderTitle")}</span>
            </div>
            <div>
                <p class="login-title">${msg("loginAccountTitle")}</p>
            </div>
            <div>
                <form id="kc-register-form" class="form form-register" action="${url.registrationAction}" method="post">
                    <div class="register-input-section ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="firstName" class="label-title">${msg("firstName")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="firstName" class="login-field" name="firstName" value="${(register.formData.firstName!'')}" />
                        </div>
                    </div>

                    <div class="register-input-section ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="lastName" class="label-title">${msg("lastName")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="lastName" class="login-field" name="lastName" value="${(register.formData.lastName!'')}" />
                        </div>
                    </div>

                    <div class="register-input-section ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="email" class="label-title">${msg("email")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="email" class="login-field" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                        </div>
                    </div>

                    <#if !realm.registrationEmailAsUsername>
                        <div class="register-input-section ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="username" class="label-title">${msg("username")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="username" class="login-field" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                            </div>
                        </div>
                    </#if>

                    <#if passwordRequired??>
                        <div class="register-input-section ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password" class="label-title">${msg("password")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="password" id="password" class="login-field" name="password" autocomplete="new-password"/>
                            </div>
                        </div>

                        <div class="register-input-section ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password-confirm" class="label-title">${msg("passwordConfirm")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="password" id="password-confirm" class="login-field" name="password-confirm" />
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

                    <div class="register-input-section">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                            </div>
                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <input class="submit" type="submit" value="${msg("doRegister")}"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
