/*
    @Version: 0.2
    @Author: =IFD= Cryptonat
    @Edited: 4/4/14
    
    Description:
    Saves the player's gear every 10 minutes.
*/

while {true} do {
    sleep 1800;
    if (alive player) then {
        if (playerside == west) then {
        [] call life_fnc_saveGear;    //this is what allows the cop gear to save
		[] call life_fnc_equipGear;
        hint "Game Autosaved."
    } else {
    [] call SOCK_fnc_syncData;
    hint "Game Autosaved."
    };
    };
}; 