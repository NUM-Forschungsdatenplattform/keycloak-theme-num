<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <script>
            function displayRoleTitle() {
                var roleTitle = $('#user_role').val();
                if(roleTitle == 'RESEARCHER') {
                    $('#user_role').attr('title', '${msg("researcherHoverText")}');
                } else {
                    $('#user_role').attr('title', '${msg("projectLeadHoverText")}');
                }
            }
        </script>
    <#elseif section = "form">
        <div class="login-form-title">
            <i class="icon-user"></i>
            <span>${msg("registerHeaderTitle")}</span>
        </div>
        <div class="box-container">
            <div>
                <p class="login-title">${msg("registerAccountTitle")}</p>
            </div>
            <div>
                <form id="kc-register-form" class="form form-register" action="${url.registrationAction}" method="post">
                    <div class="register-input-section ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="firstName" class="label-title">${msg("firstName")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="firstName" class="login-field" name="firstName" value="${(register.formData.firstName!'')}" required />
                        </div>
                    </div>

                    <div class="register-input-section ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="lastName" class="label-title">${msg("lastName")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="lastName" class="login-field" name="lastName" value="${(register.formData.lastName!'')}" required />
                        </div>
                    </div>

                    <div class="register-input-section ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="email" class="label-title">${msg("email")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="email" class="login-field" name="email" value="${(register.formData.email!'')}" autocomplete="email" required />
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
                                <input type="password" id="password" class="login-field" name="password" autocomplete="new-password" required />
                            </div>
                        </div>

                        <div class="register-input-section ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password-confirm" class="label-title">${msg("passwordConfirm")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="password" id="password-confirm" class="login-field" name="password-confirm" required />
                            </div>
                        </div>
                    </#if>

                    <#-- custom requested role -->
                    <div class="register-input-section ${messagesPerField.printIfExists('requested-role',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="user.attributes.requested-role" class="label-title">${msg("requested-role")}</label>
                        </div>
                        <select required name="user.attributes.requested-role" value="${(register.formData['user.attributes.requested-role']!'')}"
                                class="login-field" id="user_role"
                                onchange="displayRoleTitle()" title="${msg("researcherHoverText")}">
                              <option value="RESEARCHER" title="${msg("researcherHoverText")}" <#if (register.formData['user.attributes.requested-role']!'') == "RESEARCHER"> selected = "selected"</#if>>${msg("researcher")}</option>
                              <option value="STUDY_COORDINATOR" title="${msg("projectLeadHoverText")}" <#if (register.formData['user.attributes.requested-role']!'') == "STUDY_COORDINATOR"> selected = "selected"</#if>>${msg("study_coordinator")}</option>
                        </select>
                    </div>

                    <#-- custom department -->
                    <div class="register-input-section ${messagesPerField.printIfExists('department',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="user.attributes.department" class="label-title">${msg("department")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="user.attributes.department" required class="login-field" name="user.attributes.department" value="${(register.formData['user.attributes.department']!'')}" />
                        </div>
                    </div>

                    <#-- custom additional notes -->
                    <div class="register-input-section ${messagesPerField.printIfExists('notes',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="user.attributes.notes" class="label-title">${msg("notes")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <textarea class="login-field" id="user.attributes.notes" name="user.attributes.notes"
                                      placeholder="${msg('notes-placeholder')}"
                                      rows="6" cols="550" style="width: 405px; padding: 6px 6px; height: 100px;">${(register.formData['user.attributes.notes']!'')}</textarea>
                        </div>
                    </div>

                    <#--Custom terms and conditions-->
                    <div class="${properties.kcFormGroupClass!}" style="margin-left: 0px;">
                        <div id="kc-form-options">
                            <div class="checkbox">
                                <label>
                                    <input type="hidden" class="${properties.kcInputClass!}"  id="terms_and_conditions" name="user.attributes.terms_and_conditions" value="${(register.formData['user.attributes.terms_and_conditions']!'')}"/>
                                    <input tabindex="3" id="terms" name="terms" type="checkbox" onchange="$('#terms_and_conditions').val(new Date().getTime()); $('#registerBtn').prop('disabled', !this.checked);">
                                    ${msg("acceptText")} <a href="#termsModal" data-toggle="modal">${msg("termsTitle")}</a> ${msg("acceptTextSecond")}
                                </label>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="modal fade" id="termsModal" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">${msg("acceptText")} ${msg("termsTitle")} ${msg("acceptTextSecond")}</h4>
                                    </div>
                                    <div class="modal-body">
                                        ${kcSanitize(msg("termsText"))?no_esc}
                                    </div>
                                    <div class="modal-footer">
                                        <button class="button button-secondary" type="button" onclick="declineTerms()" data-dismiss="modal">${msg("decline")}</button>
                                        <button class="button button-primary" type="button" onclick="acceptTerms()" data-dismiss="modal">${msg("accept")}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#------------------------------>

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
                            <input id="registerBtn" class="button button-primary" type="submit" disabled value="${msg("doRegister")}"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "title">
        ${msg("titleSignup")}
    </#if>
</@layout.registrationLayout>
