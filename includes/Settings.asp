<%
class Settings
    private pUserCode
    private pPin
    public pBaseUrl

    public property get UserCode()
        UserCode = pUserCode
    end property    
   
    public property let UserCode(userCodeParam)
        pUserCode = userCodeParam
    end property
    
    public property get Pin()
        Pin = pPin
    end property
   
    public property let Pin(pinParam)
        pPin = pinParam
    end property

    public property get BaseUrl()
        BaseUrl = pBaseUrl
    end property    
   
    public property let BaseUrl(baseUrlParam)
        pBaseUrl = baseUrlParam
    end property
end class
%>