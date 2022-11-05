#include <sourcemod>
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Remove Cash & Points Messages (CS:GO)", 
	author = "sneaK", 
	version = "1.4",
	description = "Disables certain messages in chat",
	url = "https://snksrv.com"
};

public void OnPluginStart()
{
	HookUserMessage(GetUserMessageId("TextMsg"), RemoveMessage, true);
}

public Action RemoveMessage(UserMsg msg_id, BfRead msg, const int[] players, int playersNum, bool reliable, bool init)
{
	char buffer[64];
	PbReadString(msg, "params", buffer, sizeof(buffer), 0);
	
	if (StrContains(buffer, "#Player_Cash_Award"))
	{
		return Plugin_Handled;
	}
	if (StrContains(buffer, "#Team_Cash_Award"))
	{
		return Plugin_Handled;
	}
	if (StrContains(buffer, "#Player_Point_Award"))
	{
		return Plugin_Handled;
	}
	if (StrContains(buffer, "#Player_Team_Award"))
	{
		return Plugin_Handled;
	}
	if (StrContains(buffer, "#Notice_Bonus"))
	{
		return Plugin_Handled;
	}
	return Plugin_Continue;
}
