/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rot";};
			case 1: {_color = "Gelb";};
			case 2: {_color = "Weiss";};
			case 3: {_color = "Blau";};
			case 4: {_color = "Dunkelrot";};
			case 5: {_color = "Blau / Weiss";};
			case 6: {_color = "Sani";};
			case 7: {_color = "M Energy Gruen";};
			case 8: {_color = "Pokemon";};
			case 9: {_color = "ADAC";};
			case 10: {_color = "Polizei";};
			case 11: {_color = "Tarn";};
			case 12: {_color = "Pink";};
			case 13: {_color = "Gay";};
			case 14: {_color = "ADAC GELB";};
			case 15: {_color = "Mechaniker";};
			case 16: {_color = "Werbung";};
			case 17: {_color = "Sticker";};
			case 18: {_color = "Rockstar";};
			case 19: {_color = "Badmobil";};
			case 20: {_color = "Notarzt"};
		};
	};
	
	case "B_Truck_01_mover_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "ADAC";};
			case 1: {_color = "ADAC GELB"};
		};
	};

	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Gruen";};
			case 2: {_color = "Blau";};
			case 3: {_color = "Dunkel Blau";};
			case 4: {_color = "Gelb";};
			case 5: {_color = "Weis";};
			case 6: {_color = "Grau";};
			case 7: {_color = "Schwarz"};
			case 8: {_color = "Monster Energy";};
			case 9: {_color = "Ghostbusters";};
			case 10: {_color = "Supermario";};
			case 11: {_color = "Peach";};
			case 12: {_color = "Redbull";};
			case 13: {_color = "Monster";};
			case 14: {_color = "Flamme";};
			case 15: {_color = "Barbie";};
			case 16: {_color = "Batman";};
			case 17: {_color = "Ferrari";};
			case 18: {_color = "Rally";};
			case 19: {_color = "Ganja";};
			case 20: {_color = "Noddy";};
			case 21: {_color = "Porsche";};
			case 22: {_color = "Oil";};
			case 23: {_color = "Badmobil"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rot";};
			case 1: {_color = "Dunkel Blau";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Tan";};
			case 4: {_color = "Gruen";};
			case 5: {_color = "Polizei";};
			case 6: {_color = "Polizei Autobahn";};
			case 7: {_color = "Schwarz";};
			case 8: {_color = "Monster Energy";};
			case 9: {_color = "Ghostbusters";};
			case 10: {_color = "Supermario";};
			case 11: {_color = "Peach";};
			case 12: {_color = "Redbull";};
			case 13: {_color = "Monster";};
			case 14: {_color = "Flamme";};
			case 15: {_color = "Barbie";};
			case 16: {_color = "Batman";};
			case 17: {_color = "Ferrari";};
			case 18: {_color = "Rally";};
			case 19: {_color = "Ganja";};
			case 20: {_color = "Noddy";};
			case 21: {_color = "Porsche";};
			case 22: {_color = "Oil";};
			case 23: {_color = "Badmobil"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dunkel Rot";};
			case 1: {_color = "Silver";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Schwarz";};
			case 4: {_color = "Polizei";};
			case 5: {_color = "Polizei Autobahn";};
			case 6: {_color = "Oesi";};
			case 7: {_color = "Sani";};
			case 8: {_color = "Farrari";};
			case 9: {_color = "Space BMW";};
			case 10: {_color = "Bayern";};
			case 11: {_color = "Carbon Voll";};
			case 12: {_color = "Cabrio";};
			case 13: {_color = "Makaveli";};
			case 14: {_color = "Monster Energie";};
			case 15: {_color = "Security";};
			case 16: {_color = "Sonder Einsatz Kommando";};
			case 17: {_color = "Donator"};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weis";};
			case 1: {_color = "Rot";};
			case 2: {_color = "Krankenwagen"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weis";};
			case 1: {_color = "Rot";};
			case 2: {_color = "Gruen"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weis";};
			case 1: {_color = "Rot"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Braun";};
			case 1: {_color = "Digi Desert";};
			case 2: {_color = "Schwarz";};
			case 3: {_color = "Blau";};
			case 4: {_color = "Rot";};
			case 5: {_color = "Weis";};
			case 6: {_color = "Digi Gruen";};
			case 7: {_color = "Hunter Camo";};
			case 8: {_color = "Rebel Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei";};
			case 1: {_color = "Polizei Ausbilder";};
			case 2: {_color = "Polizei Blau";};
			case 3: {_color = "Schwarz";};
			case 4: {_color = "Civ Blau";};
			case 5: {_color = "Civ Rot";};
			case 6: {_color = "Digi Gruen";};
			case 7: {_color = "Blauline";};
			case 8: {_color = "Elliptical";};
			case 9: {_color = "Furious";};
			case 10: {_color = "Jeans Blau";};
			case 11: {_color = "Speedy Rotline";};
			case 12: {_color = "Sunset";};
			case 13: {_color = "Vrana";};
			case 14: {_color = "Waves Blau";};
			case 15: {_color = "Rebel Digital";};
			case 16: {_color = "ADAC";};
			case 17: {_color = "ADAC GELB";};
			case 18: {_color = "Tarn";};
			case 19: {_color = "Notarzt";};
			case 20: {_color = "Cop"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Weis / Blau";};
			case 2: {_color = "Digi Gruen";};
			case 3: {_color = "Desert Digi";};
			case 4: {_color = "Notarzt"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel";};
			case 1: {_color = "S-E-K"};
		};
	};
	
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei";};
			case 1: {_color = "Wald-Tarn";};
			case 2: {_color = "Schnee-Tarn";};
			case 3: {_color = "Lion-Tarn";};
			case 4: {_color = "Red-Tarn"};
		};
	};
	
	case "O_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Justiz"};
		};
	};
	
	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei";};
			case 1: {_color = "Polizei Ausbilder"};
		};
	};
	
	case "I_Truck_02_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange/Blau";};
			case 1: {_color = "Schwarz/Weis";};
			case 2: {_color = "Gruen/Rot";};
			case 3: {_color = "Like-Weed"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange/Blau";};
			case 1: {_color = "Schwarz/Weis";};
			case 2: {_color = "Gruen/Rot";};
			case 3: {_color = "Like-Weed"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange/Blau";};
			case 1: {_color = "Schwarz/Weis";};
			case 2: {_color = "Gruen/Rot"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion";};
			case 1: {_color = "Dahoman";};
			case 2: {_color = "Adac"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei Schwarz";};
			case 1: {_color = "Polizei"};
		};
	};
	
	case "B_Truck_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Adac"};
		};
	};
};
_color;