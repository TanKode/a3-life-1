/*
	@Author: =IFD= Cryptonat
	@Created: 2/22/14
	
	Description:
	Saves the player's gear every 10 minutes.
*/

while {true} do {    //Tells the function to continually loop.
	sleep (30*60);   //Sleep for 600 seconds/30 minutes
	if (alive player) then   //If the player is alive, then do this
    {
		[] call SOCK_fnc_updateRequest;
		hint parseText format[localize "STR_BTK_Autosave", profileName];   //Just to tell you that the game is saving
	};
};