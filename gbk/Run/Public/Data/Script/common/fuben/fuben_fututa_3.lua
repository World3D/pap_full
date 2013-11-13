--MisDescBegin
-------------------------
--***********************
--Const
--***********************
-------------------------

x700103_g_ScriptId 				= 700103
x700103_g_MissionId 			= 443
x700103_g_MissionKind 		= 23

x700103_g_FuBenType				= 1

x700103_g_CopySceneName				= "����������"
x700103_g_Name								= ""
x700103_g_CopySceneType				= FUBEN_FUTUTA
x700103_g_LimitMembers				= 1			--���Խ���������С��������
x700103_g_TickTime						= 5				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x700103_g_LimitTotalHoldTime	= 360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x700103_g_LimitCompleteTime		= 10
x700103_g_CloseTick						= 2				--�����ر�ǰ����ʱ����λ��������
x700103_g_NoUserTime					= 10			--������û���˺���Լ��������ʱ�䣨��λ���룩
x700103_g_DeadTrans						= 0				--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x700103_g_Fuben_X							= 64				--���븱����λ��X
x700103_g_Fuben_Z							= 106				--���븱����λ��Z
x700103_g_Back_X							= 433				--Դ����λ��X
x700103_g_Back_Z							= 422					--Դ����λ��Z

x700103_g_MissionName				= "����������"
x700103_g_MissionInfo				= "ɱ��ȫ�����"
x700103_g_MissionTarget			= "ɱ��ȫ�����"
x700103_g_MissionBonusInfo	= "���%d�ľ��齱����"
x700103_g_ContinueInfo			= "��Ҫ����Ŭ������"

--MisDescEnd

x700103_g_LevelLess					= 30
x700103_g_RoundUntil				= 200

x700103_g_MissionComplete		= "лл�����������ڸҳ�����"
x700103_g_MissionFuBenOpen	= "���븱����"

x700103_g_KillMonsterMessage		= "���Ѿ�ɱ����%d/%dֻ�֣�"
x700103_g_CompleteOutMessage		= "������ɣ�����%d����͵���һ�㣡"

x700103_g_ErrorMessage					= "����������"
x700103_g_ErrorMessage_Country	= "�㲻�Ǳ����ˣ�"
x700103_g_ErrorMessage_Level		= format("��ĵȼ�����%d��", x700103_g_LevelLess)
x700103_g_ErrorMessage_Team			= "�㲻�ڶ����У�"
x700103_g_ErrorMessage_TeamNum	= format("���鲻��%d�ˣ�", x700103_g_LimitMembers)
x700103_g_ErrorMessage_Captain	= "�㲻�Ƕӳ���"
x700103_g_ErrorMessage_Round		= format("������Ѿ�����%d���ˣ�", x700103_g_RoundUntil)

x700103_g_ErrorMessage_OtherLevel		= "%s�ĵȼ�����%d��"
x700103_g_ErrorMessage_OtherAround	= "%s��������ߣ�"
x700103_g_ErrorMessage_OtherRound		= "%s�����Ѿ�����%d���ˣ�"

x700103_g_SomeoneInTeam				= "������ĳ��"

x700103_g_FuBenCreateOK					= "���������ɹ���"
x700103_g_FuBenCreateFailed			= "�����Ѵ����ޣ����Ժ����ԣ�"
x700103_g_MissionAbandon				= "����ʧ�ܣ�"
x700103_g_CountDownMessage			= "�㽫��%d����뿪������"
x700103_g_TimeOutFailedMessage	= "����ʧ�ܣ���ʱ��"
x700103_g_CompleteFailedNPCMessage	= "���Ǿ�Ȼʧ���ˣ�"
x700103_g_TipForEnter						= "���븡������"
x700103_g_SceneMapNavPath				= "fuben_fututasanceng/fuben_fututasanceng.nav"

x700103_g_LowHPAttention				= 30
x700103_g_LowHP									= 120
x700103_g_LowHPMessage					= "%d�����ӵ�HP����%d%%��"
x700103_g_BossEmergeMessage			= "%d�����Ӹ������־�Ӣ�֣�"

