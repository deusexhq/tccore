class TCCore extends Actor config (TCCore);

const version = "180120";
var string GSCData;
var config bool bHasUpdate;
var float TimeUntilUpdate;
var bool bChecked;

function PostBeginPlay()
{
	Log("Starting TCCore update check.", 'TCCore');
	UpdateCheck();
	TimeUntilUpdate=RandRange(10,19);
	SetTimer(TimeUntilUpdate,True);
}

function CodeBase _CodeBase()
{
	return Spawn(class'CodeBase');
}

function UpdateCheck()
{
	local GenericSiteQuery GSC;
	
	GSC = Spawn(class'GenericSiteQuery');
	GSC.browse("deusex.ucoz.net", "/deusex.txt", 80, 5);
	GSC.CallbackActor = Self;
	GSC.bDestroyAfterQuery=True;
}

function Timer()
{
	local string datastring, DataStore;
	if(TimeUntilUpdate > 0)
		TimeUntilUpdate-=1;
		
	if(bChecked)
		Destroy();
		
	if(GSCData != "" && TimeUntilUpdate <= 0)
	{
		SetTimer(5, False);
		bChecked=True;
		DataStore = GSCData;
		GSCData = "";
		Log("Data from Update Client found.... filtering version string.", 'TCCore');
		datastring = _CodeBase().Split(DataStore, "<core>", "</core>");
	
		Log("Returned net version: "$datastring$" - Current version: "$version, 'TCCore');

		BroadcastMessage(_CodeBase().Split(DataStore, "<motd>", "</motd>"));

		if(datastring != version)
		{
			bHasUpdate=True;
			SaveConfig();
			Log("Version mismatch.. update available? Check for updates at https://github.com/Kaiz0r/tccore", 'TCCore');
			BroadcastMessage("TCCore has an update available!");
		}
		else
		{
			bHasUpdate=False;
			SaveConfig();
			Log("Core is up-to-date.", 'TCCore');		
		}
	}
}
