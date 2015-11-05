#define true 1
#define false 0

class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"Tonic"}; 
	};
};

/*Server Settings*/

class CfgServerSettings
{
	class extDB
	{
		/*Database Selection*/
		Database = "AltisLife"; //Database config name
		/*RCON Settings*/
		RCON = false; //Enabled?
		RCON_Selection = "RCON"; //Selection of what RCON config to pull from the extDB Configuration file eg. [RCON]
		/*VAC Settings*/
		VAC = false; //Enabled? If you want to ban VAC'd players, edit it in the extDB Configuration file.
		/*MISC settings*/
		MISC = false; //Enabled? Allows you to use certain features that are not really related to the database for extDB
		/*Logging Settings*/
		LOG = false; //Custom Logging Enabled?
		LOG_Settings[] = {{"HACKER","hacker.log"},{"LOG2","debug.log"}}; //First Selection = ID | Second Selection = Log File
		/*Debug*/
		MySQL_Query = false; //Log queries? Only set this to true if you are developing.
	};
};

/*Functions*/

class CfgFunctions
{
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\life_server\Functions\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
		};
	};
	
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class insertVehicle {};
			class bool{};
			class updatePartial {};
			class repaintVehicle {};
		};
	};
	
	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\life_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedCrimes {};
			class wantedProfUpdate {};
		};
		
		class tanken
		{
			file = "\life_server\scripts\Tanke";
			class diesel {};
			class fuel {};
			class fuelAir {};
			class fuelCheck {};
			class fuelConfig {};
			class fuelPrices {};
			class initFuelAction {};
			class super {};
			class vehicleCheck {};
			class scriptsave {postInit=1;};
		};
		
		class diesdasdus
		{
			file = "\life_server\scripts\diesdasdus";
			class vehicleSpawnMenu {};
			class vehicleSpawn {};
			class craft {};
			class craftClothing {};
			class craft_update {};
			class craft_updateClothing {};
			class craftAction {};
			class craftActionClothing {};
			class craftCfg {};
			class craftFilter {};
			class craftFilterClothing {};
			class craftScriptSave {postInit=1;};
		};
		
		class auftragsbuch
		{
			file = "\life_server\scripts\adacAuf";
			class aufBuchMenu {};
			class auftragsBuch {};
			class showAuftraege {};
			class aufMarker {};
			class meineAuftraege {};
			class deleteAuftraege {};
			class newAuftraege {};
			class aufRequest {};
			class mapZoomIn {};
			class AufScriptSave {postInit=1;};
		};
		
		class taru
		{
			file = "\life_server\scripts\taru";
			class Taru {};
			class TaruArrimerPod {};
			class TaruDesarrimePod {};
			class TaruLarguerPod {};
			class ListeJoueur {};
			class TransmissionSonMessage {};
			class TaruGetIn {};
			class TaruHotfixVRotor {};
			class TaruScriptSave {postInit=1;};
		};
		
		class skillSystem
		{
			file = "\life_server\scripts\skillsystem";
			class skillInfo {};
			class skillMenu {};
			class skillLern {};
			class skillScriptSave {postInit=1;};
		};
		
		class Jail_Sys
		{
			file = "\life_server\Functions\Jail";
			class jailSys {};
			class JailPlayer {};
			class JailTimer {};
		};
		
		class Client_Code
		{
			file = "\life_server\Functions\Client";
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
			class managesc {};
			class cleanup {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class getVehiclesAbschlepp {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class logIt {};
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};
			class disableRobes {};
			class goldUpdate {};
			class robShops {};
			class shopState {};
			class vehicleInsurance {};
			class vehicleRepaint {};
			class updateVehInventory {};
			class getVehiclePos {};
			class vehicleSavePos {};
		};
		
		class Housing
		{
			file = "\life_server\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class initHouses {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
			class preCheckHouse {};
		};
		
		class Gangs
		{
			file = "\life_server\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};

		class Actions
		{
			file = "\life_server\Functions\Actions";
			class pickupAction {};
		};
		
		 class DynMarket
		{
			file = "\life_server\Functions\DynMarket";
			class calculatePrices {};
			class changePrice {}; 
			class config {};
			class getUpdate {};
			class HandleDB {};
			class playerLogged {};
			class sleeper {};
			class randomEvent {};

		};
		
		class Smartphone
		{
			file = "\life_server\Functions\Smartphone";
			class handleMessages {};
			class msgRequest {};
			class cleanupMessages {};
		};	
		
		/*class adacAuf
		{
			file = "\life_server\Functions\adacAuf";
			class handleContract {};
			class contractRequest {};
			class deleteHandle {};
			class auftragsBuch {};
		};*/
		
		class Custom
		{
			file = "\life_server\scripts\Custom";
			class vehicleRefresh {};
			class hausweg {};
			class bruecke {};
			class grenze {};
			class grenzeRunter {};
			class beta {};
			class D41_RandomBlitze {};
			class D41Lightning {};
			class zafarias_kartbahn {};
			class Fahrschule {};
		};
		
		class Airdrop
		{
			file = "\life_server\scripts\Airdrop";
			class generateAirdrop {};
			class airDrop {};
		};
		
		class dealer
		{
			file = "\life_server\scripts\dealer";
			class dealerAnzeige {};
			class dealerSpawnDorida {};
			class dealerSpawnGalati {};
			class dealerSpawnKavala {};
			class dealerMarker {};
		};
		
		class ConvoySM
		{
			file = "\life_server\scripts\ConvoySM";
			class startConvoy {};
			class initConvoy1 {};
			class initConvoy2 {};
		};
		
		class Taxi
		{
			file = "\life_server\scripts\Taxi";
			class callTaxiDrivers {};
			class acceptedTaxiCall {};
			class goOnDuty {};
			class goOffDuty {};
		};
		
		class Auktionshaus
		{
			file = "\life_server\scripts\Auktionshaus";
			class SAH_addOffer {};
			class SAH_removeOffer {};
			class SAH_checkPID {};
			class SAH_reciever {};
			class SAH_Transaction {};
		};
		
		class Goverment
		{
			file = "\life_server\scripts\Goverment";
			class recievedVote {};
			class voteEnd {};
			class newVote {};
			class govLogged {};
			class newLaw {};
			class deleteLaw {};
			class getLaws {};
			class getGovCash {};
			class govWithdraw {};
			class changeTaxes {};
			class clearGov {};
			class addCash {};
		};
		
		class Base
		{
			file = "\life_server\scripts\Base";
			class addBase {};
			class addBase2 {};
			class fetchPlayerBase {};
			class initBase {};
			class initTrunk {};
			class updateObj {};
			class updateBaseContainers {};
			class updateBaseTrunk {};
			class spawnobj {};
			class removeObj {};
			class baseMemberUpdate {};
		};
		
		class Paintball
		{
			file = "\life_server\scripts\paintball";
			class paintball {};
			class game {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
};