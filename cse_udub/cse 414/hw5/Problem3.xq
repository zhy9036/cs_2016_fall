  (: Yang Zhang
         CSE 414
         HW5
  :)

  (: Problem 3. :)


<result>
	<country>
		<name>United States</name>
		{
			for $x in doc("mondial.xml")/mondial/country[name='United States']/province/name/text()
			let $y := doc("mondial.xml")/mondial/country[name='United States']/province[name=$x]/population/text()
			let $z := doc("mondial.xml")/mondial/country[name='United States']/province[name=$x]/area/text()
			let $ratio := round-half-to-even($y div $z, 2)
			order by $ratio descending
			return 
				<state>
					<name> {$x} </name>
					<population_density> {$ratio} </population_density>
				</state>
		}
	</country>
</result>

(:result
	
<result>
  <country>
    <name>United States</name>
    <state>
      <name>Distr. Columbia</name>
      <population_density>2955.11</population_density>
    </state>
    <state>
      <name>New Jersey</name>
      <population_density>399.29</population_density>
    </state>
    <state>
      <name>Rhode Island</name>
      <population_density>314.57</population_density>
    </state>
    <state>
      <name>Massachusetts</name>
      <population_density>285.13</population_density>
    </state>
    <state>
      <name>Connecticut</name>
      <population_density>251.59</population_density>
    </state>
    <state>
      <name>Maryland</name>
      <population_density>188.04</population_density>
    </state>
    <state>
      <name>New York</name>
      <population_density>142.6</population_density>
    </state>
    <state>
      <name>Delaware</name>
      <population_density>138.11</population_density>
    </state>
    <state>
      <name>Ohio</name>
      <population_density>104.5</population_density>
    </state>
    <state>
      <name>Pennsylvania</name>
      <population_density>102.43</population_density>
    </state>
    <state>
      <name>Florida</name>
      <population_density>96.45</population_density>
    </state>
    <state>
      <name>Illinois</name>
      <population_density>81.52</population_density>
    </state>
    <state>
      <name>California</name>
      <population_density>78.5</population_density>
    </state>
    <state>
      <name>Hawaii</name>
      <population_density>70.63</population_density>
    </state>
    <state>
      <name>Michigan</name>
      <population_density>64.48</population_density>
    </state>
    <state>
      <name>Virginia</name>
      <population_density>63.78</population_density>
    </state>
    <state>
      <name>Indiana</name>
      <population_density>62.57</population_density>
    </state>
    <state>
      <name>North Carolina</name>
      <population_density>54.43</population_density>
    </state>
    <state>
      <name>Tennessee</name>
      <population_density>49.18</population_density>
    </state>
    <state>
      <name>Georgia</name>
      <population_density>49.07</population_density>
    </state>
    <state>
      <name>New Hampshire</name>
      <population_density>48.8</population_density>
    </state>
    <state>
      <name>South Carolina</name>
      <population_density>46.66</population_density>
    </state>
    <state>
      <name>Kentucky</name>
      <population_density>37.34</population_density>
    </state>
    <state>
      <name>Wisconsin</name>
      <population_density>35.55</population_density>
    </state>
    <state>
      <name>Louisiana</name>
      <population_density>35.19</population_density>
    </state>
    <state>
      <name>Alabama</name>
      <population_density>32.25</population_density>
    </state>
    <state>
      <name>Washington</name>
      <population_density>31.79</population_density>
    </state>
    <state>
      <name>Missouri</name>
      <population_density>29.93</population_density>
    </state>
    <state>
      <name>West Virginia</name>
      <population_density>28.93</population_density>
    </state>
    <state>
      <name>Texas</name>
      <population_density>28.13</population_density>
    </state>
    <state>
      <name>Vermont</name>
      <population_density>23.65</population_density>
    </state>
    <state>
      <name>Mississippi</name>
      <population_density>22.11</population_density>
    </state>
    <state>
      <name>Minnesota</name>
      <population_density>21.43</population_density>
    </state>
    <state>
      <name>Iowa</name>
      <population_density>19.57</population_density>
    </state>
    <state>
      <name>Arkansas</name>
      <population_density>18.31</population_density>
    </state>
    <state>
      <name>Oklahoma</name>
      <population_density>18.31</population_density>
    </state>
    <state>
      <name>Arizona</name>
      <population_density>15.43</population_density>
    </state>
    <state>
      <name>Colorado</name>
      <population_density>14.44</population_density>
    </state>
    <state>
      <name>Maine</name>
      <population_density>14.42</population_density>
    </state>
    <state>
      <name>Oregon</name>
      <population_density>12.9</population_density>
    </state>
    <state>
      <name>Kansas</name>
      <population_density>12.18</population_density>
    </state>
    <state>
      <name>Utah</name>
      <population_density>9.36</population_density>
    </state>
    <state>
      <name>Nebraska</name>
      <population_density>8.27</population_density>
    </state>
    <state>
      <name>Nevada</name>
      <population_density>5.86</population_density>
    </state>
    <state>
      <name>New Mexico</name>
      <population_density>5.49</population_density>
    </state>
    <state>
      <name>Idaho</name>
      <population_density>5.48</population_density>
    </state>
    <state>
      <name>South Dakota</name>
      <population_density>3.69</population_density>
    </state>
    <state>
      <name>North Dakota</name>
      <population_density>3.5</population_density>
    </state>
    <state>
      <name>Montana</name>
      <population_density>2.31</population_density>
    </state>
    <state>
      <name>Wyoming</name>
      <population_density>1.89</population_density>
    </state>
    <state>
      <name>Alaska</name>
      <population_density>0.4</population_density>
    </state>
  </country>
</result>

:)
