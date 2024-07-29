--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: province; Type: TABLE; Schema: public; Owner: maxclaims
--

CREATE TABLE public.province (
    name text,
    code text NOT NULL,
    country character varying(2) DEFAULT 'CA'::character varying NOT NULL
);


ALTER TABLE public.province OWNER TO maxclaims;

--
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: maxclaims
--

COPY public.province (name, code, country) FROM stdin;
Andorra la Vella	07	AD
Canillo	02	AD
Encamp	03	AD
Escaldes-Engordany	08	AD
La Massana	04	AD
Ordino	05	AD
Sant Julia de Loria	06	AD
'Ajman	AJ	AE
Abu Zaby	AZ	AE
Salyan	SAL	AZ
Samaxi	SMI	AZ
Samkir	SKR	AZ
Hope Town	HT	BS
Long Island	LI	BS
South Eleuthera	SE	BS
Heilongjiang	HL	CN
Henan	HA	CN
San Pedro de Macoris	23	DO
Pohjanmaa	12	FI
Pohjois-Karjala	13	FI
Pohjois-Pohjanmaa	14	FI
Pohjois-Savo	15	FI
Satakunta	17	FI
Uusimaa	18	FI
Varsinais-Suomi	19	FI
Central	C	FJ
Eastern	E	FJ
Northern	N	FJ
Western	W	FJ
Chuuk	TRK	FM
Kosrae	KSA	FM
Pohnpei	PNI	FM
Yap	YAP	FM
Auvergne-Rhone-Alpes	ARA	FR
Bourgogne-Franche-Comte	BFC	FR
Bretagne	BRE	FR
Centre-Val de Loire	CVL	FR
Corse	COR	FR
Grand-Est	GES	FR
Hauts-de-France	HDF	FR
Ile-de-France	IDF	FR
Normandie	NOR	FR
Occitanie	OCC	FR
Bissau	BS	GW
Gabu	GA	GW
Atlantida	AT	HN
Goa	GA	IN
Gujarat	GJ	IN
Okinawa	47	JP
Casablanca-Settat	06	MA
Govi-Altay	065	MN
Hovd	043	MN
Omnogovi	053	MN
Orhon	035	MN
Ovorhangay	055	MN
Cabo Delgado	P	MZ
Gaza	G	MZ
Inhambane	I	MZ
Manica	B	MZ
Darien	5	PA
Herrera	6	PA
Los Santos	7	PA
Ngobe-Bugle	NB	PA
Panama	8	PA
Veraguas	9	PA
Amazonas	AMA	PE
Ancash	ANC	PE
Apurimac	APU	PE
Bethlehem	BTH	PS
Gaza	GZA	PS
Hebron	HBN	PS
Jenin	JEN	PS
Jericho and Al Aghwar	JRH	PS
Jerusalem	JEM	PS
Nablus	NBS	PS
Qalqilya	QQA	PS
Ramallah	RBH	PS
Salfit	SLT	PS
Tubas	TBS	PS
Tulkarm	TKM	PS
Aveiro	01	PT
Beja	02	PT
Braga	03	PT
Braganca	04	PT
Castelo Branco	05	PT
Coimbra	06	PT
Evora	07	PT
Faro	08	PT
Guarda	09	PT
Leiria	10	PT
Lisboa	11	PT
Portalegre	12	PT
Porto	13	PT
Regiao Autonoma da Madeira	30	PT
Regiao Autonoma dos Acores	20	PT
Santarem	14	PT
Setubal	15	PT
Viana do Castelo	16	PT
Vila Real	17	PT
Viseu	18	PT
Airai	004	PW
Kayangel	100	PW
Koror	150	PW
Melekeok	212	PW
Ngardmau	222	PW
Alto Paraguay	16	PY
Alto Parana	10	PY
Amambay	13	PY
Asuncion	ASU	PY
Boqueron	19	PY
Caaguazu	5	PY
Caazapa	6	PY
Canindeyu	14	PY
Central	11	PY
Concepcion	1	PY
Cordillera	3	PY
Guaira	4	PY
Itapua	7	PY
Misiones	8	PY
Neembucu	12	PY
Paraguari	9	PY
Presidente Hayes	15	PY
San Pedro	2	PY
Ad Dawhah	DA	QA
Al Khawr wa adh Dhakhirah	KH	QA
Al Wakrah	WA	QA
Ar Rayyan	RA	QA
Ash Shamal	MS	QA
Az Za'ayin	ZA	QA
Umm Salal	US	QA
Alba	AB	RO
Arad	AR	RO
Arges	AG	RO
Bacau	BC	RO
Polzela	173	SI
Postojna	094	SI
Guera	GR	TD
Hadjer Lamis	HL	TD
Logone-Occidental	LO	TD
Mpigi	106	UG
Mukono	108	UG
Nwoya	328	UG
Anguilla	Anguilla	AI
Eastern District	Eastern District	AS
Western District	Western District	AS
Aruba	Aruba	AW
Eckeroe	Eckeroe	AX
Finstroem	Finstroem	AX
Hammarland	Hammarland	AX
Jomala	Jomala	AX
Mariehamn	Mariehamn	AX
Saltvik	Saltvik	AX
Saint Barthelemy	Saint Barthelemy	BL
Hamilton	Hamilton	BM
Saint George	Saint George	BM
New Providence	New Providence	BS
Cocos (Keeling) Islands	Cocos (Keeling) Islands	CC
Cook Islands	Cook Islands	CK
Curacao	Curacao	CW
Christmas Island	Christmas Island	CX
Western Sahara	Western Sahara	EH
Falkland Islands (Malvinas)	Falkland Islands (Malvinas)	FK
Eysturoy	Eysturoy	FO
Nordoyar	Nordoyar	FO
Streymoy	Streymoy	FO
Suduroy	Suduroy	FO
Vagar	Vagar	FO
Guyane	Guyane	GF
Guernsey	Guernsey	GG
Gibraltar	Gibraltar	GI
Avannaata Kommunia	Avannaata Kommunia	GL
Kommune Qeqertalik	Kommune Qeqertalik	GL
Guadeloupe	Guadeloupe	GP
South Georgia and the South Sandwich Islands	South Georgia and the South Sandwich Islands	GS
Agat	Agat	GU
Asan-Maina	Asan-Maina	GU
Barrigada	Barrigada	GU
Chalan Pago-Ordot	Chalan Pago-Ordot	GU
Dededo	Dededo	GU
Hagatna	Hagatna	GU
Mangilao	Mangilao	GU
Mongmong-Toto-Maite	Mongmong-Toto-Maite	GU
Piti	Piti	GU
Santa Rita	Santa Rita	GU
Sinajana	Sinajana	GU
Talofofo	Talofofo	GU
Tamuning-Tumon-Harmon	Tamuning-Tumon-Harmon	GU
Yigo	Yigo	GU
Yona	Yona	GU
Hong Kong	Hong Kong	HK
Isle of Man	Isle of Man	IM
British Indian Ocean Territory	British Indian Ocean Territory	IO
Jersey	Jersey	JE
Cayman Islands	Cayman Islands	KY
Saint Martin (French Part)	Saint Martin (French Part)	MF
Macao	Macao	MO
Northern Mariana Islands	Northern Mariana Islands	MP
Martinique	Martinique	MQ
Saint Anthony	Saint Anthony	MS
Saint Peter	Saint Peter	MS
Province Nord	Province Nord	NC
Province Sud	Province Sud	NC
Norfolk Island	Norfolk Island	NF
Niue	Niue	NU
Iles Marquises	Iles Marquises	PF
Iles Sous-le-Vent	Iles Sous-le-Vent	PF
Iles Tuamotu-Gambier	Iles Tuamotu-Gambier	PF
Iles du Vent	Iles du Vent	PF
Saint Pierre and Miquelon	Saint Pierre and Miquelon	PM
Pitcairn	Pitcairn	PN
Adjuntas	Adjuntas	PR
Aguada	Aguada	PR
Aguadilla	Aguadilla	PR
Aguas Buenas	Aguas Buenas	PR
Aibonito	Aibonito	PR
Anasco	Anasco	PR
Arecibo	Arecibo	PR
Arroyo	Arroyo	PR
Acoua	Acoua	YT
Phu Tho	68	VN
Phu Yen	32	VN
Quang Binh	24	VN
Quang Nam	27	VN
Quang Ngai	29	VN
Quang Tri	25	VN
Barceloneta	Barceloneta	PR
Barranquitas	Barranquitas	PR
Bayamon	Bayamon	PR
Cabo Rojo	Cabo Rojo	PR
Caguas	Caguas	PR
Camuy	Camuy	PR
Canovanas	Canovanas	PR
Carolina	Carolina	PR
Catano	Catano	PR
Cayey	Cayey	PR
Ceiba	Ceiba	PR
Ciales	Ciales	PR
Cidra	Cidra	PR
Coamo	Coamo	PR
Comerio	Comerio	PR
Corozal	Corozal	PR
Culebra	Culebra	PR
Dorado	Dorado	PR
Fajardo	Fajardo	PR
Florida	Florida	PR
Guanica	Guanica	PR
Guayama	Guayama	PR
Guayanilla	Guayanilla	PR
Guaynabo	Guaynabo	PR
Gurabo	Gurabo	PR
Hatillo	Hatillo	PR
Hormigueros	Hormigueros	PR
Humacao	Humacao	PR
Isabela	Isabela	PR
Juana Diaz	Juana Diaz	PR
Lajas	Lajas	PR
Lares	Lares	PR
Las Marias	Las Marias	PR
Las Piedras	Las Piedras	PR
Loiza	Loiza	PR
Luquillo	Luquillo	PR
Manati	Manati	PR
Maricao	Maricao	PR
Mayaguez	Mayaguez	PR
Moca	Moca	PR
Morovis	Morovis	PR
Municipio de Jayuya	Municipio de Jayuya	PR
Municipio de Juncos	Municipio de Juncos	PR
Naguabo	Naguabo	PR
Naranjito	Naranjito	PR
Patillas	Patillas	PR
Penuelas	Penuelas	PR
Ponce	Ponce	PR
Quebradillas	Quebradillas	PR
Rincon	Rincon	PR
Rio Grande	Rio Grande	PR
Sabana Grande	Sabana Grande	PR
Salinas	Salinas	PR
San German	San German	PR
San Juan	San Juan	PR
San Lorenzo	San Lorenzo	PR
San Sebastian	San Sebastian	PR
Santa Isabel Municipio	Santa Isabel Municipio	PR
Toa Alta	Toa Alta	PR
Toa Baja	Toa Baja	PR
Trujillo Alto	Trujillo Alto	PR
Utuado	Utuado	PR
Vega Alta	Vega Alta	PR
Vega Baja	Vega Baja	PR
Vieques	Vieques	PR
Villalba	Villalba	PR
Yabucoa	Yabucoa	PR
Yauco	Yauco	PR
Reunion	Reunion	RE
Singapore	Singapore	SG
Svalbard and Jan Mayen	Svalbard and Jan Mayen	SJ
Sint Maarten (Dutch Part)	Sint Maarten (Dutch Part)	SX
Turks and Caicos Islands	Turks and Caicos Islands	TC
French Southern Territories	French Southern Territories	TF
Tokelau	Tokelau	TK
Vatican City	Vatican City	VA
Virgin Islands, British	Virgin Islands, British	VG
Virgin Islands, U.S.	Virgin Islands, U.S.	VI
Bandrele	Bandrele	YT
Mamoudzou	Mamoudzou	YT
Mtsamboro	Mtsamboro	YT
Ouangani	Ouangani	YT
Sada	Sada	YT
Tsingoni	Tsingoni	YT
Al Fujayrah	FU	AE
Ash Shariqah	SH	AE
Dubayy	DU	AE
Ra's al Khaymah	RK	AE
Umm al Qaywayn	UQ	AE
Baghlan	BGL	AF
Balkh	BAL	AF
Bamyan	BAM	AF
Faryab	FYB	AF
Helmand	HEL	AF
Herat	HER	AF
Kabul	KAB	AF
Kandahar	KAN	AF
Khost	KHO	AF
Kunduz	KDZ	AF
Logar	LOG	AF
Nangarhar	NAN	AF
Nimroz	NIM	AF
Paktika	PKA	AF
Paktiya	PIA	AF
Parwan	PAR	AF
Takhar	TAK	AF
Uruzgan	URU	AF
Redonda	11	AG
Saint George	03	AG
Saint John	04	AG
Saint Mary	05	AG
Saint Paul	06	AG
Saint Peter	07	AG
Saint Philip	08	AG
Berat	01	AL
Diber	09	AL
Durres	02	AL
Elbasan	03	AL
Fier	04	AL
Gjirokaster	05	AL
Korce	06	AL
Kukes	07	AL
Lezhe	08	AL
Shkoder	10	AL
Tirane	11	AL
Vlore	12	AL
Aragacotn	AG	AM
Ararat	AR	AM
Armavir	AV	AM
Erevan	ER	AM
Gegark'unik'	GR	AM
Kotayk'	KT	AM
Lori	LO	AM
Sirak	SH	AM
Syunik'	SU	AM
Tavus	TV	AM
Vayoc Jor	VD	AM
Bengo	BGO	AO
Benguela	BGU	AO
Bie	BIE	AO
Cabinda	CAB	AO
Cunene	CNN	AO
Huambo	HUA	AO
Huila	HUI	AO
Kuando Kubango	CCU	AO
Kwanza Norte	CNO	AO
Kwanza Sul	CUS	AO
Luanda	LUA	AO
Lunda Norte	LNO	AO
Lunda Sul	LSU	AO
Malange	MAL	AO
Moxico	MOX	AO
Namibe	NAM	AO
Uige	UIG	AO
Zaire	ZAI	AO
Buenos Aires	B	AR
Catamarca	K	AR
Chaco	H	AR
Chubut	U	AR
Ciudad Autonoma de Buenos Aires	C	AR
Cordoba	X	AR
Corrientes	W	AR
Entre Rios	E	AR
Formosa	P	AR
Jujuy	Y	AR
La Pampa	L	AR
La Rioja	F	AR
Mendoza	M	AR
Misiones	N	AR
Neuquen	Q	AR
Rio Negro	R	AR
Salta	A	AR
San Juan	J	AR
San Luis	D	AR
Santa Cruz	Z	AR
Santa Fe	S	AR
Santiago del Estero	G	AR
Tierra del Fuego	V	AR
Tucuman	T	AR
Burgenland	1	AT
Karnten	2	AT
Niederosterreich	3	AT
Oberosterreich	4	AT
Salzburg	5	AT
Steiermark	6	AT
Tirol	7	AT
Vorarlberg	8	AT
Wien	9	AT
Australian Capital Territory	ACT	AU
New South Wales	NSW	AU
Northern Territory	NT	AU
Queensland	QLD	AU
South Australia	SA	AU
Tasmania	TAS	AU
Victoria	VIC	AU
Western Australia	WA	AU
Abseron	ABS	AZ
Agcabadi	AGC	AZ
Agdas	AGS	AZ
Agstafa	AGA	AZ
Agsu	AGU	AZ
Baki	BA	AZ
Balakan	BAL	AZ
Barda	BAR	AZ
Beylaqan	BEY	AZ
Calilabad	CAL	AZ
Ganca	GA	AZ
Goranboy	GOR	AZ
Goycay	GOY	AZ
Goygol	GYG	AZ
Haciqabul	HAC	AZ
Imisli	IMI	AZ
Kurdamir	KUR	AZ
Lankaran	LA	AZ
Masalli	MAS	AZ
Mingacevir	MI	AZ
Naftalan	NA	AZ
Naxcivan	NX	AZ
Neftcala	NEF	AZ
Oguz	OGU	AZ
Qabala	QAB	AZ
Qax	QAX	AZ
Qazax	QAZ	AZ
Qobustan	QOB	AZ
Quba	QBA	AZ
Qusar	QUS	AZ
Sabirabad	SAB	AZ
Saki	SAK	AZ
Samux	SMX	AZ
Sirvan	SR	AZ
Siyazan	SIY	AZ
Sumqayit	SM	AZ
Tovuz	TOV	AZ
Xacmaz	XAC	AZ
Xizi	XIZ	AZ
Yardimli	YAR	AZ
Yevlax	YEV	AZ
Zaqatala	ZAQ	AZ
Zardab	ZAR	AZ
Brcko distrikt	BRC	BA
Federacija Bosne i Hercegovine	BIH	BA
Republika Srpska	SRP	BA
Christ Church	01	BB
Saint Andrew	02	BB
Saint George	03	BB
Saint James	04	BB
Saint John	05	BB
Saint Joseph	06	BB
Saint Lucy	07	BB
Saint Michael	08	BB
Saint Peter	09	BB
Saint Philip	10	BB
Saint Thomas	11	BB
Barisal	06	BD
Chittagong	10	BD
Dhaka	13	BD
Khulna	27	BD
Rajshahi	54	BD
Rangpur	55	BD
Sylhet	60	BD
Antwerpen	VAN	BE
Brabant wallon	WBR	BE
Brussels Hoofdstedelijk Gewest	BRU	BE
Hainaut	WHT	BE
Liege	WLG	BE
Limburg	VLI	BE
Luxembourg	WLX	BE
Namur	WNA	BE
Oost-Vlaanderen	VOV	BE
Vlaams-Brabant	VBR	BE
West-Vlaanderen	VWV	BE
Boulgou	BLG	BF
Boulkiemde	BLK	BF
Comoe	COM	BF
Houet	HOU	BF
Kadiogo	KAD	BF
Kourweogo	KOW	BF
Leraba	LER	BF
Mouhoun	MOU	BF
Poni	PON	BF
Sanmatenga	SMT	BF
Tuy	TUI	BF
Yatenga	YAT	BF
Zoundweogo	ZOU	BF
Blagoevgrad	01	BG
Burgas	02	BG
Dobrich	08	BG
Gabrovo	07	BG
Haskovo	26	BG
Kardzhali	09	BG
Kyustendil	10	BG
Lovech	11	BG
Montana	12	BG
Pazardzhik	13	BG
Pernik	14	BG
Pleven	15	BG
Plovdiv	16	BG
Razgrad	17	BG
Ruse	18	BG
Shumen	27	BG
Silistra	19	BG
Sliven	20	BG
Smolyan	21	BG
Sofia	23	BG
Sofia (stolitsa)	22	BG
Stara Zagora	24	BG
Targovishte	25	BG
Varna	03	BG
Veliko Tarnovo	04	BG
Vidin	05	BG
Vratsa	06	BG
Yambol	28	BG
Al 'Asimah	13	BH
Al Janubiyah	14	BH
Al Muharraq	15	BH
Ash Shamaliyah	17	BH
Bubanza	BB	BI
Bujumbura Mairie	BM	BI
Cibitoke	CI	BI
Gitega	GI	BI
Kirundo	KI	BI
Muyinga	MY	BI
Mwaro	MW	BI
Ngozi	NG	BI
Rutana	RT	BI
Ruyigi	RY	BI
Alibori	AL	BJ
Atacora	AK	BJ
Atlantique	AQ	BJ
Borgou	BO	BJ
Collines	CO	BJ
Donga	DO	BJ
Littoral	LI	BJ
Mono	MO	BJ
Oueme	OU	BJ
Plateau	PL	BJ
Zou	ZO	BJ
Belait	BE	BN
Brunei-Muara	BM	BN
Temburong	TE	BN
Tutong	TU	BN
Chuquisaca	H	BO
Cochabamba	C	BO
El Beni	B	BO
La Paz	L	BO
Oruro	O	BO
Pando	N	BO
Potosi	P	BO
Santa Cruz	S	BO
Tarija	T	BO
Bonaire	BO	BQ
Saba	SA	BQ
Sint Eustatius	SE	BQ
Acre	AC	BR
Alagoas	AL	BR
Amapa	AP	BR
Amazonas	AM	BR
Bahia	BA	BR
Ceara	CE	BR
Distrito Federal	DF	BR
Espirito Santo	ES	BR
Goias	GO	BR
Maranhao	MA	BR
Mato Grosso	MT	BR
Mato Grosso do Sul	MS	BR
Minas Gerais	MG	BR
Para	PA	BR
Paraiba	PB	BR
Parana	PR	BR
Pernambuco	PE	BR
Piaui	PI	BR
Rio Grande do Norte	RN	BR
Rio Grande do Sul	RS	BR
Rio de Janeiro	RJ	BR
Rondonia	RO	BR
Roraima	RR	BR
Santa Catarina	SC	BR
Sao Paulo	SP	BR
Sergipe	SE	BR
Tocantins	TO	BR
Central Andros	CS	BS
City of Freeport	FP	BS
East Grand Bahama	EG	BS
Harbour Island	HI	BS
Bumthang	33	BT
Chhukha	12	BT
Gasa	GA	BT
Lhuentse	44	BT
Monggar	42	BT
Paro	11	BT
Pemagatshel	43	BT
Punakha	23	BT
Samdrup Jongkhar	45	BT
Samtse	14	BT
Thimphu	15	BT
Trashi Yangtse	TY	BT
Trashigang	41	BT
Trongsa	32	BT
Tsirang	21	BT
Wangdue Phodrang	24	BT
Central	CE	BW
Kgatleng	KL	BW
Kweneng	KW	BW
North East	NE	BW
North West	NW	BW
South East	SE	BW
Brestskaya voblasts'	BR	BY
Homyel'skaya voblasts'	HO	BY
Horad Minsk	HM	BY
Hrodzenskaya voblasts'	HR	BY
Mahilyowskaya voblasts'	MA	BY
Minskaya voblasts'	MI	BY
Vitsyebskaya voblasts'	VI	BY
Belize	BZ	BZ
Cayo	CY	BZ
Corozal	CZL	BZ
Orange Walk	OW	BZ
Stann Creek	SC	BZ
Toledo	TOL	BZ
Alberta	AB	CA
British Columbia	BC	CA
Manitoba	MB	CA
New Brunswick	NB	CA
Newfoundland and Labrador	NL	CA
Northwest Territories	NT	CA
Nova Scotia	NS	CA
Nunavut	NU	CA
Ontario	ON	CA
Prince Edward Island	PE	CA
Quebec	QC	CA
Saskatchewan	SK	CA
Yukon	YT	CA
Equateur	EQ	CD
Haut-Katanga	HK	CD
Haut-Uele	HU	CD
Ituri	IT	CD
Kasai Central	KC	CD
Kasai Oriental	KE	CD
Kinshasa	KN	CD
Kongo Central	BC	CD
Kwilu	KL	CD
Lualaba	LU	CD
Maniema	MA	CD
Nord-Kivu	NK	CD
Nord-Ubangi	NU	CD
Sankuru	SA	CD
Sud-Kivu	SK	CD
Sud-Ubangi	SU	CD
Tanganyika	TA	CD
Tshopo	TO	CD
Tshuapa	TU	CD
Bangui	BGF	CF
Haute-Kotto	HK	CF
Nana-Mambere	NM	CF
Ouham	AC	CF
Ouham-Pende	OP	CF
Brazzaville	BZV	CG
Cuvette	8	CG
Cuvette-Ouest	15	CG
Pointe-Noire	16	CG
Sangha	13	CG
Aargau	AG	CH
Appenzell Ausserrhoden	AR	CH
Appenzell Innerrhoden	AI	CH
Basel-Landschaft	BL	CH
Basel-Stadt	BS	CH
Bern	BE	CH
Fribourg	FR	CH
Geneve	GE	CH
Glarus	GL	CH
Graubunden	GR	CH
Jura	JU	CH
Luzern	LU	CH
Neuchatel	NE	CH
Nidwalden	NW	CH
Obwalden	OW	CH
Sankt Gallen	SG	CH
Schaffhausen	SH	CH
Schwyz	SZ	CH
Solothurn	SO	CH
Thurgau	TG	CH
Ticino	TI	CH
Uri	UR	CH
Valais	VS	CH
Vaud	VD	CH
Zug	ZG	CH
Zurich	ZH	CH
Abidjan	AB	CI
Bas-Sassandra	BS	CI
Comoe	CM	CI
Denguele	DN	CI
Goh-Djiboua	GD	CI
Lacs	LC	CI
Lagunes	LG	CI
Montagnes	MG	CI
Sassandra-Marahoue	SM	CI
Savanes	SV	CI
Vallee du Bandama	VB	CI
Woroba	WR	CI
Yamoussoukro	YM	CI
Zanzan	ZZ	CI
Aisen del General Carlos Ibanez del Campo	AI	CL
Antofagasta	AN	CL
Arica y Parinacota	AP	CL
Atacama	AT	CL
Biobio	BI	CL
Coquimbo	CO	CL
La Araucania	AR	CL
Libertador General Bernardo O'Higgins	LI	CL
Los Lagos	LL	CL
Los Rios	LR	CL
Magallanes	MA	CL
Maule	ML	CL
Region Metropolitana de Santiago	RM	CL
Tarapaca	TA	CL
Valparaiso	VS	CL
Adamaoua	AD	CM
Centre	CE	CM
Est	ES	CM
Extreme-Nord	EN	CM
Littoral	LT	CM
Nord	NO	CM
Nord-Ouest	NW	CM
Ouest	OU	CM
Sud	SU	CM
Sud-Ouest	SW	CM
Anhui	AH	CN
Beijing	BJ	CN
Chongqing	CQ	CN
Fujian	FJ	CN
Gansu	GS	CN
Guangdong	GD	CN
Guangxi	GX	CN
Guizhou	GZ	CN
Hainan	HI	CN
Hebei	HE	CN
Hubei	HB	CN
Hunan	HN	CN
Jiangsu	JS	CN
Jiangxi	JX	CN
Jilin	JL	CN
Liaoning	LN	CN
Nei Mongol	NM	CN
Ningxia	NX	CN
Qinghai	QH	CN
Shaanxi	SN	CN
Shandong	SD	CN
Shanghai	SH	CN
Shanxi	SX	CN
Sichuan	SC	CN
Tianjin	TJ	CN
Xinjiang	XJ	CN
Xizang	XZ	CN
Yunnan	YN	CN
Zhejiang	ZJ	CN
Amazonas	AMA	CO
Antioquia	ANT	CO
Arauca	ARA	CO
Atlantico	ATL	CO
Bolivar	BOL	CO
Boyaca	BOY	CO
Caldas	CAL	CO
Caqueta	CAQ	CO
Casanare	CAS	CO
Cauca	CAU	CO
Cesar	CES	CO
Choco	CHO	CO
Cordoba	COR	CO
Cundinamarca	CUN	CO
Distrito Capital de Bogota	DC	CO
Guainia	GUA	CO
Guaviare	GUV	CO
Huila	HUI	CO
La Guajira	LAG	CO
Magdalena	MAG	CO
Meta	MET	CO
Narino	NAR	CO
Norte de Santander	NSA	CO
Putumayo	PUT	CO
Quindio	QUI	CO
Risaralda	RIS	CO
San Andres, Providencia y Santa Catalina	SAP	CO
Santander	SAN	CO
Sucre	SUC	CO
Tolima	TOL	CO
Valle del Cauca	VAC	CO
Vichada	VID	CO
Alajuela	A	CR
Cartago	C	CR
Guanacaste	G	CR
Heredia	H	CR
Limon	L	CR
Puntarenas	P	CR
San Jose	SJ	CR
Artemisa	15	CU
Camaguey	09	CU
Ciego de Avila	08	CU
Cienfuegos	06	CU
Granma	12	CU
Guantanamo	14	CU
Holguin	11	CU
La Habana	03	CU
Las Tunas	10	CU
Matanzas	04	CU
Mayabeque	16	CU
Pinar del Rio	01	CU
Sancti Spiritus	07	CU
Santiago de Cuba	13	CU
Villa Clara	05	CU
Boa Vista	BV	CV
Porto Novo	PN	CV
Praia	PR	CV
Sal	SL	CV
Santa Catarina	CA	CV
Sao Filipe	SF	CV
Sao Vicente	SV	CV
Ammochostos	04	CY
Keryneia	06	CY
Larnaka	03	CY
Lefkosia	01	CY
Lemesos	02	CY
Pafos	05	CY
Jihocesky kraj	31	CZ
Jihomoravsky kraj	64	CZ
Karlovarsky kraj	41	CZ
Kraj Vysocina	63	CZ
Kralovehradecky kraj	52	CZ
Liberecky kraj	51	CZ
Moravskoslezsky kraj	80	CZ
Olomoucky kraj	71	CZ
Pardubicky kraj	53	CZ
Plzensky kraj	32	CZ
Praha, Hlavni mesto	10	CZ
Stredocesky kraj	20	CZ
Ustecky kraj	42	CZ
Zlinsky kraj	72	CZ
Baden-Wurttemberg	BW	DE
Bayern	BY	DE
Berlin	BE	DE
Brandenburg	BB	DE
Bremen	HB	DE
Hamburg	HH	DE
Hessen	HE	DE
Mecklenburg-Vorpommern	MV	DE
Niedersachsen	NI	DE
Nordrhein-Westfalen	NW	DE
Rheinland-Pfalz	RP	DE
Saarland	SL	DE
Sachsen	SN	DE
Sachsen-Anhalt	ST	DE
Schleswig-Holstein	SH	DE
Thuringen	TH	DE
Arta	AR	DJ
Djibouti	DJ	DJ
Hovedstaden	84	DK
Midtjylland	82	DK
Nordjylland	81	DK
Sjaelland	85	DK
Syddanmark	83	DK
Saint Andrew	02	DM
Saint George	04	DM
Saint John	05	DM
Saint Mark	08	DM
Saint Paul	10	DM
Azua	02	DO
Baoruco	03	DO
Barahona	04	DO
Dajabon	05	DO
Distrito Nacional (Santo Domingo)	01	DO
Duarte	06	DO
El Seibo	08	DO
Espaillat	09	DO
Hato Mayor	30	DO
Hermanas Mirabal	19	DO
Independencia	10	DO
La Altagracia	11	DO
La Romana	12	DO
La Vega	13	DO
Maria Trinidad Sanchez	14	DO
Monsenor Nouel	28	DO
Monte Cristi	15	DO
Monte Plata	29	DO
Pedernales	16	DO
Peravia	17	DO
Puerto Plata	18	DO
Samana	20	DO
San Cristobal	21	DO
San Jose de Ocoa	31	DO
San Juan	22	DO
Sanchez Ramirez	24	DO
Santiago	25	DO
Santiago Rodriguez	26	DO
Valverde	27	DO
Adrar	01	DZ
Ain Defla	44	DZ
Ain Temouchent	46	DZ
Alger	16	DZ
Annaba	23	DZ
Batna	05	DZ
Bechar	08	DZ
Bejaia	06	DZ
Biskra	07	DZ
Blida	09	DZ
Bordj Bou Arreridj	34	DZ
Bouira	10	DZ
Boumerdes	35	DZ
Chlef	02	DZ
Constantine	25	DZ
Djelfa	17	DZ
El Bayadh	32	DZ
El Oued	39	DZ
El Tarf	36	DZ
Ghardaia	47	DZ
Guelma	24	DZ
Illizi	33	DZ
Jijel	18	DZ
Khenchela	40	DZ
Laghouat	03	DZ
M'sila	28	DZ
Mascara	29	DZ
Medea	26	DZ
Mila	43	DZ
Mostaganem	27	DZ
Naama	45	DZ
Oran	31	DZ
Ouargla	30	DZ
Oum el Bouaghi	04	DZ
Relizane	48	DZ
Saida	20	DZ
Setif	19	DZ
Sidi Bel Abbes	22	DZ
Skikda	21	DZ
Souk Ahras	41	DZ
Tamanrasset	11	DZ
Tebessa	12	DZ
Tiaret	14	DZ
Tindouf	37	DZ
Tipaza	42	DZ
Tissemsilt	38	DZ
Tizi Ouzou	15	DZ
Tlemcen	13	DZ
Azuay	A	EC
Bolivar	B	EC
Canar	F	EC
Carchi	C	EC
Chimborazo	H	EC
Cotopaxi	X	EC
El Oro	O	EC
Esmeraldas	E	EC
Galapagos	W	EC
Guayas	G	EC
Imbabura	I	EC
Loja	L	EC
Los Rios	R	EC
Manabi	M	EC
Morona Santiago	S	EC
Napo	N	EC
Orellana	D	EC
Pastaza	Y	EC
Pichincha	P	EC
Santa Elena	SE	EC
Santo Domingo de los Tsachilas	SD	EC
Sucumbios	U	EC
Tungurahua	T	EC
Zamora Chinchipe	Z	EC
Harjumaa	37	EE
Hiiumaa	39	EE
Ida-Virumaa	44	EE
Jarvamaa	51	EE
Jogevamaa	49	EE
Laane-Virumaa	59	EE
Laanemaa	57	EE
Parnumaa	67	EE
Polvamaa	65	EE
Raplamaa	70	EE
Saaremaa	74	EE
Tartumaa	78	EE
Valgamaa	82	EE
Viljandimaa	84	EE
Vorumaa	86	EE
Ad Daqahliyah	DK	EG
Al Bahr al Ahmar	BA	EG
Al Buhayrah	BH	EG
Al Fayyum	FYM	EG
Al Gharbiyah	GH	EG
Al Iskandariyah	ALX	EG
Al Isma'iliyah	IS	EG
Al Jizah	GZ	EG
Al Minufiyah	MNF	EG
Al Minya	MN	EG
Al Qahirah	C	EG
Al Qalyubiyah	KB	EG
Al Uqsur	LX	EG
Al Wadi al Jadid	WAD	EG
As Suways	SUZ	EG
Ash Sharqiyah	SHR	EG
Aswan	ASN	EG
Asyut	AST	EG
Bani Suwayf	BNS	EG
Bur Sa'id	PTS	EG
Dumyat	DT	EG
Janub Sina'	JS	EG
Kafr ash Shaykh	KFS	EG
Matruh	MT	EG
Qina	KN	EG
Shamal Sina'	SIN	EG
Suhaj	SHG	EG
Al Awsat	MA	ER
Andalucia	AN	ES
Aragon	AR	ES
Asturias, Principado de	AS	ES
Canarias	CN	ES
Cantabria	CB	ES
Castilla y Leon	CL	ES
Castilla-La Mancha	CM	ES
Catalunya	CT	ES
Ceuta	CE	ES
Extremadura	EX	ES
Galicia	GA	ES
Illes Balears	IB	ES
La Rioja	RI	ES
Madrid, Comunidad de	MD	ES
Melilla	ML	ES
Murcia, Region de	MC	ES
Navarra, Comunidad Foral de	NC	ES
Pais Vasco	PV	ES
Valenciana, Comunidad	VC	ES
Adis Abeba	AA	ET
Afar	AF	ET
Amara	AM	ET
Binshangul Gumuz	BE	ET
Hareri Hizb	HA	ET
Oromiya	OR	ET
Sumale	SO	ET
Tigray	TI	ET
YeDebub Biheroch Bihereseboch na Hizboch	SN	ET
Etela-Karjala	02	FI
Etela-Pohjanmaa	03	FI
Etela-Savo	04	FI
Kainuu	05	FI
Kanta-Hame	06	FI
Keski-Pohjanmaa	07	FI
Keski-Suomi	08	FI
Kymenlaakso	09	FI
Lappi	10	FI
Paijat-Hame	16	FI
Pirkanmaa	11	FI
Nouvelle-Aquitaine	NAQ	FR
Pays-de-la-Loire	PDL	FR
Provence-Alpes-Cote-d'Azur	PAC	FR
Estuaire	1	GA
Haut-Ogooue	2	GA
Moyen-Ogooue	3	GA
Ngounie	4	GA
Ogooue-Ivindo	6	GA
Ogooue-Lolo	7	GA
Ogooue-Maritime	8	GA
Woleu-Ntem	9	GA
England	ENG	GB
Northern Ireland	NIR	GB
Scotland	SCT	GB
Wales	WLS	GB
Saint Andrew	01	GD
Saint David	02	GD
Saint George	03	GD
Saint John	04	GD
Saint Mark	05	GD
Saint Patrick	06	GD
Southern Grenadine Islands	10	GD
Abkhazia	AB	GE
Ajaria	AJ	GE
Guria	GU	GE
Imereti	IM	GE
K'akheti	KA	GE
Kvemo Kartli	KK	GE
Mtskheta-Mtianeti	MM	GE
Rach'a-Lechkhumi-Kvemo Svaneti	RL	GE
Samegrelo-Zemo Svaneti	SZ	GE
Samtskhe-Javakheti	SJ	GE
Shida Kartli	SK	GE
Tbilisi	TB	GE
Ashanti	AH	GH
Brong-Ahafo	BA	GH
Central	CP	GH
Eastern	EP	GH
Greater Accra	AA	GH
Northern	NP	GH
Upper East	UE	GH
Volta	TV	GH
Western	WP	GH
Kommune Kujalleq	KU	GL
Kommuneqarfik Sermersooq	SM	GL
Qeqqata Kommunia	QE	GL
Banjul	B	GM
Central River	M	GM
Lower River	L	GM
North Bank	N	GM
Upper River	U	GM
Western	W	GM
Boffa	BF	GN
Boke	B	GN
Conakry	C	GN
Coyah	CO	GN
Dabola	DB	GN
Dalaba	DL	GN
Dubreka	DU	GN
Guekedou	GU	GN
Kankan	K	GN
Kissidougou	KS	GN
Labe	L	GN
Macenta	MC	GN
Nzerekore	N	GN
Pita	PI	GN
Siguiri	SI	GN
Bioko Norte	BN	GQ
Bioko Sur	BS	GQ
Litoral	LI	GQ
Wele-Nzas	WN	GQ
Agion Oros	69	GR
Anatoliki Makedonia kai Thraki	A	GR
Attiki	I	GR
Dytiki Ellada	G	GR
Dytiki Makedonia	C	GR
Ionia Nisia	F	GR
Ipeiros	D	GR
Kentriki Makedonia	B	GR
Kriti	M	GR
Notio Aigaio	L	GR
Peloponnisos	J	GR
Sterea Ellada	H	GR
Thessalia	E	GR
Voreio Aigaio	K	GR
Alta Verapaz	AV	GT
Baja Verapaz	BV	GT
Chimaltenango	CM	GT
Chiquimula	CQ	GT
El Progreso	PR	GT
Escuintla	ES	GT
Guatemala	GU	GT
Huehuetenango	HU	GT
Izabal	IZ	GT
Jalapa	JA	GT
Jutiapa	JU	GT
Peten	PE	GT
Quetzaltenango	QZ	GT
Quiche	QC	GT
Retalhuleu	RE	GT
Sacatepequez	SA	GT
San Marcos	SM	GT
Santa Rosa	SR	GT
Solola	SO	GT
Suchitepequez	SU	GT
Totonicapan	TO	GT
Zacapa	ZA	GT
Demerara-Mahaica	DE	GY
East Berbice-Corentyne	EB	GY
Essequibo Islands-West Demerara	ES	GY
Mahaica-Berbice	MA	GY
Pomeroon-Supenaam	PM	GY
Upper Demerara-Berbice	UD	GY
Choluteca	CH	HN
Colon	CL	HN
Comayagua	CM	HN
Copan	CP	HN
Cortes	CR	HN
El Paraiso	EP	HN
Francisco Morazan	FM	HN
Intibuca	IN	HN
Islas de la Bahia	IB	HN
La Paz	LP	HN
Lempira	LE	HN
Ocotepeque	OC	HN
Olancho	OL	HN
Santa Barbara	SB	HN
Valle	VA	HN
Yoro	YO	HN
Bjelovarsko-bilogorska zupanija	07	HR
Brodsko-posavska zupanija	12	HR
Dubrovacko-neretvanska zupanija	19	HR
Grad Zagreb	21	HR
Istarska zupanija	18	HR
Karlovacka zupanija	04	HR
Koprivnicko-krizevacka zupanija	06	HR
Krapinsko-zagorska zupanija	02	HR
Licko-senjska zupanija	09	HR
Medimurska zupanija	20	HR
Osjecko-baranjska zupanija	14	HR
Pozesko-slavonska zupanija	11	HR
Primorsko-goranska zupanija	08	HR
Sibensko-kninska zupanija	15	HR
Sisacko-moslavacka zupanija	03	HR
Splitsko-dalmatinska zupanija	17	HR
Varazdinska zupanija	05	HR
Viroviticko-podravska zupanija	10	HR
Vukovarsko-srijemska zupanija	16	HR
Zadarska zupanija	13	HR
Zagrebacka zupanija	01	HR
Artibonite	AR	HT
Centre	CE	HT
Grande'Anse	GA	HT
Nippes	NI	HT
Nord	ND	HT
Nord-Est	NE	HT
Ouest	OU	HT
Sud	SD	HT
Sud-Est	SE	HT
Bacs-Kiskun	BK	HU
Baranya	BA	HU
Bekes	BE	HU
Borsod-Abauj-Zemplen	BZ	HU
Budapest	BU	HU
Csongrad	CS	HU
Fejer	FE	HU
Gyor-Moson-Sopron	GS	HU
Hajdu-Bihar	HB	HU
Heves	HE	HU
Jasz-Nagykun-Szolnok	JN	HU
Komarom-Esztergom	KE	HU
Nograd	NO	HU
Pest	PE	HU
Somogy	SO	HU
Szabolcs-Szatmar-Bereg	SZ	HU
Tolna	TO	HU
Vas	VA	HU
Veszprem	VE	HU
Zala	ZA	HU
Aceh	AC	ID
Bali	BA	ID
Banten	BT	ID
Bengkulu	BE	ID
Gorontalo	GO	ID
Jakarta Raya	JK	ID
Jambi	JA	ID
Jawa Barat	JB	ID
Jawa Tengah	JT	ID
Jawa Timur	JI	ID
Kalimantan Barat	KB	ID
Kalimantan Selatan	KS	ID
Kalimantan Tengah	KT	ID
Kalimantan Timur	KI	ID
Kalimantan Utara	KU	ID
Kepulauan Bangka Belitung	BB	ID
Kepulauan Riau	KR	ID
Lampung	LA	ID
Maluku	ML	ID
Maluku Utara	MU	ID
Nusa Tenggara Barat	NB	ID
Nusa Tenggara Timur	NT	ID
Papua	PP	ID
Papua Barat	PB	ID
Riau	RI	ID
Sulawesi Barat	SR	ID
Sulawesi Selatan	SN	ID
Sulawesi Tengah	ST	ID
Sulawesi Tenggara	SG	ID
Sulawesi Utara	SA	ID
Sumatera Barat	SB	ID
Sumatera Selatan	SS	ID
Sumatera Utara	SU	ID
Yogyakarta	YO	ID
Carlow	CW	IE
Cavan	CN	IE
Clare	CE	IE
Cork	CO	IE
Donegal	DL	IE
Dublin	D	IE
Galway	G	IE
Kerry	KY	IE
Kildare	KE	IE
Kilkenny	KK	IE
Laois	LS	IE
Leitrim	LM	IE
Limerick	LK	IE
Longford	LD	IE
Louth	LH	IE
Mayo	MO	IE
Meath	MH	IE
Monaghan	MN	IE
Offaly	OY	IE
Roscommon	RN	IE
Sligo	SO	IE
Tipperary	TA	IE
Waterford	WD	IE
Westmeath	WH	IE
Wexford	WX	IE
Wicklow	WW	IE
HaDarom	D	IL
HaMerkaz	M	IL
HaTsafon	Z	IL
Hefa	HA	IL
Tel Aviv	TA	IL
Yerushalayim	JM	IL
Andaman and Nicobar Islands	AN	IN
Andhra Pradesh	AP	IN
Arunachal Pradesh	AR	IN
Assam	AS	IN
Bihar	BR	IN
Chandigarh	CH	IN
Chhattisgarh	CT	IN
Dadra and Nagar Haveli	DN	IN
Daman and Diu	DD	IN
Delhi	DL	IN
Haryana	HR	IN
Himachal Pradesh	HP	IN
Jammu and Kashmir	JK	IN
Jharkhand	JH	IN
Karnataka	KA	IN
Kerala	KL	IN
Lakshadweep	LD	IN
Madhya Pradesh	MP	IN
Maharashtra	MH	IN
Manipur	MN	IN
Meghalaya	ML	IN
Mizoram	MZ	IN
Nagaland	NL	IN
Odisha	OR	IN
Puducherry	PY	IN
Punjab	PB	IN
Rajasthan	RJ	IN
Sikkim	SK	IN
Tamil Nadu	TN	IN
Telangana	TG	IN
Tripura	TR	IN
Uttar Pradesh	UP	IN
Uttarakhand	UT	IN
West Bengal	WB	IN
Al Anbar	AN	IQ
Al Basrah	BA	IQ
Al Muthanna	MU	IQ
Al Qadisiyah	QA	IQ
An Najaf	NA	IQ
Arbil	AR	IQ
As Sulaymaniyah	SU	IQ
Babil	BB	IQ
Baghdad	BG	IQ
Dahuk	DA	IQ
Dhi Qar	DQ	IQ
Diyala	DI	IQ
Karbala'	KA	IQ
Kirkuk	KI	IQ
Maysan	MA	IQ
Ninawa	NI	IQ
Salah ad Din	SD	IQ
Wasit	WA	IQ
Alborz	32	IR
Ardabil	03	IR
Azarbayjan-e Gharbi	02	IR
Azarbayjan-e Sharqi	01	IR
Bushehr	06	IR
Chahar Mahal va Bakhtiari	08	IR
Esfahan	04	IR
Fars	14	IR
Gilan	19	IR
Golestan	27	IR
Hamadan	24	IR
Hormozgan	23	IR
Ilam	05	IR
Kerman	15	IR
Kermanshah	17	IR
Khorasan-e Jonubi	29	IR
Khorasan-e Razavi	30	IR
Khorasan-e Shomali	31	IR
Khuzestan	10	IR
Kohgiluyeh va Bowyer Ahmad	18	IR
Kordestan	16	IR
Lorestan	20	IR
Markazi	22	IR
Mazandaran	21	IR
Qazvin	28	IR
Qom	26	IR
Semnan	12	IR
Sistan va Baluchestan	13	IR
Tehran	07	IR
Yazd	25	IR
Zanjan	11	IR
Austurland	7	IS
Hofudborgarsvaedi	1	IS
Nordurland eystra	6	IS
Nordurland vestra	5	IS
Sudurland	8	IS
Sudurnes	2	IS
Vestfirdir	4	IS
Vesturland	3	IS
Abruzzo	65	IT
Basilicata	77	IT
Calabria	78	IT
Campania	72	IT
Emilia-Romagna	45	IT
Friuli-Venezia Giulia	36	IT
Lazio	62	IT
Liguria	42	IT
Lombardia	25	IT
Marche	57	IT
Molise	67	IT
Piemonte	21	IT
Puglia	75	IT
Sardegna	88	IT
Sicilia	82	IT
Toscana	52	IT
Trentino-Alto Adige	32	IT
Umbria	55	IT
Valle d'Aosta	23	IT
Veneto	34	IT
Clarendon	13	JM
Hanover	09	JM
Kingston	01	JM
Manchester	12	JM
Portland	04	JM
Saint Andrew	02	JM
Saint Ann	06	JM
Saint Catherine	14	JM
Saint Elizabeth	11	JM
Saint James	08	JM
Saint Mary	05	JM
Saint Thomas	03	JM
Trelawny	07	JM
Westmoreland	10	JM
'Ajlun	AJ	JO
Al 'Aqabah	AQ	JO
Al 'Asimah	AM	JO
Al Balqa'	BA	JO
Al Karak	KA	JO
Al Mafraq	MA	JO
At Tafilah	AT	JO
Az Zarqa'	AZ	JO
Irbid	IR	JO
Jarash	JA	JO
Ma'an	MN	JO
Madaba	MD	JO
Aichi	23	JP
Akita	05	JP
Aomori	02	JP
Chiba	12	JP
Ehime	38	JP
Fukui	18	JP
Fukuoka	40	JP
Fukushima	07	JP
Gifu	21	JP
Gunma	10	JP
Hiroshima	34	JP
Hokkaido	01	JP
Hyogo	28	JP
Ibaraki	08	JP
Ishikawa	17	JP
Iwate	03	JP
Kagawa	37	JP
Kagoshima	46	JP
Kanagawa	14	JP
Kochi	39	JP
Kumamoto	43	JP
Kyoto	26	JP
Mie	24	JP
Miyagi	04	JP
Miyazaki	45	JP
Nagano	20	JP
Nagasaki	42	JP
Nara	29	JP
Niigata	15	JP
Oita	44	JP
Okayama	33	JP
Osaka	27	JP
Saga	41	JP
Saitama	11	JP
Shiga	25	JP
Shimane	32	JP
Shizuoka	22	JP
Tochigi	09	JP
Tokushima	36	JP
Tokyo	13	JP
Tottori	31	JP
Toyama	16	JP
Wakayama	30	JP
Yamagata	06	JP
Yamaguchi	35	JP
Yamanashi	19	JP
Baringo	01	KE
Bomet	02	KE
Bungoma	03	KE
Busia	04	KE
Elgeyo/Marakwet	05	KE
Embu	06	KE
Garissa	07	KE
Homa Bay	08	KE
Isiolo	09	KE
Kajiado	10	KE
Kakamega	11	KE
Kericho	12	KE
Kiambu	13	KE
Kilifi	14	KE
Kirinyaga	15	KE
Kisii	16	KE
Kisumu	17	KE
Kitui	18	KE
Kwale	19	KE
Laikipia	20	KE
Lamu	21	KE
Machakos	22	KE
Makueni	23	KE
Mandera	24	KE
Marsabit	25	KE
Meru	26	KE
Migori	27	KE
Mombasa	28	KE
Murang'a	29	KE
Nairobi City	30	KE
Nakuru	31	KE
Nandi	32	KE
Narok	33	KE
Nyamira	34	KE
Nyandarua	35	KE
Nyeri	36	KE
Siaya	38	KE
Taita/Taveta	39	KE
Tharaka-Nithi	41	KE
Trans Nzoia	42	KE
Turkana	43	KE
Uasin Gishu	44	KE
Wajir	46	KE
Batken	B	KG
Bishkek	GB	KG
Chuy	C	KG
Jalal-Abad	J	KG
Naryn	N	KG
Osh	GO	KG
Talas	T	KG
Ysyk-Kol	Y	KG
Baat Dambang	2	KH
Banteay Mean Chey	1	KH
Kampong Chaam	3	KH
Kampong Chhnang	4	KH
Kampong Spueu	5	KH
Kampong Thum	6	KH
Kampot	7	KH
Kandaal	8	KH
Kracheh	10	KH
Krong Kaeb	23	KH
Krong Pailin	24	KH
Krong Preah Sihanouk	18	KH
Mondol Kiri	11	KH
Phnom Penh	12	KH
Pousaat	15	KH
Prey Veaeng	14	KH
Rotanak Kiri	16	KH
Siem Reab	17	KH
Svaay Rieng	20	KH
Taakaev	21	KH
Gilbert Islands	G	KI
Line Islands	L	KI
Anjouan	A	KM
Grande Comore	G	KM
Saint Anne Sandy Point	02	KN
Saint George Basseterre	03	KN
Saint James Windward	05	KN
Saint John Figtree	07	KN
Saint Mary Cayon	08	KN
Saint Paul Capisterre	09	KN
Saint Paul Charlestown	10	KN
Saint Peter Basseterre	11	KN
Saint Thomas Lowland	12	KN
Saint Thomas Middle Island	13	KN
P'yongyang	01	KP
Busan-gwangyeoksi	26	KR
Chungcheongbuk-do	43	KR
Chungcheongnam-do	44	KR
Daegu-gwangyeoksi	27	KR
Daejeon-gwangyeoksi	30	KR
Gangwon-do	42	KR
Gwangju-gwangyeoksi	29	KR
Gyeonggi-do	41	KR
Gyeongsangbuk-do	47	KR
Gyeongsangnam-do	48	KR
Incheon-gwangyeoksi	28	KR
Jeju-teukbyeoljachido	49	KR
Jeollabuk-do	45	KR
Jeollanam-do	46	KR
Seoul-teukbyeolsi	11	KR
Ulsan-gwangyeoksi	31	KR
Al 'Asimah	KU	KW
Al Ahmadi	AH	KW
Al Farwaniyah	FA	KW
Al Jahra'	JA	KW
Hawalli	HA	KW
Mubarak al Kabir	MU	KW
Almaty	ALA	KZ
Almaty oblysy	ALM	KZ
Aqmola oblysy	AKM	KZ
Aqtobe oblysy	AKT	KZ
Astana	AST	KZ
Atyrau oblysy	ATY	KZ
Batys Qazaqstan oblysy	ZAP	KZ
Bayqongyr	BAY	KZ
Mangghystau oblysy	MAN	KZ
Ongtustik Qazaqstan oblysy	YUZ	KZ
Pavlodar oblysy	PAV	KZ
Qaraghandy oblysy	KAR	KZ
Qostanay oblysy	KUS	KZ
Qyzylorda oblysy	KZY	KZ
Shyghys Qazaqstan oblysy	VOS	KZ
Soltustik Qazaqstan oblysy	SEV	KZ
Zhambyl oblysy	ZHA	KZ
Attapu	AT	LA
Champasak	CH	LA
Houaphan	HO	LA
Khammouan	KH	LA
Louang Namtha	LM	LA
Louangphabang	LP	LA
Oudomxai	OU	LA
Savannakhet	SV	LA
Viangchan	VI	LA
Xaignabouli	XA	LA
Xekong	XE	LA
Xiangkhouang	XI	LA
Aakkar	AK	LB
Baalbek-Hermel	BH	LB
Beqaa	BI	LB
Beyrouth	BA	LB
Liban-Nord	AS	LB
Liban-Sud	JA	LB
Mont-Liban	JL	LB
Nabatiye	NA	LB
Anse la Raye	01	LC
Castries	02	LC
Dennery	05	LC
Gros Islet	06	LC
Laborie	07	LC
Micoud	08	LC
Soufriere	10	LC
Vieux Fort	11	LC
Balzers	01	LI
Eschen	02	LI
Gamprin	03	LI
Mauren	04	LI
Planken	05	LI
Ruggell	06	LI
Schaan	07	LI
Schellenberg	08	LI
Triesen	09	LI
Triesenberg	10	LI
Vaduz	11	LI
Central Province	2	LK
Eastern Province	5	LK
North Central Province	7	LK
North Western Province	6	LK
Northern Province	4	LK
Sabaragamuwa Province	9	LK
Southern Province	3	LK
Uva Province	8	LK
Western Province	1	LK
Grand Bassa	GB	LR
Grand Gedeh	GG	LR
Margibi	MG	LR
Maryland	MY	LR
Montserrado	MO	LR
Nimba	NI	LR
River Gee	RG	LR
Sinoe	SI	LR
Berea	D	LS
Butha-Buthe	B	LS
Leribe	C	LS
Maseru	A	LS
Mohale's Hoek	F	LS
Quthing	G	LS
Alytaus apskritis	AL	LT
Kauno apskritis	KU	LT
Klaipedos apskritis	KL	LT
Marijampoles apskritis	MR	LT
Panevezio apskritis	PN	LT
Siauliu apskritis	SA	LT
Taurages apskritis	TA	LT
Telsiu apskritis	TE	LT
Utenos apskritis	UT	LT
Vilniaus apskritis	VL	LT
Diekirch	DI	LU
Grevenmacher	GR	LU
Luxembourg	LU	LU
Adazu novads	011	LV
Aglonas novads	001	LV
Aizkraukles novads	002	LV
Aizputes novads	003	LV
Alojas novads	005	LV
Aluksnes novads	007	LV
Babites novads	012	LV
Baldones novads	013	LV
Baltinavas novads	014	LV
Balvu novads	015	LV
Bauskas novads	016	LV
Beverinas novads	017	LV
Brocenu novads	018	LV
Carnikavas novads	020	LV
Cesu novads	022	LV
Cesvaines novads	021	LV
Ciblas novads	023	LV
Daugavpils novads	025	LV
Dobeles novads	026	LV
Erglu novads	030	LV
Gulbenes novads	033	LV
Iecavas novads	034	LV
Ikskiles novads	035	LV
Incukalna novads	037	LV
Jaunjelgavas novads	038	LV
Jaunpiebalgas novads	039	LV
Jaunpils novads	040	LV
Jekabpils novads	042	LV
Jelgava	JEL	LV
Jelgavas novads	041	LV
Jurmala	JUR	LV
Kekavas novads	052	LV
Kokneses novads	046	LV
Kraslavas novads	047	LV
Kuldigas novads	050	LV
Lielvardes novads	053	LV
Liepaja	LPX	LV
Limbazu novads	054	LV
Livanu novads	056	LV
Lubanas novads	057	LV
Ludzas novads	058	LV
Madonas novads	059	LV
Malpils novads	061	LV
Nauksenu novads	064	LV
Ogres novads	067	LV
Olaines novads	068	LV
Ozolnieku novads	069	LV
Preilu novads	073	LV
Rezeknes novads	077	LV
Riebinu novads	078	LV
Riga	RIX	LV
Rojas novads	079	LV
Ropazu novads	080	LV
Rugaju novads	082	LV
Rundales novads	083	LV
Salaspils novads	087	LV
Saldus novads	088	LV
Saulkrastu novads	089	LV
Sejas novads	090	LV
Siguldas novads	091	LV
Skrundas novads	093	LV
Stopinu novads	095	LV
Talsu novads	097	LV
Tukuma novads	099	LV
Valkas novads	101	LV
Valmiera	VMR	LV
Vecumnieku novads	105	LV
Ventspils novads	106	LV
Al Butnan	BU	LY
Al Jabal al Akhdar	JA	LY
Al Jabal al Gharbi	JG	LY
Al Jufrah	JU	LY
Al Kufrah	KF	LY
Al Marj	MJ	LY
Al Marqab	MB	LY
Al Wahat	WA	LY
An Nuqat al Khams	NQ	LY
Az Zawiyah	ZA	LY
Banghazi	BA	LY
Darnah	DR	LY
Misratah	MI	LY
Murzuq	MQ	LY
Nalut	NL	LY
Sabha	SB	LY
Surt	SR	LY
Tarabulus	TB	LY
Wadi ash Shati'	WS	LY
Beni-Mellal-Khenifra	05	MA
Draa-Tafilalet	08	MA
Fes- Meknes	03	MA
Guelmim-Oued Noun (EH-partial)	10	MA
L'Oriental	02	MA
Laayoune-Sakia El Hamra (EH-partial)	11	MA
Marrakech-Safi	07	MA
Rabat-Sale-Kenitra	04	MA
Souss-Massa	09	MA
Tanger-Tetouan-Al Hoceima	01	MA
La Condamine	CO	MC
Monaco-Ville	MO	MC
Monte-Carlo	MC	MC
Saint-Roman	SR	MC
Anenii Noi	AN	MD
Balti	BA	MD
Basarabeasca	BS	MD
Bender	BD	MD
Briceni	BR	MD
Cahul	CA	MD
Calarasi	CL	MD
Cantemir	CT	MD
Causeni	CS	MD
Chisinau	CU	MD
Cimislia	CM	MD
Criuleni	CR	MD
Donduseni	DO	MD
Drochia	DR	MD
Dubasari	DU	MD
Edinet	ED	MD
Falesti	FA	MD
Floresti	FL	MD
Gagauzia, Unitatea teritoriala autonoma	GA	MD
Glodeni	GL	MD
Hincesti	HI	MD
Ialoveni	IA	MD
Leova	LE	MD
Nisporeni	NI	MD
Ocnita	OC	MD
Orhei	OR	MD
Rezina	RE	MD
Riscani	RI	MD
Singerei	SI	MD
Soldanesti	SD	MD
Soroca	SO	MD
Stefan Voda	SV	MD
Stinga Nistrului, unitatea teritoriala din	SN	MD
Straseni	ST	MD
Taraclia	TA	MD
Telenesti	TE	MD
Ungheni	UN	MD
Bar	02	ME
Berane	03	ME
Bijelo Polje	04	ME
Budva	05	ME
Cetinje	06	ME
Danilovgrad	07	ME
Herceg-Novi	08	ME
Kolasin	09	ME
Kotor	10	ME
Niksic	12	ME
Plav	13	ME
Pljevlja	14	ME
Pluzine	15	ME
Podgorica	16	ME
Rozaje	17	ME
Tivat	19	ME
Ulcinj	20	ME
Zabljak	21	ME
Antananarivo	T	MG
Antsiranana	D	MG
Fianarantsoa	F	MG
Mahajanga	M	MG
Toamasina	A	MG
Toliara	U	MG
Kwajalein	KWA	MH
Majuro	MAJ	MH
Berovo	03	MK
Bitola	04	MK
Bogdanci	05	MK
Bogovinje	06	MK
Bosilovo	07	MK
Brvenica	08	MK
Centar Zupa	78	MK
Cesinovo-Oblesevo	81	MK
Cucer Sandevo	82	MK
Debar	21	MK
Debarca	22	MK
Delcevo	23	MK
Demir Hisar	25	MK
Demir Kapija	24	MK
Dojran	26	MK
Dolneni	27	MK
Gevgelija	18	MK
Gostivar	19	MK
Ilinden	34	MK
Jegunovce	35	MK
Karbinci	37	MK
Kavadarci	36	MK
Kicevo	40	MK
Kocani	42	MK
Kratovo	43	MK
Kriva Palanka	44	MK
Krusevo	46	MK
Kumanovo	47	MK
Lipkovo	48	MK
Lozovo	49	MK
Makedonska Kamenica	51	MK
Makedonski Brod	52	MK
Negotino	54	MK
Novo Selo	56	MK
Ohrid	58	MK
Pehcevo	60	MK
Petrovec	59	MK
Plasnica	61	MK
Prilep	62	MK
Probistip	63	MK
Radovis	64	MK
Rankovce	65	MK
Resen	66	MK
Rosoman	67	MK
Skopje	85	MK
Sopiste	70	MK
Stip	83	MK
Struga	72	MK
Strumica	73	MK
Studenicani	74	MK
Sveti Nikole	69	MK
Tearce	75	MK
Tetovo	76	MK
Valandovo	10	MK
Veles	13	MK
Vinica	14	MK
Vrapciste	16	MK
Zelenikovo	32	MK
Zelino	30	MK
Bamako	BKO	ML
Gao	7	ML
Kayes	1	ML
Kidal	8	ML
Koulikoro	2	ML
Mopti	5	ML
Segou	4	ML
Sikasso	3	ML
Tombouctou	6	ML
Ayeyarwady	07	MM
Bago	02	MM
Kachin	11	MM
Magway	03	MM
Mandalay	04	MM
Mon	15	MM
Nay Pyi Taw	18	MM
Rakhine	16	MM
Shan	17	MM
Tanintharyi	05	MM
Yangon	06	MM
Bayan-Olgiy	071	MN
Bulgan	067	MN
Darhan uul	037	MN
Dornogovi	063	MN
Selenge	049	MN
Tov	047	MN
Ulaanbaatar	1	MN
Dakhlet Nouadhibou	08	MR
Guidimaka	10	MR
Nouakchott Nord	14	MR
Tiris Zemmour	11	MR
Attard	01	MT
Balzan	02	MT
Birgu	03	MT
Birkirkara	04	MT
Birzebbuga	05	MT
Bormla	06	MT
Dingli	07	MT
Fgura	08	MT
Floriana	09	MT
Fontana	10	MT
Ghajnsielem	13	MT
Gharb	14	MT
Gharghur	15	MT
Ghasri	16	MT
Ghaxaq	17	MT
Gudja	11	MT
Gzira	12	MT
Hamrun	18	MT
Iklin	19	MT
Isla	20	MT
Kalkara	21	MT
Kercem	22	MT
Kirkop	23	MT
Lija	24	MT
Luqa	25	MT
Marsa	26	MT
Marsaskala	27	MT
Marsaxlokk	28	MT
Mdina	29	MT
Mellieha	30	MT
Mgarr	31	MT
Mosta	32	MT
Mqabba	33	MT
Msida	34	MT
Mtarfa	35	MT
Munxar	36	MT
Nadur	37	MT
Naxxar	38	MT
Paola	39	MT
Pembroke	40	MT
Pieta	41	MT
Qala	42	MT
Qormi	43	MT
Qrendi	44	MT
Rabat Gozo	45	MT
Rabat Malta	46	MT
Safi	47	MT
Saint John	49	MT
Saint Julian's	48	MT
Saint Lucia's	53	MT
Saint Paul's Bay	51	MT
Sannat	52	MT
Santa Venera	54	MT
Siggiewi	55	MT
Sliema	56	MT
Swieqi	57	MT
Ta' Xbiex	58	MT
Tarxien	59	MT
Valletta	60	MT
Xaghra	61	MT
Xewkija	62	MT
Xghajra	63	MT
Zabbar	64	MT
Zebbug Gozo	65	MT
Zejtun	67	MT
Zurrieq	68	MT
Black River	BL	MU
Flacq	FL	MU
Grand Port	GP	MU
Moka	MO	MU
Pamplemousses	PA	MU
Plaines Wilhems	PW	MU
Port Louis	PL	MU
Riviere du Rempart	RR	MU
Rodrigues Islands	RO	MU
Savanne	SA	MU
Alifu Alifu	02	MV
Baa	20	MV
Gaafu Dhaalu	28	MV
Haa Dhaalu	23	MV
Kaafu	26	MV
Laamu	05	MV
Maale	MLE	MV
Meemu	12	MV
Noonu	25	MV
Raa	13	MV
Seenu	01	MV
Vaavu	04	MV
Balaka	BA	MW
Blantyre	BL	MW
Dowa	DO	MW
Lilongwe	LI	MW
Machinga	MH	MW
Mangochi	MG	MW
Mzimba	MZ	MW
Ntchisi	NI	MW
Salima	SA	MW
Zomba	ZO	MW
Aguascalientes	AGU	MX
Baja California	BCN	MX
Baja California Sur	BCS	MX
Campeche	CAM	MX
Chiapas	CHP	MX
Chihuahua	CHH	MX
Ciudad de Mexico	CMX	MX
Coahuila de Zaragoza	COA	MX
Colima	COL	MX
Durango	DUR	MX
Guanajuato	GUA	MX
Guerrero	GRO	MX
Hidalgo	HID	MX
Jalisco	JAL	MX
Mexico	MEX	MX
Michoacan de Ocampo	MIC	MX
Morelos	MOR	MX
Nayarit	NAY	MX
Nuevo Leon	NLE	MX
Oaxaca	OAX	MX
Puebla	PUE	MX
Queretaro	QUE	MX
Quintana Roo	ROO	MX
San Luis Potosi	SLP	MX
Sinaloa	SIN	MX
Sonora	SON	MX
Tabasco	TAB	MX
Tamaulipas	TAM	MX
Tlaxcala	TLA	MX
Veracruz de Ignacio de la Llave	VER	MX
Yucatan	YUC	MX
Zacatecas	ZAC	MX
Johor	01	MY
Kedah	02	MY
Kelantan	03	MY
Melaka	04	MY
Negeri Sembilan	05	MY
Pahang	06	MY
Perak	08	MY
Perlis	09	MY
Pulau Pinang	07	MY
Sabah	12	MY
Sarawak	13	MY
Selangor	10	MY
Terengganu	11	MY
Wilayah Persekutuan Kuala Lumpur	14	MY
Wilayah Persekutuan Labuan	15	MY
Wilayah Persekutuan Putrajaya	16	MY
Maputo	L	MZ
Nampula	N	MZ
Niassa	A	MZ
Sofala	S	MZ
Tete	T	MZ
Zambezia	Q	MZ
Erongo	ER	NA
Hardap	HA	NA
Karas	KA	NA
Kavango East	KE	NA
Khomas	KH	NA
Kunene	KU	NA
Ohangwena	OW	NA
Omaheke	OH	NA
Omusati	OS	NA
Oshana	ON	NA
Oshikoto	OT	NA
Otjozondjupa	OD	NA
Zambezi	CA	NA
Agadez	1	NE
Diffa	2	NE
Dosso	3	NE
Maradi	4	NE
Niamey	8	NE
Tahoua	5	NE
Tillaberi	6	NE
Zinder	7	NE
Abia	AB	NG
Abuja Federal Capital Territory	FC	NG
Adamawa	AD	NG
Akwa Ibom	AK	NG
Anambra	AN	NG
Bauchi	BA	NG
Bayelsa	BY	NG
Benue	BE	NG
Borno	BO	NG
Cross River	CR	NG
Delta	DE	NG
Ebonyi	EB	NG
Edo	ED	NG
Ekiti	EK	NG
Enugu	EN	NG
Gombe	GO	NG
Imo	IM	NG
Jigawa	JI	NG
Kaduna	KD	NG
Kano	KN	NG
Katsina	KT	NG
Kebbi	KE	NG
Kogi	KO	NG
Kwara	KW	NG
Lagos	LA	NG
Nasarawa	NA	NG
Niger	NI	NG
Ogun	OG	NG
Ondo	ON	NG
Osun	OS	NG
Oyo	OY	NG
Plateau	PL	NG
Rivers	RI	NG
Sokoto	SO	NG
Taraba	TA	NG
Yobe	YO	NG
Zamfara	ZA	NG
Boaco	BO	NI
Carazo	CA	NI
Chinandega	CI	NI
Chontales	CO	NI
Costa Caribe Sur	AS	NI
Esteli	ES	NI
Granada	GR	NI
Jinotega	JI	NI
Leon	LE	NI
Madriz	MD	NI
Managua	MN	NI
Masaya	MS	NI
Matagalpa	MT	NI
Nueva Segovia	NS	NI
Rio San Juan	SJ	NI
Rivas	RI	NI
Drenthe	DR	NL
Flevoland	FL	NL
Fryslan	FR	NL
Gelderland	GE	NL
Groningen	GR	NL
Limburg	LI	NL
Noord-Brabant	NB	NL
Noord-Holland	NH	NL
Overijssel	OV	NL
Utrecht	UT	NL
Zeeland	ZE	NL
Zuid-Holland	ZH	NL
Akershus	02	NO
Aust-Agder	09	NO
Buskerud	06	NO
Finnmark	20	NO
Hedmark	04	NO
Hordaland	12	NO
More og Romsdal	15	NO
Nord-Trondelag	17	NO
Nordland	18	NO
Oppland	05	NO
Oslo	03	NO
Ostfold	01	NO
Rogaland	11	NO
Sogn og Fjordane	14	NO
Sor-Trondelag	16	NO
Telemark	08	NO
Troms	19	NO
Vest-Agder	10	NO
Vestfold	07	NO
Bagmati	BA	NP
Bheri	BH	NP
Dhawalagiri	DH	NP
Gandaki	GA	NP
Janakpur	JA	NP
Kosi	KO	NP
Lumbini	LU	NP
Mahakali	MA	NP
Mechi	ME	NP
Narayani	NA	NP
Rapti	RA	NP
Sagarmatha	SA	NP
Seti	SE	NP
Yaren	14	NR
Auckland	AUK	NZ
Bay of Plenty	BOP	NZ
Canterbury	CAN	NZ
Chatham Islands Territory	CIT	NZ
Gisborne	GIS	NZ
Hawke's Bay	HKB	NZ
Manawatu-Wanganui	MWT	NZ
Marlborough	MBH	NZ
Nelson	NSN	NZ
Northland	NTL	NZ
Otago	OTA	NZ
Southland	STL	NZ
Taranaki	TKI	NZ
Tasman	TAS	NZ
Waikato	WKO	NZ
Wellington	WGN	NZ
West Coast	WTC	NZ
Ad Dakhiliyah	DA	OM
Al Buraymi	BU	OM
Al Wusta	WU	OM
Az Zahirah	ZA	OM
Janub al Batinah	BJ	OM
Janub ash Sharqiyah	SJ	OM
Masqat	MA	OM
Musandam	MU	OM
Shamal al Batinah	BS	OM
Shamal ash Sharqiyah	SS	OM
Zufar	ZU	OM
Bocas del Toro	1	PA
Chiriqui	4	PA
Cocle	2	PA
Colon	3	PA
Arequipa	ARE	PE
Ayacucho	AYA	PE
Cajamarca	CAJ	PE
Cusco	CUS	PE
El Callao	CAL	PE
Huancavelica	HUV	PE
Huanuco	HUC	PE
Ica	ICA	PE
Junin	JUN	PE
La Libertad	LAL	PE
Lambayeque	LAM	PE
Lima	LIM	PE
Loreto	LOR	PE
Madre de Dios	MDD	PE
Moquegua	MOQ	PE
Pasco	PAS	PE
Piura	PIU	PE
Puno	PUN	PE
San Martin	SAM	PE
Tacna	TAC	PE
Tumbes	TUM	PE
Ucayali	UCA	PE
Central	CPM	PG
East New Britain	EBR	PG
Eastern Highlands	EHG	PG
Madang	MPM	PG
Manus	MRL	PG
Morobe	MPL	PG
National Capital District (Port Moresby)	NCD	PG
New Ireland	NIK	PG
Southern Highlands	SHM	PG
Western Highlands	WHM	PG
Abra	ABR	PH
Agusan del Norte	AGN	PH
Agusan del Sur	AGS	PH
Aklan	AKL	PH
Albay	ALB	PH
Antique	ANT	PH
Apayao	APA	PH
Aurora	AUR	PH
Basilan	BAS	PH
Bataan	BAN	PH
Batanes	BTN	PH
Batangas	BTG	PH
Benguet	BEN	PH
Biliran	BIL	PH
Bohol	BOH	PH
Bukidnon	BUK	PH
Bulacan	BUL	PH
Cagayan	CAG	PH
Camarines Norte	CAN	PH
Camarines Sur	CAS	PH
Camiguin	CAM	PH
Capiz	CAP	PH
Catanduanes	CAT	PH
Cavite	CAV	PH
Cebu	CEB	PH
Compostela Valley	COM	PH
Cotabato	NCO	PH
Davao Oriental	DAO	PH
Davao del Norte	DAV	PH
Davao del Sur	DAS	PH
Dinagat Islands	DIN	PH
Eastern Samar	EAS	PH
Guimaras	GUI	PH
Ifugao	IFU	PH
Ilocos Norte	ILN	PH
Ilocos Sur	ILS	PH
Iloilo	ILI	PH
Isabela	ISA	PH
La Union	LUN	PH
Laguna	LAG	PH
Lanao del Norte	LAN	PH
Lanao del Sur	LAS	PH
Leyte	LEY	PH
Maguindanao	MAG	PH
Marinduque	MAD	PH
Masbate	MAS	PH
Mindoro Occidental	MDC	PH
Mindoro Oriental	MDR	PH
Misamis Occidental	MSC	PH
Misamis Oriental	MSR	PH
Mountain Province	MOU	PH
National Capital Region	00	PH
Negros Occidental	NEC	PH
Negros Oriental	NER	PH
Northern Samar	NSA	PH
Nueva Ecija	NUE	PH
Nueva Vizcaya	NUV	PH
Palawan	PLW	PH
Pampanga	PAM	PH
Pangasinan	PAN	PH
Quezon	QUE	PH
Quirino	QUI	PH
Rizal	RIZ	PH
Romblon	ROM	PH
Samar	WSA	PH
Sarangani	SAR	PH
Siquijor	SIG	PH
Sorsogon	SOR	PH
South Cotabato	SCO	PH
Southern Leyte	SLE	PH
Sultan Kudarat	SUK	PH
Sulu	SLU	PH
Surigao del Norte	SUN	PH
Surigao del Sur	SUR	PH
Tarlac	TAR	PH
Tawi-Tawi	TAW	PH
Zambales	ZMB	PH
Zamboanga Sibugay	ZSI	PH
Zamboanga del Norte	ZAN	PH
Zamboanga del Sur	ZAS	PH
Azad Jammu and Kashmir	JK	PK
Balochistan	BA	PK
Federally Administered Tribal Areas	TA	PK
Gilgit-Baltistan	GB	PK
Islamabad	IS	PK
Khyber Pakhtunkhwa	KP	PK
Punjab	PB	PK
Sindh	SD	PK
Dolnoslaskie	DS	PL
Kujawsko-pomorskie	KP	PL
Lodzkie	LD	PL
Lubelskie	LU	PL
Lubuskie	LB	PL
Malopolskie	MA	PL
Mazowieckie	MZ	PL
Opolskie	OP	PL
Podkarpackie	PK	PL
Podlaskie	PD	PL
Pomorskie	PM	PL
Slaskie	SL	PL
Swietokrzyskie	SK	PL
Warminsko-mazurskie	WN	PL
Wielkopolskie	WP	PL
Zachodniopomorskie	ZP	PL
Bihor	BH	RO
Bistrita-Nasaud	BN	RO
Botosani	BT	RO
Braila	BR	RO
Brasov	BV	RO
Bucuresti	B	RO
Buzau	BZ	RO
Calarasi	CL	RO
Caras-Severin	CS	RO
Cluj	CJ	RO
Constanta	CT	RO
Covasna	CV	RO
Dambovita	DB	RO
Dolj	DJ	RO
Galati	GL	RO
Giurgiu	GR	RO
Gorj	GJ	RO
Harghita	HR	RO
Hunedoara	HD	RO
Ialomita	IL	RO
Iasi	IS	RO
Ilfov	IF	RO
Maramures	MM	RO
Mehedinti	MH	RO
Mures	MS	RO
Neamt	NT	RO
Olt	OT	RO
Prahova	PH	RO
Salaj	SJ	RO
Satu Mare	SM	RO
Sibiu	SB	RO
Suceava	SV	RO
Teleorman	TR	RO
Timis	TM	RO
Tulcea	TL	RO
Valcea	VL	RO
Vaslui	VS	RO
Vrancea	VN	RO
Beograd	00	RS
Borski okrug	14	RS
Branicevski okrug	11	RS
Jablanicki okrug	23	RS
Juznobacki okrug	06	RS
Juznobanatski okrug	04	RS
Kolubarski okrug	09	RS
Kosovsko-Mitrovacki okrug	28	RS
Macvanski okrug	08	RS
Moravicki okrug	17	RS
Nisavski okrug	20	RS
Pcinjski okrug	24	RS
Pecki okrug	26	RS
Pirotski okrug	22	RS
Podunavski okrug	10	RS
Pomoravski okrug	13	RS
Prizrenski okrug	27	RS
Rasinski okrug	19	RS
Raski okrug	18	RS
Severnobacki okrug	01	RS
Severnobanatski okrug	03	RS
Srednjebanatski okrug	02	RS
Sremski okrug	07	RS
Sumadijski okrug	12	RS
Toplicki okrug	21	RS
Zajecarski okrug	15	RS
Zapadnobacki okrug	05	RS
Zlatiborski okrug	16	RS
Adygeya, Respublika	AD	RU
Altay, Respublika	AL	RU
Altayskiy kray	ALT	RU
Amurskaya oblast'	AMU	RU
Arkhangel'skaya oblast'	ARK	RU
Astrakhanskaya oblast'	AST	RU
Bashkortostan, Respublika	BA	RU
Belgorodskaya oblast'	BEL	RU
Bryanskaya oblast'	BRY	RU
Buryatiya, Respublika	BU	RU
Chechenskaya Respublika	CE	RU
Chelyabinskaya oblast'	CHE	RU
Chukotskiy avtonomnyy okrug	CHU	RU
Chuvashskaya Respublika	CU	RU
Dagestan, Respublika	DA	RU
Ingushetiya, Respublika	IN	RU
Irkutskaya oblast'	IRK	RU
Ivanovskaya oblast'	IVA	RU
Kabardino-Balkarskaya Respublika	KB	RU
Kaliningradskaya oblast'	KGD	RU
Kalmykiya, Respublika	KL	RU
Kaluzhskaya oblast'	KLU	RU
Kamchatskiy kray	KAM	RU
Karachayevo-Cherkesskaya Respublika	KC	RU
Kareliya, Respublika	KR	RU
Kemerovskaya oblast'	KEM	RU
Khabarovskiy kray	KHA	RU
Khakasiya, Respublika	KK	RU
Khanty-Mansiyskiy avtonomnyy okrug	KHM	RU
Kirovskaya oblast'	KIR	RU
Komi, Respublika	KO	RU
Kostromskaya oblast'	KOS	RU
Krasnodarskiy kray	KDA	RU
Krasnoyarskiy kray	KYA	RU
Kurganskaya oblast'	KGN	RU
Kurskaya oblast'	KRS	RU
Leningradskaya oblast'	LEN	RU
Lipetskaya oblast'	LIP	RU
Magadanskaya oblast'	MAG	RU
Mariy El, Respublika	ME	RU
Mordoviya, Respublika	MO	RU
Moskovskaya oblast'	MOS	RU
Moskva	MOW	RU
Murmanskaya oblast'	MUR	RU
Nenetskiy avtonomnyy okrug	NEN	RU
Nizhegorodskaya oblast'	NIZ	RU
Novgorodskaya oblast'	NGR	RU
Novosibirskaya oblast'	NVS	RU
Omskaya oblast'	OMS	RU
Orenburgskaya oblast'	ORE	RU
Orlovskaya oblast'	ORL	RU
Penzenskaya oblast'	PNZ	RU
Permskiy kray	PER	RU
Primorskiy kray	PRI	RU
Pskovskaya oblast'	PSK	RU
Rostovskaya oblast'	ROS	RU
Ryazanskaya oblast'	RYA	RU
Saha, Respublika	SA	RU
Sakhalinskaya oblast'	SAK	RU
Samarskaya oblast'	SAM	RU
Sankt-Peterburg	SPE	RU
Saratovskaya oblast'	SAR	RU
Severnaya Osetiya, Respublika	SE	RU
Smolenskaya oblast'	SMO	RU
Stavropol'skiy kray	STA	RU
Sverdlovskaya oblast'	SVE	RU
Tambovskaya oblast'	TAM	RU
Tatarstan, Respublika	TA	RU
Tomskaya oblast'	TOM	RU
Tul'skaya oblast'	TUL	RU
Tverskaya oblast'	TVE	RU
Tyumenskaya oblast'	TYU	RU
Tyva, Respublika	TY	RU
Udmurtskaya Respublika	UD	RU
Ul'yanovskaya oblast'	ULY	RU
Vladimirskaya oblast'	VLA	RU
Volgogradskaya oblast'	VGG	RU
Vologodskaya oblast'	VLG	RU
Voronezhskaya oblast'	VOR	RU
Yamalo-Nenetskiy avtonomnyy okrug	YAN	RU
Yaroslavskaya oblast'	YAR	RU
Yevreyskaya avtonomnaya oblast'	YEV	RU
Zabaykal'skiy kray	ZAB	RU
Est	02	RW
Nord	03	RW
Ouest	04	RW
Sud	05	RW
Ville de Kigali	01	RW
'Asir	14	SA
Al Bahah	11	SA
Al Hudud ash Shamaliyah	08	SA
Al Jawf	12	SA
Al Madinah al Munawwarah	03	SA
Al Qasim	05	SA
Ar Riyad	01	SA
Ash Sharqiyah	04	SA
Ha'il	06	SA
Jazan	09	SA
Makkah al Mukarramah	02	SA
Najran	10	SA
Tabuk	07	SA
Guadalcanal	GU	SB
Western	WE	SB
Anse Boileau	02	SC
Anse Royale	05	SC
Anse aux Pins	01	SC
Baie Lazare	06	SC
Beau Vallon	08	SC
Bel Ombre	10	SC
Cascade	11	SC
English River	16	SC
Grand Anse Mahe	13	SC
La Digue	15	SC
Takamaka	23	SC
Blue Nile	NB	SD
Gedaref	GD	SD
Gezira	GZ	SD
Kassala	KA	SD
Khartoum	KH	SD
North Darfur	DN	SD
North Kordofan	KN	SD
Northern	NO	SD
Red Sea	RS	SD
River Nile	NR	SD
Sennar	SI	SD
South Darfur	DS	SD
South Kordofan	KS	SD
West Darfur	DW	SD
White Nile	NW	SD
Blekinge lan	K	SE
Dalarnas lan	W	SE
Gavleborgs lan	X	SE
Gotlands lan	I	SE
Hallands lan	N	SE
Jamtlands lan	Z	SE
Jonkopings lan	F	SE
Kalmar lan	H	SE
Kronobergs lan	G	SE
Norrbottens lan	BD	SE
Orebro lan	T	SE
Ostergotlands lan	E	SE
Skane lan	M	SE
Sodermanlands lan	D	SE
Stockholms lan	AB	SE
Uppsala lan	C	SE
Varmlands lan	S	SE
Vasterbottens lan	AC	SE
Vasternorrlands lan	Y	SE
Vastmanlands lan	U	SE
Vastra Gotalands lan	O	SE
Saint Helena	HL	SH
Ajdovscina	001	SI
Apace	195	SI
Beltinci	002	SI
Benedikt	148	SI
Bistrica ob Sotli	149	SI
Bled	003	SI
Bloke	150	SI
Bohinj	004	SI
Borovnica	005	SI
Bovec	006	SI
Braslovce	151	SI
Brda	007	SI
Brezice	009	SI
Brezovica	008	SI
Cankova	152	SI
Celje	011	SI
Cerklje na Gorenjskem	012	SI
Cerknica	013	SI
Cerkno	014	SI
Cirkulane	196	SI
Crensovci	015	SI
Crnomelj	017	SI
Destrnik	018	SI
Divaca	019	SI
Dobje	154	SI
Dobrepolje	020	SI
Dobrna	155	SI
Dobrova-Polhov Gradec	021	SI
Dobrovnik	156	SI
Domzale	023	SI
Dornava	024	SI
Dravograd	025	SI
Duplek	026	SI
Gorje	207	SI
Gornja Radgona	029	SI
Gornji Petrovci	031	SI
Grad	158	SI
Grosuplje	032	SI
Hajdina	159	SI
Hoce-Slivnica	160	SI
Hodos	161	SI
Horjul	162	SI
Hrastnik	034	SI
Hrpelje-Kozina	035	SI
Idrija	036	SI
Ig	037	SI
Ilirska Bistrica	038	SI
Ivancna Gorica	039	SI
Izola	040	SI
Jesenice	041	SI
Jursinci	042	SI
Kamnik	043	SI
Kanal	044	SI
Kidricevo	045	SI
Kobarid	046	SI
Kobilje	047	SI
Kocevje	048	SI
Komen	049	SI
Komenda	164	SI
Koper	050	SI
Kosanjevica na Krki	197	SI
Kostel	165	SI
Kranj	052	SI
Kranjska Gora	053	SI
Krizevci	166	SI
Krsko	054	SI
Kungota	055	SI
Kuzma	056	SI
Lasko	057	SI
Lenart	058	SI
Lendava	059	SI
Litija	060	SI
Ljubljana	061	SI
Ljutomer	063	SI
Log-Dragomer	208	SI
Logatec	064	SI
Loska Dolina	065	SI
Lovrenc na Pohorju	167	SI
Luce	067	SI
Lukovica	068	SI
Majsperk	069	SI
Makole	198	SI
Maribor	070	SI
Markovci	168	SI
Medvode	071	SI
Menges	072	SI
Metlika	073	SI
Mezica	074	SI
Miklavz na Dravskem Polju	169	SI
Miren-Kostanjevica	075	SI
Mirna Pec	170	SI
Mislinja	076	SI
Mokronog-Trebelno	199	SI
Moravce	077	SI
Mozirje	079	SI
Murska Sobota	080	SI
Muta	081	SI
Naklo	082	SI
Nazarje	083	SI
Nova Gorica	084	SI
Novo Mesto	085	SI
Odranci	086	SI
Oplotnica	171	SI
Ormoz	087	SI
Piran	090	SI
Pivka	091	SI
Podcetrtek	092	SI
Podlehnik	172	SI
Poljcane	200	SI
Prebold	174	SI
Preddvor	095	SI
Prevalje	175	SI
Ptuj	096	SI
Puconci	097	SI
Race-Fram	098	SI
Radece	099	SI
Radenci	100	SI
Radlje ob Dravi	101	SI
Radovljica	102	SI
Ravne na Koroskem	103	SI
Razkrizje	176	SI
Recica ob Savinji	209	SI
Rence-Vogrsko	201	SI
Ribnica	104	SI
Rogaska Slatina	106	SI
Rogasovci	105	SI
Ruse	108	SI
Salovci	033	SI
Semic	109	SI
Sempeter-Vrtojba	183	SI
Sencur	117	SI
Sentilj	118	SI
Sentjernej	119	SI
Sentjur	120	SI
Sentrupert	211	SI
Sevnica	110	SI
Sezana	111	SI
Skocjan	121	SI
Skofja Loka	122	SI
Skofljica	123	SI
Slovenj Gradec	112	SI
Slovenska Bistrica	113	SI
Slovenske Konjice	114	SI
Smarje pri Jelsah	124	SI
Smarjeske Toplice	206	SI
Smartno ob Paki	125	SI
Smartno pri Litiji	194	SI
Sodrazica	179	SI
Solcava	180	SI
Sostanj	126	SI
Starse	115	SI
Store	127	SI
Straza	203	SI
Sveta Trojica v Slovenskih Goricah	204	SI
Sveti Andraz v Slovenskih Goricah	182	SI
Sveti Jurij	116	SI
Sveti Jurij v Slovenskih Goricah	210	SI
Sveti Tomaz	205	SI
Tabor	184	SI
Tisina	010	SI
Tolmin	128	SI
Trbovlje	129	SI
Trebnje	130	SI
Trnovska Vas	185	SI
Trzic	131	SI
Trzin	186	SI
Turnisce	132	SI
Velenje	133	SI
Velika Polana	187	SI
Velike Lasce	134	SI
Verzej	188	SI
Videm	135	SI
Vipava	136	SI
Vitanje	137	SI
Vodice	138	SI
Vojnik	139	SI
Vransko	189	SI
Vrhnika	140	SI
Vuzenica	141	SI
Zagorje ob Savi	142	SI
Zalec	190	SI
Zavrc	143	SI
Zelezniki	146	SI
Zetale	191	SI
Ziri	147	SI
Zrece	144	SI
Zuzemberk	193	SI
Banskobystricky kraj	BC	SK
Bratislavsky kraj	BL	SK
Kosicky kraj	KI	SK
Nitriansky kraj	NI	SK
Presovsky kraj	PV	SK
Trenciansky kraj	TC	SK
Trnavsky kraj	TA	SK
Zilinsky kraj	ZI	SK
Eastern	E	SL
Western Area	W	SL
Domagnano	03	SM
San Marino	07	SM
Serravalle	09	SM
Dakar	DK	SN
Diourbel	DB	SN
Fatick	FK	SN
Kaffrine	KA	SN
Kaolack	KL	SN
Louga	LG	SN
Saint-Louis	SL	SN
Tambacounda	TC	SN
Thies	TH	SN
Ziguinchor	ZG	SN
Awdal	AW	SO
Banaadir	BN	SO
Bay	BY	SO
Mudug	MU	SO
Nugaal	NU	SO
Togdheer	TO	SO
Woqooyi Galbeed	WO	SO
Brokopondo	BR	SR
Commewijne	CM	SR
Nickerie	NI	SR
Para	PR	SR
Paramaribo	PM	SR
Saramacca	SA	SR
Sipaliwini	SI	SR
Wanica	WA	SR
Central Equatoria	EC	SS
Eastern Equatoria	EE	SS
Unity	UY	SS
Upper Nile	NU	SS
Western Equatoria	EW	SS
Principe	P	ST
Sao Tome	S	ST
Ahuachapan	AH	SV
Cabanas	CA	SV
Chalatenango	CH	SV
Cuscatlan	CU	SV
La Libertad	LI	SV
La Paz	PA	SV
La Union	UN	SV
Morazan	MO	SV
San Miguel	SM	SV
San Salvador	SS	SV
San Vicente	SV	SV
Santa Ana	SA	SV
Sonsonate	SO	SV
Usulutan	US	SV
Al Hasakah	HA	SY
Al Ladhiqiyah	LA	SY
Al Qunaytirah	QU	SY
As Suwayda'	SU	SY
Dar'a	DR	SY
Dayr az Zawr	DY	SY
Dimashq	DI	SY
Halab	HL	SY
Hamah	HM	SY
Hims	HI	SY
Idlib	ID	SY
Rif Dimashq	RD	SY
Tartus	TA	SY
Hhohho	HH	SZ
Lubombo	LU	SZ
Manzini	MA	SZ
Mayo-Kebbi-Est	ME	TD
Ouaddai	OD	TD
Tibesti	TI	TD
Ville de Ndjamena	ND	TD
Wadi Fira	WF	TD
Kara	K	TG
Maritime	M	TG
Plateaux	P	TG
Savanes	S	TG
Amnat Charoen	37	TH
Ang Thong	15	TH
Bueng Kan	38	TH
Buri Ram	31	TH
Chachoengsao	24	TH
Chai Nat	18	TH
Chaiyaphum	36	TH
Chanthaburi	22	TH
Chiang Mai	50	TH
Chiang Rai	57	TH
Chon Buri	20	TH
Chumphon	86	TH
Kalasin	46	TH
Kamphaeng Phet	62	TH
Kanchanaburi	71	TH
Khon Kaen	40	TH
Krabi	81	TH
Krung Thep Maha Nakhon	10	TH
Lampang	52	TH
Lamphun	51	TH
Loei	42	TH
Lop Buri	16	TH
Mae Hong Son	58	TH
Maha Sarakham	44	TH
Mukdahan	49	TH
Nakhon Nayok	26	TH
Nakhon Pathom	73	TH
Nakhon Phanom	48	TH
Nakhon Ratchasima	30	TH
Nakhon Sawan	60	TH
Nakhon Si Thammarat	80	TH
Nan	55	TH
Narathiwat	96	TH
Nong Bua Lam Phu	39	TH
Nong Khai	43	TH
Nonthaburi	12	TH
Pathum Thani	13	TH
Pattani	94	TH
Phangnga	82	TH
Phatthalung	93	TH
Phayao	56	TH
Phetchabun	67	TH
Phetchaburi	76	TH
Phichit	66	TH
Phitsanulok	65	TH
Phra Nakhon Si Ayutthaya	14	TH
Phrae	54	TH
Phuket	83	TH
Prachin Buri	25	TH
Prachuap Khiri Khan	77	TH
Ranong	85	TH
Ratchaburi	70	TH
Rayong	21	TH
Roi Et	45	TH
Sa Kaeo	27	TH
Sakon Nakhon	47	TH
Samut Prakan	11	TH
Samut Sakhon	74	TH
Samut Songkhram	75	TH
Saraburi	19	TH
Satun	91	TH
Si Sa Ket	33	TH
Sing Buri	17	TH
Songkhla	90	TH
Sukhothai	64	TH
Suphan Buri	72	TH
Surat Thani	84	TH
Surin	32	TH
Tak	63	TH
Trang	92	TH
Trat	23	TH
Ubon Ratchathani	34	TH
Udon Thani	41	TH
Uthai Thani	61	TH
Uttaradit	53	TH
Yala	95	TH
Yasothon	35	TH
Dushanbe	DU	TJ
Khatlon	KT	TJ
Kuhistoni Badakhshon	GB	TJ
Nohiyahoi Tobei Jumhuri	RA	TJ
Sughd	SU	TJ
Ainaro	AN	TL
Cova Lima	CO	TL
Dili	DI	TL
Ahal	A	TM
Balkan	B	TM
Dasoguz	D	TM
Lebap	L	TM
Mary	M	TM
Beja	31	TN
Ben Arous	13	TN
Bizerte	23	TN
Gabes	81	TN
Gafsa	71	TN
Jendouba	32	TN
Kairouan	41	TN
Kasserine	42	TN
Kebili	73	TN
L'Ariana	12	TN
La Manouba	14	TN
Le Kef	33	TN
Mahdia	53	TN
Medenine	82	TN
Monastir	52	TN
Nabeul	21	TN
Sfax	61	TN
Sidi Bouzid	43	TN
Siliana	34	TN
Sousse	51	TN
Tataouine	83	TN
Tozeur	72	TN
Tunis	11	TN
Zaghouan	22	TN
Tongatapu	04	TO
Vava'u	05	TO
Adana	01	TR
Adiyaman	02	TR
Afyonkarahisar	03	TR
Agri	04	TR
Aksaray	68	TR
Amasya	05	TR
Ankara	06	TR
Antalya	07	TR
Ardahan	75	TR
Artvin	08	TR
Aydin	09	TR
Balikesir	10	TR
Bartin	74	TR
Batman	72	TR
Bayburt	69	TR
Bilecik	11	TR
Bingol	12	TR
Bitlis	13	TR
Bolu	14	TR
Burdur	15	TR
Bursa	16	TR
Canakkale	17	TR
Cankiri	18	TR
Corum	19	TR
Denizli	20	TR
Diyarbakir	21	TR
Duzce	81	TR
Edirne	22	TR
Elazig	23	TR
Erzincan	24	TR
Erzurum	25	TR
Eskisehir	26	TR
Gaziantep	27	TR
Giresun	28	TR
Gumushane	29	TR
Hakkari	30	TR
Hatay	31	TR
Igdir	76	TR
Isparta	32	TR
Istanbul	34	TR
Izmir	35	TR
Kahramanmaras	46	TR
Karabuk	78	TR
Karaman	70	TR
Kars	36	TR
Kastamonu	37	TR
Kayseri	38	TR
Kilis	79	TR
Kirikkale	71	TR
Kirklareli	39	TR
Kirsehir	40	TR
Kocaeli	41	TR
Konya	42	TR
Kutahya	43	TR
Malatya	44	TR
Manisa	45	TR
Mardin	47	TR
Mersin	33	TR
Mugla	48	TR
Mus	49	TR
Nevsehir	50	TR
Nigde	51	TR
Ordu	52	TR
Osmaniye	80	TR
Rize	53	TR
Sakarya	54	TR
Samsun	55	TR
Sanliurfa	63	TR
Siirt	56	TR
Sinop	57	TR
Sirnak	73	TR
Sivas	58	TR
Tekirdag	59	TR
Tokat	60	TR
Trabzon	61	TR
Tunceli	62	TR
Usak	64	TR
Van	65	TR
Yalova	77	TR
Yozgat	66	TR
Zonguldak	67	TR
Arima	ARI	TT
Chaguanas	CHA	TT
Couva-Tabaquite-Talparo	CTT	TT
Diego Martin	DMN	TT
Mayaro-Rio Claro	MRC	TT
Penal-Debe	PED	TT
Point Fortin	PTF	TT
Port of Spain	POS	TT
Princes Town	PRT	TT
San Fernando	SFO	TT
San Juan-Laventille	SJL	TT
Sangre Grande	SGE	TT
Siparia	SIP	TT
Tobago	TOB	TT
Tunapuna-Piarco	TUP	TT
Funafuti	FUN	TV
Changhua	CHA	TW
Chiayi	CYQ	TW
Hsinchu	HSQ	TW
Hualien	HUA	TW
Kaohsiung	KHH	TW
Keelung	KEE	TW
Kinmen	KIN	TW
Lienchiang	LIE	TW
Miaoli	MIA	TW
Nantou	NAN	TW
New Taipei	NWT	TW
Penghu	PEN	TW
Pingtung	PIF	TW
Taichung	TXG	TW
Tainan	TNN	TW
Taipei	TPE	TW
Taitung	TTT	TW
Taoyuan	TAO	TW
Yilan	ILA	TW
Yunlin	YUN	TW
Arusha	01	TZ
Dar es Salaam	02	TZ
Dodoma	03	TZ
Geita	27	TZ
Iringa	04	TZ
Kagera	05	TZ
Kaskazini Unguja	07	TZ
Katavi	28	TZ
Kigoma	08	TZ
Kilimanjaro	09	TZ
Kusini Pemba	10	TZ
Kusini Unguja	11	TZ
Lindi	12	TZ
Manyara	26	TZ
Mara	13	TZ
Mbeya	14	TZ
Mjini Magharibi	15	TZ
Morogoro	16	TZ
Mtwara	17	TZ
Mwanza	18	TZ
Njombe	29	TZ
Pwani	19	TZ
Rukwa	20	TZ
Ruvuma	21	TZ
Shinyanga	22	TZ
Simiyu	30	TZ
Singida	23	TZ
Tabora	24	TZ
Tanga	25	TZ
Avtonomna Respublika Krym	43	UA
Cherkaska oblast	71	UA
Chernihivska oblast	74	UA
Chernivetska oblast	77	UA
Dnipropetrovska oblast	12	UA
Donetska oblast	14	UA
Ivano-Frankivska oblast	26	UA
Kharkivska oblast	63	UA
Khersonska oblast	65	UA
Khmelnytska oblast	68	UA
Kirovohradska oblast	35	UA
Kyiv	30	UA
Kyivska oblast	32	UA
Luhanska oblast	09	UA
Lvivska oblast	46	UA
Mykolaivska oblast	48	UA
Odeska oblast	51	UA
Poltavska oblast	53	UA
Rivnenska oblast	56	UA
Sevastopol	40	UA
Sumska oblast	59	UA
Ternopilska oblast	61	UA
Vinnytska oblast	05	UA
Volynska oblast	07	UA
Zakarpatska oblast	21	UA
Zaporizka oblast	23	UA
Zhytomyrska oblast	18	UA
Amuru	316	UG
Arua	303	UG
Buikwe	117	UG
Buliisa	416	UG
Buvuma	120	UG
Gomba	121	UG
Gulu	304	UG
Jinja	204	UG
Kabale	404	UG
Kabarole	405	UG
Kampala	102	UG
Kasese	406	UG
Kyenjojo	415	UG
Lira	307	UG
Luwero	104	UG
Masaka	105	UG
Mbale	209	UG
Mbarara	410	UG
Moyo	309	UG
Soroti	211	UG
Wakiso	113	UG
Palmyra Atoll	95	UM
Alabama	AL	US
Alaska	AK	US
Arizona	AZ	US
Arkansas	AR	US
California	CA	US
Colorado	CO	US
Connecticut	CT	US
Delaware	DE	US
District of Columbia	DC	US
Florida	FL	US
Georgia	GA	US
Hawaii	HI	US
Idaho	ID	US
Illinois	IL	US
Indiana	IN	US
Iowa	IA	US
Kansas	KS	US
Kentucky	KY	US
Louisiana	LA	US
Maine	ME	US
Maryland	MD	US
Massachusetts	MA	US
Michigan	MI	US
Minnesota	MN	US
Mississippi	MS	US
Missouri	MO	US
Montana	MT	US
Nebraska	NE	US
Nevada	NV	US
New Hampshire	NH	US
New Jersey	NJ	US
New Mexico	NM	US
New York	NY	US
North Carolina	NC	US
North Dakota	ND	US
Ohio	OH	US
Oklahoma	OK	US
Oregon	OR	US
Pennsylvania	PA	US
Rhode Island	RI	US
South Carolina	SC	US
South Dakota	SD	US
Tennessee	TN	US
Texas	TX	US
Utah	UT	US
Vermont	VT	US
Virginia	VA	US
Washington	WA	US
West Virginia	WV	US
Wisconsin	WI	US
Wyoming	WY	US
Artigas	AR	UY
Canelones	CA	UY
Cerro Largo	CL	UY
Colonia	CO	UY
Durazno	DU	UY
Flores	FS	UY
Florida	FD	UY
Lavalleja	LA	UY
Maldonado	MA	UY
Montevideo	MO	UY
Paysandu	PA	UY
Rio Negro	RN	UY
Rivera	RV	UY
Rocha	RO	UY
Salto	SA	UY
San Jose	SJ	UY
Soriano	SO	UY
Tacuarembo	TA	UY
Treinta y Tres	TT	UY
Andijon	AN	UZ
Buxoro	BU	UZ
Farg'ona	FA	UZ
Jizzax	JI	UZ
Namangan	NG	UZ
Navoiy	NW	UZ
Qashqadaryo	QA	UZ
Qoraqalpog'iston Respublikasi	QR	UZ
Samarqand	SA	UZ
Surxondaryo	SU	UZ
Toshkent	TK	UZ
Xorazm	XO	UZ
Charlotte	01	VC
Grenadines	06	VC
Saint David	03	VC
Saint George	04	VC
Saint Patrick	05	VC
Amazonas	Z	VE
Anzoategui	B	VE
Apure	C	VE
Aragua	D	VE
Barinas	E	VE
Bolivar	F	VE
Carabobo	G	VE
Cojedes	H	VE
Delta Amacuro	Y	VE
Distrito Capital	A	VE
Falcon	I	VE
Guarico	J	VE
Lara	K	VE
Merida	L	VE
Miranda	M	VE
Monagas	N	VE
Nueva Esparta	O	VE
Portuguesa	P	VE
Sucre	R	VE
Tachira	S	VE
Trujillo	T	VE
Vargas	X	VE
Yaracuy	U	VE
Zulia	V	VE
An Giang	44	VN
Ba Ria - Vung Tau	43	VN
Bac Giang	54	VN
Bac Kan	53	VN
Bac Lieu	55	VN
Bac Ninh	56	VN
Ben Tre	50	VN
Binh Dinh	31	VN
Binh Duong	57	VN
Binh Phuoc	58	VN
Binh Thuan	40	VN
Ca Mau	59	VN
Can Tho	CT	VN
Cao Bang	04	VN
Da Nang	DN	VN
Dak Lak	33	VN
Dak Nong	72	VN
Dien Bien	71	VN
Dong Nai	39	VN
Dong Thap	45	VN
Gia Lai	30	VN
Ha Giang	03	VN
Ha Nam	63	VN
Ha Noi	HN	VN
Ha Tinh	23	VN
Hai Duong	61	VN
Hai Phong	HP	VN
Ho Chi Minh	SG	VN
Hoa Binh	14	VN
Hung Yen	66	VN
Khanh Hoa	34	VN
Kien Giang	47	VN
Kon Tum	28	VN
Lai Chau	01	VN
Lam Dong	35	VN
Lang Son	09	VN
Lao Cai	02	VN
Long An	41	VN
Nam Dinh	67	VN
Nghe An	22	VN
Ninh Binh	18	VN
Ninh Thuan	36	VN
Quang Ninh	13	VN
Soc Trang	52	VN
Son La	05	VN
Tay Ninh	37	VN
Thai Binh	20	VN
Thai Nguyen	69	VN
Thanh Hoa	21	VN
Thua Thien-Hue	26	VN
Tien Giang	46	VN
Tra Vinh	51	VN
Tuyen Quang	07	VN
Vinh Long	49	VN
Vinh Phuc	70	VN
Yen Bai	06	VN
Sanma	SAM	VU
Shefa	SEE	VU
Tafea	TAE	VU
Sigave	SG	WF
Uvea	UV	WF
Tuamasaga	TU	WS
'Adan	AD	YE
Al Hudaydah	HU	YE
Amanat al 'Asimah	SA	YE
Dhamar	DH	YE
Hadramawt	HD	YE
Lahij	LA	YE
Ma'rib	MA	YE
Shabwah	SH	YE
Ta'izz	TA	YE
Eastern Cape	EC	ZA
Free State	FS	ZA
Gauteng	GT	ZA
Kwazulu-Natal	NL	ZA
Limpopo	LP	ZA
Mpumalanga	MP	ZA
North-West	NW	ZA
Northern Cape	NC	ZA
Western Cape	WC	ZA
Central	02	ZM
Copperbelt	08	ZM
Eastern	03	ZM
Luapula	04	ZM
Lusaka	09	ZM
North-Western	06	ZM
Northern	05	ZM
Southern	07	ZM
Western	01	ZM
Bulawayo	BU	ZW
Harare	HA	ZW
Manicaland	MA	ZW
Mashonaland Central	MC	ZW
Mashonaland East	ME	ZW
Mashonaland West	MW	ZW
Masvingo	MV	ZW
Matabeleland North	MN	ZW
Matabeleland South	MS	ZW
Midlands	MI	ZW
\.


--
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: maxclaims
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (code, country);


--
-- Name: province province_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maxclaims
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);


--
-- PostgreSQL database dump complete
--

