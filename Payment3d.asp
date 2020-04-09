<!-- #INCLUDE virtual="/includes/CCProxySale3DSecureRequest.asp" -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="content-language" content="tr">
    <meta http-equiv="content-type" content="text/html; charset=windows-1254">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WireCard Classic ASP Test Ortamı</title>
	<link rel="icon" href="/favicon.png">
</head>
<body>
    <%
        '---------------------------------------------------------------------
        '-- WireCard 3D Payment ----------------------------------------------
        '---------------------------------------------------------------------
        response.Clear()

        dim statusCode, resultCode, resultMessage
        
        dim saleRequest
        set saleRequest = new CCProxySale3DSecureRequest
        saleRequest.ServiceType         = "CCProxy"
        saleRequest.OperationType       = "Sale3DSEC"
        saleRequest.IPAddress           = "127.0.0.1"
        saleRequest.PaymentContent      = "3D Payment Test"
        saleRequest.InstallmentCount    = "0"
        saleRequest.ErrorUrl            = "http://localhost:81/PaymentResult.asp"
        saleRequest.SuccessUrl          = "http://localhost:81/PaymentResult.asp"

        ' Token Bilgileri
        saleRequest.UserCode   = "20391"
        saleRequest.Pin        = "CABF6CB01F0F4FD3A2A7"
        saleRequest.BaseUrl    = "https://test.wirecard.com.tr/SGate/Gate"

        ' Kredi Kartı Bilgileri
        saleRequest.CreditCardNo    = "5401341234567891"
        saleRequest.OwnerName       = "Hakan Günay"
        saleRequest.ExpireYear      = "2026"
        saleRequest.ExpireMonth     = "12"
        saleRequest.Cvv             = "000"
        saleRequest.Price           = "1000"

        ' CardTokenization Bilgileri
        saleRequest.RequestType     = "0"
        saleRequest.CustomerId      = "0"
        saleRequest.ValidityPeriod  = "0"
        saleRequest.CCTokenId       = ""

        ' Müşteri Bilgileri
        saleRequest.CustomerName    = "Hakan"
        saleRequest.CustomerSurname = "Günay"
        saleRequest.CustomerEmail   = "hakangunay@gmail.com"

        dim wirecardResponse
        wirecardResponse = saleRequest.Execute

        response.write wirecardResponse
        response.end
    %>
</body>
</html>