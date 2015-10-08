// **********  Disclaimer *********** //
//        Script by ThirtySeven             
//     Nur mit genehmigung von           
//        ThirtySeven nutzbar           
// **********  Disclaimer *********** //
_x=floor(random 9);
_y=floor(random 9);

if(_x == _y) then {_y = _y + 1;};
if(_y == 10)then{_y = 0;};

switch (_x) do
	{
		case 0: 	{ bambusfarm_club1 = "FC Kavalla";};
		case 1: 	{ bambusfarm_club1 = "2033 Pyrgos";};
		case 2: 	{ bambusfarm_club1 = "Eintracht Athira";};
		case 3: 	{ bambusfarm_club1 = "VFB Sofia";};
		case 4: 	{ bambusfarm_club1 = "BVB Zaros";};
		case 5: 	{ bambusfarm_club1 = "Syrta SV";};
		case 6: 	{ bambusfarm_club1 = "1.FC Paros";};
		case 7: 	{ bambusfarm_club1 = "SK Frini";};
		case 8: 	{ bambusfarm_club1 = "FK Molos";};
		case 9: 	{ bambusfarm_club1 = "Red Gull Gravia";};
	};
 

switch (_y) do
	{
		case 0: 	{ bambusfarm_club2 = "FC Kavalla";};
		case 1: 	{ bambusfarm_club2 = "2033 Pyrgos";};
		case 2: 	{ bambusfarm_club2 = "Eintracht Athira";};
		case 3: 	{ bambusfarm_club2 = "VFB Sofia";};
		case 4: 	{ bambusfarm_club2 = "BVB Zaros";};
		case 5: 	{ bambusfarm_club2 = "Syrta SV";};
		case 6: 	{ bambusfarm_club2 = "1.FC Paros";};
		case 7: 	{ bambusfarm_club2 = "SK Frini";};
		case 8: 	{ bambusfarm_club2 = "FK Molos";};
		case 9: 	{ bambusfarm_club2 = "Red Gull Gravia";};
	};



/*
[] spawn {

	"Wettquoten:" hintC parseText format[
	"
	<t size=""1.8"">Manschaften und Quoten: <t align='right' size='0.6' color='#FE2E2E'></t></t><br /><br /><br />
	<t shadow='true' size='1.5' underline='true'>Es spielen:<t align=""right"">%1 gegen %2</t></t><br/><br/>
	<t shadow='true' size='1.5' underline='true'>Quote: 2.1 auf <t align=""right""> %1 </t></t><br/><br/>
	<t shadow='true' size='1.5' underline='true'>Quote: 2.6 auf <t align=""right""> %2 </t></t><br/><br/>
	<t shadow='true' size='1.5' underline='true'>Quote: 3.3 auf unentschieden:<t align=""right""></t></t><br/><br/>
	",
	bambusfarm_club1,
	bambusfarm_club2
	];

};*/

_club1 = bambusfarm_club1;
_club2 = bambusfarm_club2;
[format["<t size='1.3' color='#ff9900'>Manschaften und Quoten:!</t><br/>Es spielen:<br/> %1 gegen %2<br/><br/>Quote: 2.1 auf %1<br/>Quote: 2.6 auf %2<br/>Quote: 3.3 auf unentschieden",_club1,_club2],
0,
0.2,
10,
0,
0,
8
] spawn BIS_fnc_dynamicText;

sleep 1.5;
bambusfarm_bet = true; // to be sure bambusfarm_club1 and bambusfarm_club2 are set !