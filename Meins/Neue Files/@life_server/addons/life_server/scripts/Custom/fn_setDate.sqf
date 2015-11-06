_date = call compile ("extDB" callExtension "0:realtime:TIME");
sleep 40;
hint format["Setting Date to Year: %1 - Month %2 - Day %3 - Hour %4 - Minute %5",_date select 1 select 0,_date select 1 select 1,_date select 1 select 2,_date select 1 select 3,_date select 1 select 4];
sleep 10;
setDate (_date select 1);