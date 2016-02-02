<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="FacebookAppManager._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to Facebook App Manager!
    </h2>
    <body>
    <p id="p1">sss</p>
    <button type="button", onclick="logInWithFacebook()">Login</button>
    
<script type="text/javascript">
    alert('0');
    window.fbAsyncInit = function () {
        FB.init({
            appId: '1670449266546677',
            xfbml: true,
            version: 'v2.5'
        });
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) { return; }
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    } (document, 'script', 'facebook-jssdk'));

    logInWithFacebook = function () {
        //authResponse res = FB.getAuthResponse();
        
        FB.login(function (response) {
            //alert('authResponse ='+response.authResponse.toString());
            if (response.authResponse) {
                var access_token = FB.getAuthResponse(); //FB.getAuthResponse()['accessToken'];
                //alert('access_token=' + access_token.toString());
                console.log('Access Token = ' + access_token);
                alert('You are logged in cookie set!');
                document.getElementById("p1").innerHTML = String.Format("Hello, {0}!", response.name);
                FB.api('/me', function (response) {
                    console.log('Good to see you, ' + response.name + '.');
                    document.getElementById("p1").innerHTML ="Hello, "response.name +"!";
//                    document.getElementById("p1").innerHTML = String.Format("Hello, {0}!", response.name);

                });
            } else {
                console.log('User cancelled login or did not fully authorize.');
                alert('User cancelled login or did not fully authorize.');
            }
        }, { scope: '' });


    };
</script>
    <%--<p>
        To learn more about ASP.NET visit <a href="http://www.asp.net" title="ASP.NET Website">www.asp.net</a>.
    </p>
    <p>
        You can also find <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409"
            title="MSDN ASP.NET Docs">documentation on ASP.NET at MSDN</a>.
    </p>--%>
    </body>
</asp:Content>
