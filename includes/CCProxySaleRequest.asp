
<%
class CCProxySaleRequest
    public  ServiceType
    public  OperationType
    public  CreditCardInfo
    public  MPAY
    public  CurrencyCode
    public  IPAddress
    public  PaymentContent
    public  InstallmentCount
    public  Description
    public  ExtraParam
    public  CardTokenization
    public  Port
    public  BaseUrl
	public  CustomerInfo
    public  Language

    

    public function Execute()
        dim SrvHTTPS
        set SrvHTTPS = Server.CreateObject("MSXML2.ServerXMLHTTP")
        'SrvHTTPS.Open "POST", "BaseUrl", false
        'SrvHTTPS.Send ToXmlString
    
        'Execute = SrvHTTPS.Responsetext
    end function

    function ToXmlString()
        dim requestXml
        requestXml = "<?xml version=""1.0"" encoding=""utf-8"" ?>" & _
            "<WIRECARD>" & _
                "<ServiceType>" & ServiceType & "</ServiceType>" & _
                "<OperationType>" & OperationType & "</OperationType>" & _
                "<Token>" & _
                    "<UserCode>" & Token.UserCode & "</UserCode>" & _
                    "<Pin>" & Token.UserPin & "</Pin>" & _
                "</Token>" & _
                "<CreditCardInfo>" & _
                    "<CreditCardNo>" & CreditCardInfo.CreditCardNo & "</CreditCardNo>" & _
                    "<OwnerName>" & CreditCardInfo.OwnerName & "</OwnerName>" & _
                    "<ExpireYear>" & CreditCardInfo.ExpireYear & "</ExpireYear>" & _
                    "<ExpireMonth>" & CreditCardInfo.ExpireMonth & "</ExpireMonth>" & _
                    "<Cvv>" & CreditCardInfo.Cvv & "</Cvv>" & _
                    "<Price>" & CreditCardInfo.Price & "</Price>" & _
                "</CreditCardInfo>" & _
                "<CardTokenization>" & _
                    "<RequestType>" & CardTokenization.RequestType & "</RequestType>" & _
                    "<CustomerId>" & CardTokenization.CustomerId & "</CustomerId>" & _
                    "<ValidityPeriod>" & CardTokenization.ValidityPeriod & "</ValidityPeriod>" & _
                    "<CCTokenId>" & CardTokenization.CCTokenId & "</CCTokenId>" & _
                "</CardTokenization>" & _
                "<CustomerInfo>" & _
                    "<CustomerName>" & CustomerInfo.CustomerName & "</CustomerName>" & _
                    "<CustomerSurname>" & CustomerInfo.CustomerSurname & "</CustomerSurname>" & _
                    "<CustomerEmail>" & CustomerInfo.CustomerEmail & "</CustomerEmail>" & _
                "</CustomerInfo>" & _
                "<Language>" & Language & "</Language>" & _
                "<MPAY>" & MPAY & "</MPAY>" & _
                "<CurrencyCode>" & CurrencyCode & "</CurrencyCode>" & _
                "<IPAddress>" & IPAddress & "</IPAddress>" & _
                "<PaymentContent>" & PaymentContent & "</PaymentContent>" & _
                "<InstallmentCount>" & InstallmentCount & "</InstallmentCount>" & _
                "<Description>" & Description & "</Description>" & _
                "<ExtraParam>" & ExtraParam & "</ExtraParam>" & _
            "</WIRECARD>"

        ToXmlString = requestXml
    end function
    
end class
%>