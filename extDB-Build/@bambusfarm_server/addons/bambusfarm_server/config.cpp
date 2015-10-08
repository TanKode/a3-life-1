class DefaultEventhandlers;
class CfgPatches 
{
	class bambusfarm_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "bambusfarm_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\bambusfarm_server\Functions\MP";
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
			file = "\bambusfarm_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class mresToArray {};
			class insertVehicle {};
			class bool{};
			class mresString {};
			class updatePartial {};
		};
	};
	
	class bambusfarm_System
	{
		tag = "bambusfarm";
		class Wanted_Sys
		{
			file = "\bambusfarm_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};
		
		class Jail_Sys
		{
			file = "\bambusfarm_server\Functions\Jail";
			class jailSys {};
		};
		
		class Client_Code
		{
			file = "\bambusfarm_server\Functions\Client";
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\bambusfarm_server\Functions\Systems";
			class managesc {};
			class cleanup {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class vehicleIsDead {};
			class spikeStrip {};
			class logIt {};
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};
		};
		
		class Housing
		{
			file = "\bambusfarm_server\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class initHouses {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
		};
		
		class Gangs
		{
			file = "\bambusfarm_server\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};

	    class DynMarket
        {
            file = "\bambusfarm_server\Functions\DynMarket";
            class calculatePrices {};
            class config {};
            class getUpdate {};
            class HandleDB {};
            class playerLogged {};
            class sleeper {};
            class randomEvent {};
            class randomEventAktien {};
        };

		class Auktionshaus
		{
			file = "\bambusfarm_server\Functions\Auktionshaus";
			class SAH_addOffer {};
			class SAH_removeOffer {};
			class SAH_checkPID {};
			class SAH_reciever {};
			class SAH_looper {};
			class SAH_Transaction {};
		};

        class bambusfarm
        {
        	file = "\bambusfarm_server\Functions\bambusfarm";
				class insertSkillSys {};
				class removeSkillSys {};
				class insertKarma {};
				class GWH{};
        };
		
		class AS
		{
			file = "\bambusfarm_server\AS_AdminMenu";
			class receiver {};
			class ASconfig {};
			class getActions {};
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
			init = "(_this select 0) execVM ""\bambusfarm_server\fix_headgear.sqf""";
		};
	};
};