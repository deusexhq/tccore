//Class of generic functions that can be used in various situations
class CodeBase extends Actor;

const version = "180102";


//Ported scripts (Ideas from other languages that UC didn't have

//Split - based on Python
//Takes the Original string, and returns the string found between LeftCut and RightCut, optionally having offsets on either side
//Example: str = <message>!blah!</message> - Split(str, "<message>", "</message>") returns !blah!
//Example: str = <message>!blah!</message> - Split(str, "<message>", "</message>", 1, -1) returns blah
function string Split(string Original, string LeftCut, string RightCut, optional int OffsetLeft, optional int OffsetRight)
{
	local int leftline, rightline;
	leftline = InStr(Original, LeftCut);
	leftline += Len(LeftCut);
	leftline += OffsetLeft;
	
	rightline = InStr(Original, RightCut);
	rightline += OffsetRight;
	
	return Mid(Original, leftline, rightline-leftline);
}

//Repl -  based on Unreal 2 function
//Takes the Original string, returns the string with every instance of Target replaced with ReplaceWith
//Example: str = "one two four" - Repl(str, "four", "three") returns "one two three"
function string Repl(string Original, string Target, string ReplaceWith)
{
local string TempMessage, TempLeft, TempRight, OutMessage, _TmpString;
	OutMessage=Original;
    while (instr(caps(outmessage), Target) != -1)
    {
        tempRight=(right(OutMessage, (len(OutMessage)-instr(caps(OutMessage), Target))-Len(Target)));
        tempLeft=(left(OutMessage, instr(caps(OutMessage), Target)) );
        OutMessage=TempLeft$ReplaceWith$TempRight;
    }
	return OutMessage;
}

//Player variable functions
function string GetName(PlayerPawn P)
{
	if(P != None)
		return P.PlayerReplicationInfo.PlayerName;
	else return "[No player found]";
}

function int GetID(PlayerPawn P)
{
	if(P != None)
		return P.PlayerReplicationInfo.PlayerID;
	else return -1;
}

function string GetIP(PlayerPawn P)
{
    local string IP;
    if(P != None)
    {
		IP = P.GetPlayerNetworkAddress();
		IP = Left(IP,InStr(IP,":"));
		return IP;
	}
	else return "[No player found]";
}

function PlayerPawn GetPlayerFromID(int i)
{
	local PlayerPawn P;
	foreach AllActors(class'PlayerPawn', P)
		if(P.PlayerReplicationInfo.PlayerID == i)
			return P;
}

function PlayerPawn GetPlayerFromName(string str)
{
	local PlayerPawn P;
	foreach AllActors(class'PlayerPawn', P)
		if(instr(caps(P.PlayerReplicationInfo.PlayerName), caps(str)) != -1)
			return P;
}

defaultproperties
{
	Lifespan=1
}
