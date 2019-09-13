{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Users/views/Login.php *}

{strip}
	<style>
		body {
			background: url(layouts/responsive/skins/images/login-background.jpeg);
			background-position: center;
			background-size: cover;
			width: 100%;
			height: 96%;
			background-repeat: no-repeat;
		}
		hr {
		    margin-top: 15px;
			background-color: #7C7C7C;
			height: 2px;
			border-width: 0;
		}
		h3, h4 {
			margin-top: 0px;
		}
		hgroup {
			text-align:center;
			margin-top: 4em;
		}
		input {
			font-size: 16px;
			padding: 10px 10px 10px 0px;
			-webkit-appearance: none;
			display: block;
			color: #636363;
			width: 100%;
			border: none;
			border-radius: 0;
			border-bottom: 1px solid #757575;
		}
		input:focus {
			outline: none;
		}
		label {
			font-size: 16px;
			font-weight: normal;
			position: absolute;
			pointer-events: none;
			left: 0px;
			top: 10px;
			transition: all 0.2s ease;
		}
		input:focus ~ label, input.used ~ label {
			top: -20px;
			transform: scale(.75);
			left: -12px;
			font-size: 18px;
		}
		input:focus ~ .bar:before, input:focus ~ .bar:after {
			width: 50%;
		}
		#page {
			padding-top: 6%;
		}
		.widgetHeight {
			margin-top: 20px !important;
		}
		.loginDiv {
			    /*height: 400px!important;*/
    background: rgba(0,0,0,0.6)!important;
    border: none;
    box-shadow: none;
			border-radius: 6px;
		}
		.marketingDiv {
			color: #303030;
			padding: 10px 20px;
		}
		.separatorDiv {
			background-color: #7C7C7C;
			width: 2px;
			height: 460px;
			margin-left: 20px;
		}
		.user-logo {
			height: 110px;
			margin: 0 auto;
			padding-top: 40px;
			padding-bottom: 20px;
		}
		.blockLink {
			border: 1px solid #303030;
			padding: 3px 5px;
		}
		.group {
			position: relative;
			margin: 20px 20px 40px;
		}
		.failureMessage {
			color: red;
			display: block;
			text-align: center;
			padding: 0px 0px 10px;
		}
		.successMessage {
			color: green;
			display: block;
			text-align: center;
			padding: 0px 0px 10px;
		}
		.inActiveImgDiv {
			padding: 5px;
			text-align: center;
			margin: 30px 0px;
		}
		.app-footer p {
			margin-top: 0px; text-align: center;
    background: rgba(0,0,0,0.6)!important;
    margin-bottom: 0;
    padding: 4px 0;
    color: #fff;
    font-size: 10px;
    border: none;
    position: fixed;
    bottom: 0;
		}
		.footer {
			background-color: #fbfbfb;
			height:26px;
		}
		.bar {
			position: relative;
			display: block;
			width: 100%;
		}
		.bar:before, .bar:after {
			content: '';
			width: 0;
			bottom: 1px;
			position: absolute;
			height: 1px;
			background: #35aa47;
			transition: all 0.2s ease;
		}
		.bar:before {
			left: 50%;
		}
		.bar:after {
			right: 50%;
		}
		.button {
			position: relative;
			display: inline-block;
			padding: 9px;
			margin: .3em 0 1em 0;
			width: 100%;
			vertical-align: middle;
			color: #fff;
			font-size: 16px;
			line-height: 20px;
			-webkit-font-smoothing: antialiased;
			text-align: center;
			letter-spacing: 1px;
			background: transparent;
			border: 0;
			cursor: pointer;
			transition: all 0.15s ease;
		}
		.button:focus {
			outline: 0;
		}
		.buttonGreen {
			background-image: linear-gradient(to bottom, #35aa47 0px, #35aa47 100%)
		}
		.buttonBlue {
			background-image: linear-gradient(to bottom, #039be5 0px, #039be5 100%)
		}
		.ripples {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			overflow: hidden;
			background: transparent;
		}
		.input-group {
			margin-bottom: 10px;
		}
		
		//Animations
		@keyframes inputHighlighter {
			from {
				background: #4a89dc;
			}
			to 	{
				width: 0;
				background: transparent;
			}
		}
		@keyframes ripples {
			0% {
				opacity: 0;
			}
			25% {
				opacity: 1;
			}
			100% {
				width: 200%;
				padding-bottom: 200%;
				opacity: 0;
			}
		}


	</style>

	<span class="app-nav"></span>
	<div class="col-lg-12">
		<div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-sm-5 col-sm-offset-4 col-xs-12">
			<div class="loginDiv widgetHeight">
				<div class="login-heading">
                    <img class="img-responsive user-logo" src="layouts/responsive/resources/Images/vtiger.png">
                </div>

				<div>
					<span class="{if !$ERROR}hide{/if} failureMessage" id="validationMessage">{$MESSAGE}</span>
					<span class="{if !$MAIL_STATUS}hide{/if} successMessage">{$MESSAGE}</span>
				</div>

				<div id="loginFormDiv">
					<form class="form-horizontal" method="POST" action="index.php" style="padding: 20px;">
						<input type="hidden" name="module" value="Users"/>
						<input type="hidden" name="action" value="Login"/>
<div class="control-group">
<label class="sr-only" for="inlineFormInputGroup">Username</label>
  <div class="input-group">
    <div class="input-group-addon"><i class="fa fa-user"></i></div>
    <input type="text" class="form-control" id="inlineFormInputGroup username" placeholder="Username" name="username">
  </div>
</div>
<div class="control-group">
<label class="sr-only" for="inlineFormInputGroup">Password</label>
  <div class="input-group">
    <div class="input-group-addon"><i class="fa fa-lock"></i></div>
    <input type="password" class="form-control" id="inlineFormInputGroup password" placeholder="Password" name="password">
  </div>
	</div>

						<div class="control-group">
							<button type="submit" class="button buttonGreen">Sign in</button><br>
							<a class="forgotPasswordLink" style="color: #fff;">forgot password?</a>
						</div>
					</form>
				</div>

				<div id="forgotPasswordDiv" class="hide">
					<form class="form-horizontal" action="forgotPassword.php" method="POST" style="padding: 20px;">
<div class="control-group">
<label class="sr-only" for="inlineFormInputGroup">Username</label>
  <div class="input-group">
    <div class="input-group-addon"><i class="fa fa-user"></i></div>
    <input type="text" class="form-control" id="username" placeholder="Username" name="username">
  </div>
</div>

<div class="control-group">
<label class="sr-only" for="inlineFormInputGroup">Email</label>
  <div class="input-group">
    <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
    <input type="email" class="form-control" id="inlineFormInputGroup" placeholder="Email" name="emailId">
  </div>
	</div>

	<div class="control-group">
							<button type="submit" class="button buttonBlue forgot-submit-btn">Submit</button><br>
							<span style="color: #fff;">Please enter details and submit <a class="forgotPasswordLink pull-right" style="color: #fff;">Back</a></span>
						</div>
<!--
                        <div class="group">
							<input id="username" type="text" name="username" placeholder="Username" >
							<span class="bar"></span>
							<label>Username</label>
						</div>
						<div class="group">
							<input id="email" type="email" name="emailId" placeholder="Email" >
							<span class="bar"></span>
							<label>Email</label>
						</div>
						<div class="group">
							<button type="submit" class="button buttonBlue forgot-submit-btn">Submit</button><br>
							<span style="color: #fff;">Please enter details and submit <a class="forgotPasswordLink pull-right" style="color: #15c;">Back</a></span>
						</div>
					-->
					</form>
				</div>
			</div>
		</div>

		

		<script>
			jQuery(document).ready(function () {
				var validationMessage = jQuery('#validationMessage');
				var forgotPasswordDiv = jQuery('#forgotPasswordDiv');

				var loginFormDiv = jQuery('#loginFormDiv');
				loginFormDiv.find('#password').focus();

				loginFormDiv.find('a').click(function () {
					loginFormDiv.toggleClass('hide');
					forgotPasswordDiv.toggleClass('hide');
					validationMessage.addClass('hide');
				});

				forgotPasswordDiv.find('a').click(function () {
					loginFormDiv.toggleClass('hide');
					forgotPasswordDiv.toggleClass('hide');
					validationMessage.addClass('hide');
				});

				loginFormDiv.find('button').on('click', function () {
					var username = loginFormDiv.find('#username').val();
					var password = jQuery('#password').val();
					var result = true;
					var errorMessage = '';
					if (username === '') {
						errorMessage = 'Please enter valid username';
						result = false;
					} else if (password === '') {
						errorMessage = 'Please enter valid password';
						result = false;
					}
					if (errorMessage) {
						validationMessage.removeClass('hide').text(errorMessage);
					}
					return result;
				});

				forgotPasswordDiv.find('button').on('click', function () {
					var username = jQuery('#forgotPasswordDiv #username').val();
					var email = jQuery('#email').val();

					var email1 = email.replace(/^\s+/, '').replace(/\s+$/, '');
					var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/;
					var illegalChars = /[\(\)\<\>\,\;\:\\\"\[\]]/;

					var result = true;
					var errorMessage = '';
					if (username === '') {
						errorMessage = 'Please enter valid username';
						result = false;
					} else if (!emailFilter.test(email1) || email == '') {
						errorMessage = 'Please enter valid email address';
						result = false;
					} else if (email.match(illegalChars)) {
						errorMessage = 'The email address contains illegal characters.';
						result = false;
					}
					if (errorMessage) {
						validationMessage.removeClass('hide').text(errorMessage);
					}
					return result;
				});
				jQuery('input').blur(function (e) {
					var currentElement = jQuery(e.currentTarget);
					if (currentElement.val()) {
						currentElement.addClass('used');
					} else {
						currentElement.removeClass('used');
					}
				});

				var ripples = jQuery('.ripples');
				ripples.on('click.Ripples', function (e) {
					jQuery(e.currentTarget).addClass('is-active');
				});

				ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function (e) {
					jQuery(e.currentTarget).removeClass('is-active');
				});
				loginFormDiv.find('#username').focus();
			});
		</script>
		</div>
	{/strip}
