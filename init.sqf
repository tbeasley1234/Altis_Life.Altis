enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
if (isDedicated && IsNil ("life_market_prices")) then
{
	[] Call life_fnc_marketconfiguration;
	diag_log "Market prices generated";
	
	"Life_market_prices" addPublicVariableEventHandler
	{
		diag_log format ["! Market prices updated% 1", _this select 1];
	};
};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.3.5";

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

StartProgress = true;

[] execVM "welcomemessages.sqf";
fn_whoDunnit = compile preprocessFileLineNumbers "scripts\fn_whoDunnit.sqf";