x700103_g_ExpBonus				= 0

x700103_g_MissionNPCName		= {
																{scene = 11, name = "����"},		--����
																{scene = 18, name = "����"},		--����
																{scene = 21, name = "����"},		--ѩ��
																{scene = 24, name = "����"},		--��Į
																{scene = 36, name = "���¾�"}		--�ʳ�
															}
x700103_g_NeedKillMonster		=	{
															}
x700103_g_FailedObj					= {
																{hash=1, type=9034, x=30, z=64, ai=7, aiscript=0, camp=21},
																{hash=2, type=9034, x=98, z=64, ai=7, aiscript=0, camp=21},
																{hash=3, type=9034, x=64, z=19, ai=7, aiscript=0, camp=21}
															}
x700103_g_BossMonster				= {
																{hash=1, type=341, time=3, ai=0, aiscript=0},
																{hash=2, type=341, time=8, ai=0, aiscript=0},
																{hash=3, type=341, time=12*60, ai=0, aiscript=0},
																{hash=4, type=341, time=15*60, ai=0, aiscript=0},
																{hash=5, type=341, time=17*60, ai=0, aiscript=0},
																{hash=6, type=341, time=18*60, ai=0, aiscript=0}
															}
x700103_g_BossRandomPosition	=	{
																	{x1=32, z1=64, x2=28, z2=64},
																	{x1=96, z1=64, x2=100, z2=64},
																	{x1=62, z1=19, x2=66, z2=19}
																}

-------------------------
--***********************
--Define
--***********************
-------------------------

x700103_OK							= 0
x700103_OK_RETURN				= 1
x700103_ERROR_UNKNOWN		= -1

x700103_FAILED_COUNTRY	= 10
x700103_FAILED_LEVEL		= 11
x700103_FAILED_ROUND		= 13
x700103_FAILED_TEAM			= 14
x700103_FAILED_TEAMNUM	= 15
x700103_FAILED_CAPTAIN	= 16

x700103_FAILED_OTHERLEVEL		= 20
x700103_FAILED_OTHERMISSION	= 22
x700103_FAILED_OTHERAROUND	= 23
x700103_FAILED_OTHERROUND		= 24

x700103_MP_AIMSCENE			= 0
x700103_MP_TEAMID				= 1
x700103_MP_KILLMONSTER	= 2
x700103_MP_ISCOMPLETE		= 7

x700103_CSP_FUBENTYPE				= 0
x700103_CSP_SCRIPTID				= 1
x700103_CSP_TICKCOUNT				= 2
x700103_CSP_FROMSCENEID			= 3
x700103_CSP_ISCLOSING				= 4
x700103_CSP_LEAVECOUNTDOWN	= 5
x700103_CSP_TEAMID					= 6
x700103_CSP_NALLMONSTER			= 7
x700103_CSP_NKILLMONSTER		= 8
x700103_CSP_ISCOMPLETE			= 9
x700103_CSP_FAILEDOBJ_1			= 10
x700103_CSP_FAILEDOBJ_2			= 11
x700103_CSP_FAILEDOBJ_3			= 12

x700103_MD_DayCount				= MD_FUTUTA_DAYCOUNT_A

-------------------------
--***********************
--OnDefaultEvent
--***********************
-------------------------

