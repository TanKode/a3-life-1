
_from = "Automsg";
_msg = "Unser Server befindet sich im Beta Status der Altis Life 4.0. Die Beta wird ab 17.05.2015 2 Wochen lang laufen. Es gab einen Datenbank reset, JEDER wird wieder bei NULL anfangen! Waerend der Beta bitten wir euch jeden Bug uns auf unserer HP in dem dafuer vorgesehen Forum zu melden, damit wir diese schnellst möglichts beheben koennen mfg das Adminteam vom GBB Altis Life Server!";

sleep (30*60);
[[_msg,_from,4],"TON_fnc_clientMessage",true,false] call life_fnc_MP;
		
while{true} do
{
	sleep (60*60);
	[[_msg,_from,4],"TON_fnc_clientMessage",true,false] call life_fnc_MP;
};