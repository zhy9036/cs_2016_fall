  (: Yang Zhang
         CSE 414
         HW5
  :)

  (: Problem 5. :)


<result>

	{
		for $x in doc("mondial.xml")/mondial/country/name/text()
		let $y := doc("mondial.xml")/mondial/country[name=$x]/@car_code
		let $z := count(doc("mondial.xml")/mondial/mountain[@country = $y and height>2000]/name/text())
		where $z>2
		return
			<country>
				<name>{$x}</name>
				
					{
							for $mname in doc("mondial.xml")/mondial/mountain[@country = $y and height>2000]/name/text()
							let $height := doc("mondial.xml")/mondial/mountain[name=$mname]/height/text()
							return
							<mountains>
								<name>{$mname}</name>
								<height>{$height}</height>
							</mountains>	
					}
					
			</country>
	}
</result>
(:result
<result>
  <country>
    <name>Spain</name>
    <mountains>
      <name>Pico de Aneto</name>
      <height>3404</height>
    </mountains>
    <mountains>
      <name>Torre de Cerredo</name>
      <height>2648</height>
    </mountains>
    <mountains>
      <name>Pico de Almanzor</name>
      <height>2648</height>
    </mountains>
    <mountains>
      <name>Moncayo</name>
      <height>2313</height>
    </mountains>
    <mountains>
      <name>Mulhacen</name>
      <height>3482</height>
    </mountains>
    <mountains>
      <name>Pico de Teide</name>
      <height>3718</height>
    </mountains>
    <mountains>
      <name>Roque de los Muchachos</name>
      <height>2426</height>
    </mountains>
  </country>
  <country>
    <name>Italy</name>
    <mountains>
      <name>GranParadiso</name>
      <height>4061</height>
    </mountains>
    <mountains>
      <name>Marmolata</name>
      <height>3343</height>
    </mountains>
    <mountains>
      <name>Gran Sasso</name>
      <height>2912</height>
    </mountains>
    <mountains>
      <name>Etna</name>
      <height>3323</height>
    </mountains>
  </country>
  <country>
    <name>Switzerland</name>
    <mountains>
      <name>GrandCombin</name>
      <height>4314</height>
    </mountains>
    <mountains>
      <name>Finsteraarhorn</name>
      <height>4274</height>
    </mountains>
    <mountains>
      <name>Crap_Sogn_Gion</name>
      <height>2228</height>
    </mountains>
  </country>
  <country>
    <name>Norway</name>
    <mountains>
      <name>Galdhoeppig</name>
      <height>2469</height>
    </mountains>
    <mountains>
      <name>Jostedalsbre</name>
      <height>2083</height>
    </mountains>
    <mountains>
      <name>Glittertind</name>
      <height>2452</height>
    </mountains>
    <mountains>
      <name>Snoehetta</name>
      <height>2286</height>
    </mountains>
  </country>
  <country>
    <name>Sweden</name>
    <mountains>
      <name>Kebnekaise</name>
      <height>2114</height>
    </mountains>
    <mountains>
      <name>Sarektjokko</name>
      <height>2090</height>
    </mountains>
    <mountains>
      <name>Portefjaellen</name>
      <height>2021</height>
    </mountains>
  </country>
  <country>
    <name>Iran</name>
    <mountains>
      <name>Damavand</name>
      <height>5610</height>
    </mountains>
    <mountains>
      <name>Sabalan</name>
      <height>4811</height>
    </mountains>
    <mountains>
      <name>Zard Kuh</name>
      <height>4550</height>
    </mountains>
  </country>
  <country>
    <name>Tajikistan</name>
    <mountains>
      <name>Pik Kommunizma</name>
      <height>7494</height>
    </mountains>
    <mountains>
      <name>Pik Revoluzija</name>
      <height>6974</height>
    </mountains>
    <mountains>
      <name>Pik Moskva</name>
      <height>6785</height>
    </mountains>
    <mountains>
      <name>Pik Karl-Marx</name>
      <height>6726</height>
    </mountains>
  </country>
  <country>
    <name>Nepal</name>
    <mountains>
      <name>Dhaulagiri</name>
      <height>8167</height>
    </mountains>
    <mountains>
      <name>Annapurna</name>
      <height>8091</height>
    </mountains>
    <mountains>
      <name>Manaslu</name>
      <height>8163</height>
    </mountains>
  </country>
  <country>
    <name>Indonesia</name>
    <mountains>
      <name>Leuser</name>
      <height>3466</height>
    </mountains>
    <mountains>
      <name>Kerinci</name>
      <height>3805</height>
    </mountains>
    <mountains>
      <name>Merapi</name>
      <height>2914</height>
    </mountains>
    <mountains>
      <name>Semeru</name>
      <height>3676</height>
    </mountains>
    <mountains>
      <name>Gunung Agung</name>
      <height>3142</height>
    </mountains>
    <mountains>
      <name>Rinjani</name>
      <height>3726</height>
    </mountains>
    <mountains>
      <name>Tambora</name>
      <height>2850</height>
    </mountains>
    <mountains>
      <name>Rantekombola</name>
      <height>3455</height>
    </mountains>
    <mountains>
      <name>Gunung Binaiya</name>
      <height>3027</height>
    </mountains>
    <mountains>
      <name>Puncak Jaya</name>
      <height>4884</height>
    </mountains>
  </country>
  <country>
    <name>Papua New Guinea</name>
    <mountains>
      <name>Mt. Wilhelm</name>
      <height>4509</height>
    </mountains>
    <mountains>
      <name>Mt. Giluwe</name>
      <height>4368</height>
    </mountains>
    <mountains>
      <name>Mt. Balbi</name>
      <height>2715</height>
    </mountains>
  </country>
  <country>
    <name>Japan</name>
    <mountains>
      <name>Asahi-Dake</name>
      <height>2290</height>
    </mountains>
    <mountains>
      <name>Fujisan</name>
      <height>3776</height>
    </mountains>
    <mountains>
      <name>Hotaka-Dake</name>
      <height>3190</height>
    </mountains>
  </country>
  <country>
    <name>Philippines</name>
    <mountains>
      <name>Pulog</name>
      <height>2928</height>
    </mountains>
    <mountains>
      <name>Mount Apo</name>
      <height>2954</height>
    </mountains>
    <mountains>
      <name>Kanlaon</name>
      <height>2435</height>
    </mountains>
    <mountains>
      <name>Mantalingajan</name>
      <height>2085</height>
    </mountains>
  </country>
  <country>
    <name>Mexico</name>
    <mountains>
      <name>Citlaltepetl (Pico de Orizaba)</name>
      <height>5700</height>
    </mountains>
    <mountains>
      <name>Popocatepetl</name>
      <height>5450</height>
    </mountains>
    <mountains>
      <name>Iztaccihuatl</name>
      <height>5286</height>
    </mountains>
    <mountains>
      <name>Nevado de Toluca</name>
      <height>4558</height>
    </mountains>
    <mountains>
      <name>Nevado de Colima</name>
      <height>4330</height>
    </mountains>
  </country>
  <country>
    <name>Canada</name>
    <mountains>
      <name>Mt Logan</name>
      <height>5959</height>
    </mountains>
    <mountains>
      <name>Mt Waddington</name>
      <height>4019</height>
    </mountains>
    <mountains>
      <name>Mt Robson</name>
      <height>3954</height>
    </mountains>
    <mountains>
      <name>Mt Columbia</name>
      <height>3747</height>
    </mountains>
    <mountains>
      <name>Barbeau Peak</name>
      <height>2616</height>
    </mountains>
    <mountains>
      <name>Mt. Odin</name>
      <height>2147</height>
    </mountains>
  </country>
  <country>
    <name>United States</name>
    <mountains>
      <name>Mauna Kea</name>
      <height>4214</height>
    </mountains>
    <mountains>
      <name>Mauna Loa</name>
      <height>4170</height>
    </mountains>
    <mountains>
      <name>Haleakala</name>
      <height>3055</height>
    </mountains>
    <mountains>
      <name>Mt Redoubt</name>
      <height>3108</height>
    </mountains>
    <mountains>
      <name>Mt McKinley</name>
      <height>6193</height>
    </mountains>
    <mountains>
      <name>Mt Blackburn</name>
      <height>4996</height>
    </mountains>
    <mountains>
      <name>Granite Peak</name>
      <height>3901</height>
    </mountains>
    <mountains>
      <name>Borah Peak</name>
      <height>3859</height>
    </mountains>
    <mountains>
      <name>Harney Peak</name>
      <height>2207</height>
    </mountains>
    <mountains>
      <name>Gannett Peak</name>
      <height>4207</height>
    </mountains>
    <mountains>
      <name>Kings Peak</name>
      <height>4123</height>
    </mountains>
    <mountains>
      <name>Mt Elbert</name>
      <height>4401</height>
    </mountains>
    <mountains>
      <name>Pikes Peak</name>
      <height>4302</height>
    </mountains>
    <mountains>
      <name>Wheeler Peak</name>
      <height>4011</height>
    </mountains>
    <mountains>
      <name>Humphreys Peak</name>
      <height>3850</height>
    </mountains>
    <mountains>
      <name>Guadalupe Peak</name>
      <height>2667</height>
    </mountains>
    <mountains>
      <name>Mt Rainier</name>
      <height>4392</height>
    </mountains>
    <mountains>
      <name>Mt Adams</name>
      <height>3743</height>
    </mountains>
    <mountains>
      <name>Mt Hood</name>
      <height>3424</height>
    </mountains>
    <mountains>
      <name>Mt Whitney</name>
      <height>4418</height>
    </mountains>
    <mountains>
      <name>Boundary Peak</name>
      <height>4006</height>
    </mountains>
    <mountains>
      <name>Mt Mitchell</name>
      <height>2037</height>
    </mountains>
    <mountains>
      <name>Clingmans Dome</name>
      <height>2025</height>
    </mountains>
  </country>
  <country>
    <name>Colombia</name>
    <mountains>
      <name>Pico Cristobal Colon</name>
      <height>5775</height>
    </mountains>
    <mountains>
      <name>Nevado del Ruiz</name>
      <height>5389</height>
    </mountains>
    <mountains>
      <name>Nevado del Huila</name>
      <height>5750</height>
    </mountains>
  </country>
  <country>
    <name>Argentina</name>
    <mountains>
      <name>Monte Pissis</name>
      <height>6795</height>
    </mountains>
    <mountains>
      <name>Aconcagua</name>
      <height>6962</height>
    </mountains>
    <mountains>
      <name>Tupungato</name>
      <height>6550</height>
    </mountains>
  </country>
  <country>
    <name>Bolivia</name>
    <mountains>
      <name>Illampu</name>
      <height>6368</height>
    </mountains>
    <mountains>
      <name>Illimani</name>
      <height>6439</height>
    </mountains>
    <mountains>
      <name>Sajama</name>
      <height>6542</height>
    </mountains>
  </country>
  <country>
    <name>Peru</name>
    <mountains>
      <name>Huascaran</name>
      <height>6768</height>
    </mountains>
    <mountains>
      <name>Alpamayo</name>
      <height>5947</height>
    </mountains>
    <mountains>
      <name>Pico Rocarre</name>
      <height>5187</height>
    </mountains>
    <mountains>
      <name>Ausangate</name>
      <height>6336</height>
    </mountains>
    <mountains>
      <name>Coropuna</name>
      <height>6425</height>
    </mountains>
    <mountains>
      <name>Ampato</name>
      <height>6288</height>
    </mountains>
  </country>
  <country>
    <name>Ecuador</name>
    <mountains>
      <name>Cayambe</name>
      <height>5796</height>
    </mountains>
    <mountains>
      <name>Cotopaxi</name>
      <height>5897</height>
    </mountains>
    <mountains>
      <name>Chimborazo</name>
      <height>6287</height>
    </mountains>
  </country>
  <country>
    <name>Tanzania</name>
    <mountains>
      <name>Kilimanjaro</name>
      <height>5895</height>
    </mountains>
    <mountains>
      <name>Mawenzi</name>
      <height>5148</height>
    </mountains>
    <mountains>
      <name>Meru</name>
      <height>4567</height>
    </mountains>
  </country>
  <country>
    <name>Madagascar</name>
    <mountains>
      <name>Tsaratanana</name>
      <height>2876</height>
    </mountains>
    <mountains>
      <name>Tsiafajavona</name>
      <height>2642</height>
    </mountains>
    <mountains>
      <name>Andringitra</name>
      <height>2658</height>
    </mountains>
  </country>
</result>
:)