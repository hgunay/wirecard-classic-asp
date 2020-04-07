<!-- #INCLUDE virtual="/includes/BaseModel.asp" -->
<!-- #INCLUDE virtual="/includes/Settings.asp" -->
<!-- #INCLUDE virtual="/includes/CCProxySaleRequest.asp" -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WireCard Classic ASP Test Ortamı</title>
	<link rel="icon" href="favicon.png">
</head>
<body>
    <%
        '---------------------------------------------------------------------
        '-- WireCard Non 3D Payment ------------------------------------------
        '---------------------------------------------------------------------
        response.Clear()

        response.write("<script language=javascript>console.log('WireCard Non 3D Payment'); </script>")

        dim postSettings
        set postSettings = new Settings
        postSettings.UserCode   = "20391"
        postSettings.Pin        = "CABF6CB01F0F4FD3A2A7"
        postSettings.BaseUrl    = "https://test.wirecard.com.tr/SGate/Gate"

        dim userToken
        set userToken = new Token
        userToken.UserCode  = postSettings.UserCode
        userToken.Pin       = postSettings.Pin

        dim saleRequest
        set saleRequest = new CCProxySaleRequest
        saleRequest.ServiceType     = "CCProxy"
        saleRequest.OperationType   = "Sale"
        saleRequest.MPAY            = ""
        saleRequest.CurrencyCode    = "TL"
        saleRequest.Port            = ""
        saleRequest.IPAddress       = ""
        saleRequest.PaymentContent  = "Test"
        saleRequest.InstallmentCount = 0
        saleRequest.Description     = "Test"
        saleRequest.ExtraParam      = ""
        saleRequest.Language        = "TR"

        'call saleRequest.CreateToken(userToken)
        'call saleRequest.CreateToken("postSettings.UserCode","postSettings.Pin")
        'saleRequest.Execute
    %>

    <p><%= postSettings.UserCode %></p>
    <p><%= postSettings.Pin %></p>
    <p><%= postSettings.BaseUrl %></p>

    <p><%= userToken.UserCode %></p>
    <p><%= userToken.Pin %></p>

    

</body>
</html>