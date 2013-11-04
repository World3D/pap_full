--MisDescBegin

-------------------------
--***********************
--Const
--***********************
-------------------------

x300200_g_MissionId					= 401
x300200_g_ScriptId 					= 300200
x300200_g_MissionName				= "��������"
x300200_g_MissionKind				= 23
x300200_g_MissionLevel			= 1

x300200_g_LevelOver						= 20
x300200_g_BonusMoneyLevelRate	= 0.75
x300200_g_BonusMoneyBase			= 900
x300200_g_BonusLevelBase			= 5

x300200_g_MissionTarget				= "�Ͽ�ȥѰ�ҵ�%d������·��%s�ɡ����ͣ����ͣ�"
x300200_g_MissionInfo					=	"���������������ٻ��������򡢻����������£���������µ��ٶȾ������ճɼ���"
x300200_g_MissionCompleteInfo	=	"��ϲ����������������������Ǳ������µĽ������պð���"
x300200_g_MissionContinueInfo	= "�Ͽ�ȥѰ�ҵ�%d������·��%s�ɡ����ͣ����ͣ�"
x300200_g_MissionToLeaderInfo	= "ȥ��%s������"
x300200_g_MissionNextInfo			= "���Ѿ������%d���׶ε����£���һ��Ŀ����%s�����ͣ����ͣ�"
x300200_g_MissionToFirstInfo	= "�����������ĵ�1��Ŀ����%s���Ͽ�ȥѰ�ҵ�1������·���ɣ����ͣ����ͣ�"
x300200_g_MissionToLastInfo		= "��ϲ�㣬��ȥ��%s�������"

x300200_g_MissionNPCName		= {
																{scene = 11, name = "�շ�"},		--����
																{scene = 18, name = "�շ�"},		--����
																{scene = 21, name = "�շ�"},		--ѩ��
																{scene = 24, name = "�շ�"}			--��Į
															}
x300200_g_MissionAimNPCName	=	{
																{hash = 0, scene = 11, name = "�շ�", buffId = -1},
																{hash = 1, scene = 11, name = "ҩ���ϰ�", buffId = 7501},
																{hash = 2, scene = 11, name = "��������ʦ", buffId = 7502},
																{hash = 3, scene = 11, name = "�շ�", buffId = -1},
																{hash = -1, buffId = -1},
																{hash = 10, scene = 36, name = "����", buffId = -1},
																{hash = 11, scene = 36, name = "���ž���", buffId = 7501},
																{hash = 12, scene = 36, name = "�����", buffId = 7501},
																{hash = 13, scene = 36, name = "����Ͱ�", buffId = 7502},
																{hash = 14, scene = 36, name = "������", buffId = 7502},
																{hash = 15, scene = 36, name = "����", buffId = 7503},
																{hash = 16, scene = 36, name = "��־��", buffId = 7503},
																{hash = 17, scene = 36, name = "�Ŵ�ɽ", buffId = 7503},
																{hash = 18, scene = 36, name = "����", buffId = -1}
															}
															
x300200_g_MissionBonusInfo			= "���%d��%d��%dͭ�Ľ�����"

x300200_g_AbandonMinute		= 15
x300200_g_RoundLimit			= 2
x300200_g_ShaQiUntil			= 0

x300200_g_StartPosX				= 165
x300200_g_StartPosZ				= 153
															
x300200_g_ErrorMessage_Country	= "�㲻�Ǳ����ˣ�"
x300200_g_ErrorMessage_Level		= format("��ĵȼ�����%d�����޷��μ���������������%d���Ժ�������", x300200_g_LevelOver, x300200_g_LevelOver)
x300200_g_ErrorMessage_Abandon	= format("��ոշ��������񻹲���%d���ӣ��Ժ������ɣ�", x300200_g_AbandonMinute)
x300200_g_ErrorMessage_Round		= format("������Ѿ��μӹ�%d�α�������Ϣһ�°ɡ�������������������", x300200_g_RoundLimit)
x300200_g_ErrorMessage_ShaQi		= "���ɱ��̫�أ��޷��μ�������������"

-------------------------
--***********************
--Define
--***********************
-------------------------

x300200_OK_AIM					= 0
x300200_OK_MISSION			= 1
x300200_OK_OTHERNPC			= 2
x300200_ERROR_UNKNOWN		= -1

