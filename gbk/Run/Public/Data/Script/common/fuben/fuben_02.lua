--MisDescBegin
-------------------------
--***********************
--Const
--***********************
-------------------------

x700101_g_ScriptId 				= 700101
x700101_g_MissionId 			= 408
x700101_g_MissionKind 		= 23

x700101_g_FuBenType				= 1

x700101_g_CopySceneName				= "��������02"
x700101_g_Name								= "����2"
x700101_g_CopySceneType				= FUBEN_02
x700101_g_LimitMembers				= 1			--���Խ���������С��������
x700101_g_TickTime						= 5				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x700101_g_LimitTotalHoldTime	= 360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
--x700101_g_LimitTimeSuccess		= 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x700101_g_CloseTick						= 6				--�����ر�ǰ����ʱ����λ��������
x700101_g_NoUserTime					= 10			--������û���˺���Լ��������ʱ�䣨��λ���룩
x700101_g_DeadTrans						= 0				--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x700101_g_Fuben_X							= 38				--���븱����λ��X
x700101_g_Fuben_Z							= 180				--���븱����λ��Z
x700101_g_Back_X							= 33				--Դ����λ��X
x700101_g_Back_Z							= 180					--Դ����λ��Z

x700101_g_NeedKillMonster			= {
																	{hash=1, num=3, type=9107},
																	{hash=2, num=1, type=9111},
																	{hash=3, num=1, type=9112}
																}

x700101_g_LevelLess					= 10
x700101_g_RoundUntil				= 8
x700101_g_ShaQiUntil				= 0

x700101_g_MissionName				= "��������02"
x700101_g_MissionInfo				= "ɱ��ȫ�����"
x700101_g_MissionTarget			= "ɱ��ȫ������"
x700101_g_MissionBonusInfo	= "���%d��%d��%dͭ�Ľ�����"

x700101_g_ContinueInfo			= "��Ҫ����Ŭ������"
x700101_g_MissionComplete		= "лл�����������ڸҳ�����"
x700101_g_MissionFuBenOpen	= "���븱����"

x700101_g_KillMonsterMessage		= "���Ѿ�ɱ����%d/%dֻ�֣�"
x700101_g_CompleteOutMessage		= "������ɣ�����%d����͵����λ�ã�"
x700101_g_OtherMonsterMessage		= "��Ӣ�ֱ�ɱ��"
x700101_g_BossMergeMessage			= "BOSS���֣�"

x700101_g_ErrorMessage					= "����������"
x700101_g_ErrorMessage_Country	= "�㲻�Ǳ����ˣ�"
x700101_g_ErrorMessage_Level		= format("��ĵȼ�����%d��", x700101_g_LevelLess)
x700101_g_ErrorMessage_Round		= format("������Ѿ������%d�����񣬸���������", x700101_g_RoundUntil)
x700101_g_ErrorMessage_ShaQi		= "%s��ɱ�����أ�"
x700101_g_ErrorMessage_Team			= "�㲻�ڶ����У�"
x700101_g_ErrorMessage_TeamNum	= format("���鲻��%d�ˣ�", x700101_g_LimitMembers)
x700101_g_ErrorMessage_Captain	= "�㲻�Ƕӳ���"

x700101_g_ErrorMessage_OtherLevel		= "%s�ĵȼ�����%d��"
x700101_g_ErrorMessage_OtherRound		= "%s�����Ѿ������%d�����񣬸���������"
x700101_g_ErrorMessage_OtherMission	= "%sû�н�����"
x700101_g_ErrorMessage_OtherAround	= "%s��������ߣ�"

x700101_g_SomeoneInTeam				= "������ĳ��"