function x700103_OnDefaultEvent(sceneId, selfId, NPCId)

	local safeCheckRet, otherRet = x700103_SafeNPCCheck(sceneId, selfId, NPCId);
	local bHaveMission = IsHaveMission(sceneId, selfId, x700103_g_MissionId);
	local misIndex;
	local str = x700103_g_MissionName.."\n";
	local dispatchType = 0;
	local bDone = 0;
	
	if bHaveMission > 0 then
		misIndex = GetMissionIndexByID(sceneId, selfId, x700103_g_MissionId);
		bDone = x700103_CheckComplete(sceneId, selfId);

		if bDone == 1 then
			str = str..x700103_g_MissionComplete;
			dispatchType = 2;
		else
			str = str..x700103_g_CompleteFailedNPCMessage;
			dispatchType = 2;
		end
	elseif safeCheckRet == x700103_OK or safeCheckRet == x700103_OK_RETURN then
		str = str..x700103_g_MissionInfo;
		dispatchType = 1;
	else
		dispatchType = 4;
		if safeCheckRet == x700103_FAILED_ROUND then
			str = x700103_g_ErrorMessage_Round;
		elseif safeCheckRet == x700103_FAILED_COUNTRY then
			str = x700103_g_ErrorMessage_Country;
		elseif safeCheckRet == x700103_FAILED_LEVEL then
			str = x700103_g_ErrorMessage_Level;
		elseif safeCheckRet == x700103_FAILED_CAPTAIN then
			str = x700103_g_ErrorMessage_Captain;
		elseif safeCheckRet == x700103_FAILED_TEAM then
			str = x700103_g_ErrorMessage_Team;
		elseif safeCheckRet == x700103_FAILED_TEAMNUM then
			str = x700103_g_ErrorMessage_TeamNum;
		else
			local otherName = x700103_g_SomeoneInTeam;
			if otherRet >= 0 then
				otherName = GetName(sceneId, otherRet);
			end
			if safeCheckRet == x700103_FAILED_OTHERLEVEL then
				str = format(x700103_g_ErrorMessage_OtherLevel, otherName, x700103_g_LevelLess);
			elseif safeCheckRet == x700103_FAILED_OTHERROUND then
				str = format(x700103_g_ErrorMessage_OtherRound, otherName, x700103_g_RoundUntil);
			elseif safeCheckRet == x700103_FAILED_OTHERMISSION then
				str = format(x700103_g_ErrorMessage_OtherMission, otherName);
			elseif safeCheckRet == x700103_FAILED_OTHERAROUND then
				str = format(x700103_g_ErrorMessage_OtherAround, otherName);
			end
		end
	end
	
	BeginEvent(sceneId);
		AddText(sceneId, str);
	EndEvent();
	
	if dispatchType == 1 then
		DispatchMissionInfo(sceneId, selfId, NPCId, x700103_g_ScriptId, x700103_g_MissionId);
	elseif dispatchType == 2 then
		DispatchMissionContinueInfo(sceneId, selfId, NPCId, x700103_g_ScriptId, x700103_g_MissionId);
	elseif dispatchType == 3 then
		DispatchEventList(sceneId, selfId, NPCId);
	else
		DispatchMissionTips(sceneId, selfId);
	end

end

-------------------------
--***********************
--OnEnumerate
--***********************
-------------------------

function x700103_OnEnumerate(sceneId, selfId, NPCId)

	if x700103_SafeDisplayCheck(sceneId, selfId, NPCId) > 0 then
		AddNumText(sceneId, x700103_g_ScriptId, x700103_g_MissionName);
	end

end

-------------------------
--***********************
--SafeDisplayCheck
--***********************
-------------------------

function x700103_SafeDisplayCheck(sceneId, selfId, NPCId)

	local bHaveMission = IsHaveMission(sceneId, selfId, x700103_g_MissionId);
	
	if bHaveMission > 0 then
		return 1;
	end
	
	if x700103_IsMissionNPC(sceneId, selfId, x700103_g_MissionId, NPCId) > 0 then
		return 1;
	end
	
	return 0;

end

-------------------------
--***********************
--IsMissionNPC
--***********************
-------------------------

function x700103_IsMissionNPC(sceneId, selfId, missionId, NPCId)

	for i, item in pairs(x700103_g_MissionNPCName) do
		if item.scene == sceneId then
			if GetName(sceneId, NPCId) == item.name then
				return 1;
			end
		end
	end
	
	return 0;

end

-------------------------
--***********************
--CheckAllMemberLevel
--***********************
-------------------------

function x700103_CheckAllMemberLevel(sceneId, selfId, teamnum)

	for i = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(sceneId, selfId, i);
		if GetLevel(sceneId, memberId) < x700103_g_LevelLess then
			return 0, memberId;
		end
	end
	
	return 1;

end

-------------------------
--***********************
--CheckAllMemberHaveMission
--***********************
-------------------------

