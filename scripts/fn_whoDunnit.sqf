/*
	File: fn_whoDunnit
	Description: Save log file of units killed.
	Author: © ColinM - Help of BI Wiki & Forums.
	
	Credits:	Cuel from the BI Forums for his current & previous posts & KiloSwiss and his _killerWep code for me being too lazy to grab the Weapon names myself
*/


if(isServer) then 
{
	private["_victim","_killer","_distance","_killerWep","_weaponName"];
	_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
	
	_distance = _killer distance _victim;
	_distance = floor(_distance);
	
	_killerWep = currentWeapon _killer;
	_weaponName = (configFile >> "cfgWeapons" >> _killerWep);
	_weaponName = format["%1",getText(_weaponName >> "displayName")];
	_killerWep = format["%1",_weaponName];
	
	if(_victim == _killer) then 
	{
			diag_log format ["Suicide Message: %1 has killed %2 (Possibly suicide or disconnect)",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim]];
			[[1,format["Suicide Message: %1 has killed %2 (Possibly suicide or disconnect)",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		} else {
			diag_log format ["Death Message: %1 has killed %2 with Weapon %3 from Distance %4 Meters",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim], _killerWep, _distance];
			[[1,format["Death Message: %1 has killed %2 with Weapon %3 from Distance %4 Meters",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim], _killerWep, _distance]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	};
};