x700101_g_FuBenCreateOK					= "���������ɹ���"
x700101_g_FuBenCreateFailed			= "�����Ѵ����ޣ����Ժ����ԣ�"
x700101_g_MissionAbandon				= "����ʧ�ܣ�"
x700101_g_CountDownMessage			= "�㽫��%d����뿪������"
x700101_g_TimeOutFailedMessage	= "����ʧ�ܣ���ʱ��"
x700101_g_SceneMapNavPath				= "fuben_02/fuben_02.nav"

x700101_g_MoneyBonus				= 9999
x700101_g_buffId						= 1000

--MisDescEnd

x700101_g_MissionNPCName		= {
																{scene = 4, name = "��ҩʦ"}		
															}
															
x700101_g_MonsterGroup =	{
														{
															{	hash=1, type=x700101_g_NeedKillMonster[1].type, x=56.6176, z=180.0951, ai=0, aiscript=0},
															{	hash=1, type=x700101_g_NeedKillMonster[1].type, x=42.1541, z=180.4744, ai=0, aiscript=0},
															{	hash=1, type=x700101_g_NeedKillMonster[1].type, x=49.4044, z=185.6412, ai=0, aiscript=0}
														},
														{
															{hash=2, type=x700101_g_NeedKillMonster[2].type, x=35.3459, z=198.1646, ai=0, aiscript=0}
														},
														{
															{hash=3, type=x700101_g_NeedKillMonster[3].type, x=36.82, z=195.42, ai=0, aiscript=0}
														},
													}

-------------------------
--***********************
--Define
--***********************
-------------------------

x700101_OK							= 0
x700101_OK_RETURN				= 1
x700101_ERROR_UNKNOWN		= -1

x700101_FAILED_COUNTRY	= 10
x700101_FAILED_LEVEL		= 11
x700101_FAILED_ROUND		= 12
x700101_FAILED_SHAQI		= 13
x700101_FAILED_TEAM			= 14
x700101_FAILED_TEAMNUM	= 15
x700101_FAILED_CAPTAIN	= 16

x700101_FAILED_OTHERLEVEL		= 20
x700101_FAILED_OTHERROUND		= 21
x700101_FAILED_OTHERMISSION	= 22
x700101_FAILED_OTHERAROUND	= 23

x700101_MP_AIMSCENE			= 0
x700101_MP_TEAMID				= 1
x700101_MP_KILLMONSTER	= 2
x700101_MP_COMPLETETIME	= 3
x700101_MP_ISCOMPLETE		= 7

x700101_CSP_FUBENTYPE				= 0
x700101_CSP_SCRIPTID				= 1
x700101_CSP_TICKCOUNT				= 2
x700101_CSP_FROMSCENEID			= 3
x700101_CSP_ISCLOSING				= 4
x700101_CSP_LEAVECOUNTDOWN	= 5
x700101_CSP_TEAMID					= 6
x700101_CSP_NKILLBOSS				= 7
x700101_CSP_NKILLMONSTER		= 8

-------------------------
--***********************
--OnDefaultEvent
--***********************
-------------------------

