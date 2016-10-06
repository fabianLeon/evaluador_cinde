-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: evaluador
-- ------------------------------------------------------
-- Server version	5.7.13-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `pk_estudiante` varchar(13) NOT NULL,
  `n_nombres` varchar(100) DEFAULT NULL,
  `n_apellido1` varchar(50) DEFAULT NULL,
  `n_apellido2` varchar(50) DEFAULT NULL,
  `n_correo` varchar(200) DEFAULT NULL,
  `p_contrasena` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pk_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES ('10','PRUEBA','PRUEBA','PRUEBA','PRUEBA@PRUEBA.COM','PRUEBA'),('20102020088','Fabián ','Sánchez','León','fabi_leon@outlook.com','12345'),('20102020090','Pepito','Perez','Padilla','pepitoperez@hotmail.com','12345'),('2010288115','OSCAR ANDRÉS','LLANOS','CARILLO','andres80llanos@gmail.com','88115'),('2012288021','KELLY JOHANNA','CARREÑO','RANGEL','mfed_kjcarrenor659@pedagogica.edu.co','88021'),('2013288003','GIOVANNY ENRIQUE','ARAQUE','SUAREZ','BLOGOTANO@YAHOO.ES','88003'),('2013288037','YURI BIVIANA','GOMEZ','FERNANDEZ','BIVIG15@YAHOO.COM','88037'),('2013288038','JAIRO HUMBERTO','GONZALEZ','PULIDO','','88038'),('2013288077','VIVIANA ALEXANDRA','SOLORZANO','RUIZ','VIVITA7@GMAIL.COM ','88077'),('2013288146','PARMENIO ','PORTILLA','DUARTE','PARMENIO.PORTILLA@GMAIL.COM; PARMENIO.PORTILLA@ICBF.GOV.CO','88146'),('2013288186','ANGIE LORIETH','MELO','MACÍAS','LORIETHTAYA@GMAIL.COM','88186'),('2014188045','GABRIEL HERNÁN','GONZALEZ','ROJAS','GHGONZALEZ11@GMAIL.COM','88045'),('20151150038','Catalina','Lopez','Alfonso','catalinalopez_@hotmail.com','12345'),('2015188001','MARYURI ','AGUDELO','FRANCO','MARYAGRA1@HOTMAIL.COM','88001'),('2015188003','OMAR EDUARDO','BELTRAN','RUIZ','OBELTRAN@PEDAGOGICA.EDU.CO','88003'),('2015188004','LUIS ENRIQUE','BUITRAGO','PINZON','ROPAVEJERO3@GMAIL.COM','88004'),('2015188005','SABRINA ','BURGOS','CAPERA','SABRINA_BURGOS@YAHOO.ES','88005'),('2015188009','LORENA ','CAMINOS','LAURA','LOAURACAMINOS@HOTMAIL.ES','88009'),('2015188011','SANDRA MILENA','CARRILLO','SIERRA','SCARRILLO@UNISIMONBOLIVAR.EDU.CO','88011'),('2015188012','HARRISON ','CASTAÑEDA','SANTAMARIA','HARRISONCAST@GMAIL.COM','88012'),('2015188013','DAISE PAOLA','CASTAÑO','ANTOLINEZ','P.CASTANOANTOLINEZ@GMAIL.COM','88013'),('2015188014','MARIA NATALIA','CHAPETON','CASTRO','NATALCD04@YAHOO.ES','88014'),('2015188016','ALEXANDER DAVID','CORTES','ZAMORA','DAVIDCORTESZA@YAHOO.COM','88016'),('2015188017','ANGELICA MILENA','CUADRADO','DORIA','ANGELICACUADRADO@GMAIL.COM','88017'),('2015188018','WILMER JAVIER','CARDENAS','BENITEZ','JAVIERCARDENAS07@GMAIL.COM','88018'),('2015188019','KAREN LISETH','DIAZ','ORTIZ','KRENDIAZORTIZ@GMAIL.COM','88019'),('2015188020','NUBIA PATRICIA','ESTUPIÑAN','SOLER','NUBIEL@HOTMAIL.COM','88020'),('2015188021','MARIA ANGELICA','FACUNDO','DIAZ','ANGELICAFACUNDO@GMAIL.COM','88021'),('2015188022','CATALINA ','GARCIA','ANTE','CATALINAGARCIAANTE@GMAIL.COM','88022'),('2015188023','CAROLINA ','GARZON','BOLIVAR','CAROLINAGARBOL@YAHOO.COM','88023'),('2015188024','SANDRA CAROLINA','GIL','BETANCUR','CAROLINAGIL,PSICO@GMAIL.COM','88024'),('2015188025','CLAUDIA LIZETH','GODOY','MORENO','NUTRICIONISTA.CLIZGOM@GMAIL.COM','88025'),('2015188027','NIDIA ESPERANZA','GONZALEZ','CAMARGO','JULIGONZALEZF13@GMAIL.COM','88027'),('2015188028','JULIAN MAURICIO','GONZALEZ','FORERO','NIDIGON1208@GMAIL.COM','88028'),('2015188029','CATHERINE VIVIANA','GRANADOS','MORERA','VIVIGRANA2@HOTMAIL.COM','88029'),('2015188032','NATHALIA PILAR','GUZMAN','PINZON','CLIPIL8@GMAIL.COM','88032'),('2015188035','JUAN CARLOS','IBARRA','RODRIGUEZ','JUANITOIBAR@GMAIL.COM','88035'),('2015188036','CAMILO ANDRES','IGUA','TORRES','CAMILO.IGUA@OUTLOOK.COM','88036'),('2015188037','JUAN PABLO','JIMENEZ','MONTENEGRO','JUANPJIMENEZM@GMAIL.COM','88037'),('2015188039','LENYS DAYHANA','MACIAS','GOMEZ','LENYSDM@HOTMAIL.COM','88039'),('2015188040','ANDREA CATALINA','MARTIN','ROJAS','ACATALINAMR@GMAIL.COM','88040'),('2015188041','ARNOLD HERNAN','MAYORGA','GUZMAN','ARNOLDMAYORGA81@GMAIL.COM','88041'),('2015188042','WENDY BIBIANA','MENDOZA','CARDENAS','BIBISMC@HOTMAIL.COM','88042'),('2015188043','ILBA YANETH','MEZA','CASTAÑEDA','JMEZACASTANEDA@YAHOO.COM','88043'),('2015188045','LEONOR ','MONCADA','PARDO','LEO.MONCADA@GMAIL.COM','88045'),('2015188046','CAROLINA ','MONTEJO','CHIRIVI','CARMONNUTRICIONISTA@GMAIL.COM','88046'),('2015188050','DIANA CAROLINA','OCHOA','ORDOÑEZ','DCAROLINA8A@GMAIL.COM','88050'),('2015188052','OSCAR FAVIAN','ORTIZ','REYES','DAMASOGARDEL@GMAIL.COM','88052'),('2015188053','LAURA JULIANA','PACHON','RODRIGUEZ','JULIANAS1210@GMAIL.COM','88053'),('2015188055','WILLIAM ANTONIO','PARADA','VARGAS','PSICO.WA.PARADAVARGAS@HOTMAIL.COM','88055'),('2015188056','VIOLETA CLAIRE','PARRA','KLUSMANN','VIOPA2@YAHOO.ES','88056'),('2015188057','SARA RAQUEL','PATARROYO','GRANADOS','SARITAPATARROYO@HOTMAIL.COM','88057'),('2015188058','LAURA ','PEREZ','ALVAREZ','PS.LAURAPEREZALVAREZ@GMAIL.COM','88058'),('2015188059','KAROL VIVIANA','PINEDA','BERMUDEZ','KAROLVIVIANAPINEDAB@GMAIL.COM','88059'),('2015188060','LISSED JHASBEIDY','PIÑEROS','PIÑEROS','SEDJHASBLEIDY@GMAIL.COM','88060'),('2015188062','ADRIANA COLOMBIA','QUICENO','ABAUNZA','ADRIANA.COLOMBIA18@GMAIL.COM','88062'),('2015188063','FLOR MARCELA','RAMOS','LOPEZ','FLORMARALO@GMAIL.COM','88063'),('2015188066','LUZ ADRIANA','RICO','MORENO','LAZURIANA@GMAIL.COM','88066'),('2015188067','NURY CONSTANZA','RIVAS','GONZALEZ','NURYRIVASG@YAHOO.COM','88067'),('2015188068','FRANCY MAGNOLIA','RODRIGUEZ','CAMACHO','FRAMAROCA@GMAIL.COM','88068'),('2015188070','ANDREA DEL PILAR','RODRIGUEZ','ROJAS','T.SANDREARODRIGUEZ@GMAIL.COM','88070'),('2015188072','RAUL RODOLFO','ROMERO','BERNAL','RAULRODOLFOROMEROB@GMAIL.COM','88072'),('2015188073','JEIMMY KATERINNE','RUBIO','LEAL','COORDICOMUNITARIA@GMAIL.COM','88073'),('2015188074','CLAUDIA MILENA','RUIZ','CEPEDA','MILERUIZ0530@GMAIL.COM','88074'),('2015188075','JOSE MIGUEL','SEGURA','GUTIERREZ','JOSEMIELSEGURA@GMAIL.COM','88075'),('2015188076','ELVER CAMILO','SEPULVEDA','RONDON','MRCAMILO@HOTMAIL.COM','88076'),('2015188077','CATALINA ','SERNA','GONZALEZ','CATASERNAGONZALEZ@YAHOO.ES','88077'),('2015188079','SANDRA MILENA','SILVA','PEREZ','SANDRASILVA49@YAHOO.COM','88079'),('2015188081','SINDY JOHANNA','TORRES','ALVAREZ','SINDYTO89@GMAIL.COM','88081'),('2015188083','MARIA FERNANDA','VALBUENA','BATANERO','MAFEVALBA@HOTMAIL.COM','88083'),('2015188084','PEDRO IVAN','VALENZUELA','OJEDA','PSIVANVALENZUELA@GMAIL.COM','88084'),('2015188085','FRANCY MIREYA','VELA','NIÑO','FMVELANINO@YAHOO.ES','88085'),('2015188086','MARLY ','VERA','BARRIOS','MARLYVERA@HOTMAIL.COM','88086'),('2015188087','MARITZA ','VILLAMIZAR','DIAZ','MARITZAVD@GMAIL.COM','88087'),('2015188088','BLANCA INES','ZAMUDIO','LEGUIZAMON','BLANCAIZA@HOTMAIL.COM','88088'),('2015188089','DIANA PATRICIA','AGUDELO','FRANCO','MARYAGRA1@HOTMAIL.COM','88089'),('2015188090','ADRIANA ELISA','CORREA','THIAN','adrianaecthian@gmail.com','88090'),('2015188092','CAMILO ANDRES','LOVERA','PINZON','MEMILEPU@YAHOO.COM','88092'),('2015188093','HELENA PATRICIA','MARIÑO','GALEANO','HELEPATTY@YAHOO.ES','88093'),('2015188094','VIVIAN JOHANA','MUÑOZ','RODRIGUEZ','VMUNOZ@SDMUJER.GOV.CO','88094'),('2015288001','LISULY PAOLA','ALFONSO','JIMENEZ','LIPALJI@HOTMAIL.COM','88001'),('2015288003','FRANCI CAMILA','AMEZQUITA','TORREAS','camilatorres.0311@gmail.com','88003'),('2015288006','ESPERANZA ','AREVALO','BORRERO','arevalo.esperanza@gmail.com','88006'),('2015288010','XIMENA ','BENITEZ','CARDENAS','mena1607@gmail.com','88010'),('2015288011','JUAN JOSE','BERNAL','GUZMAN','jotajose@gmail.com','88011'),('2015288012','MARIA FERNANDA','BOJACA','ALDANA','mafebojaca@gmail.com','88012'),('2015288013','MONICA ','BOLAÑOS','AGUILAR','monikbolanos@hotmail.com','88013'),('2015288015','DAVID LEONARDO','CAMARGO','ESCOLAR','DAVIDCAMARGOESCOLAR@GMAIL.COM','88015'),('2015288016','INGRITH ROCIO','CAMELO','LOPEZ','campesinaandina@gmail.com','88016'),('2015288018','EDWARD ARMANDO','CARDOZO','CAMELO','eacc012345@gmail.com','88018'),('2015288019','NELSON ','CARRILLO','RANGEL','nacar51@yahoo.es','88019'),('2015288020','LIDY NATALIA','CASTILLO','VELASCO','lncastillov@gmail.com','88020'),('2015288023','FREDDY LUIS','CORREA','ECHEVERRIA','FRECOCHE@GMAIL.COM','88023'),('2015288024','BIBIANA DELPILAR','CUADRADO','SUAREZ','bibiana581@gmail.com','88024'),('2015288025','CLAUDIA LORENA','CUASPA','MELENDEZ','lorenclaume@gmail.com','88025'),('2015288027','LUZ MYRIAM','DIAZ','PARDO','LUZMDIAZPARDO@GMAIL.COM','88027'),('2015288029','LEIDY MAYERLY','ESQUIVEL','VERGEL','vergel_leidy.1989@hotmail.com','88029'),('2015288030','LINA MARCELA','FARFAN','RODRIGUEZ','linamarcelafarfan@hotmail.com','88030'),('2015288031','JESSICA TATIANA','FERNANDEZ','ORREGO','tati_2306@hotmail.com','88031'),('2015288032','LUIS CARLOS','GARCIA','PERDOMO','LCGARCIAP@PEDAGOGICA.EDU.CO','88032'),('2015288033','RICARDO ANDRES','GARCIA','SAAVEDRA','RAGSAA@HOTMAIL.COM','88033'),('2015288034','YAMILETH ','GONZALEZ','CANDELO','yamil258@hotmail.com','88034'),('2015288036','LUISA FERNANDA','GUTIERREZ','FUENMAYOR','luisafono@hotmail.com','88036'),('2015288037','RONALD ','GUTIERREZ','OSORIO','RONTUGSO27@HOTMAIL.COM','88037'),('2015288038','PAOLA ','HERNANDEZ','LILIANA','LILIPAO121213@GMAIL.COM','88038'),('2015288039','MARIA ANDREA','HERNANDEZ','BALLESTEROS','MAHB.1986@GMAIL.COM','88039'),('2015288041','JENNIFER MARITZA','HERRAN','DUARTE','jenherran@gmail.com','88041'),('2015288042','LORENA ','HORMAZA','LADY','lololorito@hotmail.com','88042'),('2015288043','DIEGO ENRIQUE','INFANTE','GONZALEZ','DIEGO1549@HOTMAIL.COM','88043'),('2015288044','DELIMIRO RAMON','JAIME','PACHECO','delimiro.jaime@p.correosanbartolo.edu.co','88044'),('2015288045','LEYDI AURORA','JIMENEZ','SANCHEZ','LEYAURJISA@HOTMAIL.COM','88045'),('2015288048','MATILDE ','LOPEZ','MENESES','jfgmaty@gmail.com','88048'),('2015288049','ADRIANA ','LOPEZ','NAÑEZ','LANALOPEZITA@GMAIL.COM','88049'),('2015288050','ADRIANA ','LOZANO','PACHECO','alozano@hotmail.com','88050'),('2015288054','TATIANA CAROLINA','MENDOZA','MELO','TATIANACAROLINAMENDOZA@GMAIL.COM','88054'),('2015288055','ALEXANDER ','MOJICA','RUIZ','mojicaruiz@gmail.com','88055'),('2015288057','CAMILO ANDRES','MORENO','HERNANDEZ','HERMOANCA@GMAIL.COM','88057'),('2015288058','INGRID JISSEL','MORENO','ORTIZ','ingjis46@hotmail.com','88058'),('2015288059','STELLA DEL PILAR','MURCIA','MUÑOZ','STELLAR2M@GMAIL.COM','88059'),('2015288060','ALFONSO ','MURILLO','CARLOS','CMURILLO18@GMAIL.COM','88060'),('2015288061','DAISSY VIVIANA','PAEZ','MONROY','VIVIEDUESPECIAL@GMAIL.COM','88061'),('2015288062','CARLOS ENRIQUE','PARRA','GUERRERO','SOCIOPEDAGOGO@GMAIL.COM','88062'),('2015288064','DIEGO FERNANDO','PENAGOS','BARRERA','DIEGOPENAGOS@HOTMAIL.COM','88064'),('2015288065','DAVID ','PLAZA','GUAMANGA','DPLAZAG27@YAHOO.ES','88065'),('2015288066','DERLY ZULELLY','PRADO','TELLEZ','DERLYZPRADO@GMAIL.COM','88066'),('2015288067','JULIE VIVIANA','QUIMBAYA','CALDERON','YUVI68@YAHOO.ES','88067'),('2015288068','NOLMY ','QUIÑONES','VEGA','NOLMYSOFIA@GMAIL.COM','88068'),('2015288070','RICARDO ','RODRIGUEZ','JOSE','JOSERICARO@GMAIL.COM','88070'),('2015288071','PATRICIA ','RODRIGUEZ','SONIA','SONIRODRIGUEZ01@HOTMAIL.COM','88071'),('2015288072','HECTOR HAROLD','RODRIGUEZ','NAVARRO','HECTOR_RRODRIGUEZ@HOTMAIL.COM','88072'),('2015288074','DIANA KATERINE','ROJAS','MORA','DIANAKROJAS1@HOTMAIL.COM','88074'),('2015288076','SHADY IBETH','ROZO','ROJAS','SHADYROZO@GMAIL.COM','88076'),('2015288077','LEIDY CAROLINA','RUIZ','HERRERA','CARORUHE@GMAIL.COM','88077'),('2015288079','LEONARDO ','SUAREZ','ARANDA','MALACAY@GMAIL.COM','88079'),('2015288080','LEIDYS MARIA','TEJEDA','MOLINA','LETEJEMO@GMAIL.COM','88080'),('2015288082','ALEXIS FERNAN','URREA','ROMERO','alexis.urrea@gmail.com','88082'),('2015288084','WENDY YOLANY','VERA','TORRES','WENYILL_2@HOTMAIL.COM','88084'),('2015288085','GLORIA MERCEDES','VERGARA','GIRALDO','GOGLIS40@GMAIL.COM','88085'),('2015288086','GILBERTO ALEJANDRO','VILLA','AYALA','GAVILLA11@GMAIL.COM','88086'),('2015288087','MONICA LILIANA','ALVAREZ','MATEUZ','mhonika4@hotmail.com','88087'),('2015288088','LAURA VIVIANA','GARCIA','MARTINEZ','lauragarcia1988@gmail.com','88088'),('2015288090','ANDRES FELIPE','VALENCIA','REYES','ing.andresfelipe0205@gmail.com','88090'),('2016188003','LILIVET CONSTANZA','ACERO','ZAMBRANO','lilica16_70 @hotmail.com','88003'),('2016188004','PAOLA ANDREA','ACOSTA','ZAMORA','paolaacosta111@gmail.com;paoacosta1@hotmail.es','88004'),('2016188005','FRANCY ASTRID','ALVAREZ','LOZANO','falvarez3176@hotmail.com;falvarez3117@gmail.com','88005'),('2016188006','SHIRLEY ','AMADO','AMADO','psiamado@hotmail.com;shirlyamado54@gmail.com','88006'),('2016188007','CLAUDIA ELIZABETH','APRAEZ','ACOSTA','claudia.apraez@gmail.com;klauss411@hotmail.com','88007'),('2016188008','LEIDY JOHANA','ARCE','GUZMAN','JHOANA.ARCE@LIVE.COM;JHOANAARCE@GMAIL.COM','88008'),('2016188011','MARIA ','BERNAL','AURA','b.auramaria@yahoo.es','88011'),('2016188012','CINDY CRISTAL','BOHORQUEZ','BOHORQUEZ','kristal1024@gmail.com;kristal1024@hotmail.com','88012'),('2016188013','MONICA JUDITH','BOHORQUEZ','VILLATE','monicabohorquez4645@gmail.com','88013'),('2016188014','GERMAN ANDRES','BONILLA','JIMENEZ','gabonilla82@hotmail.com;gabonilla82@gmail.com','88014'),('2016188016','JENSY HASBLEIDY','CALDERON','OBANDO','Jensita7@yahoo.com;Jensita7@hotmail.com','88016'),('2016188019','LUIS CARLOS','CARRILLO','BOGOTA','luiscarribo@gmail.com','88019'),('2016188020','MARCELA INES','CASALINS','CUERVO','mar.cielo.07@hotmail.com','88020'),('2016188021','GIOVANNA ALEJANDRA','CASTAÑEDA','LEON','alejandrac1307@hotmail.com','88021'),('2016188022','ELIANA ','CEBALLOS','GIRALDO','elianaceballosgiraldo@gmail.com;elice28@hotmail.com','88022'),('2016188023','AZUCENA DEL PILAR','CORTES','CELY','azpi124@hotmail.com;azulpurpurapili@gmail.com','88023'),('2016188024','NIDIA PATRICIA','CUADROS','TENJO','patriciacuadros0@gmail.com;patycuadros@hotmail.com','88024'),('2016188025','RAFAEL ANTONIO','DAZA','BARBERY','rafaeldaza15@yahoo.es','88025'),('2016188026','YOHANNA PAOLA','DE LA HORTUA','QUINTERO','YOHANCESS@HOTMAIL.COM','88026'),('2016188027','CAROLINA ','DELGADO','ANDREA','ancade14-@hotmail.com','88027'),('2016188028','LIANA KATHERINE','DEVIA','OLAYA','LIANAKATHERINE@HOTMAIL.COM','88028'),('2016188029','OFIR ENEYDA','DURAN','MOJICA','Ofirduranm@hotmail.com','88029'),('2016188030','JOSE ARETH','ESTEVEZ','CEBALLOS','jaestevezc@gmail.com;neptuno88@gmail.com','88030'),('2016188031','LIGIA ESTHER','FLOREZ','BEJARANO','florezligia8@gmail.com;ligiaflorez@yahoo.es','88031'),('2016188033','GERMAN ','GAITAN','PEDRAZA','G1989ER@HOTMAIL.COM;alumnoupn@hotmail.com','88033'),('2016188034','YENIFER LORENA','GALLO','MONTOYA','YLGALLOMONTOYA@GMAIL.COM','88034'),('2016188035','YESICA CAROLINA','GARCIA','DURAN','YESICA.GARCIA.DURAN@HOTMAIL.COM','88035'),('2016188036','MARCO ELIAS','GARCIA','RIAÑO','marcogarcia73@hotmail.com','88036'),('2016188037','KAREN MELISSA','GOMEZ','ACOSTA','azulita227@hotmail.com;melissagomezac@gmail.com','88037'),('2016188038','LUZ FABIOLA','GOMEZ','CASTIBLANCO','light211@hotmail.com','88038'),('2016188041','CARLOS JULIO','GONGORA','RONCANCIO','gongoracarlos1968@gmail.com','88041'),('2016188042','DIEGO ARMANDO','GONZALEZ','CASTRO','diegofear16@hotmail.com;ycastillobaquero@gmail.com','88042'),('2016188043','LILIAN MARCELA','GONZALEZ','ORTEGA','MARCEG.O@HOTMAIL.COM','88043'),('2016188044','ANTONIO ','GUERRERO','MARCO','lujurio3@gmail.com','88044'),('2016188045','CAROLINA ','GUERRERO','REYES','carolaguerreror@gmail.com;cguerreror@pedagogica.edu.co','88045'),('2016188046','NAYIBE ','HERNANDEZ','VALERO','nayibeh01@yahoo.es','88046'),('2016188047','ANA MARIA','JIMENEZ','CUARTAS','anifugy@hotmail.com','88047'),('2016188048','ORIANA MARIA','LA ROTTA','AMAYA','SERLINSAR@GMAIL.COM','88048'),('2016188049','SERGIO ','LINARES','SARMIENTO','SERLINSAR@GMAIL.COM','88049'),('2016188050','MYRIAM ','LOMBANA','SOLANO','myriaml_1970@hotmail.com','88050'),('2016188051','LIZ STEFANY','LOPEZ','OSPINA','lizlopez_ospina@hotmail.com;stefanylo456@gmail.com','88051'),('2016188053','GUSTAVO ADOLFO','MALAGON','FORERO','GUSTAVOMALAGONF@GMAIL.COM','88053'),('2016188054','MARCIA PAOLA','MARQUEZ','CETINA','marciapaolamc@gmail.com;m.marquez@colegiolasamericas.edu.co','88054'),('2016188055','NELDA YAMILY','MEDINA','ORDOÑEZ','yamilymedina_o@hotmail.com','88055'),('2016188056','MÓNICA ALEXANDRA','MENDOZA','MOLINA','monicam65@hotmail.com','88056'),('2016188059',' ','MOLINA','MYRIAM','myriammolina2000@yahoo.es','88059'),('2016188060','LUIS GUILLERMO','MONSALVE','JIMENEZ','lmonsalve28@hotmail.com;lmonsalve.28@gmail.com','88060'),('2016188061','AHYRA DILBANA','MORA','OLARTE','ahyradil@gmail.com','88061'),('2016188062','INGRID RUTH','MORALES','MORALES','ingridruthm@gmail.com','88062'),('2016188063','MARYURY YURLEY','MORALES','PACHON','maryury.ymp@gmal.com','88063'),('2016188064','ALEXSANDER ','MORENO','CARRILLO','alesxandermoreno@hotmail.com','88064'),('2016188065','LEONARDO ','MORENO','REYES','amanita1977@hotmail.com','88065'),('2016188067','ALDEMAR ','MORENO','YOSA','yosaps@gmail.com','88067'),('2016188068','JOHN JAIME','MORERA','GOMEZ','jjmorera@hotmail.com;carmenhelen_81@yahoo.es','88068'),('2016188069','JENNY MILDRED','MUÑOZ','RODRIGUEZ','jenny_mildred@hotmail.com; tcrea.teatroydanza@hotmail.com','88069'),('2016188070','LINA KATERINA','NARVAEZ','BELLO','likanabe@hotmail.com','88070'),('2016188071','JOSE ALDEMAR','NEUTA','FERNANDEZ','joseneutaf@gmail.com','88071'),('2016188072','CARMEN ROSA','NORIEGA','LAVERDE','rocanor@gmail.com;rocanor1@hotmail.com','88072'),('2016188073','CAROLINA ','OBANDO','PAZ','carolina.obando@gmail.com;caritoop@hotmail.com','88073'),('2016188074','IRIS ARIADNA','ORDOÑEZ','ARIAS','irisaoa@gmail.com;iris.ordonez@uniminuto.edu','88074'),('2016188075','JESUS ALBERTO','ORTIZ','NARVAEZ','jebeto14@yahoo.com;joseneutaf@hotmail.com','88075'),('2016188076','SILVIA HELENA','PACHECO','GARCIA','silvispacheco@gmail.com','88076'),('2016188078','ADRIANA CONSUELO','PALENCIA','GALVIS','ADRIPALG@HOTMAIL.COM;ACPALENCIA@REDP. EDU .CO','88078'),('2016188079','YAQUELINE ','PARRA','BUITRAGO','yaqueline.danza@gmail.com','88079'),('2016188081','RODRIGO ','PARRA','SANCHEZ','proferodrigodibujo@gmail.com','88081'),('2016188083','SILVIA ALEJANDRA','PENAGOS','TELLEZ','ARTEMISIA.05@GMAIL.COM;SPENAGOS@SDIS.GOV.CO','88083'),('2016188084','PAOLA ANDREA','PEREZ','GIL','muisca.2012@gmail.com;hakuna.127@hotmail.com ','88084'),('2016188085','CLAUDIA YANETH','PLAZAS','HERNANDEZ','claudiayplazas@hotmail.com','88085'),('2016188087','LUB JANNETH','QUINTERO','CAMACHO','ljquinteroc@hotmail.com','88087'),('2016188088','HELLMAN LEONEL','RAMIREZ','ARANGO','hellman -74@hotmail.com','88088'),('2016188089','WALTER ORLANDO','RAMIREZ','ARDILA','walter.ramirez1223@gmail.com','88089'),('2016188090','BLANCA CECILIA','RAMIREZ','MARTINEZ','RAMABLACE@GMAIL.COM','88090'),('2016188091','CARMEN JANNETH','REINA','PRIETO','jannethreina@gmail.com;cjreina@pedagogica.edu.co','88091'),('2016188092','ELIANA MARCELA','REINOSO','SABOGAL','marcel-1530@hotmail.com;elianamarcelareinososabogal@gmail.com','88092'),('2016188094','SANDRA MILENA','RINCON','CASTILLO','sandramr2730@gmail.com;sandramr2730@hotmail.com','88094'),('2016188095','JULIETH VANESSA','RINCON','SANABRIA','juvarisa8809@gmail.com','88095'),('2016188096','JESÚS IVÁN','RODRIGUEZ','BUENHOMBRE','goodman_ex@yahoo.com;alegnitajesus@gmail.com','88096'),('2016188098','ANGELA ANDREA','RODRIGUEZ','VILLAMIL','angerovi@gmail.com;angelitarodriguezv@hotmail.com','88098'),('2016188099','ANDREA KATHERINE','ROJAS','ROJAS','andrea.krojas@hotmail.com;andrea.rojas@epe.edu.co','88099'),('2016188103','DIANA CAROLINA','RUIZ','MATALLANA','di.ca.ru.06@gmail.com','88103'),('2016188105','WALTER JULIO','SABOGAL','UMAÑA','sabogalwalter777@gmail.com','88105'),('2016188106','NANCY PAOLA','SALAZAR','MURILLO','lauris09@hotmail.es;paolasalaz11@gmail.com','88106'),('2016188107','NICOLE ESPERANZA','SANDOVAL','HERRERA','nesahe@gmail.com;nesandovalh@hotmail.com','88107'),('2016188108','ANYELA MARCELA','SIERRA','DIAZ','anyelasidi89@gmail.com;anyelasidi88hotmail.com','88108'),('2016188109','NOHELIA ','TELLEZ','SONIA','tellezsonia@gmail.com','88109'),('2016188110','SANDRA PATRICIA','TORRES','CABIATIVA','shannitorress@hotmail.com','88110'),('2016188111','LEIDI MAYID','TOVAR','HERNANDEZ','mayitomayid@hotmail.com','88111'),('2016188114','YASMIN ROCIO','TRIVIÑO','POVEDA','NIMSAY0115@HOTMAIL.COM','88114'),('2016188116','GONZALO ','VALDES','MARTINEZ','gvaldes92@yahoo.es;gonzalovama1989@gmail.com','88116'),('2016188117','LOREN KATERINE','VARGAS','HERRERA','lorwoman_75@hotmail.com;lorwoman_75@outlook.es','88117'),('2016188118','LISETH PAOLA','VEGA','ROJAS','veroli.vega@gmail.com;veroli.seth_8@hotmail.com','88118'),('2016188122','DIANA MARCELA','ALVARADO','GONZALEZ','marshe.laalvarado@gmail.com;marcela.alvaradog@hotmail.com','88122'),('2016188123','LUZ ADRIANA','BENITEZ','TURRIAGO','adri_benitez06@hotmail.com ','88123'),('2016188124','JOSE IGNACIO','CASTRO','ORJUELA','Josecastro14@hotmail.es;jji.castro@uniandes.edu.co','88124'),('2016188125','PATRICIA DEL CARMEN','LUENGAS','RAPALINO','PATRICIAL21@HOTMAIL.COM','88125'),('2016188126','WILLIAM MAURICIO','PUENTES','GONZALEZ','profesormauriciopuentes@gmail.com','88126'),('2016188127','YULI ','ZAPATA','BALANTA','yulibbb@yahoo.es;yulizazapata@hotmail.com','88127'),('2016188128','YEISON SMITH','LAGOS','VELASCO','YESLAGOS1985@HOTMAIL.COM','88128'),('2016188130','NATHALYA ALEJANDRA','LUQUE','RODRIGUEZ','NATYALUQUER@HOTMAIL.COM','88130'),('2016188131','JHONNYS ALBERTO','MARBELLO','YEPES','MARBELLO415@HOTMAIL.COM','88131'),('2016188133','ANGELA MARIA','OTALORA','NASAYO','AMON2383@GMAIL.COM','88133'),('2016188134','ANA MILENA','PINZON','TOVAR','MILEMIMUYE@HOTMAIL.COM','88134'),('2016188135','PAOLA ANDREA','REYES','CADENA','PAOLAREYES.C85@GMAIL.COM','88135'),('2016188136','LAURA CATALINA','ROA','SAYAGO','CATAROA19@GMAIL.COM','88136'),('2016188137','JENNY PAOLA','SOCHA','HERNANDEZ','PAOLASCHZ@GMAIL.COM','88137'),('2016188138','DENNIS ALEJANDRO','TASSO','CARDENAS','CIRCONTRAVIA@GMAIL.COM','88138');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-27  4:46:33
