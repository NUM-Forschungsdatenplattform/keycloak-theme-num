<#import "template.ftl" as layout>
<@layout.emailLayout>
<#assign currentTime = .now>
<#assign currentDate = currentTime?date>
${kcSanitize(msg("emailVerificationBodyHtml", user.getLastName(), user.getFirstName(), link, linkExpiration, linkExpirationFormatter(linkExpiration)))?no_esc}
    <p>
        ${msg("numCopyrightHtml", currentDate?string.yyyy)}
    </p>
    <p>
        <a href="${properties.numUrl}">${properties.numUrl}</a>
    </p>
</@layout.emailLayout>
