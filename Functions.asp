<%
    function replaceWithRegex(value, pattern, replaceText)
		dim regExp
		set regExp = new RegExp

		regExp.Pattern    = pattern 
		regExp.Global     = True 
		
        value = regExp.Replace(value, replaceText)
		replaceWithRegex = value

		set regExp = nothing
	end function
%>