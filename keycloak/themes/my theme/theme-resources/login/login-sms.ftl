<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>

	<#if section = "header">
		${msg("smsAuthTitle",realm.displayName)}
	<#elseif section = "form">
		<form id="kc-sms-code-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
			<div class="${properties.kcFormGroupClass!}">
				<div class="${properties.kcLabelWrapperClass!}">
					<label for="code" class="${properties.kcLabelClass!}">${msg("smsAuthLabel")}</label>
				</div>
				<script>
						setTimeout(() => {
						const box = document.getElementById('code');
						box.style.visibility = 'hidden';
						}, 110000);
						</script>
				<div class="${properties.kcInputWrapperClass!}">
					
					<input type="text" id="code" name="code" class="${properties.kcInputClass!}" autofocus/>
				</div>
			</div>
			<div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
				<div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
						<script>
							var a=120;
							var x = setInterval(function() {
							a=a-1;
							document.getElementById("GadTool.blogspot.com").innerHTML= a+" секунд";
							if(a<0){
							document.getElementById("GadTool.blogspot.com").innerHTML= "";
							document.getElementById("GadTool").innerHTML= "";
							document.getElementById("GadTool_12").innerHTML= "Отправить заново";
							}
							},1000);
							</script>
					<div class="${properties.kcFormOptionsWrapperClass!}">
					<span id="GadTool">Отправить заново через </span>
					<span id="GadTool.blogspot.com"></span>
					<!By GadTool><a href="${url.loginUrl}">
					<span id="GadTool_12"></span></a>
					
					
						
							
					</div>
					
						
				</div>

				<div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
					<input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
				</div>
			</div>
			
		</form>
	<#elseif section = "info" >
		${msg("smsAuthInstruction")}
	</#if>
</@layout.registrationLayout>
