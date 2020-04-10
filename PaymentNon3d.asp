<!-- #INCLUDE virtual="/includes/CCProxySaleRequest.asp" -->
<%
    '---------------------------------------------------------------------
    '-- WireCard Non 3D Payment ------------------------------------------
    '---------------------------------------------------------------------
    response.Clear()
    
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
    saleRequest.CreditCardNo    = request.form("cc-number")
    saleRequest.OwnerName       = request.form("cc-name")
    saleRequest.ExpireYear      = request.form("cc-year")
    saleRequest.ExpireMonth     = request.form("cc-month")
    saleRequest.Cvv             = request.form("cvv")
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

        dim statusCode, resultCode, resultMessage, orderObjectId, _
            lastTransactionDate, maskedCreditCardNumber, mpay, tokenId,  _
            subscriberId, subscriberStarterDate, SubscriptionRequestId

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
                case "LastTransactionDate"
                    lastTransactionDate = nodeValue
                case "MaskedCreditCardNumber"
                    maskedCreditCardNumber = nodeValue
                case "MPAY"
                    maskedCreditCardNumber = nodeValue
                case "CCTokenId"
                    tokenId = nodeValue
                case "SubscriberId"
                    subscriberId = nodeValue
                case "SubscriberStarterDate"
                    subscriberStarterDate = nodeValue
                case "SubscriptionRequestId"
                    subscriptionRequestId = nodeValue
            end select
        next
    end if
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="content-language" content="tr">
    <meta http-equiv="content-type" content="text/html; charset=windows-1254">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WireCard Classic ASP Test Ortamı</title>
	<link rel="icon" href="/favicon.png">
	<!-- Styles -->
    <link href="/Assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/Assets/css/style.css" rel="stylesheet" />
</head>
<body>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-sm-8">
            <div class="card">
                <div class="card-header">
                    <strong>Ödeme Sonuç Bilgileri</strong>
                </div>						
                <div class="card-body">
                    <dl class="row">
                        <dt class="col-sm-4">OrderId</dt>
                        <dd class="col-sm-8"><%= orderObjectId %></dd>
                        <dt class="col-sm-4">MPAY</dt>
                        <dd class="col-sm-8"><%= mpay %></dd>
                        <dt class="col-sm-4">StatusCode</dt>
                        <dd class="col-sm-8"><%= statusCode %></dd>
                        <dt class="col-sm-4">ResultCode</dt>
                        <dd class="col-sm-8"><%= resultCode %></dd>
                        <dt class="col-sm-4">ResultMessage</dt>
                        <dd class="col-sm-8"><%= resultMessage %></dd>
                        <dt class="col-sm-4">LastTransactionDate</dt>
                        <dd class="col-sm-8"><%= lastTransactionDate %></dd>
                        <dt class="col-sm-4">MaskedCCNo</dt>
                        <dd class="col-sm-8"><%= maskedCreditCardNumber %></dd>
                        <dt class="col-sm-4">CCTokenId</dt>
                        <dd class="col-sm-8"><%= tokenId %></dd>
                        <dt class="col-sm-4">SubscriberId</dt>
                        <dd class="col-sm-8"><%=subscriberId %></dd>
                        <dt class="col-sm-4">SubscriberStarterDate</dt>
                        <dd class="col-sm-8"><%= subscriberStarterDate %></dd>
                        <dt class="col-sm-4">SubscriptionRequestId</dt>
                        <dd class="col-sm-8"><%= subscriptionRequestId %></dd>
                    </dl>
                    <div class="row" style="border-top: 1px solid #adb5bd; padding-top: 20px;">
                        <div class="col-sm-12">
                            <p>İşlem sonucunun başarılı olması durumunda <strong>StatusCode</strong> parametresine ait değer <strong>0</strong> olarak gelir.
                                İşlem sonucu başarısız olursa bu değer <strong>1</strong> olarak gelir.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- Scripts -->
    <script src="/Assets/js/jquery-3.4.1.min.js"></script>
    <script src="/Assets/js/bootstrap.min.js"></script>
    <script src="/Assets/js/site.js"></script>
</body>
</html>