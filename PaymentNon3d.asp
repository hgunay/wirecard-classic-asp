<!-- #INCLUDE virtual="/includes/BaseModel.asp" -->
<!-- #INCLUDE virtual="/includes/Settings.asp" -->
<!-- #INCLUDE virtual="/includes/CCProxySaleRequest.asp" -->

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
        '-- WireCard Non 3D Payment ------------------------------------------
        '---------------------------------------------------------------------
        response.Clear()

        dim statusCode, resultCode, resultMessage
        
        dim saleRequest
        set saleRequest = new CCProxySaleRequest
        saleRequest.ServiceType     = "CCProxy"
        saleRequest.OperationType   = "Sale"
        saleRequest.IPAddress       = "127.0.0.1"
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

        if len(wirecardResponse) > 0 then
            dim responseXml
            set responseXml     = Server.CreateObject("Microsoft.XMLDOM")
            responseXml.async   = True
            responseXml.LoadXML wirecardResponse

            dim resultNodes
            set resultNodes = responseXml.selectNodes("//Item")
            
            for each node in resultNodes
                dim nodeKey, nodeValue
                nodeKey = node.getAttribute("Key")
                nodeValue = node.getAttribute("Value")
                
                select case nodeKey
                    case "StatusCode"
                        statusCode = nodeValue
                    case "ResultCode"
                        resultCode = nodeValue
                    case "ResultMessage"
                        resultMessage = nodeValue
                end select
            next
        end if
    %>

    <p><b>WireCard Non 3D Payment Result</b></p>
    <p><b>Islem Sonucu :</b> <%= statusCode %></p>
    <p><b>Aciklama     :</b> <%= resultMessage %></p>
    <p><b>Kod          :</b> <%= resultCode %></p>    
    ş
</body>
</html>