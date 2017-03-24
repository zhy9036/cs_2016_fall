  (: Yang Zhang
         CSE 414
         HW5
  :)

  (: Problem 4. :)

<result>
	<country>
		<name>United States</name>
		{
			for $x in doc("mondial.xml")/mondial/country[name='United States']/province/name/text()
			let $y := doc("mondial.xml")/mondial/country[name='United States']/province[name=$x]/population/text()
			let $z := doc("mondial.xml")/mondial/country[name='United States']/population/text()
			let $ratio := round-half-to-even($y div $z, 8)
			order by $ratio descending
			return 
				<state>
					<name> {$x} </name>
					<population_ratio> {$ratio} </population_ratio>
				</state>
		}
	</country>
</result>

(:
<result>
  <country>
    <name>United States</name>
    <state>
      <name>California</name>
      <population_ratio>0.12109258</population_ratio>
    </state>
    <state>
      <name>Texas</name>
      <population_ratio>0.0729496</population_ratio>
    </state>
    <state>
      <name>New York</name>
      <population_ratio>0.06806319</population_ratio>
    </state>
    <state>
      <name>Florida</name>
      <population_ratio>0.05499156</population_ratio>
    </state>
    <state>
      <name>Pennsylvania</name>
      <population_ratio>0.04510593</population_ratio>
    </state>
    <state>
      <name>Illinois</name>
      <population_ratio>0.04464131</population_ratio>
    </state>
    <state>
      <name>Ohio</name>
      <population_ratio>0.04197871</population_ratio>
    </state>
    <state>
      <name>Michigan</name>
      <population_ratio>0.03667828</population_ratio>
    </state>
    <state>
      <name>New Jersey</name>
      <population_ratio>0.03021976</population_ratio>
    </state>
    <state>
      <name>Georgia</name>
      <population_ratio>0.02809347</population_ratio>
    </state>
    <state>
      <name>North Carolina</name>
      <population_ratio>0.02786433</population_ratio>
    </state>
    <state>
      <name>Virginia</name>
      <population_ratio>0.02527053</population_ratio>
    </state>
    <state>
      <name>Massachusetts</name>
      <population_ratio>0.02295709</population_ratio>
    </state>
    <state>
      <name>Indiana</name>
      <population_ratio>0.02200612</population_ratio>
    </state>
    <state>
      <name>Washington</name>
      <population_ratio>0.02105389</population_ratio>
    </state>
    <state>
      <name>Missouri</name>
      <population_ratio>0.02027219</population_ratio>
    </state>
    <state>
      <name>Tennessee</name>
      <population_ratio>0.02014513</population_ratio>
    </state>
    <state>
      <name>Wisconsin</name>
      <population_ratio>0.01940014</population_ratio>
    </state>
    <state>
      <name>Maryland</name>
      <population_ratio>0.01911723</population_ratio>
    </state>
    <state>
      <name>Minnesota</name>
      <population_ratio>0.01758336</population_ratio>
    </state>
    <state>
      <name>Arizona</name>
      <population_ratio>0.01709333</population_ratio>
    </state>
    <state>
      <name>Louisiana</name>
      <population_ratio>0.01633079</population_ratio>
    </state>
    <state>
      <name>Alabama</name>
      <population_ratio>0.0162084</population_ratio>
    </state>
    <state>
      <name>Kentucky</name>
      <population_ratio>0.01466594</population_ratio>
    </state>
    <state>
      <name>Colorado</name>
      <population_ratio>0.01460784</population_ratio>
    </state>
    <state>
      <name>South Carolina</name>
      <population_ratio>0.01411075</population_ratio>
    </state>
    <state>
      <name>Oklahoma</name>
      <population_ratio>0.01244798</population_ratio>
    </state>
    <state>
      <name>Connecticut</name>
      <population_ratio>0.01227073</population_ratio>
    </state>
    <state>
      <name>Oregon</name>
      <population_ratio>0.01217177</population_ratio>
    </state>
    <state>
      <name>Iowa</name>
      <population_ratio>0.01070423</population_ratio>
    </state>
    <state>
      <name>Mississippi</name>
      <population_ratio>0.01024669</population_ratio>
    </state>
    <state>
      <name>Kansas</name>
      <population_ratio>0.0097376</population_ratio>
    </state>
    <state>
      <name>Arkansas</name>
      <population_ratio>0.00946733</population_ratio>
    </state>
    <state>
      <name>Utah</name>
      <population_ratio>0.00772732</population_ratio>
    </state>
    <state>
      <name>West Virginia</name>
      <population_ratio>0.00681407</population_ratio>
    </state>
    <state>
      <name>New Mexico</name>
      <population_ratio>0.0064912</population_ratio>
    </state>
    <state>
      <name>Nevada</name>
      <population_ratio>0.00629253</population_ratio>
    </state>
    <state>
      <name>Nebraska</name>
      <population_ratio>0.0062177</population_ratio>
    </state>
    <state>
      <name>Maine</name>
      <population_ratio>0.00466102</population_ratio>
    </state>
    <state>
      <name>Idaho</name>
      <population_ratio>0.00445294</population_ratio>
    </state>
    <state>
      <name>Hawaii</name>
      <population_ratio>0.00444213</population_ratio>
    </state>
    <state>
      <name>New Hampshire</name>
      <population_ratio>0.0044008</population_ratio>
    </state>
    <state>
      <name>Rhode Island</name>
      <population_ratio>0.0037055</population_ratio>
    </state>
    <state>
      <name>Montana</name>
      <population_ratio>0.00329789</population_ratio>
    </state>
    <state>
      <name>South Dakota</name>
      <population_ratio>0.00276938</population_ratio>
    </state>
    <state>
      <name>Delaware</name>
      <population_ratio>0.00274539</population_ratio>
    </state>
    <state>
      <name>North Dakota</name>
      <population_ratio>0.00240503</population_ratio>
    </state>
    <state>
      <name>Alaska</name>
      <population_ratio>0.00228655</population_ratio>
    </state>
    <state>
      <name>Vermont</name>
      <population_ratio>0.00221025</population_ratio>
    </state>
    <state>
      <name>Distr. Columbia</name>
      <population_ratio>0.00198503</population_ratio>
    </state>
    <state>
      <name>Wyoming</name>
      <population_ratio>0.00180032</population_ratio>
    </state>
  </country>
</result>

:)