function x700101_OnDefaultEvent(sceneId, selfId, NPCId)

	local safeCheckRet, otherRet = x700101_SafeNPCCheck(sceneId, selfId, NPCId);
	local bHaveMission = IsHaveMission(sceneId, selfId, x700101_g_MissionId);
	local misIndex;
	local str = x700101_g_MissionName.."\n";
	local dispatchType = 0;
	local bDone = 0;
	
	if bHaveMission > 0 then
		misIndex = GetMissionIndexByID(sceneId, selfId, x700101_g_MissionId);
		bDone = x700101_CheckSubmit(sceneId, selfId);
		if bDone > 0 then
			str = str..x700101_g_MissionComplete;
			dispatchType = 2;
		else
			str = str..x700101_g_ContinueInfo;
			dispatchType = 1;
		end
	elseif safeCheckRet == x700101_OK or safeCheckRet == x700101_OK_RETURN then
		str = str..x700101_g_MissionInfo;
		dispatchType = 1;
	else
		dispatchType = 4;
		if safeCheckRet == x700101_FAILED_CAPTAIN then
			str = x700101_g_ErrorMessage_Captain;
		elseif safeCheckRet == x700101_FAILED_TEAM then
			str = x700101_g_ErrorMessage_Team;
		elseif safeCheckRet == x700101_FAILED_TEAMNUM then
			str = x700101_g_ErrorMessage_TeamNum;
		elseif safeCheckRet == x700101_FAILED_COUNTRY then
			str = x700101_g_ErrorMessage_Country;
		elseif safeCheckRet == x700101_FAILED_LEVEL then
			str = x700101_g_ErrorMessage_Level;
		elseif safeCheckRet == x700101_FAILED_ROUND then
			str = x700101_g_ErrorMessage_Round;
		else
			local otherName = x700101_g_SomeoneInTeam;
			if otherRet >= 0 then
				otherName = GetName(sceneId, otherRet);
			end
			if safeCheckRet == x700101_FAILED_OTHERLEVEL then
				str = format(x700101_g_ErrorMessage_OtherLevel, otherName, x700101_g_LevelLess);
			elseif safeCheckRet == x700101_FAILED_OTHERROUND then
				str = format(x700101_g_ErrorMessage_OtherRound, otherName, x700101_g_RoundUntil);
			elseif safeCheckRet == x700101_FAILED_OTHERMISSION then
				str = format(x700101_g_ErrorMessage_OtherMission, otherName);
			elseif safeCheckRet == x700101_FAILED_OTHERAROUND then
				str = format(x700101_g_ErrorMessage_OtherAround, otherName);
			end
		end
	end
	
	BeginEvent(sceneId);
		AddText(sceneId, str);
	EndEvent();
	
	if dispatchType == 1 then
		DispatchMissionInfo(sceneId, selfId, NPCId, x700101_g_ScriptId, x700101_g_MissionId);
	elseif dispatchType == 2 then
		if bDone > 0 then
			DispatchMissionContinueInfo(sceneId, selfId, NPCId, x700101_g_ScriptId, x700101_g_MissionId);
		else
			DispatchEventList(sceneId, selfId, NPCId);
		end
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

function x700101_OnEnumerate(sceneId, selfId, NPCId)

	if x700101_SafeDisplayCheck(sceneId, selfId, NPCId) > 0 then
		AddNumText(sceneId, x700101_g_ScriptId, x700101_g_MissionName);
	end

end

-------------------------
--***********************
--SafeDisplayCheck
--***********************
-------------------------

function x700101_SafeDisplayCheck(sceneId, selfId, NPCId)

	local bHaveMission = IsHaveMission(sceneId, selfId, x700101_g_MissionId);
	
	if bHaveMission > 0 then
		return 1;
	end
	
	if x700101_IsMissionNPC(sceneId, selfId, x700101_g_MissionId, NPCId) > 0 then
		return 1;
	end
	
	return 0;

end

-------------------------
--***********************
--IsMissionNPC
--***********************
-------------------------

function x700101_IsMissionNPC(sceneId, selfId, missionId, NPCId)

	for i, item in pairs(x700101_g_MissionNPCName) do
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
--CheckRound
--***********************
-------------------------

function x700101_CheckRound(sceneId, selfId)

	local daycount = GetMissionData(sceneId, selfId, MD_HUOCAISHENDIAN_DAYCOUNT);
	local nowtime = LuaFnGetCurrentTime();
	
	local today = floor(nowtime / 86400);
	local round = 0;
	
	if today == floor(daycount / 10000) then
		round = floor((daycount - today * 10000) / 100) + 1;
		if round >= x700101_g_RoundUntil then
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

function x700101_CheckAllMemberRound(sceneId, selfId, teamnum)

	for i = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(sceneId, selfId, i);
		if x700101_CheckRound(sceneId, memberId) > x700101_g_RoundUntil then
			return 0, memberId;
		end
	end
	
	return 1;

end

