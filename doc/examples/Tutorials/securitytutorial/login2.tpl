<h1>Login page</h1>

<comp:form name="login_form">
  Login: <comp:inputbox name="login"/><br>
  Password: <comp:inputbox name="password" type="password"/><br>
  <comp:commandbutton name="submit_login" type="submit"/>
</comp:form>

<comp:validationrule component = "login" 
                     mandatory = "true" 
                     maxLength = "10"/>
<comp:validationrule component = "password" 
                     mandatory = "true" 
                     maxLength = "20"/>