x300200_FAILED_COUNTRY	= 10
x300200_FAILED_LEVEL		= 11
x300200_FAILED_ABANDON	= 12
x300200_FAILED_ROUND		= 13
x300200_FAILED_SHAQI		= 14
x300200_FAILED_NOMISSION= 15

x300200_MP_AIMNPC				= 0

--MisDescEnd


-------------------------
--***********************
--IsMissionNPC
--***********************
-------------------------

function x300200_IsMissionNPC(sceneId, selfId, missionId, NPCId)

	for i, item in x300200_g_MissionNPCName do
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
--IsAimNPC
--***********************
-------------------------

function x300200_IsAimNPC(sceneId, selfId, missionId, NPCId)

	local misIndex = GetMissionIndexByID(sceneId, selfId, x300200_g_MissionId);
	local aimNPCHash = GetMissionParam(sceneId, selfId, misIndex, x300200_MP_AIMNPC);

	for i, item in x300200_g_MissionAimNPCName do
		if item.scene == sceneId then
			if item.hash == aimNPCHash then
				if GetName(sceneId, NPCId) == item.name then
					return 1;
				end
			end
		end
	end
	
	return 0;

end

-------------------------
--***********************
--GetAimNPCNum
--***********************
-------------------------

function x300200_GetAimNPCNum(sceneId, selfId, aimNPCHash)

	local num = 0;
	for i, item in x300200_g_MissionAimNPCName do
		if item.scene == sceneId then
			if item.hash == aimNPCHash then
				return num;
			end
			num = num + 1;
		end
	end
	
	return x300200_ERROR_UNKNOWN;

end

-------------------------
--***********************
--CheckRound
--***********************
-------------------------

function x300200_CheckRound(sceneId, selfId, NPCId)

	local daycount = GetMissionData(sceneId, selfId, MD_TIERENSANXIANG_DAYCOUNT);
	local nowtime = LuaFnGetCurrentTime();
	
	local today = floor(nowtime / 86400);
	local round = 0;
	
	if today == floor(daycount / 10000) then
		round = floor((daycount - today * 10000) / 100) + 1;
		if round >= x300200_g_RoundLimit then
			return -1;
		end
	end
	
	return round;

end

-------------------------
--***********************
--CheckCountry
--***********************
-------------------------

function x300200_CheckCountry(sceneId, selfId, NPCId)

	return 1;

end

-------------------------
--***********************
--CheckShaQi
--***********************
-------------------------

function x300200_CheckShaQi(sceneId, selfId, NPCId)

	return 1;

end

-------------------------
--***********************
--SafeDisplayCheck
--***********************
-------------------------

function x300200_SafeDisplayCheck(sceneId, selfId, NPCId)

	local bHaveMission = IsHaveMission(sceneId, selfId, x300200_g_MissionId);
	
	if bHaveMission > 0 then
		return 1;
	end
	
	if x300200_IsMissionNPC(sceneId, selfId, x300200_g_MissionId, NPCId) > 0 then
		return 1;
	end
	
	return 0;

end

-------------------------
--***********************
--SafeNPCCheck
--***********************
-------------------------

function x300200_SafeNPCCheck(sceneId, selfId, NPCId)
	
	local bHaveMission = IsHaveMission(sceneId, selfId, x300200_g_MissionId);
	
	if bHaveMission > 0 then

		if x300200_IsAimNPC(sceneId, selfId, x300200_g_MissionId, NPCId) > 0 then
			return x300200_OK_AIM;
		elseif x300200_IsMissionNPC(sceneId, selfId, x300200_g_MissionId, NPCId) > 0 then
			return x300200_OK_MISSION;
		else
			return x300200_OK_OTHERNPC;
		end
		
	else
	
		if x300200_CheckCountry(sceneId, selfId, NPCId) < 0 then
			return x300200_FAILED_COUNTRY;
		end
		
		if x300200_CheckShaQi(sceneId, selfId, NPCId) < 0 then
			return x300200_FAILED_SHAQI;
		end
		
		if GetLevel(sceneId, selfId) < x300200_g_LevelOver then
			return x300200_FAILED_LEVEL;
		end
		
		if x300200_CheckRound(sceneId, selfId, NPCId) < 0 then
			return x300200_FAILED_ROUND;
		end
	
		if x300200_CheckAbandon(sceneId, selfId, NPCId) <= 0 then
			return x300200_FAILED_ABANDON;
		end
	end

	if x300200_IsMissionNPC(sceneId, selfId, x300200_g_MissionId, NPCId) > 0 then
		return x300200_OK_MISSION;
	end
	
	if bHaveMission > 0 then
		return x300200_OK_OTHERNPC;
	else
		return x300200_FAILED_NOMISSION;
	end