-------------------------
--***********************
--CheckAllMemberLevel
--***********************
-------------------------

function x700101_CheckAllMemberLevel(sceneId, selfId, teamnum)

	for i = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(sceneId, selfId, i);
		if GetLevel(sceneId, memberId) < x700101_g_LevelLess then
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

function x700101_CheckAllMemberHaveMission(sceneId, selfId, teamnum)

	for i = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(sceneId, selfId, i);
		if IsHaveMission(sceneId, memberId, x700101_g_MissionId) <= 0 then
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

function x700101_CheckAllMemberAround(sceneId, selfId, teamnum)

	if GetNearTeamCount(sceneId, selfId) == teamnum then
		return 1;
	end
	
	return 0, -1;

end

-------------------------
--***********************
--SafeNPCCheck
--***********************
-------------------------

function x700101_SafeNPCCheck(sceneId, selfId, NPCId)

	bHaveMission = IsHaveMission(sceneId, selfId, x700101_g_MissionId);
	
	if bHaveMission > 0 then
	
		misIndex = GetMissionIndexByID(sceneId, selfId, x700101_g_MissionId);
		aimsceneid = GetMissionParam(sceneId, selfId, misIndex, x700101_MP_AIMSCENE);
		aimteamid = GetMissionParam(sceneId, selfId, misIndex, x700101_MP_TEAMID);
		
		if aimsceneid >= 0 and teamId == aimteamid then
			return x700101_OK_RETURN;
		else
			return x700101_ERROR_UNKNOWN;
		end
		
	else
		local teamid = GetTeamId(sceneId, selfId);
		local teamnum = GetTeamSize(sceneId, selfId);
		if GetLevel(sceneId, selfId) < x700101_g_LevelLess then
			return x700101_FAILED_LEVEL;
		elseif x700101_CheckRound(sceneId, selfId) > x700101_g_RoundUntil then
			return x700101_FAILED_ROUND;
		elseif LuaFnIsTeamLeader(sceneId, selfId) <= 0 then
			return x700101_FAILED_CAPTAIN;
		elseif teamid < 0 then
			return x700101_FAILED_TEAM;
		elseif teamnum < x700101_g_LimitMembers then
			return x700101_FAILED_TEAMNUM;
		else
		
			local nearteamnum = GetNearTeamCount(sceneId, selfId);
			local ret, otherId;
			
			ret, otherId = x700101_CheckAllMemberLevel(sceneId, selfId, nearteamnum);
			if ret <= 0 then
				return x700101_FAILED_OTHERLEVEL, otherId;
			end
			ret, otherId = x700101_CheckAllMemberRound(sceneId, selfId, nearteamnum);
			if ret <= 0 then
				return x700101_FAILED_OTHERROUND, otherId;
			end
			ret, otherId = x700101_CheckAllMemberHaveMission(sceneId, selfId, nearteamnum);
			if ret <= 0 then
				return x700101_FAILED_OTHERMISSION, otherId;
			end
			ret, otherId = x700101_CheckAllMemberAround(sceneId, selfId, nearteamnum);
			if ret <= 0 then
				return x700101_FAILED_OTHERAROUND, otherId;
			end
			return x700101_OK;
			
		end
	end
	
	return x700101_ERROR_UNKNOWN;

end

-------------------------
--***********************
--CheckAccept
--***********************
-------------------------

function x700101_CheckAccept(sceneId, selfId, NPCId)

	local safeCheckRet = x700101_SafeNPCCheck(sceneId, selfId, NPCId);
	if safeCheckRet == x700101_OK or safeCheckRet == x700101_OK_RETURN then
		return 1;
	end
	
	return 0;

end

-------------------------
--***********************
--OnAccept
--***********************
-------------------------

