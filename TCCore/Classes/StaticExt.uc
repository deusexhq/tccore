//Class of generic functions that can be used in various situations
class StaticExt extends Actor;

//Ported scripts (Ideas from other languages that UC didn't have

//Split - based on Python
//Takes the Original string, and returns the string found between LeftCut and RightCut, optionally having offsets on either side
//Example: str = <message>!blah!</message> - Split(str, "<message>", "</message>") returns !blah!
//Example: str = <message>!blah!</message> - Split(str, "<message>", "</message>", 1, -1) returns blah
static function string Split(string Original, string LeftCut, string RightCut, optional int OffsetLeft, optional int OffsetRight)
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
static function string Repl(string Original, string Target, string ReplaceWith)
{
local string TempMessage, TempLeft, TempRight, OutMessage, _TmpString;
	OutMessage=Original;
    while (instr(caps(outmessage), caps(Target)) != -1)
    {
        tempRight=(right(OutMessage, (len(OutMessage)-instr(caps(OutMessage), caps(Target)))-Len(Target)));
        tempLeft=(left(OutMessage, instr(caps(OutMessage), caps(Target))) );
        OutMessage=TempLeft$ReplaceWith$TempRight;
    }
	return OutMessage;
}


defaultproperties
{
	Lifespan=1
}
