waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};
/*
player createDiarySubject ["reignofterror","Reign of Terror"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["governmentlaws","Government Laws"];
player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["policerules","Police Procedures/Rules"];
player createDiarySubject ["safezones","Safe Zones (No Killing)"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Illegal Activity"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["controls","Controls"];
*/
//New briefing menu
player createDiarySubject ["reignofterror","Reign of Terror"];
player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["controls","Controls"];

// Reign of Terror Section

	player createDiaryRecord ["reignofterror",
		[
			"Teamspeak",
				"
				Reign of Terror Teamspeak can be found at:<br/><br/>
				asts.gameservers.com:9541<br/><br/>
				ALL PLAYERS ARE REQUIRED TO CONNECT TO TEAMSPEAK<br></br>
				"
		]
	];
	
	player createDiaryRecord ["reignofterror",
		[
			"Website/Forums",
				"
				www.reignofterrorclan.enjin.com/<br/>
				This is also where ban appeals will be made.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["reignofterror",
		[
			"Donations",
				"
				Donations keep the server running, also you gain access to donator shop.<br/><br/>
				www.reignofterrorclan.enjin.com/<br/><br/>
				"
		]
	];
	
// Server Rules
	
	player createDiaryRecord ["serverrules",
		[
			"Check the website for the current rules and punishments", 
				"
				http://reignofterrorclan.enjin.com/forum/m/17518766/viewthread/11327612-altis-life-rules<br/><br/>
				"
		]
	];
	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				Left Shift + R: Restrain (Cop Only)<br/>
				Left Shift + G: Knock out / stun (Civ Only, used for robbing them)<br/>
				Left Shift + L: Cop Siren Lights<br/>
				Left Shift + H: Surrender<br/>
				"
		]
	];

	
