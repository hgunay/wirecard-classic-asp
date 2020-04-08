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

        dim saleRequest
        set saleRequest = new CCProxySaleRequest
        saleRequest.ServiceType     = "CCProxy"
        saleRequest.OperationType   = "Sale"
        saleRequest.IPAddress       = "178.251.45.163"
        saleRequest.PaymentContent  = "Test"
        saleRequest.InstallmentCount = "0"

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
        saleRequest.Price           = "1"

        ' CardTokenization Bilgileri
        saleRequest.RequestType     = "0"
        saleRequest.CustomerId      = "0"
        saleRequest.ValidityPeriod  = "0"
        saleRequest.CCTokenId       = ""

        ' Müşteri Bilgileri
        saleRequest.CustomerName    = "Hakan"
        saleRequest.CustomerSurname = "Günay"
        saleRequest.CustomerEmail   = "hakangunay@gmail.com"

        response.write saleRequest.Execute

    %>
    <p><b>WireCard Non 3D Payment</b></p>


    

</body>
</html>