function x700103_CheckAllMemberHaveMission(sceneId, selfId, teamnum)

	for i = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(sceneId, selfId, i);
		if IsHaveMission(sceneId, memberId, x700103_g_MissionId) <= 0 then
--			return 0, memberId;
		end
	end
	
	return 1;

end

-------------------------
--***********************
--CheckAllMemberAround
--***********************
-------------------------

function x700103_CheckAllMemberAround(sceneId, selfId, teamnum)

	if GetNearTeamCount(sceneId, selfId) == teamnum then
		return 1;
	end
	
	return 0, -1;

end


-------------------------
--***********************
--CheckRound
--***********************
-------------------------

function x700103_CheckRound(sceneId, selfId)

	local daycount = GetMissionData(sceneId, selfId, x700103_MD_DayCount);
	local nowtime = LuaFnGetCurrentTime();
	
	local today = floor(nowtime / 86400);
	local round = 0;
	
	if today == floor(daycount / 10000) then
		round = floor((daycount - today * 10000) / 100) + 1;
		if round >= x700103_g_RoundUntil then
			return -1;
		end
	end
	
	return round;

end

-------------------------
--***********************
--CheckAllMemberRound
--***********************
-------------------------

function x700103_CheckAllMemberRound(sceneId, selfId, teamnum)

	for i = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(sceneId, selfId, i);
		if x700103_CheckRound(sceneId, memberId) < 0 then
			return 0, memberId;
		end
	end
	
	return 1;
	
end

-------------------------
--***********************
--SafeNPCCheck
--***********************
-------------------------

function x700103_SafeNPCCheck(sceneId, selfId, NPCId)

	bHaveMission = IsHaveMission(sceneId, selfId, x700103_g_MissionId);
	
	if bHaveMission > 0 then
	
		misIndex = GetMissionIndexByID(sceneId, selfId, x700103_g_MissionId);
		aimsceneid = GetMissionParam(sceneId, selfId, misIndex, x700103_MP_AIMSCENE);
		aimteamid = GetMissionParam(sceneId, selfId, misIndex, x700103_MP_TEAMID);
		
		if aimsceneid >= 0 and teamId == aimteamid then
			return x700103_OK_RETURN;
		else
			return x700103_ERROR_UNKNOWN;
		end
		
	else
		local teamid = GetTeamId(sceneId, selfId);
		local teamnum = GetTeamSize(sceneId, selfId);
		if GetLevel(sceneId, selfId) < x700103_g_LevelLess then
			return x700103_FAILED_LEVEL;
		elseif x700103_CheckRound(sceneId, selfId) < 0 then
			return x700103_FAILED_ROUND;
		elseif LuaFnIsTeamLeader(sceneId, selfId) <= 0 then
			return x700103_FAILED_CAPTAIN;
		elseif teamid < 0 then
			return x700103_FAILED_TEAM;
		elseif teamnum < x700103_g_LimitMembers then
			return x700103_FAILED_TEAMNUM;
		else
		
			local nearteamnum = GetNearTeamCount(sceneId, selfId);
			local ret, otherId;
			
			ret, otherId = x700103_CheckAllMemberLevel(sceneId, selfId, nearteamnum);
			if ret <= 0 then
				return x700103_FAILED_OTHERLEVEL, otherId;
			end
			ret, otherId = x700103_CheckAllMemberRound(sceneId, selfId, nearteamnum);
			if ret <= 0 then
				return x700103_FAILED_OTHERAROUND, otherId;
			end
			ret, otherId = x700103_CheckAllMemberHaveMission(sceneId, selfId, nearteamnum);
			if ret <= 0 then
				return x700103_FAILED_OTHERMISSION, otherId;
			end
			ret, otherId = x700103_CheckAllMemberAround(sceneId, selfId, nearteamnum);
			if ret <= 0 then
				return x700103_FAILED_OTHERAROUND, otherId;
			end
			return x700103_OK;
			
		end
	end
	
	return x700103_ERROR_UNKNOWN;

end

-------------------------
--***********************
--CheckAccept
--***********************
-------------------------

