  (: Yang Zhang
         CSE 414
         HW5
  :)

  (: Problem 2. :)
<result>
    {
      for $x in doc("mondial.xml")/mondial/country/name/text()
      let $y := count(doc("mondial.xml")//country[name = $x]/province)
      where $y > 20
      order by $y descending
        return 
            <country num_provinces = '{$y}'>
              <name> {$x} </name>
            </country>
    }
</result>

(: Results
<result>
  <country num_provinces="81">
    <name>United Kingdom</name>
  </country>
  <country num_provinces="80">
    <name>Russia</name>
  </country>
  <country num_provinces="73">
    <name>Turkey</name>
  </country>
  <country num_provinces="51">
    <name>United States</name>
  </country>
  <country num_provinces="49">
    <name>Poland</name>
  </country>
  <country num_provinces="47">
    <name>Japan</name>
  </country>
  <country num_provinces="41">
    <name>Romania</name>
  </country>
  <country num_provinces="33">
    <name>Colombia</name>
  </country>
  <country num_provinces="32">
    <name>India</name>
  </country>
  <country num_provinces="32">
    <name>Mexico</name>
  </country>
  <country num_provinces="30">
    <name>China</name>
  </country>
  <country num_provinces="27">
    <name>Brazil</name>
  </country>
  <country num_provinces="26">
    <name>Switzerland</name>
  </country>
  <country num_provinces="26">
    <name>Egypt</name>
  </country>
  <country num_provinces="25">
    <name>Hungary</name>
  </country>
  <country num_provinces="25">
    <name>Ukraine</name>
  </country>
  <country num_provinces="25">
    <name>Peru</name>
  </country>
  <country num_provinces="25">
    <name>Tanzania</name>
  </country>
  <country num_provinces="24">
    <name>Sweden</name>
  </country>
  <country num_provinces="24">
    <name>Iran</name>
  </country>
  <country num_provinces="24">
    <name>Argentina</name>
  </country>
  <country num_provinces="23">
    <name>Venezuela</name>
  </country>
  <country num_provinces="22">
    <name>France</name>
  </country>
  <country num_provinces="21">
    <name>Kazakstan</name>
  </country>
</result>

:)

