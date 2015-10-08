/*
 Author: Maximum
 Description: Placeables for the cop\medic sides.
Disclaimer: Don't be a asshole and pass this off as your own or become a KAI and sell it for profit, Im releasing this for FREE...
 Credits: Killerty69 for a second pare of eyes when mine got to sleepy

P.S. - Don't be a faggot like i know some of you all will be.
*/
disableSerialization;
if (!bambusfarm_barrier_active) exitWith {};
if (bambusfarm_barrier_activeObj == ObjNull) exitWith {};
_currentPos = getPosATL bambusfarm_barrier_activeObj;
detach bambusfarm_barrier_activeObj;
bambusfarm_barrier_activeObj setPos[(getPos bambusfarm_barrier_activeObj select 0), (getPos bambusfarm_barrier_activeObj select 1), 0];
bambusfarm_barrier_activeObj enableSimulationGlobal true;
bambusfarm_bar_placey pushBack bambusfarm_barrier_activeObj;
bambusfarm_barrier_active = false;
bambusfarm_barrier_activeObj = ObjNull;