function x700103_CheckAccept(sceneId, selfId, NPCId)

	local safeCheckRet = x700103_SafeNPCCheck(sceneId, selfId, NPCId);
	if safeCheckRet == x700103_OK or safeCheckRet == x700103_OK_RETURN then
		return 1;
	end
	
	return 0;

end

-------------------------
--***********************
--OnAccept
--***********************
-------------------------

function x700103_OnAccept(sceneId, selfId, NPCId, backsceneId)

	bHaveMission = IsHaveMission(sceneId, selfId, x700103_g_MissionId);
	local teamId = GetTeamId(sceneId, selfId);
	
	if bHaveMission > 0 then
		
		local safeCheckRet = x700103_SafeNPCCheck(sceneId, selfId, NPCId);
		if SafeNPCCheck == x700103_OK_RETURN then
			misIndex = GetMissionIndexByID(sceneId, selfId, x700103_g_MissionId);
			aimsceneid = GetMissionParam(sceneId, selfId, misIndex, x700103_MP_AIMSCENE);
			NewWorld(sceneId, selfId, aimsceneid, x700103_g_Fuben_X, x700103_g_Fuben_Z);
		else
			BeginEvent(sceneId);
				AddText(x700103_g_ErrorMessage);
			EndEvent();
			DispatchMissionTips(sceneId, selfId);
			return 0;
		end
		
	else
		
		local memberNum = GetNearTeamCount(sceneId, selfId);
		for i = 0, memberNum - 1 do
			local memberId = GetNearTeamMember(sceneId, selfId, i);
			AddMission(sceneId, memberId, x700103_g_MissionId, x700103_g_ScriptId, 1, 0, 0);
			local misIndex = GetMissionIndexByID(sceneId, memberId, x700103_g_MissionId);
			SetMissionByIndex(sceneId, memberId, misIndex, x700103_MP_AIMSCENE, -1);
			SetMissionByIndex(sceneId, memberId, misIndex, x700103_MP_TEAMID, teamId);
			SetMissionByIndex(sceneId, memberId, misIndex, x700103_MP_ISCOMPLETE, 0);
		end
		
		x700103_MakeCopyScene(sceneId, selfId, memberNum, backsceneId);
		
	end
	
end

-------------------------
--***********************
--MakeCopyScene
--***********************
-------------------------

function x700103_MakeCopyScene(sceneId, selfId, memberNum, backsceneId)
	
	local leaderguid = LuaFnObjId2Guid(sceneId, selfId);
	LuaFnSetSceneLoad_Map(sceneId, x700103_g_SceneMapNavPath); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x700103_g_NoUserTime * 1000);
	LuaFnSetCopySceneData_Timer(sceneId, x700103_g_TickTime * 1000);
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_FUBENTYPE, x700103_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_SCRIPTID, x700103_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_TICKCOUNT, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_FROMSCENEID, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_ISCLOSING, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_LEAVECOUNTDOWN, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_TEAMID, GetTeamId(sceneId, selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_NALLMONSTER, 0) ;--ȫ��������
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_NKILLMONSTER, 0) ;--ɱ���ֵ�����
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_ISCOMPLETE, 0);

	if backsceneId == nil then
		backsceneId = sceneId;
	end
	
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_FROMSCENEID, backsceneId);--���ø�����ڳ�����
	
	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
		BeginEvent(sceneId);
		if bRetSceneID > 0 then
			AddText(sceneId, x700103_g_FuBenCreateOK);
		else
			AddText(sceneId, x700103_g_FuBenCreateFailed);
			for i = 0, memberNum - 1 do
				local memberId = GetNearTeamMember(sceneId, selfId, i);
				x700103_CancelMission(sceneId, memberId);
			end
		end
	EndEvent();
	DispatchMissionTips(sceneId, selfId);

end

-------------------------
--***********************
--OnCopySceneReady
--***********************
-------------------------

