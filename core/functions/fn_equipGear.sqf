#include <macro.h>
/*
Skins players
*/
if (playerSide == west) then {
	if (__GETC__(life_coplevel) > 0) then
	{
		if ((uniform player) == "U_BG_Guerilla2_1") then
		{
				player setObjectTextureGlobal [0, "Textures\clothing\Cadet.paa"];
		};
		if ((uniform player) == "U_Rangemaster") then
		{
			player setObjectTextureGlobal [0, "Textures\clothing\PoliceOfficer.paa"];
		};
		if ((uniform player) == "U_B_SpecopsUniform_sgg") then
		{
			player setObjectTextureGlobal [0, "Textures\clothing\U_B_SpecopsUniform_sgg.jpg"];
		};
		if ((uniform player) == "U_Competitor") then
		{
			player setObjectTextureGlobal [0, "Textures\clothing\HighwayCostume.paa"];
		};
	};
	if (__GETC__(life_coplevel) < 1) then
		{ 
			if ((uniform player) == "U_BG_Guerilla2_1") then
			{
				player setObjectTextureGlobal [0, "Textures\clothing\Cadet.paa"];
			};
		};
};

if (playerSide == independent) then {
	if ((uniform player) == "U_IG_Guerilla2_1") then
	{
		player setObjectTextureGlobal [0, "Textures\clothing\medic_uniform.jpg"];
	};
};

if  (playerSide == civilian) then {
	if ((uniform player) == "U_Competitor") then
	{
		player setObjectTextureGlobal [0, "Textures\clothing\miningco_uniform.jpg"];
	};
};


/*
if (__GETC__(life_adminlevel) > 1) then {
	if ((uniform player) == "U_BG_Guerilla2_1") then
	{
		player setObjectTextureGlobal [0, "Textures\clothing\adminskin.jpg"];
	};
};
*/