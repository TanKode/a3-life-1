#include <macro.h> 
/*
	File: fn_welcome.sqf
	Author: Mario2002
	Edit: by snajdan
	
	Description:
	Displays introduction on init!
*/

private ["_text","_intro"];

_intro = [];
_text = [];
//sleep 2;
if(life_firstSpawn) then 
{
	switch (playerSide) do
	{
		case west: 
		{
			_text = [
				format ["<t align='left'>Wenn das dein erster Besuch auf unserem Server ist, bitten wir dich, die Regeln genauestens durchzulesen. Dies kannst du auf der Homepage: <t color='#428BCA'>http://bambusfarm.net/</t> tun."],
				format ["<t align='left'>Als Polizist bist Du eine Vorbildfunktion hier auf dem Server, verhalte dich bitte dementsprechen.</t>"],
				format ["<t align='left'>Wir legen auf unserem Server viel Wert auf RP also verhalte dich dementsprechend. Zuwiederhandlung wird z.b. (Trolling, RDM, VDM usw.) wird mit einem BAN bestrafft!!!.</t"],
				format ["<t align='left'>Desyncs: Die meisten desyncs sind durch die Clients bedingt, bei einer Framerate unter 30 FPS ist der Armaclient überlastet und hat Probleme die Netzwerkkommunikation zu verwalten.</t>"],
				format ["<t align='left'>Die Admins wünschen dir viel Spaß auf diesem Server.</t>"],
				format ["<t align='left' color='#428BCA'>TS3 : ts.bambusfarm.net</t>"],
				format ["<t align='left' color='#428BCA'>Homepage : http://bambusfarm.net</t>"]
			];
		};
		
		case independent: 
		{
			_text = [
				format ["<t align='left'>Wenn das dein erster Besuch auf unserem Server ist, bitten wir dich, die Regeln genauestens durchzulesen. Dies kannst du auf der Homepage: <t color='#428BCA'>http://bambusfarm.net/</t> tun."],
				format ["<t align='left'>Als Sanitäter/Notarzt bist du dafür zuständing Tote Personen wiederzubeleben, verletzte Personen zu behandeln oder Ihnen ein fehlendes Organg wieder zu Transplantieren!</t>"],
				format ["<t align='left'>Wir legen auf unserem Server viel Wert auf RP also verhalte dich dementsprechend. Zuwiederhandlung wird z.b. (Trolling, RDM, VDM usw.) wird mit einem BAN bestrafft!!!.</t"],
				format ["<t align='left'>Desyncs: Die meisten desyncs sind durch die Clients bedingt, bei einer Framerate unter 30 FPS ist der Armaclient überlastet und hat Probleme die Netzwerkkommunikation zu verwalten.</t>"],
				format ["<t align='left'>Die Admins wünschen dir viel Spaß auf diesem Server.</t>"],
				format ["<t align='left' color='#428BCA'>TS3 : ts.bambusfarm.net</t>"],
				format ["<t align='left' color='#428BCA'>Homepage : http://bambusfarm.net</t>
			];
		};
		
		case civilian:
		{
			_text = [
				format ["<t align='left'>Wenn das dein erster Besuch auf unserem Server ist, bitten wir dich, die Regeln genauestens durchzulesen. Dies kannst du auf der Homepage: <t color='#428BCA'>http://bambusfarm.net/</t> tun."],
				format ["<t align='left'>Solltest du dich nun fragen welcher Rohstoff dir am schnellsten und meisten Geld bringt, drücke Z und dann auf Markt. Dieser hat immer die aktuellsten Informationen zu den Rohstoffpreisen für dich, da wir in einer dynamischen Wirtschaft leben werden die Preise sich auch immer ändern im Verhältniss zu der Menge an Rohstoffen die gerade verfügbar sind.</t>"],
				format ["<t align='left'>Wir legen auf unserem Server viel Wert auf RP also verhalte dich dementsprechend. Zuwiederhandlung wird z.b. (Trolling, RDM, VDM usw.) wird mit einem BAN bestrafft!!!.</t"],
				format ["<t align='left'>Desyncs: Die meisten desyncs sind durch die Clients bedingt, bei einer Framerate unter 30 FPS ist der Armaclient überlastet und hat Probleme die Netzwerkkommunikation zu verwalten.</t>"],
				format ["<t align='left'>Die Admins wünschen dir viel Spaß auf diesem Server.</t>"],
				format ["<t align='left' color='#428BCA'>TS3 : ts.bambusfarm.net</t>"],
				format ["<t align='left' color='#428BCA'>Homepage : http://bambusfarm.net</t>
			];
		};
		
		case east:
		{
			_text = [
				format ["<t align='left'>Wenn das dein erster Besuch auf unserem Server ist, bitten wir dich, die Regeln genauestens durchzulesen. Dies kannst du auf der Homepage: <t color='#428BCA'>http://bambusfarm.net/</t> tun."],
				format ["<t align='left'>Als ADAC bist du dafür zuständing beschädigte Fahrzeuge zu reparieren, oder abzuschleppen. Die ADAC Frahtion ist nocht nicht ganz fertig und wird im laufe der nächsten Zeit noch ein paar funktionen dazu bekommen!</t>"],
				format ["<t align='left'>Wir legen auf unserem Server viel Wert auf RP also verhalte dich dementsprechend. Zuwiederhandlung wird z.b. (Trolling, RDM, VDM usw.) wird mit einem BAN bestrafft!!!.</t"],
				format ["<t align='left'>Desyncs: Die meisten desyncs sind durch die Clients bedingt, bei einer Framerate unter 30 FPS ist der Armaclient überlastet und hat Probleme die Netzwerkkommunikation zu verwalten.</t>"],
				format ["<t align='left'>Die Admins wünschen dir viel Spaß auf diesem Server.</t>"],
				format ["<t align='left' color='#428BCA'>TS3 : ts.bambusfarm.net</t>"],
				format ["<t align='left' color='#428BCA'>Homepage : http://bambusfarm.net</t>
			];
		};
	};
	
	{
		_intro pushBack (parseText _x);
	} forEach _text;

	format ["Hallo %1",profileName] hintC _intro;
};