function x700101_OnAccept(sceneId, selfId, NPCId)

	bHaveMission = IsHaveMission(sceneId, selfId, x700101_g_MissionId);
	local teamId = GetTeamId(sceneId, selfId);
	
	if bHaveMission > 0 then
		
		local safeCheckRet = x700101_SafeNPCCheck(sceneId, selfId, NPCId);
		if SafeNPCCheck == x700101_OK_RETURN then
			misIndex = GetMissionIndexByID(sceneId, selfId, x700101_g_MissionId);
			aimsceneid = GetMissionParam(sceneId, selfId, misIndex, x700101_MP_AIMSCENE);
			NewWorld(sceneId, selfId, aimsceneid, x700101_g_Fuben_X, x700101_g_Fuben_Z);
		else
			BeginEvent(sceneId);
				AddText(x700101_g_ErrorMessage);
			EndEvent();
			DispatchMissionTips(sceneId, selfId);
			return 0;
		end
		
	else
		
		local memberNum = GetNearTeamCount(sceneId, selfId);
		for i = 0, memberNum - 1 do
			local memberId = GetNearTeamMember(sceneId, selfId, i);
			AddMission(sceneId, memberId, x700101_g_MissionId, x700101_g_ScriptId, 1, 0, 0);
			local misIndex = GetMissionIndexByID(sceneId, memberId, x700101_g_MissionId);
			SetMissionByIndex(sceneId, memberId, misIndex, x700101_MP_AIMSCENE, -1);
			SetMissionByIndex(sceneId, memberId, misIndex, x700101_MP_TEAMID, teamId);
			SetMissionByIndex(sceneId, memberId, misIndex, x700101_MP_ISCOMPLETE, 0);
			x700101_AddDayCount(sceneId, memberId);
		end
		
		x700101_MakeCopyScene(sceneId, selfId, memberNum);
		
	end
	
end

-------------------------
--***********************
--CalculateLevel
--***********************
-------------------------

function x700101_CalculateLevel(sceneId, selfId, memberNum)

	local totalLevel = 0;
	for i = 0, memberNum - 1 do
		local memberId = GetNearTeamMember(sceneId, selfId, i);
		totalLevel = totalLevel + GetLevel(sceneId, memberId);
	end
	
	return floor(totalLevel / memberNum);

end

-------------------------
--***********************
--MakeCopyScene
--***********************
-------------------------

function x700101_MakeCopyScene(sceneId, selfId, memberNum)

	local level = x700101_CalculateLevel(sceneId, selfId, memberNum);
	
	local leaderguid = LuaFnObjId2Guid(sceneId, selfId);
	LuaFnSetSceneLoad_Map(sceneId, x700101_g_SceneMapNavPath); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x700101_g_NoUserTime * 1000);
	LuaFnSetCopySceneData_Timer(sceneId, x700101_g_TickTime * 1000);
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_FUBENTYPE, x700101_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_SCRIPTID, x700101_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_TICKCOUNT, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_FROMSCENEID, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_ISCLOSING, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_LEAVECOUNTDOWN, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_TEAMID, GetTeamId(sceneId, selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_NKILLBOSS, 0) ;--ɱ��Boss������
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_NKILLMONSTER, 0) ;--ɱ���ֵ�����
	
	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
		BeginEvent(sceneId);
		if bRetSceneID > 0 then
			AddText(sceneId, x700101_g_FuBenCreateOK);
		else
			AddText(sceneId, x700101_g_FuBenCreateFailed);
			for i = 0, memberNum - 1 do
				local memberId = GetNearTeamMember(sceneId, selfId, i);
				x700101_CancelMission(sceneId, memberId);
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

