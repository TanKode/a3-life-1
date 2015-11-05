waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","Server-Regeln"];
player createDiarySubject ["spielregeln","Spiel-Regeln"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Official Change Log",
				"
					The official change log can be found on the BIS forums (search Altis Life RPG)
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Custom Change Log",
				"
					0.2 = Grenze erichtet. PVP Zone in Arbeit. Truppenuebungsplatz.  // Wird nicht aktualisiert
				"
		]
	];

		player createDiaryRecord ["serverrules",
		[
			"Allgmeines", 
				"
				Hacken, Cheaten und jede Art von Spielmanipulation (Bugusing) sind strengstens Verboten.<br/><br/>

				1. Ein gesunder Menschenverstand und Konsequenzenlogik wird von jedem Spieler erwartet<br/>
				2. Persoenliche Beleidigungen und Trolling ausserhalb eines Rollenspiels sind untersagt<br/>
				3. Sich mittels Spielfehler Vorteile zu verschaffen ist verboten und wird als Bugusing oder Exploiting gewertet.<br/>
				4. Handlungen die in einer regeltechnischen Grauzone liegen, werden vom jeweiligen SUPPORTER, nach eigenem Ermessen bearbeitet<br/>
				"
		]
	];
	
	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
					Folgende sind Safezones und jegliche kriminelle Handlung kann zum Bann fuehren!<br/><br/>
					
					Jeder Fahrzeugspawn (shop oder garage)<br/>
					Jeder Waffenshop<br/>
					Alle Polizei HQ's<br/>
					Rebel Outposts<br/>
					Donator Shops<br/>
					Kavalla Marktplatz<br/></br>
				"
		]
	];
					

	
	player createDiaryRecord ["serverrules",
		[
			"Roleplay", 
				"
				Immer Roleplay<br/><br/>
				
				1. ROLEPLAY wird bei uns gross geschrieben und ein Rollenspielverhalten wird von jedem Spieler erwartet!<br/>
				2. Dies beinhaltet, dass man sich eine Figur mit Rolle, Charakter und Geschichte ausdenkt und diesen gewissenhaft nachgeht!<br/>
				2. Das eigene und das Leben anderer sollte demnach weitgehend verschont bleiben!<br/>
				2. Es sollte jedem die Moeglichkeit gegeben werden, sein Leben mittels Rollenspiel zu retten!<br/>
				3. Die Toetung eines Spielers sollte dabei der letzte Ausweg sein!<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Safezones", 
				"
				In einer Safezone darf nicht ueberfallen, getoetet, ein Diebstahl veruebt oder einem anderen Spieler Schaden jeglicher Hinsicht zugefuegt werden!<br/>				
				Zu den Safezones gehoeren:<br/> 
				Marktplatz Kavala (innerhalb der Mauern)<br/>
				Rebellengebiet<br/>
				Polizeireviere<br/>
				Private Haeuser<br/>
				Spawnpunkte (Spieler die gerade den Server betreten und oder sich im Intro befinden)<br/>
				Rebellen Aussenposten NORD, SÜD, Selakano<br/>
				Geldautomaten (ATM), Maerkte, Garagen etc. (ueberall wo Spieler etwas erwerben koennen) gelten lediglich in KAVALA als Safezone!<br/>
				Geldautomaten (ATM), Maerkte, Garagen etc. (ueberall wo Spieler etwas erwerben koennen) gelten lediglich in KAVALA als Safezone!<br/>
				Das Beschiessen einer Safezone von Ausserhalb oder aus einer Safezone heraus ist untersagt<br/>
				Safezones duerfen nicht becampt werden<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Newlife", 
				"
				Newlife<br/><br/>
				
				1. Die New-Life-Regel besagt, dass man nach einem Todesfall eine neue Person spielt und nichts von den vorherigen Ereignissen weiss!<br/>
				2. Man muss mindestens 15 Minuten lang von der letzten Position fernbleiben (5 km)!<br/>
				3. Die Kooperation mit zuvor verbuendeten Personen darf mindestens diese Zeit lang nicht weitergefuehrt werden!<br/>
				4. Die New-Life-Reglung gilt nicht, wenn der Tod durch einen Bug, RDM oder VDM eingetreten ist!<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Kampfhandlungen", 
				"
				Kampfhandlungen<br/><br/>
				
				Bevor eine Kampfhandlung begonnen werden darf, muss zwischen den betroffenen Parteien ausfuehrliches Rollenspiel stattgefunden haben!<br/>
				Einem Spieler darf nur dann Schaden zugefuegt werden, wenn dieser vorab angekuendigt wird.<br/>
				Ankuendigungen sind nur gueltig, wenn sichergestellt ist, dass das Gegenueber diese auch klar und deutlich verstanden hat. Vorzugsweise ueber Ingame-Voice mit Videobeweis. Falls die Umgebunglautstaerke oder die Entfernung diesen nicht gewaehrleisten koennen, duerfen Ankuendigungen auch ueber Textnachricht via. SMS verkuendet werden<br/>
				Das Niederschlagen oder Ausrauben ist eine Handlung nur zwischen den Beteiligten Personen. Alle weiteren Personen muessen angekuendigt werden<br/>
				Kampfhandlungen sind beendet, wenn mind. 15 Minuten lang kein Kontakt stattgefunden hat zwischen den Beteiligten.<br/>
				Kampfhandlungen sind ebenso beendet, wenn alle im direkten Kampf involvierten Personen einer Partei ausgeschaltet sind<br/>
				Im Zweifelsfall ist eine Ankuendigung nur mit Video- oder Bildbeweis gueltig, bei Videobeweisen ist der Originalton erforderlich!<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Combatlog", 
				"
				Combatlog<br/><br/>
				
				Sich waehrend einer Kampfhandlung oder waehrend der Respawn-Zeit, aus dem Spiel zu trennen um sich den Konsequenzen zu entziehen oder an einem anderen Ort wieder zu spawnen, wird als Combatlog betrachtet und ist untersagt<br/>
				Dies beinhaltet auch festgenommene Personen zu toeten um sie vor einer Inhaftierung oder einem Überfall zu verschonen<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"VDM", 
				"
				Die New Life Rule ist vertreten bei Zivillisten , Rebellen und Polizisten! <br/><br/>

				VDM<br/>
				Fahrzeuge, Boote, Helikopter und Jets sind keine Waffen und duerfen nicht zum Schaden verursachen benutzt werden<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Trolling", 
				"
				Das Belaestigen anderer Spieler fernab des Rollenspiels wird als Trolling gewertet und ist zu unterlassen<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"MEDICS", 
				"
				Sanitaeter gelten als UNANTASTBAR, ihnen darf kein Schaden zugefuegt werden! Dies gilt auch fuer Sanitaeter Fahrzeuge!<br/><br/>
				"
		]
	];
	
