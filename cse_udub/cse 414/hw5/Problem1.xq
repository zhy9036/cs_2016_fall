      (: Yang Zhang
         CSE 414
         HW5 Q1
      :)

      (: Problem 1. :)

      <result>
			<country>
				<name>Peru</name>
				{
					for $x in doc("mondial.xml")/mondial/country[name = 'Peru']//city/name/text()
					order by $x
				    return <city> 
				    			<name>{ $x }</name>
				    	   </city>
				}
			</country>	
		</result>

      (: Results
          <result>
			  <country>
			    <name>Peru</name>
			    <city>
			      <name>Abancay</name>
			    </city>
			    <city>
			      <name>Arequipa</name>
			    </city>
			    <city>
			      <name>Ayacucho</name>
			    </city>
			    <city>
			      <name>Cajamarca</name>
			    </city>
			    <city>
			      <name>Callao</name>
			    </city>
			    <city>
			      <name>Cerro de Pasco</name>
			    </city>
			    <city>
			      <name>Chachapoyas</name>
			    </city>
			    <city>
			      <name>Chiclayo</name>
			    </city>
			    <city>
			      <name>Chimbote</name>
			    </city>
			    <city>
			      <name>Chincha Alta</name>
			    </city>
			    <city>
			      <name>Cuzco</name>
			    </city>
			    <city>
			      <name>Huancavelica</name>
			    </city>
			    <city>
			      <name>Huancayo</name>
			    </city>
			    <city>
			      <name>Huanuco</name>
			    </city>
			    <city>
			      <name>Huaraz</name>
			    </city>
			    <city>
			      <name>Ica</name>
			    </city>
			    <city>
			      <name>Iquitos</name>
			    </city>
			    <city>
			      <name>Juliaca</name>
			    </city>
			    <city>
			      <name>Lima</name>
			    </city>
			    <city>
			      <name>Moquegua</name>
			    </city>
			    <city>
			      <name>Moyobamba</name>
			    </city>
			    <city>
			      <name>Piura</name>
			    </city>
			    <city>
			      <name>Pucallpa</name>
			    </city>
			    <city>
			      <name>Puerto Maldonado</name>
			    </city>
			    <city>
			      <name>Puno</name>
			    </city>
			    <city>
			      <name>Sullana</name>
			    </city>
			    <city>
			      <name>Tacna</name>
			    </city>
			    <city>
			      <name>Talara</name>
			    </city>
			    <city>
			      <name>Trujillo</name>
			    </city>
			    <city>
			      <name>Tumbes</name>
			    </city>
			  </country>
		</result>
      :)