function x700101_OnCopySceneReady(sceneId, destsceneId)

	LuaFnSetCopySceneData_Param(destsceneId, x700101_CSP_FROMSCENEID, sceneId);--���ø�����ڳ�����
	leaderguid = LuaFnGetCopySceneData_TeamLeader(destsceneId);
	leaderObjId = LuaFnGuid2ObjId(sceneId, leaderguid);

	local	memberNum = GetNearTeamCount(sceneId, leaderObjId);

	for i = 0, memberNum - 1 do
		local memberId = GetNearTeamMember(sceneId, leaderObjId, i);

		misIndex = GetMissionIndexByID(sceneId, memberId, x700101_g_MissionId);
		SetMissionByIndex(sceneId, memberId, misIndex, x700101_MP_AIMSCENE, destsceneId);
		NewWorld(sceneId, memberId, destsceneId, x700101_g_Fuben_X, x700101_g_Fuben_Z);
	end
	x700101_CreateMonster(destsceneId, 1);
	x700101_CreateMonster(destsceneId, 2);
end

-------------------------
--***********************
--OnPlayerEnter
--***********************
-------------------------

function x700101_OnPlayerEnter(sceneId, selfId)

	SetPlayerDefaultReliveInfo(sceneId, selfId, "%10", "%10", "%10", sceneId, x700101_g_Fuben_X, x700101_g_Fuben_Z);

end

-------------------------
--***********************
--CreateMonster
--***********************
-------------------------

function x700101_CreateMonster(sceneId, teamId)

	for i, item in pairs(x700101_g_MonsterGroup[teamId]) do
		LuaFnCreateMonster(sceneId, item.type, item.x, item.z, item.ai, item.aiscript, -1);
	end

end

-------------------------
--***********************
--CancelMission
--***********************
-------------------------

function x700101_CancelMission(sceneId, selfId)

	misIndex = GetMissionIndexByID(sceneId, selfId, x700101_g_MissionId);
	local aimsceneid = GetMissionParam(sceneId, selfId, misIndex, x700101_MP_AIMSCENE);
	
	DelMission(sceneId, selfId, x700101_g_MissionId);
	
	if sceneId == aimsceneid then --����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
	
		BeginEvent(sceneId);
			AddText(sceneId, x700101_g_MissionAbandon);
		EndEvent();
		DispatchMissionTips(sceneId, selfId);
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_FROMSCENEID);--ȡ�ø�����ڳ�����
		
		NewWorld(sceneId, selfId, oldsceneId, x700101_g_Back_X, x700101_g_Back_Z);
		return oldsceneId;
	end
	
	return -1;
	
end

-------------------------
--***********************
--AddDayCount
--***********************
-------------------------

function x700101_AddDayCount(sceneId, selfId)

	local daycount = GetMissionData(sceneId, selfId, MD_HUOCAISHENDIAN_DAYCOUNT);	--day*100+circle
	local nowtime = LuaFnGetCurrentTime();
	local today = floor(nowtime / 86400);
	if today == floor(daycount / 10000) then
		daycount = daycount + 101;
	else
		daycount = today * 10000 + 1;
	end
	SetMissionData(sceneId, selfId, MD_HUOCAISHENDIAN_DAYCOUNT, daycount);

end

-------------------------
--***********************
--CheckSubmit
--***********************
-------------------------

function x700101_CheckSubmit(sceneId, selfId, NPCId)

	misIndex = GetMissionIndexByID(sceneId, selfId, x700101_g_MissionId);
	return GetMissionParam(sceneId, selfId, misIndex, x700101_MP_ISCOMPLETE);

end

-------------------------
--***********************
--OnSubmit
--***********************
-------------------------

function x700101_OnSubmit(sceneId, selfId, NPCId)
	
	local money = x700101_GetMoney(sceneId, selfId, NPCId);
	AddMoney(sceneId, selfId, money);
	
	local moneyjin = floor(money / 10000);
	local moneyyin = floor(money / 100) - moneyjin * 100;
	local moneytong = money - moneyjin * 10000 - moneyyin * 100;
	
	BeginEvent(sceneId);
		AddText(sceneId, format(x700101_g_MissionBonusInfo, moneyjin, moneyyin, moneytong));
	EndEvent();
	
	DispatchMissionTips(sceneId, selfId);
	DelMission(sceneId, selfId, x700101_g_MissionId);
	