function x700103_OnCopySceneReady(sceneId, destsceneId)

	leaderguid = LuaFnGetCopySceneData_TeamLeader(destsceneId);
	leaderObjId = LuaFnGuid2ObjId(sceneId, leaderguid);

	local	memberNum = GetNearTeamCount(sceneId, leaderObjId);
	
	for i = 0, memberNum - 1 do
		local memberId = GetNearTeamMember(sceneId, leaderObjId, i);

		misIndex = GetMissionIndexByID(sceneId, memberId, x700103_g_MissionId);
		SetMissionByIndex(sceneId, memberId, misIndex, x700103_MP_AIMSCENE, destsceneId);
		NewWorld(sceneId, memberId, destsceneId, x700103_g_Fuben_X, x700103_g_Fuben_Z);
	end
	
	local tcount = 0;
	for i, item in pairs(x700103_g_FailedObj) do
		local failedObjId = LuaFnCreateMonster(destsceneId, item.type, item.x, item.z, item.ai, item.aiscript, x700103_g_ScriptId);
		SetCurCamp(destsceneId, objId, item.camp);
		LuaFnSetCopySceneData_Param(destsceneId, x700103_CSP_FAILEDOBJ_1 + tcount, failedObjId);
		tcount = tcount + 1;
	end
	
	for i, item in pairs(x700103_g_NeedKillMonster) do
		LuaFnCreateMonster(destsceneId, item.type, item.x, item.z, item.ai, item.aiscript, -1);
	end
	
end

-------------------------
--***********************
--OnPlayerEnter
--***********************
-------------------------

function x700103_OnPlayerEnter(sceneId, selfId)

	SetPlayerDefaultReliveInfo(sceneId, selfId, "%10", "%10", "%10", sceneId, x700103_g_Fuben_X, x700103_g_Fuben_Z);

end

-------------------------
--***********************
--CancelMission
--***********************
-------------------------

function x700103_CancelMission(sceneId, selfId)

	misIndex = GetMissionIndexByID(sceneId, selfId, x700103_g_MissionId);
	local aimsceneid = GetMissionParam(sceneId, selfId, misIndex, x700103_MP_AIMSCENE);
	
	DelMission(sceneId, selfId, x700103_g_MissionId);
	
	if sceneId == aimsceneid then --����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
	
		BeginEvent(sceneId);
			AddText(sceneId, x700103_g_MissionAbandon);
		EndEvent();
		DispatchMissionTips(sceneId, selfId);
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_FROMSCENEID);--ȡ�ø�����ڳ�����
		
		NewWorld(sceneId, selfId, oldsceneId, x700103_g_Back_X, x700103_g_Back_Z);
		return oldsceneId;
	end
	
	return -1;
	
end

-------------------------
--***********************
--CheckSubmit
--***********************
-------------------------

function x700103_CheckSubmit(sceneId, selfId, NPCId)

	return 1;

end

-------------------------
--***********************
--CheckComplete
--***********************
-------------------------

function x700103_CheckComplete(sceneId, selfId, NPCId)

	local misIndex = GetMissionIndexByID(sceneId, selfId, x700103_g_MissionId);
	return GetMissionParam(sceneId, selfId, misIndex, x700103_MP_ISCOMPLETE);

end

-------------------------
--***********************
--OnSubmit
--***********************
-------------------------

function x700103_OnSubmit(sceneId, selfId, NPCId)
	
	local iscomplete = x700103_CheckComplete(sceneId, selfId, NPCId);
	
	local str;
	if iscomplete > 0 then
		str = x700103_g_MissionComplete;
	else
		str = x700103_g_MissionAbandon;
	end
	
	BeginEvent(sceneId);
		AddText(sceneId, str);
	EndEvent();
	DispatchMissionTips(sceneId, selfId);
	DelMission(sceneId, selfId, x700103_g_MissionId);
	
end

-------------------------
--***********************
--CheckTeamLeader
--***********************
-------------------------

function x700103_CheckTeamLeader(sceneId, selfId)
	if GetTeamId(sceneId, selfId) < 0 then	--�ж��Ƿ��ж���
		return x700103_FAILED_TEAM;
	end
	
	local	memberNum = GetNearTeamCount(sceneId, selfId);
	
	if memberNum < x700103_g_LimitMembers then
		return x700103_FAILED_TEAMNUMBER;
	end
	
	if LuaFnIsTeamLeader(sceneId, selfId) == 0 then	--ֻ�жӳ����ܽ�����
		return x700103_FAILED_CAPTAIN;
	end
	
	return x700103_OK;
