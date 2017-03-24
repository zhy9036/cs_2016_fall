
  (: Yang Zhang
         CSE 414
         HW5
  :)

  (: Problem 6. :)


<html>
	<head>
		<title>Rivers</title>
	</head>

	<body>
		<h1>HALA</h1>
		<ul>
			{
			for $y in doc("mondial.xml")/mondial/river/@id
			let $x := doc("mondial.xml")/mondial/river[@id = $y]/name/text() 
			let $z := tokenize(doc("mondial.xml")/mondial/river[@id = $y]/@country, '\s')
			where count($z) > 2
			return	
			<li> 
				<div>River name: {$x}</div>
				<ol>
					{
					for $id in $z
					for $cname in doc("mondial.xml")/mondial/country[@car_code=$id]/name/text()
					return
					<li>Country name: {$cname}</li>
					}
				</ol>
			</li>
			}
		</ul>
	</body>
</html>

(:result
<html>
  <head>
    <title>Rivers</title>
  </head>
  <body>
    <h1>HALA</h1>
    <ul>
      <li>
        <div>River name: Paatsjoki</div>
        <ol>
          <li>Country name: Finland</li>
          <li>Country name: Norway</li>
          <li>Country name: Russia</li>
        </ol>
      </li>
      <li>
        <div>River name: Maas</div>
        <ol>
          <li>Country name: Netherlands</li>
          <li>Country name: Belgium</li>
          <li>Country name: France</li>
        </ol>
      </li>
      <li>
        <div>River name: Donau</div>
        <ol>
          <li>Country name: Serbia</li>
          <li>Country name: Austria</li>
          <li>Country name: Germany</li>
          <li>Country name: Hungary</li>
          <li>Country name: Croatia</li>
          <li>Country name: Slovakia</li>
          <li>Country name: Bulgaria</li>
          <li>Country name: Romania</li>
          <li>Country name: Moldova</li>
          <li>Country name: Ukraine</li>
        </ol>
      </li>
      <li>
        <div>River name: Inn</div>
        <ol>
          <li>Country name: Switzerland</li>
          <li>Country name: Austria</li>
          <li>Country name: Germany</li>
        </ol>
      </li>
      <li>
        <div>River name: March</div>
        <ol>
          <li>Country name: Czech Republic</li>
          <li>Country name: Slovakia</li>
          <li>Country name: Austria</li>
        </ol>
      </li>
      <li>
        <div>River name: Drau</div>
        <ol>
          <li>Country name: Italy</li>
          <li>Country name: Austria</li>
          <li>Country name: Slovenia</li>
          <li>Country name: Croatia</li>
          <li>Country name: Hungary</li>
        </ol>
      </li>
      <li>
        <div>River name: Mur</div>
        <ol>
          <li>Country name: Austria</li>
          <li>Country name: Hungary</li>
          <li>Country name: Slovenia</li>
          <li>Country name: Croatia</li>
        </ol>
      </li>
      <li>
        <div>River name: Theiss</div>
        <ol>
          <li>Country name: Hungary</li>
          <li>Country name: Ukraine</li>
          <li>Country name: Serbia</li>
        </ol>
      </li>
      <li>
        <div>River name: Save</div>
        <ol>
          <li>Country name: Slovenia</li>
          <li>Country name: Croatia</li>
          <li>Country name: Bosnia and Herzegovina</li>
          <li>Country name: Serbia</li>
        </ol>
      </li>
      <li>
        <div>River name: Southern Morava</div>
        <ol>
          <li>Country name: Serbia</li>
          <li>Country name: Kosovo</li>
          <li>Country name: Macedonia</li>
        </ol>
      </li>
      <li>
        <div>River name: Pruth</div>
        <ol>
          <li>Country name: Romania</li>
          <li>Country name: Moldova</li>
          <li>Country name: Ukraine</li>
        </ol>
      </li>
      <li>
        <div>River name: Rhein</div>
        <ol>
          <li>Country name: Germany</li>
          <li>Country name: Switzerland</li>
          <li>Country name: Liechtenstein</li>
          <li>Country name: Austria</li>
          <li>Country name: France</li>
          <li>Country name: Netherlands</li>
        </ol>
      </li>
      <li>
        <div>River name: Mosel</div>
        <ol>
          <li>Country name: Germany</li>
          <li>Country name: Luxembourg</li>
          <li>Country name: France</li>
        </ol>
      </li>
      <li>
        <div>River name: Oder</div>
        <ol>
          <li>Country name: Germany</li>
          <li>Country name: Poland</li>
          <li>Country name: Czech Republic</li>
        </ol>
      </li>
      <li>
        <div>River name: Jordan</div>
        <ol>
          <li>Country name: Israel</li>
          <li>Country name: West Bank</li>
          <li>Country name: Jordan</li>
          <li>Country name: Syria</li>
          <li>Country name: Lebanon</li>
        </ol>
      </li>
      <li>
        <div>River name: Kura</div>
        <ol>
          <li>Country name: Turkey</li>
          <li>Country name: Georgia</li>
          <li>Country name: Azerbaijan</li>
        </ol>
      </li>
      <li>
        <div>River name: Tigris</div>
        <ol>
          <li>Country name: Turkey</li>
          <li>Country name: Syria</li>
          <li>Country name: Iraq</li>
        </ol>
      </li>
      <li>
        <div>River name: Euphrat</div>
        <ol>
          <li>Country name: Turkey</li>
          <li>Country name: Syria</li>
          <li>Country name: Iraq</li>
        </ol>
      </li>
      <li>
        <div>River name: Western Dwina</div>
        <ol>
          <li>Country name: Belarus</li>
          <li>Country name: Latvia</li>
          <li>Country name: Russia</li>
        </ol>
      </li>
      <li>
        <div>River name: Dnepr</div>
        <ol>
          <li>Country name: Belarus</li>
          <li>Country name: Ukraine</li>
          <li>Country name: Russia</li>
        </ol>
      </li>
      <li>
        <div>River name: Irtysch</div>
        <ol>
          <li>Country name: Russia</li>
          <li>Country name: Kazakstan</li>
          <li>Country name: China</li>
        </ol>
      </li>
      <li>
        <div>River name: Syrdarja</div>
        <ol>
          <li>Country name: Kazakstan</li>
          <li>Country name: Uzbekistan</li>
          <li>Country name: Tajikistan</li>
        </ol>
      </li>
      <li>
        <div>River name: Amudarja</div>
        <ol>
          <li>Country name: Tajikistan</li>
          <li>Country name: Afghanistan</li>
          <li>Country name: Turkmenistan</li>
          <li>Country name: Uzbekistan</li>
        </ol>
      </li>
      <li>
        <div>River name: Mekong</div>
        <ol>
          <li>Country name: China</li>
          <li>Country name: Laos</li>
          <li>Country name: Thailand</li>
          <li>Country name: Cambodia</li>
          <li>Country name: Vietnam</li>
        </ol>
      </li>
      <li>
        <div>River name: Brahmaputra</div>
        <ol>
          <li>Country name: China</li>
          <li>Country name: India</li>
          <li>Country name: Bangladesh</li>
        </ol>
      </li>
      <li>
        <div>River name: Indus</div>
        <ol>
          <li>Country name: Pakistan</li>
          <li>Country name: India</li>
          <li>Country name: China</li>
        </ol>
      </li>
      <li>
        <div>River name: Amazonas</div>
        <ol>
          <li>Country name: Colombia</li>
          <li>Country name: Brazil</li>
          <li>Country name: Peru</li>
        </ol>
      </li>
      <li>
        <div>River name: Parana</div>
        <ol>
          <li>Country name: Argentina</li>
          <li>Country name: Brazil</li>
          <li>Country name: Paraguay</li>
        </ol>
      </li>
      <li>
        <div>River name: Paraguay</div>
        <ol>
          <li>Country name: Argentina</li>
          <li>Country name: Brazil</li>
          <li>Country name: Paraguay</li>
          <li>Country name: Bolivia</li>
        </ol>
      </li>
      <li>
        <div>River name: Uruguay</div>
        <ol>
          <li>Country name: Brazil</li>
          <li>Country name: Uruguay</li>
          <li>Country name: Argentina</li>
        </ol>
      </li>
      <li>
        <div>River name: Gambia</div>
        <ol>
          <li>Country name: Guinea</li>
          <li>Country name: Gambia</li>
          <li>Country name: Senegal</li>
        </ol>
      </li>
      <li>
        <div>River name: Senegal</div>
        <ol>
          <li>Country name: Mali</li>
          <li>Country name: Mauritania</li>
          <li>Country name: Senegal</li>
          <li>Country name: Guinea</li>
        </ol>
      </li>
      <li>
        <div>River name: Niger</div>
        <ol>
          <li>Country name: Mali</li>
          <li>Country name: Niger</li>
          <li>Country name: Nigeria</li>
          <li>Country name: Guinea</li>
        </ol>
      </li>
      <li>
        <div>River name: Schari</div>
        <ol>
          <li>Country name: Chad</li>
          <li>Country name: Cameroon</li>
          <li>Country name: Central African Republic</li>
        </ol>
      </li>
      <li>
        <div>River name: Sanga</div>
        <ol>
          <li>Country name: Cameroon</li>
          <li>Country name: Central African Republic</li>
          <li>Country name: Congo</li>
        </ol>
      </li>
      <li>
        <div>River name: Ubangi</div>
        <ol>
          <li>Country name: Zaire</li>
          <li>Country name: Central African Republic</li>
          <li>Country name: Congo</li>
        </ol>
      </li>
      <li>
        <div>River name: Ruzizi</div>
        <ol>
          <li>Country name: Zaire</li>
          <li>Country name: Rwanda</li>
          <li>Country name: Burundi</li>
        </ol>
      </li>
      <li>
        <div>River name: Zambezi</div>
        <ol>
          <li>Country name: Angola</li>
          <li>Country name: Zambia</li>
          <li>Country name: Zimbabwe</li>
          <li>Country name: Mozambique</li>
        </ol>
      </li>
      <li>
        <div>River name: Limpopo</div>
        <ol>
          <li>Country name: South Africa</li>
          <li>Country name: Mozambique</li>
          <li>Country name: Zimbabwe</li>
          <li>Country name: Botswana</li>
        </ol>
      </li>
      <li>
        <div>River name: Oranje</div>
        <ol>
          <li>Country name: Lesotho</li>
          <li>Country name: Namibia</li>
          <li>Country name: South Africa</li>
        </ol>
      </li>
    </ul>
  </body>
</html>
:)