end

-------------------------
--***********************
--CheckTeamLeader
--***********************
-------------------------

function x700101_CheckTeamLeader(sceneId, selfId)
	if GetTeamId(sceneId, selfId) < 0 then	--�ж��Ƿ��ж���
		return x700101_FAILED_TEAM;
	end
	
	local	memberNum = GetNearTeamCount(sceneId, selfId);
	
	if memberNum < x700101_g_LimitMembers then
		return x700101_FAILED_TEAMNUMBER;
	end
	
	if LuaFnIsTeamLeader(sceneId, selfId) == 0 then	--ֻ�жӳ����ܽ�����
		return x700101_FAILED_CAPTAIN;
	end
	
	return x700101_OK;
end

-------------------------
--***********************
--OnAbandon
--***********************
-------------------------

function x700101_OnAbandon(sceneId, selfId)
	
	x700101_CancelMission(sceneId, selfId);
	
end

-------------------------
--***********************
--OnCopySceneTimer
--***********************
-------------------------

function x700101_OnCopySceneTimer(sceneId, nowTime)

	local nowTickCount = LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_TICKCOUNT) + 1;
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_TICKCOUNT, nowTickCount);
	
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_ISCLOSING);

	if leaveFlag > 0 then
	
		local leaveCountDown = LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_LEAVECOUNTDOWN) + 1;
		LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_LEAVECOUNTDOWN, leaveCountDown);
		if leaveCountDown == x700101_g_CloseTick then
			local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_FROMSCENEID);
			local humancount = LuaFnGetCopyScene_HumanCount(sceneId);
			for	i = 0, humancount - 1 do
				local humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				NewWorld(sceneId, humanId, oldsceneId, x700101_g_Back_X, x700101_g_Back_Z);
			end
		elseif leaveCountDown < x700101_g_CloseTick then
			local humancount = LuaFnGetCopyScene_HumanCount(sceneId);
			for	i = 0, humancount - 1 do
				local humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
 				local str = format(x700101_g_CountDownMessage, (x700101_g_CloseTick - leaveCountDown) * x700101_g_TickTime);
  			BeginEvent(sceneId);
  				AddText(sceneId, str);
  			EndEvent(sceneId);
  			DispatchMissionTips(sceneId, humanId);
			end
		end
		
	else

		local humancount = LuaFnGetCopyScene_HumanCount(sceneId);
		for i = 0, humancount - 1 do
			humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if nowTickCount == x700101_g_LimitTotalHoldTime then
				LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_ISCLOSING, 1);
			end
			local kickout = 0;
			if IsHaveMission(sceneId, humanId, x700101_g_MissionId) > 0 then
				if GetTeamId(sceneId, humanId) ~= LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_TEAMID) then
					kickout = 1;
				end
			else
				kickout = 1;
			end
			if kickout == 1 then
				x700101_CancelMission(sceneId, humanId);
			end
		end
	end

end

-------------------------
--***********************
--GetMoney
--***********************
-------------------------

function x700101_GetMoney(sceneId, selfId, NPCId)
	local ret = x700101_g_MoneyBonus;
	return ret;
end

-------------------------
--***********************
--OnKillObject
--***********************
-------------------------

