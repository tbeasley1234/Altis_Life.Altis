/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
format["Welcome %1 to Aussie Life",player getVariable["realname",name player]] hintC
[
	"Updated to Tonics patch 3.1.3",
	"Current changes you need to know about:",
	"Zip tie your foes, get them at the new rebel item store.  Use them in your inventory when close to a civ/cop.",
	"Shift - N releases a ziptied player.",
	"NEW: Shift 1 will allow you to surrender.",
	"NEW: Shift - H will holster your weapon.",
	"Flip your car back over (use the interaction menu).",
	"Civ's save gear on respawn.",
	"Auto Sync every 10 minutes.",
	"Turtles are fixed and back to $15k per turtle.",
	"Cop: NEW: Anti-Air Fuel Mk1 available in the cop shop.",
	"Cop: Shift R restrains the civilian/rebel.",
	"Please read the server changes forum post for more new features added.",
	"All the rules can be located on the forums.  Visit us at http://www.reignofterror.com.au/"
];
	