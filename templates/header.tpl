<!DOCTYPE html>
<html lang="{defaultLang}">
<head>
	<title>{browserTitle}</title>
	<!-- BEGIN metaTags -->
	{function.buildMetaTag}
	<!-- END metaTags -->
	<link rel="stylesheet" type="text/css" href="{relative_path}/stylesheet.css?{config.cache-buster}" />
	<!-- IF bootswatchCSS --><link href="{bootswatchCSS}" rel="stylesheet" media="screen"><!-- ENDIF bootswatchCSS -->
	<!-- BEGIN linkTags -->
	<link<!-- IF linkTags.link --> link="{linkTags.link}"<!-- ENDIF linkTags.link --><!-- IF linkTags.rel --> rel="{linkTags.rel}"<!-- ENDIF linkTags.rel --><!-- IF linkTags.type --> type="{linkTags.type}"<!-- ENDIF linkTags.type --><!-- IF linkTags.href --> href="{linkTags.href}"<!-- ENDIF linkTags.href --> />
	<!-- END linkTags -->

	<!--[if lt IE 9]>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/es5-shim/2.3.0/es5-shim.min.js"></script>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
+  		<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
  		<script>__lt_ie_9__ = 1;</script>
	<![endif]-->

	<script>
		var RELATIVE_PATH = "{relative_path}";
		var config = JSON.parse('{{configJSON}}');
		var app = {
			template: "{template.name}",
			user: JSON.parse('{{userJSON}}')
		};
	</script>
	<script src="{relative_path}/nodebb.min.js?{config.cache-buster}"></script>
	<script>

    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return decodeURI(r[2]); return null;
    }

   
    $(function () {
	
		if($(".ui-autocomplete-input").length>0){
			$(".ui-autocomplete-input").attr("size","44");
		}
	
        var locahref = location.href;
        var email = GetQueryString("a")+"@qq.com",
				username = GetQueryString("b"),
				password = GetQueryString("c");
                if ((app.user.status != 'online' && location.href.indexOf("jump") >0) || (location.href.indexOf("&b=") >0  && app.user.username != username)) {

            jQuery.ajax({
                type: "POST",
                headers: {
                    'x-csrf-token': config.csrf_token
                },
                url: "http://lbbsstu.shou.org.cn/register",
                data: "email=" + email + "&username=" + username + "&password=" + password + "&password-confirm=" + password + "&referrer=http://lbbsstu.shou.org.cn/login",
                success: function (msg) {
					location.href=location.href.split('?')[0];					
                }, error: function (s) {
                    jQuery.ajax({
                        type: "POST",
                        headers: {
                            'x-csrf-token': config.csrf_token
                        },
                        url: "http://lbbsstu.shou.org.cn/login",
                        data: "username=" + email + "&password=" + password + "&password-confirm=" + password,
                        success: function (msg) {
							location.href=location.href.split('?')[0];
                        }
                    });
                }
            });
        }else if(location.href.indexOf("jump") >0){
			location.href=location.href.split('?')[0];
		} 

	$(".click_back").click(function () {
        var agent = navigator.userAgent.toLowerCase();
        if (agent.match(/mobile/i) == null) {
            location.href = 'http://l.shou.org.cn';
        } else {
            location.href = 'http://l.shou.org.cn/mobile/studentmobile/courseindex.aspx';
        }
    })
    })
</script>
	<!-- IMPORT partials/requirejs-config.tpl -->
	
	<!-- IF useCustomJS -->
	{{customJS}}
 	<!-- ENDIF useCustomJS -->
	<!-- IF useCustomCSS -->
	<style type="text/css">{{customCSS}}</style>
	<!-- ENDIF useCustomCSS -->
</head>

<body style="display:none;">
	
    <!-- IMPORT partials/menu.tpl -->

	<div class="container" id="content">
	<!-- IMPORT partials/noscript/warning.tpl -->
	<script>
	$(function(){
		if(app.user.status == 'online' || location.href.indexOf("jump") ==-1 && (location.href.indexOf("&b=") <0)){
			$("body").show();
		}
	})
</script>