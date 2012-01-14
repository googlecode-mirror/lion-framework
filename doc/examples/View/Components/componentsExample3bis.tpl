<html>
<head>
  <title>Component rendering engine sample</title> 
</head>
<body>

  <!-- Assign a placeholder to a property within the  
       comp tag DOES NOT WORK: -->
  <comp:commandlink name="about_us" caption="{$about_us_literal}">

  <!-- Assign a placeholder to a property by ussing the
       comp-property tag WORKS: -->
  <comp:commandlink name="about_us">
    <comp-property name="caption">{$about_us_literal}</comp-property>
  </comp:commandlink>

</comp:tabpane>

</body>
</html>