end

-------------------------
--***********************
--OnEnumerate
--***********************
-------------------------

function x300200_OnEnumerate(sceneId, selfId, NPCId)

	if x300200_SafeDisplayCheck(sceneId, selfId, NPCId) > 0 then
		AddNumText(sceneId, x300200_g_ScriptId, x300200_g_MissionName);
	end

end

-------------------------
--***********************
--GetAimNPCHash
--***********************
-------------------------

function x300200_GetNextAimNPCHash(sceneId, selfId, NPCId)

	local misIndex = GetMissionIndexByID(sceneId, selfId, x300200_g_MissionId);
	local aimNPCHash = GetMissionParam(sceneId, selfId, misIndex, x300200_MP_AIMNPC);
	
	local flag = 0;
	for i, item in x300200_g_MissionAimNPCName do
		if flag > 0 then
			return item.hash;
		end
		if item.hash == aimNPCHash then
			flag = 1;
		end
	end
	
	return x300200_ERROR_UNKNOWN;

end

-------------------------
--***********************
--GetMissionNPCName
--***********************
-------------------------

function x300200_GetMissionNPCName(sceneId, selfId)

	for i, item in x300200_g_MissionNPCName do
		if item.scene == sceneId then
			return item.name;
		end
	end
	
	return nil;

end

-------------------------
--***********************
--GetAimNPCName
--***********************
-------------------------

function x300200_GetAimNPCName(sceneId, selfId, aimNPCHash)

	for i, item in x300200_g_MissionAimNPCName do
		if item.hash == aimNPCHash then
			return item.name;
		end
	end
	
	return nil;

end

-------------------------
--***********************
--GetAimNPCBuffId
--***********************
-------------------------

function x300200_GetAimNPCBuffId(sceneId, selfId, aimNPCHash)

	for i, item in x300200_g_MissionAimNPCName do
		if item.hash == aimNPCHash then
			return item.buffId;
		end
	end
	
	return nil;

end
-------------------------
--***********************
--CheckAbandon
--***********************
-------------------------

function x300200_CheckAbandon(sceneId, selfId, NPCId)

	local nowtime = LuaFnGetCurrentTime();
	local lastAbandon = GetMissionData(sceneId, selfId, MD_TIERENSANXIANG_LASTABANDON);
	
	if nowtime - lastAbandon < x300200_g_AbandonMinute * 60 then
		return 0;
	end
	
	return 1;

end

-------------------------
--***********************
--DisplayFindNext
--***********************
-------------------------

function x300200_DisplayFindNext(sceneId, selfId, NPCId, aimNPCHash)

	if aimNPCHash < 0 then
		return nil;
	end
	
	local flag = -1;
	local name;
	for i, item in x300200_g_MissionAimNPCName do
		if flag == 2 then
			flag = 1;
		end
		if i ~= 1 then
			if item.hash == aimNPCHash then
				name = item.name;
				if i == 2 then
					flag = 0;
					break;
				end
				if flag <= 0 then
					flag = 2;
				end
			end
			if flag < 0 then
				flag = 0;
			end
		end
	end
	
	if flag == -1 then
		return nil;
	end
	
	local str;
	
	if flag == 2 then
		str = format(x300200_g_MissionToLastInfo, name);
	elseif flag == 1 then
		str = format(x300200_g_MissionNextInfo, x300200_GetAimNPCNum(sceneId, selfId, aimNPCHash)-1, name);
	else
		str = format(x300200_g_MissionToFirstInfo, name);
	end
	
	return str;

end

-------------------------
--***********************
--OnAccept
--***********************
-------------------------