function x700101_OnKillObject(sceneId, selfId, objdataId ,objId)
	
	local sceneType = LuaFnGetSceneType(sceneId);
	if sceneType ~= x700101_g_FuBenType then
		return 0;
	end
	
	local fubenType = LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_FUBENTYPE);
	if fubenType ~= x700101_g_CopySceneType then
		return 0;
	end
	
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_LEAVECOUNTDOWN);
	if leaveFlag == 1 then --��������Ѿ����óɹر�״̬����ɱ����Ч
		return 0;
	end
	
	local humancount = LuaFnGetCopyScene_HumanCount(sceneId);
	
	local killmonster = LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_NKILLMONSTER);
	local killnum = 0;
	local killtype = 0;
	for i, item in pairs(x700101_g_NeedKillMonster) do
		if item.type == objdataId then
			if item.hash == 1 then
				killmonster = killmonster + 1;
				killtype = 1;
				killnum = mod(killmonster, 100);
			elseif item.hash == 2 then
				killmonster = killmonster + 100;
				killtype = 2;
				killnum = mod(floor(killmonster/100), 100);
			elseif item.hash == 3 then
				killmonster = killmonster + 10000;
				killtype = 3;
				killnum = floor(killmonster/10000);
			end
			break;
		end
	end
	
	if killtype == 1 then
	
		if killnum < x700101_g_NeedKillMonster[killtype].num then
			local str = format(x700101_g_KillMonsterMessage, killnum, x700101_g_NeedKillMonster[killtype].num);
			BeginEvent(sceneId);
				AddText(sceneId, str);
			EndEvent();
		else
			x700101_CreateMonster(sceneId, killtype+2);
			BeginEvent(sceneId);
				AddText(sceneId, x700101_g_BossMergeMessage);
			EndEvent();
		end
		
	elseif killtype == 2 then
	
		if killnum < x700101_g_NeedKillMonster[killtype].num then
			local str = format(x700101_g_KillMonsterMessage, killnum, x700101_g_NeedKillMonster[killtype].num);
			BeginEvent(sceneId);
				AddText(sceneId, str);
			EndEvent();
		else
			x700101_CauseBuff(sceneId);
			BeginEvent(sceneId);
				AddText(sceneId, x700101_g_OtherMonsterMessage);
			EndEvent();
		end
		
	elseif killtype == 3 then
	
		LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_ISCLOSING, 1);
		local tickcount = LuaFnGetCopySceneData_Param(sceneId, x700101_CSP_TICKCOUNT);
		
		for i = 0, humancount - 1 do
			humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);	--ȡ�õ�ǰ�������˵�objId
			
			local completeTime = tickcount * x700101_g_TickTime;
			SetMissionByIndex(sceneId, humanId, misIndex, x700101_MP_COMPLETETIME, completeTime);--������������
			SetMissionByIndex(sceneId, humanId, misIndex, x700101_MP_ISCOMPLETE, 1);

			str = format(x700101_g_CompleteOutMessage, x700101_g_CloseTick * x700101_g_TickTime);
			BeginEvent(sceneId);
				AddText(sceneId, str);
			EndEvent();
			DispatchMissionTips(sceneId, humanId);
		end
		
	end
	
	LuaFnSetCopySceneData_Param(sceneId, x700101_CSP_NKILLMONSTER, killmonster);
	
	for i = 0, humancount - 1 do
		local humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);--ȡ�õ�ǰ�������˵�objId
		DispatchMissionTips(sceneId, humanId);
		
		misIndex = GetMissionIndexByID(sceneId, humanId, x700101_g_MissionId); --ȡ��������������ֵ
		local killedcount = GetMissionParam(sceneId, humanId, misIndex, x700101_MP_KILLMONSTER) + 1; --ȡ���Ѿ�ɱ�˵Ĺ�����
		SetMissionByIndex(sceneId, humanId, misIndex, x700101_MP_KILLMONSTER, killedcount) --������������
	end
end

-------------------------
--***********************
--CauseBuff
--***********************
-------------------------

function x700101_CauseBuff(sceneId)

	local humancount = LuaFnGetCopyScene_HumanCount(sceneId);
	for	i = 0, humancount - 1 do
		local humanId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
		LuaFnSendSpecificImpactToUnit(sceneId, humanId, humanId, humanId, x700101_g_buffId, 0);
	end

end

-------------------------
--***********************
--OnHumanDie
--***********************
-------------------------

function x700101_OnHumanDie(sceneId, selfId, killerId)
end
