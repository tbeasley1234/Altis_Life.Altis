#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_BG_Guerilla2_1","Cadet Uniform",25]];
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret set[count _ret,["U_Rangemaster","Cop Uniform",25]];
		};
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["U_Competitor","Highway Patrol Uniform",25]];
			//_ret set[count _ret,["U_B_CombatUniform_mcam_tshirt",nil,350]];
			//_ret set[count _ret,["U_B_survival_uniform",nil,1250]];
			_ret set[count _ret,["U_B_Wetsuit",nil,2000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			//_ret set[count _ret,["U_B_CombatUniform_mcam_worn",nil,550]];
			_ret set[count _ret,["U_B_SpecopsUniform_sgg","SWAT Uniform",550]];
		};
	[] call life_fnc_equipGear;
	};
	
	//Hats
	case 1:
	{
		
		_ret set[count _ret,["H_Cap_blu","Cadet Cap",100]];
		
		//Level 1+
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret set[count _ret,["H_MilCap_blue","Police Cap",100]];
		};
		
		//Level 2+
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["H_HelmetB_plain_blk","Tactical Helmet",75]];
		};
		
		//Level 3+
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["H_Beret_blk_POLICE","Police Beret",100]];
			_ret set[count _ret,["H_HelmetB_light_black","RageMonkey's Hat",120]];
		};
		
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Diving",nil,500]
		];
	};
	
	//Vest
	case 3:
	{
		//Level 0+
		_ret set[count _ret,["V_Rangemaster_belt",nil,800]];
		
		//Level 2+
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["V_RebreatherB",nil,5000]];
			_ret set[count _ret,["V_TacVest_blk_POLICE",nil,1500]];
		};
		
		//Level 4+
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["V_PlateCarrier1_blk",nil,7000]];
		};
		
	[] call life_fnc_equipGear;
	};
	
	//Backpacks
	case 4:
	{
		_ret set[count _ret,["B_Kitbag_cbr",nil,800]];
		_ret set[count _ret,["B_AssaultPack_blk",nil,700]];
		_ret set[count _ret,["B_Bergen_blk",nil,2500]];
		_ret set[count _ret,["B_Carryall_cbr",nil,3500]];
		if((__GETC__(life_donator) > 2) && (__GETC__(life_coplevel) > 1)) then
		{
			_ret set[count _ret,["B_UAV_01_backpack_F",nil,20000]];
		};
	};
};
[] call life_fnc_equipGear;
_ret;