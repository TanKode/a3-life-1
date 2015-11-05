/*	KiloSwiss

Channel numbers:
	 0 = Global
	 1 = Side
	 2 = Command
	 3 = Group
	 4 = Vehicle
	 5 = Direct
	(6 = System)
*/

	/* Channels that are allowed to be used for VON by any player */
playerVONChannels[]={3,4,5};

	/* Channels that are allowed to be used for VON only by group leaders */
groupLeaderVONChannels[]={3,4,5};

	/* Channels that are allowed to be used for VON by any admin (see "voiceControlAdminList") */
adminVONChannels[]={3,4,5};

	/* List of Admin GUIDs */
voiceControlAdminList[]={
		"76561191234567890",	//Someadminname
		"76561190987654321",	//Someotheradminname
		"76561197098765432"		//Thirdadminname
		/* No comma (,) after the last entry! */
};
