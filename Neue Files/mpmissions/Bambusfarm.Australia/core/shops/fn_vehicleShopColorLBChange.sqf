#include <macro.h>

disableSerialization;
_colorIndex = lbValue[2304,(lbCurSel 2304)];
_className = lbData[2302,(lbCurSel 2302)];
_textures = SEL(SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_className,"textures"),_colorIndex),2);
{vehicleBoxVehicle setObjectTexture [_forEachIndex,_x];} foreach _textures;