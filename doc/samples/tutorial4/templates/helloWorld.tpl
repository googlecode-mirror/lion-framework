<html>
<head>
  <title>The hello world deluxe in Lion</title> 
</head>
<body>
Please state your name:<br> 
<comp:inputbox name="nameInputBox"/><br>
Please select a salutation:<br>
<comp:combobox name="salutationComboBox">
  <comp:item value="mr."  text="Mr"/>
  <comp:item value="ms."  text="Ms"/>
  <comp:item value="mrs." text="Mrs"/>
  <comp:item value="dr."  text="Dr"/>
</comp:combobox><br>
And finally click on button:<br>
<comp:commandbutton name="sayHelloButton" caption="Say hello!"/><br>

<h1><comp:label name="helloLabel"/></h1>
</body>
</html>
