<#ftl output_format="plainText">
<#assign currentTime = .now>
<#assign currentDate = currentTime?date>
${msg("emailVerificationBodyHtml",user.getLastName(),user.getFirstName(),link, linkExpiration, linkExpirationFormatter(linkExpiration))}
${msg("numCopyright", currentDate?string.yyyy)}
${properties.numUrl}