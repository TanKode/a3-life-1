

/*if((call life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

if(!life_invisibil) then
{ 
	life_invisibil = true;
	while{life_invisibil} do
	{
		player hideObject true;
	};
}else{
	life_invisibil = false;
	player hideObject false;
};