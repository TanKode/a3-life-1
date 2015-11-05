#include <macro.h>
/*
    Author: H4SHK3KS (ofpectag: PoA)
    File: fn_smartphone_open.sqf


    Written for Pirates of Altis
    http://pirates-of-altis.de/
    The usage of this file is restricted to allowed servers (e.g. PoA).
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!

    Description:
    Opens the smartphone

    Parameters:
    None

    Returns:
    Nothing
*/
if("ItemRadio" in assignedItems player) then
{
	if(!(player getVariable "restrained") && !(animationState player in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"])) then
	{
		createDialog "life_cell_phone";
	}
	else
	{
		if (__GETC__(life_adminlevel)>0) then
		{
			hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Smartphone</t><br/><br/>
			<t size='0.90 'font='puristaLight' align='left'>Du kannst dein Handy nur benutzen weil Du Supporter oder Admin bist. Bitte nur im Ernstfall benutzen!</t><br/>"];
			createDialog "life_cell_phone";
		}
		else
		{
			hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Smartphone</t><br/><br/>
			<t size='0.90 'font='puristaLight' align='left'>Du kannst dein Handy nicht benutzen wenn du gefesselt bist oder dich ergeben hast.</t><br/>"];
		};
	};
}
else
{
	if (__GETC__(life_adminlevel)>0) then
	{
		hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Smartphone</t><br/><br/>
		<t size='0.90 'font='puristaLight' align='left'>Du kannst dein Handy nur benutzen weil Du Supporter oder Admin bist. Bitte nur im Ernstfall benutzen!</t><br/>"];
		createDialog "life_cell_phone";
	}
	else
	{
		hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Kein Smartphone</t><br/><br/>
		<t size='0.90 'font='puristaLight' align='left'>Du brauchst ein Smartphone um SMS zu schreiben. Kaufe ein neues beim Gemischtwarenhandel.</t><br/>"];
	};
};
