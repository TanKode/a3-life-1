#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout"];
if((lbCurSel 2401) == -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
_success = false;
_price = M_CONFIG(getNumber,"VirtualItems",_type,"buyPrice");
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {life_spyglassamount = life_spyglassamount +1;[[profileName,format["Geldglitch beim Markt einkauf, Anzahl: %1",life_spyglassamount]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;};
life_nottoofast = time;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > CASH && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};

_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
_baseShop = ["bunkerbig","sandsack","sandsackecke","sandsackrund","bunkersmall","hsmall","hsmalleinzel","hturm","Hbig","hbarrierEcke","hBarriereCorridor","stachel","lampsmall","schranke","schiesswand","schiesswandfenster","schiesswandducken","schiesswandspring","schiessdeckungmitt","schiessdeckungducken","schiessdeckungliegen","schiessziel","ziel","camo","map","strom","sun","fire","helisquare","helicircle","bigturm","turm","cargohq","aid","garage","helig","lagerhalle","cargoschwarz","storagebigb","cargo"];

_totalTaxes = 0;
if (life_taxes > 0) then {
	_oldPrice = _price;
	_price = _price + (_price * (life_taxes/100));
	_totalTaxes = (_price - _oldPrice) * _amount;
};

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if((_type in _baseShop) && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
			[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
			[CASH] call life_fnc_numberText
		],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format[localize "STR_Shop_Virt_BoughtGang",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] call life_fnc_MP;

			if (_totalTaxes > 0) then {
				[[_totalTaxes],"TON_fnc_addCash",false,false] spawn life_fnc_mp;
			};

		} else {
			if((_price * _amount) > CASH) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
			hint format[localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];

			if (_totalTaxes > 0) then {
				[[_totalTaxes],"TON_fnc_addCash",false,false] spawn life_fnc_mp;
			};

			SUB(CASH,_price * _amount);
		};
	}else{
		if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
			_action = [
				format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
					[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
					[CASH] call life_fnc_numberText
				],
				localize "STR_Shop_Virt_YourorGang",
				localize "STR_Shop_Virt_UI_GangFunds",
				localize "STR_Shop_Virt_UI_YourCash"
			] call BIS_fnc_guiMessage;
			if(_action) then {
				hint format[localize "STR_Shop_Virt_BoughtGang",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
				_funds = grpPlayer getVariable "gang_bank";
				_funds = _funds - (_price * _amount);
				grpPlayer setVariable["gang_bank",_funds,true];
				[[1,grpPlayer],"TON_fnc_updateGang",false,false] call life_fnc_MP;

				if (_totalTaxes > 0) then {
					[[_totalTaxes],"TON_fnc_addCash",false,false] spawn life_fnc_mp;
				};

			} else {
				if((_price * _amount) > CASH) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
				hint format[localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];

				if (_totalTaxes > 0) then {
					[[_totalTaxes],"TON_fnc_addCash",false,false] spawn life_fnc_mp;
				};

				SUB(CASH,_price * _amount);
			};
		} else {
			//if((_price * _amount) > CASH) then {
			if(CASH >= (_price * _amount)) then {
				hint format[localize "STR_NOTF_Bargeld",[(_price * _amount)] call life_fnc_numberText,(localize _name),_amount];

				if (_totalTaxes > 0) then {
					[[_totalTaxes],"TON_fnc_addCash",false,false] spawn life_fnc_mp;
				};

				SUB(CASH,(_price * _amount));
				_success = true;
			}else {
				if(life_inv_debitcard == 0) then
				{
					if(BANK < (_price * _amount)) then {hint format[localize "STR_NOTF_NoBank",[(_price * _amount)] call life_fnc_numberText,localize _name]; [false,_type,_amount] call life_fnc_handleInv;}
					else
					{
						if((_price * _amount) > CASH) then {
							hint format[localize "STR_NOTF_NoKreditkart",[(_price * _amount)] call life_fnc_numberText,localize _name];
							[false,_type,_amount] call life_fnc_handleInv;
						};

					};
				}else
				{
					if(life_inv_debitcard > 0) then
					{	
						if(BANK < (_price * _amount)) then {hint format[localize "STR_NOTF_NoBank",[(_price * _amount)] call life_fnc_numberText,localize _name]}
						else
						{
							hint format[localize "STR_NOTF_Kreditkart",[(_price * _amount)] call life_fnc_numberText,localize _name];

							if (_totalTaxes > 0) then {
								[[_totalTaxes],"TON_fnc_addCash",false,false] spawn life_fnc_mp;
							};

							SUB(BANK,(_price * _amount));
							_success = true;

						};
					};
				};
			};
			_success;
		};
		[] call life_fnc_virt_update;
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;