end

-------------------------
--***********************
--OnAbandon
--***********************
-------------------------

function x700103_OnAbandon(sceneId, selfId)
	
	x700103_CancelMission(sceneId, selfId);
	
end

-------------------------
--***********************
--OnCopySceneTimer
--***********************
-------------------------

function x700103_OnCopySceneTimer(sceneId, nowTime)

	local nowTickCount = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_TICKCOUNT) + 1;
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_TICKCOUNT, nowTickCount);
	
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_ISCLOSING);
	
	local iscomplete = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_ISCOMPLETE);
	local humancount = LuaFnGetCopyScene_HumanCount(sceneId);

	if nowTickCount == x700103_g_LimitCompleteTime and iscomplete == 0 then
		LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_ISCOMPLETE, 1);
		LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_ISCLOSING, 1);
		iscomplete = 1;
		leaveFlag = 1;
		for i = 0, humancount - 1 do
			local humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			local str = format(x700103_g_CompleteOutMessage, x700103_g_CloseTick * x700103_g_TickTime);
			BeginEvent(sceneId);
				AddText(sceneId, str);
			EndEvent(sceneId);
			DispatchMissionTips(sceneId, humanId);
			
			local exp = x700103_GetExp(sceneId, humanId);
			GetExp(sceneId, humanId, exp);
			str = format(x700103_g_MissionBonusInfo, exp);
			BeginEvent(sceneId);
				AddText(sceneId, str);
			EndEvent();
			DispatchMissionTips(sceneId, humanId);
			
		end
	end
	
	if leaveFlag > 0 then
	
		local leaveCountDown = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_LEAVECOUNTDOWN) + 1;
		LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_LEAVECOUNTDOWN, leaveCountDown);
		
		if leaveCountDown == x700103_g_CloseTick then
			local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_FROMSCENEID);
			for	i = 0, humancount - 1 do
				local humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				if iscomplete == 1 then
					DelMission(sceneId, humanId, x700103_g_MissionId);
					CallScriptFunction(700104, "OnAccept", sceneId, humanId, nil, oldsceneId);
				else
					x700103_CancelMission(sceneId, humanId);
				end
			end
		elseif leaveCountDown < x700103_g_CloseTick then
			for	i = 0, humancount - 1 do
				local humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
 				local str = format(x700103_g_CountDownMessage, (x700103_g_CloseTick - leaveCountDown) * x700103_g_TickTime);
  			BeginEvent(sceneId);
  				AddText(sceneId, str);
  			EndEvent(sceneId);
  			DispatchMissionTips(sceneId, humanId);
			end
		end
		
	else

		for i = 0, humancount - 1 do
			humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if nowTickCount == 1 then
				BeginEvent(sceneId);
					AddText(sceneId, x700103_g_TipForEnter);
				EndEvent();
				DispatchMissionTips(sceneId, humanId);
			end
			if nowTickCount == x700103_g_LimitTotalHoldTime then
				local oldsceneId = x700103_CancelMission(sceneId, humanId);
				BeginEvent(oldsceneId);
					AddText(sceneId, x700103_g_TimeOutFailedMessage);
				EndEvent();
				DispatchMissionTips(oldsceneId, humanId);
			end
			local kickout = 0;
			if IsHaveMission(sceneId, humanId, x700103_g_MissionId) > 0 then
				if GetTeamId(sceneId, humanId) ~= LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_TEAMID) then
					kickout = 1;
				end
			else
				kickout = 1;
			end
			if kickout == 1 then
				x700103_CancelMission(sceneId, humanId);
			end
			
