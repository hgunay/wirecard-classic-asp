<!-- #INCLUDE virtual="/includes/Functions.asp" -->
<%
    class CCProxySale3DSecureRequest
        public ServiceType
        public OperationType
        public MPAY
        public CurrencyCode
        public IPAddress
        public PaymentContent
        public InstallmentCount
        public Description
        public ExtraParam
        public Port
        public BaseUrl
        public Language
        public Is3dsPayment

        ' 3DS Bilgileri
        public ErrorUrl
        public SuccessUrl

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

        private sub Class_Initialize()
            Is3dsPayment = false
        end sub

        private sub Class_Terminate()
		end sub

        public function Execute()
            dim srvObj
            set srvObj = Server.CreateObject("MSXML2.ServerXMLHTTP")
            srvObj.Open "POST", BaseUrl, false
            srvObj.Send ToXmlString
            
            dim wirecardResponse
            wirecardResponse = srvObj.Responsetext

            if Is3dsPayment then
                if len(srvObj.Responsetext) > 0 then
                    dim responseXml
                    set responseXml     = Server.CreateObject("Microsoft.XMLDOM")
                    responseXml.async   = True
                    responseXml.LoadXML wirecardResponse

                    dim statusCode, redirectUrl
                    
                    dim resultNodes
                    set resultNodes = responseXml.selectNodes("//Item")
                                
                    for each node in resultNodes
                        dim nodeKey, nodeValue
                        nodeKey = node.getAttribute("Key")
                        nodeValue = node.getAttribute("Value")
                        
                        select case nodeKey
                            case "StatusCode"
                                statusCode = nodeValue
                            case "RedirectUrl"
                                redirectUrl = nodeValue
                        end select
                    next

                    if statusCode = "0" then
                        response.redirect redirectUrl
                    end if
                end if
            else
                Execute = srvObj.Responsetext
		    end if
        end function

        private function ToXmlString()
            ' Kart numarasındaki boş stringleri RegEx ile temizliyoruz.
            CreditCardNo = replaceWithRegex(CreditCardNo, "[^0-9]", "")

            dim requestXml
            requestXml = _
            "<?xml version=""1.0"" encoding=""utf-8"" ?>" & _
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
                    "<CurrencyCode>" & CurrencyCode & "</CurrencyCode>"
                
                if Is3dsPayment = true then
                    requestXml = requestXml & _
                    "<ErrorURL>" & ErrorUrl & "</ErrorURL>" & _
                    "<SuccessURL>" & SuccessUrl & "</SuccessURL>"
                end if

                    requestXml = requestXml & _
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