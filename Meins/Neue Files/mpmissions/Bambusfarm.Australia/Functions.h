class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
		class syncGear {};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class initADAC {};
		class welcomeNotification {};
		class survival {};
		class initSafezone {};
		class initZeus {};
		class autoSave {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class admininfo_Extended {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};	
		class adminMenu_Extended {};
		class adminQuery_Extended {};
		class adminInstaHealth {};
		class adminESP {};
        class adminRepairBuild {};
		class adminDebugCon {};
		class adminMarkers {};
		class adminEvent {};
		class adminfreeze {};
		class gangLicense {};
		//class adminFunBreak {};
		//class adminFunBreakPlayer {};
	};
	
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class medicsMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class adacRequest {};
		class copMedicRequest {};
		class medicOpener {};
		class newLifeRule {};
		class therapieaction {};
		class therapie {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class gather {};
		class gutAnimal {};
		class surrender {};
		class drugCheck {};
		class drunkenCheck {};
		class fuelTank {};
		class packupmauer {};
		class playerUseBomb {};
		class processActionHO {};
		class putToGarage {};
		class removeMask {};
		class replaceOrgan {};
		class restrainActionCiv {};
		class robShops {};
		class robShops2 {};
		class shopState {};
		class sitDown {};
		class takeOrgans {};
		class TorturePlayer {};
		class fullheal {};
		class useVFirstaidkit {};
		class useVRepairkit {};
		class impoundActionAbschlepp {};
		class useMarijuana {};
		class useCocaine {};
		class useLSD {};
		class useHeroin {};
		class suechtig {};
		class abortAction {};
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class openHouseVInv {};
		class displayStats {};
		class swapItem {};
		class copHouseOwner {};
		class lockHouse {};
		class garageRefund {};
	};
	
	class Config
	{
		file = "core\config";
		class itemWeight {};
		class taxRate {};
		class vehicleAnimate {};
		class vehicleWeightCfg {};
		class underWaterLoadout {};
		class updateClothing {};
		class insurance {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class wantedAddP {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class s_onChar {};
		class s_onCheckedChange {};
		class AAN {};
		class newMsg {};
		class showMsg {};
		class smartphone {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class collectArmaItems {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class nearATM {};
		class bagSound {};
		class callCellPhone {};
		class fadeSound {};
		class globalSound {};
		class globalSoundClient {};
		class progressWaitUntilFinished {};
		class punishSafezonekiller {};
		class setRating {};
		class tasta {};
		class createMarker {};
		class vehicleSpawnPos {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
		class soundOelPumpe {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class demoChargeTimer {};
		class civLoadout {};
		class airSoft {};
		class airSoftWeaponRemove {};
		class hasOrgan {};
		class hooker {};
		class restrainCiv {};
		class waterChargeTimer {};
		class freezePlayer {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
		class updateVehTrunk {};
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class wantedGrab {};
		class arrestDialog_Arrest {};
		class breathalyzer {};
		class citybankkaCamDisplay {};
		class copOpener {};
		class copSiren2 {};
		class dealer {};
		class grenzeCamDisplay {};
		class knastCamDisplay {};
		class radars {};
		class removeMaske {};
		class seizeObjects {};
		class showArrestDialog {};
		class unrestrainCop {};
		class removeLicensesCop {};
		class createRemoveLicesnsesDialog {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class createGang {};
		class gangBrowser {};
		class gangManagement {};
		class gangMenu {};
		class joinGang {};
		class kickGang {};
		class leaveGang {};
		class setGangLeader {};
		class lockGang {};
		class unlockGang {};
	};
	
	class PermGangs
	{
		file = "core\permgangs";
		class initGang {};
		class createGangPerm {};
		class gangCreated {};
		class gangMenuPerm {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangMarkers {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class licenses {};
		class sellLicense {};
		class vehicleShopColorLBChange {};
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class burglarTool {};
		class CarAlarmSound {};
		class drinkbeer {};
		class drinkmoonshine {};
		class drinkwhiskey {};
		class gpsTracker {};
		class gpsTrackerRemove {};
		class mauer {};
		class mauerLights {};
		class organTransplantKit {};
		class rawFood {};
		class suicidePille {};
		class underwaterCharge {};
		class handschuheUse {};
		class goldsiebUse {};
		class schaufelUse {};
		class udwc {};
		class kescherUse {};
		class motorsaegeUse {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class wireTransfer {};
		class safeInvGold {}; //Dynamic Gold
		class safeGold {}; //Dynamic Gold
		class goldTake {}; //Dynamic Gold
		class itemsShow {};
		class garageLBChangeAbschlepp {};
		class impoundMenuAbschlepp {};
		class unimpoundAbschlepp {};
	};
	
	class breakout
	{
		file = "scripts\breakout";
		class p_prisionbreak {};
		class prisionbreak {};
		class progressBaren {};
	};
	
	class Special
	{
		file = "scripts\special";
		
		class openEmpMenu {};
		class isEmpOperator {};
		class scanVehicles {};
		class warnVehicle {};
		class empVehicle {};
		class vehicleWarned {};
		class vehicleEmpd {};
	};
	
	class Birddown
	{
		file = "scripts\birddown";
		
		class fireBirdDown {};
		class birdDownShot {};
		class bdVehicleWarned {};
		class birdDownWarning {};
	};
	
	class anstrich
	{
		file = "core\repaint";
		
		class RepaintMenu;
		class Repaintcolor;
		class RepaintVehicle;		
	};
	
	class Taxi
	{
		file = "scripts\taxi";
		class taxiAbschlepphof {};
		class taxiKavala {};
		class taxiAthira {};
		class taxiAirport {};
		class taxiPyrgos {};
		class taxiSofia {};
		class taxiTimer {};
		class taxiTimerWait {};
		class taxiJagt {};
		class taxi_call {};
		class taxi_respond {};
		class taxi_acceptCall {};
		class finishRide {};
		class openTaxiMenu {};
	};
	
	class wk
	{
		file = "scripts\wk";
		class wkCiv {};
		class wkCop {};
		class wkMedic {};
		class wkADAC {};
	};
	
	class blinker
	{
		file = "scripts\blinker";
		class BlinkerInit {};
		class BlinkerLinks {};
		class BlinkerRechts {};
		class WarnBlinker {};
	};
	
	class airdrop
	{
		file = "scripts\airDrop";
		class airDropWait {};
		class airDropEnd {};
	};
	
	class Infotafel
	{
		file = "scripts\infotafel";
		class infotafel_init {};
		class bild1 {};
		class bild2 {};
		class bild3 {};
		class bild4 {};
		class bild5 {};
	};
	
	class Oelbohrturm
	{
		file = "scripts\oelbohrturm";
		class oelMining {};
		class oelPump {};
		class oelfass {};
		class oelFassDetach {};
		class fInteractionMenu {};
		class oelFassVehicleAuf {};
		class oelFassVehicleAb {};
		class oelFassRemove {};
	};
	
	class ADAC
	{
		file = "core\ADAC";
		class adacLoadout {};
		class adacLights {};
		class adacSirenLights {};
		class adacMarkers {};
		class adacRepairTruck {};
		class adacImpound {};
		class adacOpener {};
		class ticketPayAdac {};
		class ticketPromptAdac {};
		class slingloadActivate {};
		class adaclicht {};
		class vehhut {};
		class vehhutlicht {};
		class packupvehhut {};
		class damageCheck {};
		class wkasten {};
		class packupWkasten {};
		
		//class adacRepaintMenu {};
		//class adacRepaintVehicle {};
	};
	
	class DynMarket
	{
		file = "core\DynMarket";
		class bought {};
		class update {};
		class DisplayPrices {};
		class LoadIntoListbox {};
		class ForcePrice {};
		class DYNMARKET_getPrice {};
		class addsubstract {};
	};
	
	class wette
	{
		file = "scripts\wetten";
		class betSystem {};
		class betFirst {};
		class betSecond {};
		class betShowQuotes {};
		class betDraw {};
	};
	
	class Auktionshaus
    {
    	file = "scripts\Auktionshaus";
    	class CAH_Sell {};
    	class CAH_Buy {};
    	class CAH_reciever {};
    	class CAH_getPlayerObj {};
    	class CAH_loadOffers {};
    	class CAH_loadInventory {};
    	class CAH_fetchDetails {};
    	class CAH_loggedIn {};
    };
	
	class Scripts
	{
		file = "scripts";
		class D41_WetterBlitz {};
		class colorEffects {};
		class info {};
		class openVehicle {};
		class radarCam {};
		class robATM {};
		class GunStoreLight {};
	};
	
	class Goverment
    {
    	file = "scripts\Goverment";
    	class voteForPlayer {};
    	class createLaw {};
    	class deleteLaw {};
    	class recievedCall {};
    	class openVoteDialog {};
    	class openLawDialog {};
    	class openGovDialog {};
    	class govWithdraw {};
    	class changeTaxes {};
    	class hideGovAcMenu {};
    };
	
	class base
	{
		file = "scripts\base";
		class buyBase {};
		class getBasePositions {};		
		class initBase {};	
		class vehicleBase {};	
		class placeObject {};
		class repairBase {};
		class removeBaseObj {};
		class baseShopAdd {};
		class baseVehicleShop {};
	};
	
	class paintball
	{
		file = "scripts\paintball";
		class pb_response {};
		class ryn_message {};
		class paintballDialog {};
	};
	
	class CopPlaceables
	{
		file = "core\cop\placeables";
		class placeablesInit {};
		class placeablesMenu {};
		class placeablesRemoveAll {};
		class placeablePlace {};
		class placeableCancel {};
		class placeablesPlaceComplete {};
	};
	
	class skillsystem
	{
		file = "scripts\skillsystem";
		class expConfig {};
		class levelUp {};
		class skillGps {};
		class heal {};
	};
    class interactionmenus
	{
		file = "scripts\interactionmenus";
		class pInteraction_cop {};
		class pInteraction_adac {};
		class pInteraction_civ {};
		class pInteraction_med {};
		class vInteraction_adac {};
		class vInteraction_cop {};
		//class vInteraction_civ {};
	};
};

//some king stuff
class King_Client_Core
{
   tag = "king";
		
	class Speedtrap
	{
		file = "core\king\speedtrap";
		class speedtrap {};
		class speedtrapGetPhotoList {};
        class speedtrapActivate {};
        class speedtrapSetSpeedLimit {};
        class speedtrapRemove {};
        class speedtrapAdd {};
        class trapped {};
        class trappedFlash {};
        class setSpeedtrapLimit {};
        class speedtrapHack {};
	};
	
	class Fuelchanger
	{
		file = "core\king\fuelchanger";
        class fuelchanger {};
        class fuelchangerManipulate {};
       // class useFuelStation {};
        class cleanFuelStation {};
		class fuelPipe {};
	};
			
	class Gambling
    {
        file = "core\king\gambling";
        class gambling {};
        class gamble {};
        class gamble_timer {};
        class gamble_bandit {};
        class gamble_dice {};
        class gamblingSetJackpotVariable {};
        class gamblingWonJackpot {};
    };
	
	class JailWork
	{
		file = "core\king\jailWork";
        class jailWorkGather {};
        class jailWorkDrop {};
        class releaseMeFromJail {};
	};
};