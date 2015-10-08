/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn bambusfarm_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call bambusfarm_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call bambusfarm_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call bambusfarm_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call bambusfarm_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call bambusfarm_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call bambusfarm_fnc_inventoryOpened}];
"bambusfarm_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call bambusfarm_fnc_MPexec;};