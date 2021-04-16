<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="noindex, nofollow">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <script type="text/javascript" charset="utf-8">
        function acceptTerms() {
            $('#terms').prop( "checked", true );
            $('#terms_and_conditions').val(new Date().getTime());
            $('#registerBtn').prop('disabled', false);
        }
        function declineTerms() {
            $('#terms').prop( "checked", false );
            $('#terms_and_conditions').val('');
            $('#registerBtn').prop('disabled', true);
        }
    </script>
    <title><#nested "title"></title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

	<body>
        <#nested "header">
        <div class="login-content">
            <div id="login-header" class="login-header">

                <div class="header-locale">
                    <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                        <div class="${properties.kcLocaleMainClass!}" id="kc-locale">
                            <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                                <div id="kc-locale-dropdown" class="${properties.kcLocaleDropDownClass!}">
                                    <a href="#" id="kc-current-locale-link">${locale.current} <i class="icon-angle-down"></i></a>
                                    <ul class="${properties.kcLocaleListClass!}">
                                        <#list locale.supported as l>
                                            <li class="${properties.kcLocaleListItemClass!}">
                                                <a class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                            </li>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </#if>
                </div>

                <img class="logo-image" src="${url.resourcesPath}/img/logo.svg">

            </div>

            <div class="login-form">
                <#if displayMessage && message?has_content>
                <div class="alert alert-${message.type}">
                     <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                     <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                     <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                     <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                     <span class="message-text">${message.summary?no_esc}</span>
                </div>
                </#if>
                <#nested "form">
            </div>
        </div>

        <footer class="footer-num">

            <div class="footer-copyright">
                © ${msg("copyRight")}
            </div>

            <div class="footer-links">
                <a href="${client.baseUrl}/imprint">${msg("imprintLink")}</a>
                <span class="footer-spacer"></span>
                <a href="${client.baseUrl}/imprint">${msg("dataProtectionLink")}</a>
                <span class="footer-spacer"></span>
                <a href="${client.baseUrl}/imprint">${msg("contactLink")}</a>
            </div>

        </footer>
	</body>
</html>
</#macro>