function x300200_OnAccept(sceneId, selfId, NPCId)

	AddMission(sceneId, selfId, x300200_g_MissionId, x300200_g_ScriptId, 1, 0, 0);
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300200_g_MissionId);
	local nowNPCName = GetName(sceneId, NPCId);
	for i, item in x300200_g_MissionAimNPCName do
		if item.name == nowNPCName then
			SetMissionByIndex(sceneId, selfId, misIndex, x300200_MP_AIMNPC, item.hash);
		end
	end
			
	local aimNPCHash = x300200_GetNextAimNPCHash(sceneId, selfId, NPCId);
	SetMissionByIndex(sceneId, selfId, misIndex, x300200_MP_AIMNPC, aimNPCHash);
	
	local daycount = GetMissionData(sceneId, selfId, MD_TIERENSANXIANG_DAYCOUNT);	--day*100+circle
	local nowtime = LuaFnGetCurrentTime();
	local today = floor(nowtime / 86400);
	if today == floor(daycount / 10000) then
		daycount = daycount + 101;
	else
		daycount = today * 10000 + 1;
	end
	SetMissionData(sceneId, selfId, MD_TIERENSANXIANG_DAYCOUNT, daycount);
	
	local str =x300200_g_MissionName.."\n"..x300200_DisplayFindNext(sceneId, selfId, NPCId, aimNPCHash);
	BeginEvent(sceneId);
		AddText(sceneId, str);
	EndEvent();
	DispatchEventList(sceneId, selfId, NPCId);
	
end

-------------------------
--***********************
--CheckSubmit
--***********************
-------------------------

function x300200_CheckSubmit(sceneId, selfId, NPCId)

	if x300200_IsAimNPC(sceneId, selfId, NPCId) > 0 then
		return 1;
	end
	
	return 0;

end

-------------------------
--***********************
--CauseBuff
--***********************
-------------------------

function x300200_CauseBuff(sceneId, selfId, buffId)

	for i, item in x300200_g_MissionAimNPCName do
		if item.buffId > 0 then
			x300200_CancelBuff(sceneId, selfId, item.buffId);
		end
	end
	
	if buffId <= 0 then
		return nil;
	end
	
	return LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, buffId, 0);

end

-------------------------
--***********************
--CancelBuff
--***********************
-------------------------

function x300200_CancelBuff(sceneId, selfId, buffId)

	return LuaFnCancelSpecificImpact(sceneId, selfId, buffId);

end

-------------------------
--***********************
--OnSubmit
--***********************
-------------------------

function x300200_OnSubmit(sceneId, selfId, NPCId)
	
	x300200_CancelBuff(sceneId, selfId);
	local money = x300200_GetMoney(sceneId, selfId, NPCId);
	AddMoney(sceneId, selfId, money);
	
	local moneyjin = floor(money / 10000);
	local moneyyin = floor(money / 100) - moneyjin * 100;
	local moneytong = money - moneyjin * 10000 - moneyyin * 100;
	
	BeginEvent(sceneId);
		AddText(sceneId, format(x300200_g_MissionBonusInfo, moneyjin, moneyyin, moneytong));
	EndEvent();
	
	DispatchMissionTips(sceneId, selfId);
	DelMission(sceneId, selfId, x300200_g_MissionId);
	
end

-------------------------
--***********************
--ChangeToNext
--***********************
-------------------------

function x300200_ChangeToNext(sceneId, selfId, NPCId, aimNPCHash)

	local flag = 0;
	for i, item in x300200_g_MissionAimNPCName do
		if flag == 1 then
			if item.hash ~= -1 then
				return item.hash;
			end
		end
		if item.hash == aimNPCHash then
			flag = 1;
		end
	end
	
	return x300200_ERROR_UNKNOWN;

end

-------------------------
--***********************
--OnDefaultEvent
--***********************
-------------------------

