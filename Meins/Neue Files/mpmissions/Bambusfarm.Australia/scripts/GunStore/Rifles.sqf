// Rifle Types

_Type_01 = "arifle_MXM_Black_F";
_Type_02 = "arifle_Katiba_F";
_Type_03 = "arifle_MX_GL_Black_F";
_Type_04 = "LMG_Zafir_F";
_Type_05 = "arifle_MX_SW_Black_F";

// Rifles

Rifle_01_01 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_01_01 attachTo [Gun_Store,[-3.015,-1.105,-1.15]];  

Rifle_02_01 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_02_01 attachTo [Gun_Store,[-3.015,-1.105,-1.45]];  

Rifle_03_01 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_03_01 attachTo [Gun_Store,[-3.015,-1.105,-1.75]];  

Rifle_04_01 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_04_01 attachTo [Gun_Store,[-3.015,-1.105,-2.05]]; 

{
_X addWeaponCargo [_Type_01,1]
} forEach [Rifle_01_01, Rifle_02_01, Rifle_03_01, Rifle_04_01]; 

Sleep 0.25;   

Rifle_01_02 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_01_02 attachTo [Gun_Store,[-3.015,-0.05,-1.15]];  

Rifle_02_02 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_02_02 attachTo [Gun_Store,[-3.015,-0.05,-1.45]]; 

Rifle_03_02 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_03_02 attachTo [Gun_Store,[-3.015,-0.05,-1.75]];  

Rifle_04_02 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_04_02 attachTo [Gun_Store,[-3.015,-0.05,-2.05]];   

{
_X addWeaponCargo [_Type_02,1]
} forEach [Rifle_01_02, Rifle_02_02, Rifle_03_02, Rifle_04_02];    

Sleep 0.25;

Rifle_01_03 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"];  
Rifle_01_03 attachTo [Gun_Store,[-3.015,0.95,-1.15]];   

Rifle_02_03 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_02_03 attachTo [Gun_Store,[-3.015,0.95,-1.45]];  

Rifle_03_03 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_03_03 attachTo [Gun_Store,[-3.015,0.95,-1.75]];  

Rifle_04_03 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_04_03 attachTo [Gun_Store,[-3.015,0.95,-2.05]]; 

{
_X addWeaponCargo [_Type_03,1]
} forEach [Rifle_01_03, Rifle_02_03, Rifle_03_03, Rifle_04_03];   

Sleep 0.25;   

Rifle_01_04 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_01_04 attachTo [Gun_Store,[-3.015,1.85,-1.15]];  

Rifle_02_04 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_02_04 attachTo [Gun_Store,[-3.015,1.85,-1.45]]; 

Rifle_03_04 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_03_04 attachTo [Gun_Store,[-3.015,1.85,-1.75]];  

Rifle_04_04 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_04_04 attachTo [Gun_Store,[-3.015,1.85,-2.05]];  

{
_X addWeaponCargo [_Type_04,1]
} forEach [Rifle_01_04, Rifle_02_04, Rifle_03_04, Rifle_04_04];  

Sleep 0.25; 

Rifle_01_05 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_01_05 attachTo [Gun_Store,[-3.015,2.85,-1.15]];   

Rifle_02_05 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"];  
Rifle_02_05 attachTo [Gun_Store,[-3.015,2.85,-1.45]]; 

Rifle_03_05 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_03_05 attachTo [Gun_Store,[-3.015,2.85,-1.75]];  

Rifle_04_05 = createvehicle ["groundweaponholder", getpos Gun_Store, [], 0, "can_collide"]; 
Rifle_04_05 attachTo [Gun_Store,[-3.015,2.85,-2.05]]; 

{
_X addWeaponCargo [_Type_05,1]
} forEach [Rifle_01_05, Rifle_02_05, Rifle_03_05, Rifle_04_05];    

Sleep 0.25;

{
_X setvectordirandup [[0,0,1],[5000,-40,0]];
_X setDamage 1;
} forEach [Rifle_01_01, Rifle_02_01, Rifle_03_01, Rifle_04_01, Rifle_01_02, Rifle_02_02, Rifle_03_02, Rifle_04_02,
Rifle_01_03, Rifle_02_03, Rifle_03_03, Rifle_04_03, Rifle_01_04, Rifle_02_04, Rifle_03_04, Rifle_04_04, Rifle_01_05,
Rifle_02_05, Rifle_03_05, Rifle_04_05];