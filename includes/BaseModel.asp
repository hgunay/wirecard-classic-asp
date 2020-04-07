<%
    class Token
        public UserCode
        public Pin
    end class

    class CreditCardInfo
        public CreditCardNo
        public OwnerName
        public ExpireYear
        public ExpireMonth
        public Cvv
        public Price
    end class

    class CustomerInfo
        public CustomerName
        public CustomerSurname
        public CustomerEmail
    end class

    class CardTokenization
        public RequestType
        public CustomerId
        public ValidityPeriod
        public CCTokenId
    end class
%>