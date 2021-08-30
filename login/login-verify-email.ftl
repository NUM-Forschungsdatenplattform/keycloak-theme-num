<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
    <#elseif section = "form">
        <p class="instruction">
            ${msg("emailVerifyInstruction1")}
        </p>
        <p class="instruction">
            ${msg("emailVerifyInstruction2")} <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
        </p>
    <#elseif section = "title">
        ${msg("titleVerifyEmail")}
    </#if>
</@layout.registrationLayout>
