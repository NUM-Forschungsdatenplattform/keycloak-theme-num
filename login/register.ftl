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

                <#if messagesPerField.existsError('firstName') ||
                     messagesPerField.existsError('lastName') ||
                     messagesPerField.existsError('email') ||
                     messagesPerField.existsError('username') ||
                     messagesPerField.existsError('password') ||
                     messagesPerField.existsError('password-confirm')
                >
                    <div class="alert alert-register alert-error">
                        <ul class="alert-register-text">
                        <#if messagesPerField.existsError('firstName')>
                            <li id="input-error-firstname" class="" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('firstName'))}
                            </li>
                        </#if>
                        <#if messagesPerField.existsError('lastName')>
                            <li id="input-error-lastname" class="" aria-live="polite">
                                         ${kcSanitize(messagesPerField.get('lastName'))}
                            </li>
                        </#if>
                        <#if messagesPerField.existsError('email')>
                            <li id="input-error-email" class="" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('email'))}
                            </li>
                        </#if>
                        <#if messagesPerField.existsError('username')>
                            <li id="input-error-username" class="" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('username'))}
                            </li>
                        </#if>
                        <#if passwordRequired??>
                            <#if messagesPerField.existsError('password')>
                                <li id="input-error-password" class="" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password'))}
                                </li>
                            </#if>
                            <#if messagesPerField.existsError('password-confirm')>
                                <li id="input-error-password-confirm" class="" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('password-confirm'))}
                                </li>
                            </#if>
                        </#if>
                        </ul>
                    </div>
                </#if>


                <form id="kc-register-form" class="form form-register" action="${url.registrationAction}" method="post">
                    <div class="register-input-section">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="firstName" class="label-title">${msg("firstName")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="firstName" class="login-field" name="firstName"
                                   value="${(register.formData.firstName!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                            />
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
