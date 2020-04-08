
<%
class CCProxySaleRequest
    public  ServiceType
    public  OperationType
    public  MPAY
    public  CurrencyCode
    public  IPAddress
    public  PaymentContent
    public  InstallmentCount
    public  Description
    public  ExtraParam
    public  Port
    public  BaseUrl
    public  Language

    ' Token Bilgileri
    public UserCode
    public Pin

    ' Kredi Kartı Bilgileri
    public CreditCardNo
    public OwnerName
    public ExpireYear
    public ExpireMonth
    public Cvv
    public Price

    ' CardTokenization Bilgileri
    public RequestType
    public CustomerId
    public ValidityPeriod
    public CCTokenId

    ' Müşteri Bilgileri
    public CustomerName
    public CustomerSurname
    public CustomerEmail

    public function Execute()
        dim SrvHTTPS
        set SrvHTTPS = Server.CreateObject("MSXML2.ServerXMLHTTP")
        SrvHTTPS.Open "POST", BaseUrl, false
        SrvHTTPS.Send ToXmlString

        response.write ToXmlString
    
        Execute = SrvHTTPS.Responsetext
    end function

    function ToXmlString()
        dim requestXml
        requestXml = "<?xml version=""1.0"" encoding=""utf-8"" ?>" & _
            "<WIRECARD>" & _
                "<ServiceType>" & ServiceType & "</ServiceType>" & _
                "<OperationType>" & OperationType & "</OperationType>" & _
                "<Token>" & _
                    "<UserCode>" & UserCode & "</UserCode>" & _
                    "<Pin>" & Pin & "</Pin>" & _
                "</Token>" & _
                "<CreditCardInfo>" & _
                    "<CreditCardNo>" & CreditCardNo & "</CreditCardNo>" & _
                    "<OwnerName>" & OwnerName & "</OwnerName>" & _
                    "<ExpireYear>" & ExpireYear & "</ExpireYear>" & _
                    "<ExpireMonth>" & ExpireMonth & "</ExpireMonth>" & _
                    "<Cvv>" & Cvv & "</Cvv>" & _
                    "<Price>" & Price & "</Price>" & _
                "</CreditCardInfo>" & _
                "<CardTokenization>" & _
                    "<RequestType>" & RequestType & "</RequestType>" & _
                    "<CustomerId>" & CustomerId & "</CustomerId>" & _
                    "<ValidityPeriod>" & ValidityPeriod & "</ValidityPeriod>" & _
                    "<CCTokenId>" & CCTokenId & "</CCTokenId>" & _
                "</CardTokenization>" & _
                "<CustomerInfo>" & _
                    "<CustomerName>" & CustomerName & "</CustomerName>" & _
                    "<CustomerSurname>" & CustomerSurname & "</CustomerSurname>" & _
                    "<CustomerEmail>" & CustomerEmail & "</CustomerEmail>" & _
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