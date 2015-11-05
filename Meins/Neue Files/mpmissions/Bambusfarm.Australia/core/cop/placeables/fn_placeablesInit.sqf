/*
 Author: Maximum
 Description: Placeables for the cop\medic sides.
Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE...
 Credits: Killerty69 for a second pare of eyes when mine got to sleepy

P.S. - Don't be a faggot like i know some of you all will be.
*/
life_barrier_active = false;
life_barrier_activeObj = ObjNull;
life_placeables = [];

if(playerSide == west) then
{
	life_placeables =
	[
		[
			"Straßen-Kegel",
			"RoadCone_F"
		],
		[
			"Straßen-Kegel licht",
			"RoadCone_L_F"
		],
		[
			"Straßenschild",
			"SignAd_Sponsor_F"
		],
		[
			"Nagelbaender",
			"Land_Razorwire_F"
		],
		[
			"Schranke",
			"Land_BarGate_F"
		],
		[
			"Sicherheitsbarriere",
			"Land_Crash_barrier_F"
		],
		[
			"Plastik Barriere Orange",
			"PlasticBarrier_03_orange_F"
		],
		[
			"Plastik Barriere Gelb",
			"PlasticBarrier_02_yellow_F"
		],
		[
			"Tragbarer Scheinwerfer",
			"Land_PortableLight_single_F"
		],
		[
			"Tragbarer Doppelt-Scheinwerfer",
			"Land_PortableLight_double_F"
		],
		[
			"Flaggenmast UNO",
			"Flag_UNO_F"
		]
	];
}else{
	life_placeables =
	[
		[
			"Straßen-Kegel",
			"RoadCone_F"
		],
		[
			"Straßen-Kegel licht",
			"RoadCone_L_F"
		],
		[
			"Straßenschild",
			"SignAd_Sponsor_F"
		],
		[
			"Schranke",
			"Land_BarGate_F"
		],
		[
			"Sicherheitsbarriere",
			"Land_Crash_barrier_F"
		],
		[
			"Plastik Barriere Orange",
			"PlasticBarrier_03_orange_F"
		],
		[
			"Plastik Barriere Gelb",
			"PlasticBarrier_02_yellow_F"
		],
		[
			"Tragbarer Scheinwerfer",
			"Land_PortableLight_single_F"
		],
		[
			"Tragbarer Doppelt-Scheinwerfer",
			"Land_PortableLight_double_F"
		],
		[
			"Flaggenmast UNO",
			"Flag_UNO_F"
		]
	];
};
life_bar_limit = 1000;
life_bar_placey = [];