// Police Section
	player createDiaryRecord ["spielregeln",
		[
			"Verhalten",
				"
				Jede Handlung in der Öffentlichkeit oder gegen Spieler sollte mit einem triftigem Rollenspielhintergrund verfolgt werden<br/>
				Waehrend eines Gefechts betreten unbeteiligte das Gebiet auf eigene Gefahr<br/>
				Illegale Gegenstaende/Fahrzeuge<br/>
				1. Polizei-, Sani- Eigentum jeglicher Art<br/>
				2. Sturmgewehre ab kaliber 5.56<br/>
				3. ausser Sting, PDW, Vermin SMG und Handfeuerwaffen<br/>
				4. Drogen<br/>
				5. Schildkroeten<br/>
				6. Hunter, Strider und Ifrit, ausser fuer die Sanitaeter und Polizei<br/>
				7. bewaffneter Offroader, ausser fuer die Polizei<br/>
				8. Goldtransporter<br/><br/>
				"
		]
	];
	player createDiaryRecord ["spielregeln",
		[
			"Bankraub",
				"
				Bankraub<br/>
				Ein Bankraub darf nur mit dem Ziel begonnen werden, diesen auch zu Ende zu bringen<br/><br/>
				"
		]
	];
	player createDiaryRecord ["spielregeln",
		[
			"Verkehrsregeln und Geschwindigkeitsbegrenzungen",
				"
				Es wird auf der rechten Strassenseite gefahren<br/>
				Das Verlassen der Strasse fuer laengere Zeit ist untersagt<br/>
				Innerorts: 50 km/h<br/>
				Kavala Marktplatz: 30 km/h<br/>
				Ausserorts: 120 km/h<br/>
				Andere Fahrzeuge zu rammen ist nicht erlaubt<br/>
				Ausnahme: gepanzerte Fahrzeuge untereinander (Ifrit, Hunter, Strider) Fuer Schaeden die dadurch entstehen haftet der Aggressor<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["spielregeln",
		[
			"Verfolgung", 
				"
				Bei einer aktiven Verfolgung darf auf die Polizei ohne weitere Ankuendigung scharf geschossen werden<br/>
				Eine aktive Verfolgung beginnt, wenn die Polizei <br/>
				zum Stehenbleiben auffordert<br/>
				das Polizei YELP zum zweiten mal ertoent<br/>
				das Polizeitonband mindestens einmal abgespielt wurde (“..hier spricht die Polizei”)<br/>
				ueber eine geraume Zeit klar und ersichtlich die Verfolgung aufgenommen hat<br/>
				Bei einer Verfolgung im Luftraum beginnt eine Kampfhandlung bereits nach Eingang einer EMP Warnung<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["spielregeln",
		[
			"Sperrgebiete", 
				"
				Es ist Zivilisten und Rebellen nicht gestattet folgende Sperrgebiete ohne Genehmigung zu betreten<br/> 
				Polizeireviere<br/>
				die Zentralbank<br/>
				private Haeuser anderer Spielern<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["spielregeln",
		[
			"Kriegsgebiete", 
				"
				In Kriegsgebieten sind fuer Handlungen gegen Polizisten keine Ankuendigungen notwendig.<br/><br/>
				"
		]
	];