# Coldbox CloudFlare Turnstile captcha Module

This module contains helpers for using CloudFlare turnstile API.

Turnstile is a service that protects your site from spam and abuse. It uses advanced risk analysis techniques to tell humans and bots apart.

## LICENSE

Apache License, Version 2.0.

## SYSTEM REQUIREMENTS

- Lucee 5+
- ColdFusion 11+
- ColdBox 6+

## INSTRUCTIONS
Just drop into your `modules` folder or use the CommandBox to install

`box install cbturnstile`


## USAGE

### Settings

You need two API Keys: 

* Site Key: 

* Secret Key:

With this two keys you can add the following settings to your `Coldbox.cfc` under a `cbturnstile` structure within the `moduleSettings` structure:


```js
moduleSettings = {
	// cbturnstile settings
	cbturnstile = {
      siteKey 	= "Site key",
    	secretKey = "Api key"
	};
}
```

If your using Coldbox 7+ you can put in its own file under `config/modules/cbturnstile.cfc:

```
component {
  function configure(){
    return {
      siteKey 	= "Site key",
    	secretKey = "Api key"
    }
  }
}
```

### Using

For use the captcha in a form you must call the widget view in order to render the load of the js and the widget. You can control the widget from your settings in the CloudFlare turnstile settings.

#### Rendering

In any form you wish to add the captcha widget you can use a helper:

Here is an example of usage:

```html
#view(
	view="widget",
	module="cbturnstile"
)#
```

#### Backend

In you handler you must inject the `turnstileService`:

```
property inject="turnstileService" inject="turnstileService@cbturnstile";
```

And in the post method, check the result of the validation with:

```
var turnstileResult = turnstileSErvice.isValid(rc['cf-turnstile-response'], event.getHTTPHeader['CF-Connecting-IP'] );
```

The `turnstileResult` is a struct with the following fields:

```
success        boolean // If the captcha is OK
error-codes    Array
challenge_ts   string 
hostname       string
metadata       Struct (ordered)
result_with_testing_key  boolean
```

### Testing

Reffer to https://developers.cloudflare.com/turnstile/troubleshooting/testing/ for using testing keys. 



