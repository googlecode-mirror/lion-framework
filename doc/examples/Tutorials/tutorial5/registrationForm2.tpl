<html>
<head>
  <title>Registration form</title> 
</head>
<body>
<h1>Registration form</h1>
<comp:form name="registration_form" action="register">

  First name:<br>
      <comp:inputbox name="first_name"/><br><br>
  Last name:<br> 
      <comp:inputbox name="last_name"/><br><br>
  Birdth date: 
      <comp:datebox name="birdth_date"/> (YYYY-mm-dd)<br><br>
  Sex:<br> 
      <comp:optionbox group="sex" name="male" caption="Male">
      &nbsp;
      <comp:optionbox group="sex" name="female" caption="Female"><br><br>
  Email address:<br>
      <comp:inputbox name="email"/><br><br>
  Password:<br> 
      <comp:inputbox type="password" name="password"/><br><br>
  Repeat password:<br> 
      <comp:inputbox type="password" name="password_confirmation"/><br><br>
  Question:<br>
      <comp:combobox name="question">
          <comp:item text="Your favorite pet?" value="pet"/>
          <comp:item text="Your first car?" value="car"/>
      </comp:combobox/><br><br>
  Answer:<br>
      <comp:inputbox name="answer"/><br><br>
  <comp:commandbutton name="send" caption="Send"/>

</comp:form>  
  
<!--/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */-->
<!--/*        Validation rules         */-->  
<!--/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */-->

<comp:validationrule component="first_name" 
                     mandatory="true" 
                     maxLength="100"
                       pattern="^[A-Za-z\s]+$"/>

<comp:validationrule component="last_name" 
                     maxLength="100"
                       pattern="^[A-Za-z\s]+$"/>
                  
<comp:validationrule component="birdth_date" 
                     mandatory="true" 
                       pattern="^\d\d\d\d\-\d\d-\d\d$"/>

<comp:validationrule component="email" 
                     mandatory="true" 
                     maxLength="150"
                        format="email"/>
                   
<comp:validationrule component="password" 
                     mandatory="true" 
                     minLength="6"
                     maxLength="15"/>

<comp:validationrule component="password_confirmation" 
                     mandatory="true"
                matchComponent="password"/>
                     
<comp:validationrule component="answer" 
                     maxLength="100"
                     mandatory="true"/>                     
                   
</body>
</html>