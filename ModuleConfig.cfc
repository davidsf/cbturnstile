component {

	// Module Properties
	this.title              = "cbturnstile";
	this.author             = "David Sedeño";
	this.webURL             = "";
	this.description        = "Coldbox module for Turnstile captcha service by CloudFlare";
	this.version            = "1.0.0";
	this.viewParentLookup   = true;
	this.layoutParentLookup = true;
	this.entryPoint         = "cbturnstile";
	this.inheritEntryPoint  = false;
	this.modelNamespace     = "cbturnstile";
	this.cfmapping          = "";
	this.autoMapModels      = true;
	this.dependencies       =   [];

	function configure(){

    interceptorSettings = {
      customInterceptionPoints = "onTurnstileFail"
    };

    // See https://developers.cloudflare.com/turnstile/troubleshooting/testing/
    // for testing keys
		settings = {
      siteKey   = '',
      secretKey = '',
      scriptUrl = 'https://challenges.cloudflare.com/turnstile/v0/api.js',
      verifyUrl = 'https://challenges.cloudflare.com/turnstile/v0/siteverify'
    };

	}

}