--
--
			
		end
		if nowTime == x700103_g_LimitTotalHoldTime then
			LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_ISCLOSING, 1);
		end	
		
		for i, item in pairs(x700103_g_BossMonster) do
			if item.time == nowTickCount then
				local tindex = random(1, 3);
				local tpos = x700103_g_BossRandomPosition[tindex];
				LuaFnCreateMonster(sceneId, item.type, tpos.x1, tpos.z1, item.ai, item.aiscript, -1);
				LuaFnCreateMonster(sceneId, item.type, tpos.x2, tpos.z2, item.ai, item.aiscript, -1);
			
				BeginEvent(sceneId);
					AddText(sceneId, format(x700103_g_BossEmergeMessage, tindex));
				EndEvent();
				for i = 0, humancount - 1 do
					humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
					DispatchMissionTips(sceneId, humanId);
				end
				
			end
		end
		
		for i = 0, 2 do
			local failedObjId = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_FAILEDOBJ_1 + i);
--			if GetHP(sceneId, failedObjId) < x700103_g_LowHP then
			if false then
				for	j = 0, humancount - 1 do
					local humanId = LuaFnGetCopyScene_HumanObjId(sceneId, j);
	 				local str = format(x700103_g_LowHPMessage, i + 1, x700103_g_LowHPAttention);
	  			BeginEvent(sceneId);
	  				AddText(sceneId, str);
	  			EndEvent(sceneId);
	  			DispatchMissionTips(sceneId, humanId);
				end
			end
		end
		
	end

end

-------------------------
--***********************
--GetMoney
--***********************
-------------------------

function x700103_GetExp(sceneId, selfId, NPCId)

	local ret = x700103_g_ExpBonus;
	return ret;
	
end

-------------------------
--***********************
--OnKillObject
--***********************
-------------------------

function x700103_OnKillObject(sceneId, selfId, objdataId ,objId)
	
	local sceneType = LuaFnGetSceneType(sceneId);
	if sceneType ~= x700103_g_FuBenType then
		return 0;
	end
	
	local fubenType = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_FUBENTYPE);
	if fubenType ~= x700103_g_CopySceneType then
		return 0;
	end
	
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_LEAVECOUNTDOWN);

	if leaveFlag == 1 then --��������Ѿ����óɹر�״̬����ɱ����Ч
		return 0;
	end
	
	local humancount = LuaFnGetCopyScene_HumanCount(sceneId);
	
	local killmonster = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_NKILLMONSTER) + 1;
	
	local humanId;
	local misIndex;
	
	LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_NKILLMONSTER, killmonster);
	
	for i = 0, humancount - 1 do
		local humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);--ȡ�õ�ǰ�������˵�objId
		
		misIndex = GetMissionIndexByID(sceneId, humanId, x700103_g_MissionId); --ȡ��������������ֵ
		local killedcount = GetMissionParam(sceneId, humanId, misIndex, x700103_MP_KILLMONSTER) + 1; --ȡ���Ѿ�ɱ�˵Ĺ�����
		SetMissionByIndex(sceneId, humanId, misIndex, x700103_MP_KILLMONSTER, killedcount); --������������
	end
end

-------------------------
--***********************
--OnDie
--***********************
-------------------------

function x700103_OnDie(sceneId, selfId, killerId)

	local humancount = LuaFnGetCopyScene_HumanCount(sceneId);
	local failedobj_1 = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_FAILEDOBJ_1);
	local failedobj_2 = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_FAILEDOBJ_2);
	local failedobj_3 = LuaFnGetCopySceneData_Param(sceneId, x700103_CSP_FAILEDOBJ_3);
	local failed = 0;
	if failedobj_1 == selfId or failedobj_2 == selfId or failedobj_3 == selfId then
		failed = 1;
	end
	
	if failed > 0 then
		for i = 0, humancount - 1 do
		
			humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);	--ȡ�õ�ǰ�������˵�objId	

			str = x700103_g_MissionAbandon;
			
			BeginEvent(sceneId);
				AddText(sceneId, str);
			EndEvent();
			DispatchMissionTips(sceneId, humanId);
		end
		
		LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_ISCLOSING, 1);
		LuaFnSetCopySceneData_Param(sceneId, x700103_CSP_ISCOMPLETE, -1);
	end

end

-------------------------
--***********************
--OnHumanDie
--***********************
-------------------------

function x700103_OnHumanDie(sceneId, selfId, killerId)
end