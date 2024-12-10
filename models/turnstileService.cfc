component singleton accessors="true"{
  property name="config" inject="coldbox:modulesettings:cbturnstile";
  property name="siteKey";
  property name="secretKey";

  function onDIComplete(){
    variables.siteKey   = variables.config.siteKey;
    variables.secretKey = variables.config.secretKey;
  }

  /**
	 * Validate the captcha
	 *
	 * @response The Response from the frontend cf-turnstile-response
   * @cfIP     Content of the header CF-Connection-IP
   * 
   * @return   struct with the turnstile response. View README
	 */
  function isValid( required response, required cfIP ){
    var httpService = new http(
			method  = "post",
			url 	= variables.config.verifyUrl,
			timeout = 10
		);

    httpService.addParam( type="formfield", name="secret",   value=variables.secretKey );
    httpService.addParam( type="formfield", name="response", value=arguments.response );
    httpService.addParam( type="formfield", name="remoteip", value=arguments.cfIP );

    return deserializeJson(httpService.send().getPrefix().filecontent);
  }
}
