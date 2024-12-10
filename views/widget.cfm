<cfoutput>
  <cfif isNull( prc.recaptcha_inited )>
    <script type="text/javascript" src="#getModuleSettings( "cbturnstile" ).scriptURL#" defer></script>
		<cfset prc.recaptcha_inited = true>
	</cfif>
  <div class="cf-turnstile" data-sitekey="#getModuleSettings( "cbturnstile" ).siteKey#" data-theme="light"></div>
</cfoutput>