function x300200_OnDefaultEvent(sceneId, selfId, NPCId)

	local safeCheckRet = x300200_SafeNPCCheck(sceneId, selfId, NPCId);
	local bHaveMission = IsHaveMission(sceneId, selfId, x300200_g_MissionId);
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300200_g_MissionId);
	local aimNPCHash = GetMissionParam(sceneId, selfId, misIndex, x300200_MP_AIMNPC);
	local str = x300200_g_MissionName.."\n";

	if safeCheckRet == x300200_OK_OTHERNPC or
		(safeCheckRet == x300200_OK_MISSION and bHaveMission >= 0 and x300200_IsAimNPC(sceneId, selfId, x300200_MissionId, NPCId) <= 0) then
		if bHaveMission > 0 then
			if x300200_ChangeToNext(sceneId, selfId, NPCId, aimNPCHash) == x300200_ERROR_UNKNOWN then
				str = str..format(x300200_g_MissionToLastInfo, x300200_GetAimNPCName(sceneId, selfId, aimNPCHash));
			else
				str = str..format(x300200_g_MissionContinueInfo, x300200_GetAimNPCNum(sceneId, selfId, aimNPCHash), x300200_GetAimNPCName(sceneId, selfId, aimNPCHash));
			end
		else
			str = str..format(x300200_g_MissionToLeaderInfo, x300200_GetMissionNPCName(sceneId, selfId));
		end
	end
	if safeCheckRet == x300200_FAILED_ABANDON then
		str = str..x300200_g_ErrorMessage_Abandon;
	elseif safeCheckRet == x300200_FAILED_ROUND then
		str = str..x300200_g_ErrorMessage_Round;
	elseif safeCheckRet == x300200_FAILED_COUNTRY then
		str = str..x300200_g_ErrorMessage_Country;
	elseif safeCheckRet == x300200_FAILED_LEVEL then
		str = str..x300200_g_ErrorMessage_Level;
	elseif safeCheckRet == x300200_FAILED_NPC then
		str = str..x300200_g_ErrorMessage_NPC;
	end
	
	BeginEvent(sceneId);
		AddText(sceneId, str);
	EndEvent();
	
	if safeCheckRet == x300200_OK_MISSION and bHaveMission <= 0 then
	
		str = str..x300200_g_MissionInfo;
		BeginEvent(sceneId);
			AddText(sceneId, str);
		EndEvent();
		DispatchMissionInfo(sceneId, selfId, NPCId, x300200_g_ScriptId, x300200_g_MissionId);

	elseif safeCheckRet == x300200_OK_AIM then

		x300200_CauseBuff(sceneId, selfId, x300200_GetAimNPCBuffId(sceneId, selfId, aimNPCHash));
		
		if x300200_IsMissionNPC(sceneId, selfId, x300200_g_MissionId, NPCId) > 0 then
		
			str = str..x300200_g_MissionCompleteInfo;
			BeginEvent(sceneId);
				AddText(sceneId, str);
			EndEvent();
			DispatchMissionContinueInfo(sceneId, selfId, NPCId, x300200_g_ScriptId, x300200_g_MissionId);
		else
			aimNPCHash = x300200_ChangeToNext(sceneId, selfId, NPCId, aimNPCHash);
			SetMissionByIndex(sceneId, selfId, misIndex, x300200_MP_AIMNPC, aimNPCHash);
			str = str..x300200_DisplayFindNext(sceneId, selfId, NPCId, aimNPCHash);
			BeginEvent(sceneId);
				AddText(sceneId, str);
			EndEvent();
			DispatchEventList(sceneId, selfId, NPCId);
		end
	else
		DispatchEventList(sceneId, selfId, NPCId);
	end

end

-------------------------
--***********************
--CheckAccept
--***********************
-------------------------

function x300200_CheckAccept(sceneId, selfId, NPCId)

	local safeCheckRet = x300200_SafeNPCCheck(sceneId, selfId, NPCId);
	if safeCheckRet == x300200_OK_MISSION then
		return 1;
	end
	
	return 0;

end

-------------------------
--***********************
--MoveTo
--***********************
-------------------------

function x300200_MoveTo(sceneId, selfId, posX, posZ)

	SetPos(sceneId, selfId, posX, posZ);

end

-------------------------
--***********************
--OnAbandon
--***********************
-------------------------

function x300200_OnAbandon(sceneId, selfId)

	DelMission(sceneId, selfId, x300200_g_MissionId);
	
	local lastAbandon = LuaFnGetCurrentTime();
	SetMissionData(sceneId, selfId, MD_TIERENSANXIANG_LASTABANDON, lastAbandon);
	
	local daycount = GetMissionData(sceneId, selfId, MD_TIERENSANXIANG_DAYCOUNT);	--day*10000+round*100+circle
	local round = x300200_CheckRound(sceneId, selfId, nil);
	if round <= 1 then
		round = 0;
	end
	daycount = floor(daycount / 10000) * 10000 + (round - 1) * 100;
	SetMissionData(sceneId, selfId, MD_TIERENSANXIANG_DAYCOUNT, daycount);
	
	x300200_CauseBuff(sceneId, selfId, -1);
	x300200_MoveTo(sceneId, selfId, x300200_g_StartPosX, x300200_g_StartPosZ);

end


-------------------------
--***********************
--GetMoney
--***********************
-------------------------

function x300200_GetMoney(sceneId, selfId, NPCId)
	local ret = x300200_g_BonusMoneyBase +
		(GetLevel(sceneId, selfId) + x300200_g_BonusLevelBase) * x300200_g_BonusMoneyLevelRate * x300200_CheckRound(sceneId, selfId, NPCId);
	return ret;
end