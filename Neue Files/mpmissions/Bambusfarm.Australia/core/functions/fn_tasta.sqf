#include <macro.h>
/*
	File: fn_oelfassDetach.sqf
	Author: PierreAmyf
	
	Description:
	Dieses Script ist von mir für den RealLifeRPG Server geschrieben 
	verwendung auf anderen Servern ohne meine erlaubnis ist nicht gestattet!!!
*/
if(EQUAL(playerSide,civilian)) then
{
	hint parseText format["
		Allgemein:<br/>
		<t color='#B51414'>Aktionstaste 10 Standart linke Windowstaste</t>: Interaktion mit Spieler oder Fahrzeug<br/>
		<t color='#B51414'>Z</t>: Spielermenue/Z-Inventar<br/>
		<t color='#B51414'>Y</t>: öffnet Spielermenue<br/>
		<t color='#B51414'>U</t>: Fahrzeug auf-/zuschließen<br/>
		<t color='#B51414'>T</t>: Kofferraum Oeffnen<br/>
		<t color='#B51414'>O</t>: Spitzhacke/Goldsieb/Uranhandschuhe/Kettensäge benutzen<br/>
		<t color='#B51414'>Links Windows</t>: Hauptinteraktionstaste um Item/Geld aufzuheben, sammeln, interaktion mit Fahrzeugen und bei der Polizei auch mit Zivilisten. Die Taste kann unter ESC->Konfiguration->Steuerung->Individ. Steuerung-> Aktionstaste 10 umgelegt werden!<br/>
		<t color='#B51414'>Leertaste/Space</t>: Springen waehrend des sprintens<br/>
		<t color='#B51414'>Strg + v</t>: kapitulieren<br/>
		<t color='#B51414'>Links Shift + H</t>: Waffen wegstecken<br/>
		<t color='#B51414'>Strg + H</t>: Waffen rausholen<br/>
		<t color='#B51414'>Links Shift + G</t>: umschlagen (Rebellen koennen damit ausrauben)<br/>
		<t color='#B51414'>Links Shift + R</t>: Rebellen koennen fesseln (Kabelbinder benoetigt!)<br/>
		<t color='#B51414'>Links Shift + P</t>: Sound laut/leiser stellen<br/>
		<t color='#B51414'>Links Shift + Num 1</t>: Takwando<br/>
		<t color='#B51414'>Links Shift + Num 2</>: Kniebeugen langsam<br/>
		<t color='#B51414'>Links Shift + Num 3</t>: Kniebeugen schnell<br/>
		<t color='#B51414'>Links Shift + Num 4</>: Liegestuetze<br/>
		<t color='#B51414'>Links Shift + Num 5</>: Winken<br/>
		<t color='#B51414'>Links Shift + Num 6</>: Nicken<br/>
		<t color='#B51414'>Links Shift + 4</t>: Einstellungen oeffnen<br/>
		<t color='#B51414'>Links Shift + 5</t>: Markt oeffnen<br/>
		<t color='#B51414'>Links Shift + 6</t>: Handy Oeffnen<br/>
		<t color='#B51414'>Links Shift + Q</t>: Blinker Links<br/>
		<t color='#B51414'>Links Shift + E</t>: Blinker Rechts<br/>
		<t color='#B51414'>Links Shift + Y</t>: Warnblinker<br/>
	"];
}else{
	if(EQUAL(playerSide,west)) then
	{
		hint parseText format["
			Allgemein:<br/>
			<t color='#B51414'>Aktionstaste 10 Standart linke Windowstaste</t>: Interaktion mit Spieler oder Fahrzeug<br/>
			<t color='#B51414'>Z</t>: Spielermenue/Z-Inventar<br/>
			<t color='#B51414'>Y</t>: öffnet Spielermenue<br/>
			<t color='#B51414'>U</t>: Fahrzeug auf-/zuschließen<br/>
			<t color='#B51414'>T</t>: Kofferraum Oeffnen<br/>
			<t color='#B51414'>Links Windows</t>: Hauptinteraktionstaste um Item/Geld aufzuheben, sammeln, interaktion mit Fahrzeugen und bei der Polizei auch mit Zivilisten. Die Taste kann unter ESC->Konfiguration->Steuerung->Individ. Steuerung-> Aktionstaste 10 umgelegt werden!<br/>
			<t color='#B51414'>Leertaste/Space</t>: Springen waehrend des sprintens<br/>
			<t color='#B51414'>Strg + v</t>: kapitulieren<br/>
			<t color='#B51414'>Links Shift + H</t>: Waffen wegstecken<br/>
			<t color='#B51414'>Strg + H</t>: Waffen rausholen<br/>
			<t color='#B51414'>Links Shift + G</t>: umschlagen (Rebellen koennen damit ausrauben)<br/>
			<t color='#B51414'>Links Shift + P</t>: Sound laut/leiser stellen<br/>
			<t color='#B51414'>Links Shift + 4</t>: Einstellungen oeffnen<br/>
			<t color='#B51414'>Links Shift + 5</t>: Markt oeffnen<br/>
			<t color='#B51414'>Links Shift + 6</t>: Handy Oeffnen<br/>
			<t color='#B51414'>Links Shift + Q</t>: Blinker Links<br/>
			<t color='#B51414'>Links Shift + E</t>: Blinker Rechts<br/>
			<t color='#B51414'>Links Shift + Y</t>: Warnblinker<br/>

			Polizei:<br/>
			<t color='#B51414'>O</t>: Im Fahrzeug Schranke oeffnen<br/>
			<t color='#B51414'>F</t>: Polizeisirene<br/>
			<t color='#B51414'>Shift + F</>: Polizeiansagen (direckt wieder ausmachen)<br/>
			<t color='#B51414'>Links Shift + R</t>: fesseln<br/>
			<t color='#B51414'>Links Shift + L</t>: aktiviert Sierenenlicht<br/>
			<t color='#B51414'>Links Shift + G</t>: umschlagen (um Personen ausergefecht zu setzen)<br/>
			<t color='#B51414'>Links Shift + U</t>: Autoschluessel fuer unrechtmaessige abgestellte Fahrzeuge<br/>
			<t color='#B51414'>Links Shift + 2</t>: Objektplazierungs-Menu<br/>
		"];
	}else{
		if(EQUAL(playerSide,east)) then
		{
			hint parseText format["
				Allgemein:<br/>
				<t color='#B51414'>Aktionstaste 10 Standart linke Windowstaste</t>: Interaktion mit Spieler oder Fahrzeug<br/>
				<t color='#B51414'>Z</t>: Spielermenue/Z-Inventar<br/>
				<t color='#B51414'>Y</t>: öffnet Spielermenue<br/>
				<t color='#B51414'>U</t>: Fahrzeug auf-/zuschließen<br/>
				<t color='#B51414'>T</t>: Kofferraum Oeffnen<br/>
				<t color='#B51414'>Links Windows</t>: Hauptinteraktionstaste um Item/Geld aufzuheben, sammeln, interaktion mit Fahrzeugen und bei der Polizei auch mit Zivilisten. Die Taste kann unter ESC->Konfiguration->Steuerung->Individ. Steuerung-> Aktionstaste 10 umgelegt werden!<br/>
				<t color='#B51414'>Leertaste/Space</t>: Springen waehrend des sprintens<br/>
				<t color='#B51414'>Strg + v</t>: kapitulieren<br/>
				<t color='#B51414'>Links Shift + H</t>: Waffen wegstecken<br/>
				<t color='#B51414'>Strg + H</t>: Waffen rausholen<br/>
				<t color='#B51414'>Links Shift + G</t>: umschlagen (Rebellen koennen damit ausrauben)<br/>
				<t color='#B51414'>Links Shift + P</t>: Sound laut/leiser stellen<br/>
				<t color='#B51414'>Links Shift + 4</t>: Einstellungen oeffnen<br/>
				<t color='#B51414'>Links Shift + 5</t>: Markt oeffnen<br/>
				<t color='#B51414'>Links Shift + 6</t>: Handy Oeffnen<br/>
				<t color='#B51414'>Links Shift + Q</t>: Blinker Links<br/>
				<t color='#B51414'>Links Shift + E</t>: Blinker Rechts<br/>
				<t color='#B51414'>Links Shift + Y</t>: Warnblinker<br/>
				
				ADAC<br/>
				<t color='#B51414'>F</t>: ADAC-Sirene<br/>
				<t color='#B51414'>O</t>: Im Fahrzeug Schranke oeffnen<br/>
				<t color='#B51414'>Links Shift + L</t>: aktiviert Sierenenlicht<br/><br/>
				<t color='#B51414'>Links Shift + U</t>: Autoschluessel fuer unrechtmaessige abgestellte Fahrzeuge<br/>
				<t color='#B51414'>Links Shift + 2</t>: Objektplazierungs-Menu<br/>
								  
			"];
		}else{
			if(EQUAL(playerSide,independent)) then
			{
				hint parseText format["
					Allgemein:<br/>
					<t color='#B51414'>Aktionstaste 10 Standart linke Windowstaste</t>: Interaktion mit Spieler oder Fahrzeug<br/>
					<t color='#B51414'>Z</t>: Spielermenue/Z-Inventar<br/>
					<t color='#B51414'>Y</t>: öffnet Spielermenue<br/>
					<t color='#B51414'>U</t>: Fahrzeug auf-/zuschließen<br/>
					<t color='#B51414'>T</t>: Kofferraum Oeffnen<br/>
					<t color='#B51414'>Links Windows</t>: Hauptinteraktionstaste um Item/Geld aufzuheben, sammeln, interaktion mit Fahrzeugen und bei der Polizei auch mit Zivilisten. Die Taste kann unter ESC->Konfiguration->Steuerung->Individ. Steuerung-> Aktionstaste 10 umgelegt werden!<br/>
					<t color='#B51414'>Leertaste/Space</t>: Springen waehrend des sprintens<br/>
					<t color='#B51414'>Strg + v</t>: kapitulieren<br/>
					<t color='#B51414'>Links Shift + H</t>: Waffen wegstecken<br/>
					<t color='#B51414'>Strg + H</t>: Waffen rausholen<br/>
					<t color='#B51414'>Links Shift + G</t>: umschlagen (Rebellen koennen damit ausrauben)<br/>
					<t color='#B51414'>Links Shift + P</t>: Sound laut/leiser stellen<br/>
					<t color='#B51414'>Links Shift + 4</t>: Einstellungen oeffnen<br/>
					<t color='#B51414'>Links Shift + 5</t>: Markt oeffnen<br/>
					<t color='#B51414'>Links Shift + 6</t>: Handy Oeffnen<br/>
					<t color='#B51414'>Links Shift + Q</t>: Blinker Links<br/>
					<t color='#B51414'>Links Shift + E</t>: Blinker Rechts<br/>
					<t color='#B51414'>Links Shift + Y</t>: Warnblinker<br/>
					
					Sanitaeter:<br/>
					<t color='#B51414'>F</t>: Medicsirene<br/>
					<t color='#B51414'>Links Shift + L</t>: aktiviert Sierenenlicht<br/><br/>
					<t color='#B51414'>Links Shift + U</t>: Autoschluessel fuer unrechtmaessige abgestellte Fahrzeuge<br/>
					<t color='#B51414'>Links Shift + 2</t>: Objektplazierungs-Menu<br/>
				"];
			};
		};
	};
};