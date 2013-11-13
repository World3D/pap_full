-------------------------
--***********************
--����NPCv2.2
--v1.00
--ZesT
--***********************
-------------------------

--MisDescBegin
-------------------------
--Const
-------------------------
x300301_g_MissionId					= 403
x300301_g_ScriptId 					= 300301
x300301_g_MissionName				= "����NPC"
x300301_g_MissionKind				= 23    --??
--x300301_g_Country						= 0			--??���� 0=��1=������
--x300301_g_Round							= 10
x300301_g_LevelRate1					= 5
x300301_g_LevelRate2					= 2	--�����õ��ľ����
x300301_g_LevelRate3					= 200
x300301_g_MissionLowerlimit	=	1			--�ȼ����ޣ������õȼ���
x300301_g_MissionUpperlimit	=	100		--�ȼ����ޣ������õȼ���

x300301_g_TestMassage				= "#Y!!�����б������"

x300301_g_ErrorMessage_Country	= "�㲻�Ǳ����ˣ�"
x300301_g_ErrorMessage_NPC			="��ȥ�� %s �ɣ���������������Ϣ!"
x300301_g_ErrorMessage_Round		="�������Ѿ���ɸ�����\n��������~"
x300301_g_StringStart				="����ʼ��������\n��ȥ�� ���ε��ϰ� �ɣ��������������!!!"
x300301_g_MissionStrings		=	{
															{hash=2, MisStr="������1��������һ�Σ����������Թ�����������\n"},
--															{hash=3, MisStr="����2��������\n"},
--															{hash=4, MisStr="����3��������\n"}
															}
x300301_g_StringEnd					="������ɵ�������"
x300301_g_StringContinue		="���˽������Ϣ��ȥ�� %s ��"
x300301_g_EachMissionNPCNumber = 2 --��������Ի���NPC������������ʼ��NPC
x300301_g_MissionNPCName		=	{
															{hash=1, scene = 11, usage = "MissionStartNPC",name = "�������ϰ�", scenename = "���º���"},
															{hash=2, scene = 11, usage = "MissionNPC",name = "���ε��ϰ�", scenename = "���º���"},
															{hash=3, scene = 11, usage = "MissionEndNPC",name = "���Ĵ���ʹ��", scenename = "���º���"}
															}
-------------------------
--Define
-------------------------
x300301_MISSION_FAILEDCOUNTRY			=	1
x300301_MISSION_FAILEDROUND				=	2
--���ʧ������
x300301_MISSION_ACCEPTREADY				=	8

x300301_NPC_START						= 20
x300301_NPC_AIM							= 21
x300301_NPC_FAILED					= 22

x300301_ERROR_UNKNOWN				= -1


x300301_MP_AIMNPC						= 0
--MisDescEnd

-------------------------
--SafeCheck
--�����������NPC���жϣ�����Define����Ӧ��ֵ
-------------------------
function x300301_SafeCheck(sceneId, selfId, NPCId)
	local bHaveMission = IsHaveMission(sceneId, selfId, x300301_g_MissionId);
	if bHaveMission <= 0 then
		--������
		if x300301_CheckCountry(sceneId,selfId,x300301_g_MissionId,NPCId) == 0 then
			return x300301_MISSION_FAILEDCOUNTRY;
		end
		--������
		if x300301_CheckRound(sceneId, selfId, x300301_g_MissionId, NPCId) < 0 then
			return x300301_MISSION_FAILEDROUND;
		end
		--����ɽ�
		return x300301_MISSION_ACCEPTREADY;
	end
	--�����ѽ�
	if x300301_IsStartNPC(sceneId, selfId, x300301_g_MissionId, NPCId) > 0 then
		return x300301_NPC_START;
	end
	
	if x300301_IsAimNPC(sceneId, selfId, x300301_g_MissionId, NPCId) > 0 then
		return x300301_NPC_AIM;
	end
	
	if x300301_IsMissionNPC(sceneId, selfId, x300301_g_MissionId, NPCId) > 0 then	
		return x300301_NPC_FAILED;
	end
	
	return x300301_ERROR_UNKNOWN;
end

-------------------------
--OnEnumerate
-------------------------
function x300301_OnEnumerate(sceneId, selfId, NPCId)

	local CheckRet = x300301_SafeCheck(sceneId, selfId, NPCId);
	if CheckRet >= 0 and CheckRet <= 10 then
		if x300301_IsStartNPC(sceneId,selfId,x300301_g_MissionId,NPCId) == 1 then
			AddNumText(sceneId, x300301_g_ScriptId, x300301_g_MissionName);
		end
	elseif CheckRet >= 20 then
		AddNumText(sceneId, x300301_g_ScriptId, x300301_g_MissionName);
	elseif CheckRet< 0 then
		return
	end
end

-------------------------
--OnDefaultEvent
-------------------------
function x300301_OnDefaultEvent(sceneId, selfId, NPCId)

	local CheckRet = x300301_SafeCheck(sceneId, selfId, NPCId);
	local daycount = GetMissionData(sceneId, selfId, MD_KANWANGNPC_DAYCOUNT);
	local nowtime = LuaFnGetCurrentTime();	
	local today = floor(nowtime / 86400);
	local bHaveMission = IsHaveMission(sceneId, selfId, x300301_g_MissionId);
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300301_g_MissionId);
	local aimNPCHash = GetMissionParam(sceneId, selfId, misIndex, x300301_MP_AIMNPC);
	local str = "#Y"..x300301_g_MissionName.."\n";
	
	if (CheckRet == x300301_MISSION_FAILEDCOUNTRY) then
		BeginEvent(sceneId);
			AddText(sceneId, x300301_g_ErrorMessage_Country);
		EndEvent();
		DispatchEventList(sceneId,selfId,NPCId,x300301_g_ScriptId,x300301_g_MissionId)
	elseif (CheckRet == x300301_MISSION_FAILEDROUND) then
		BeginEvent(sceneId);
			AddText(sceneId, x800200_g_ErrorMessage_Round);
		EndEvent();
		DispatchEventList(sceneId,selfId,NPCId,x300301_g_ScriptId,x300301_g_MissionId)
	elseif (CheckRet == x300301_MISSION_ACCEPTREADY) then
	--!!
	--!!
		if(daycount ~= today)then
			BeginEvent(sceneId);
				AddText(sceneId, x300301_g_StringStart);
			EndEvent();
			DispatchMissionInfo(sceneId,selfId,NPCId,x300301_g_ScriptId,x300301_g_MissionId)
		else
			BeginEvent(sceneId);
				AddText(sceneId, x300301_g_ErrorMessage_Round);
			EndEvent();
			DispatchEventList(sceneId,selfId,NPCId,x300301_g_ScriptId,x300301_g_MissionId)
		end
	elseif (CheckRet == x300301_NPC_START) or (CheckRet == x300301_NPC_FAILED) then
		BeginEvent(sceneId);
			local ShowErrorMessage = str..format(x300301_g_ErrorMessage_NPC,x300301_GetNameByHash(sceneId,selfId,aimNPCHash))
			AddText(sceneId, ShowErrorMessage);
		EndEvent();
		DispatchEventList(sceneId,selfId,NPCId,x300301_g_ScriptId,x300301_g_MissionId)
	elseif (CheckRet == x300301_NPC_AIM) then
		if x300301_IsEndNPC(sceneId,selfId,x300301_g_MissionId,NPCId) == 1 then
			BeginEvent(sceneId);
				AddText(sceneId,x300301_g_StringEnd);
			EndEvent();
			DispatchMissionContinueInfo(sceneId,selfId,NPCId,x300301_g_ScriptId,x300301_g_MissionId)
		else
			BeginEvent(sceneId);
				local ShowContinueMessage = x300301_GetContinueMessage(sceneId, selfId, NPCId)--ȷ����ͬ�ļ�����Ϣ
				AddText(sceneId, ShowContinueMessage);
			EndEvent();
			DispatchEventList(sceneId,selfId,NPCId,x300301_g_ScriptId,x300301_g_MissionId)
			SetMissionByIndex(sceneId, selfId, misIndex, x300301_MP_AIMNPC,aimNPCHash+1);
			BeginEvent(sceneId)
			  local strText = "#Y�������  "..x300301_g_MissionName.."������!!"
			  AddText(sceneId,strText);
			EndEvent()
			DispatchMissionTips(sceneId,selfId)
		end
	elseif (CheckRet == x300301_ERROR_UNKNOWN) then
		return
	end	
end


-------------------------
--OnAccept
-------------------------
function x300301_OnAccept(sceneId,selfId,NPCId)

	Msg2Player(  sceneId, selfId, x800200_g_TestMassage, MSG2PLAYER_PARA )

	local DoKill,DoArea,DoItem=0,0,0;
	
	AddMission( sceneId,selfId, x300301_g_MissionId, x300301_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	SetMissionData(sceneId,selfId,MD_KANWANGNPC_DAYCOUNT,floor(LuaFnGetCurrentTime()/86400))
--**Ȧ���ļ�¼
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300301_g_MissionId);
	SetMissionByIndex(sceneId, selfId, misIndex, x300301_MP_AIMNPC,2);--û����NPCId������ x300301_GetHashByName(sceneId, selfId, NPCId)+1);
	
	BeginEvent(sceneId)
	 	strText = "�����������  "..x300301_g_MissionName
	 	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end


-------------------------
--CheckAccept
-------------------------
function x300301_CheckAccept( sceneId, selfId ,NPCId )

	if x300301_IsMissionNPC(sceneId,selfId,x300301_g_MissionId,NPCId) == 1 then
		return 1
	end
	return 0
end


-------------------------
--OnAbandon
-------------------------
function x300301_OnAbandon( sceneId, selfId )

	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x300301_g_MissionId )
  BeginEvent(sceneId)
	  local strText = "�����������  "..x300301_g_MissionName
	  AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end


-------------------------
--OnSubmit
-------------------------
function x300301_OnSubmit( sceneId, selfId, NPCId,selectRadioId )

	local ExpBonus = x300301_GetExpBonus(sceneId,selfId,NPCId)
	AddExp(sceneId,selfId,ExpBonus)
	Msg2Player(sceneId,selfId,"������"..ExpBonus.."�ľ���",MSG2PLAYER_PARA)
	DelMission( sceneId, selfId, x300301_g_MissionId )
	--**����
  BeginEvent(sceneId)
	  local strText = "#Y�����������  "..x300301_g_MissionName
	  AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
-------------------------
--CheckSubmit
-------------------------
function x300301_CheckSubmit(sceneId,selfId, NPCId)

	if(x300301_IsMissionNPC(sceneId, selfId, NPCId) > 0)then
		return 1;
	end
	return 0;
end


-------------------------
--**CheckCountry
--��NPC��ͬ����1����ͬ����0��
-------------------------
function x300301_CheckCountry(sceneId, selfId, x300301_g_MissionId, NPCId)
	return 1;
end
-------------------------
--**CheckRound
--��������ɵ�Ȧ�������ڵ������Ȧ������-1���������Ȧ�����أ�0-N��
-------------------------
function x300301_CheckRound(sceneId, selfId, x300301_g_MissionId, NPCId)
	return 0;
end
-------------------------
--IsStartNPC
--�Ƿ�ʼNPC
-------------------------
function x300301_IsStartNPC(sceneId, selfId, x300301_g_MissionId, NPCId)
	local NPCName = GetName(sceneId,NPCId)
	for i,item in pairs(x300301_g_MissionNPCName) do
		if ((item.scene == sceneId) and (item.name == NPCName)) then
			if (x300301_residue(item.hash,x300301_g_EachMissionNPCNumber+1) == 1) then
				return 1;
			end
		end
	end
	return 0;
end
-------------------------
--IsEndNPC
--�Ƿ����NPC
-------------------------
function x300301_IsEndNPC(sceneId, selfId, x300301_g_MissionId, NPCId)
	for i,item in pairs(x300301_g_MissionNPCName) do
		if ((item.scene == sceneId) and (item.name == GetName(sceneId,NPCId))) then
			if (x300301_residue(item.hash, x300301_g_EachMissionNPCNumber+1) == 0) then
				return 1;
			end
		end
	end
	return 0;
end
-------------------------
--IsAimNPC
--�ж��Ƿ�ǰĿ��NPC
-------------------------
function x300301_IsAimNPC(sceneId, selfId, x300301_g_MissionId, NPCId)
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300301_g_MissionId);
	local aimNPCHash = GetMissionParam(sceneId, selfId, misIndex, x300301_MP_AIMNPC);
	for i,item in pairs(x300301_g_MissionNPCName) do
		if ((item.scene == sceneId) and (item.hash == aimNPCHash)) then
			if (GetName(sceneId,NPCId) == item.name) then
				return 1;
			end
		end
	end
	return 0;
end

-------------------------
--IsMissionNPC
--�����г��ֵ�����NPC
-------------------------
function x300301_IsMissionNPC(sceneId, selfId, x300301_g_MissionId, NPCId)
	local NPCName = GetName(sceneId,NPCId)
	for i,item in pairs(x300301_g_MissionNPCName) do
		if ((item.scene == sceneId) and (item.name == NPCName)) then
			return item.hash;
		end
	end
	return 0;
end


---------------------------
--GetContinueMessage
---------------------------
function x300301_GetContinueMessage(sceneId, selfId, NPCId)
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300301_g_MissionId);
	local aimNPCHash = GetMissionParam(sceneId, selfId, misIndex, x300301_MP_AIMNPC);
	local TextString = "������������";
	for i,item in pairs(x300301_g_MissionStrings) do
		if(item.hash == aimNPCHash) then
			TextString = item.MisStr ..format(x300301_g_StringContinue,x300301_GetNameByHash(sceneId,selfId,aimNPCHash+1));
			return TextString;
		end
	end
	return TextString;
end

---------------------------
--GetMaxHash
---------------------------
function x300301_GetMaxHash(sceneId, selfId)
	local n=0
	for i,item in pairs(x300301_g_MissionNPCName) do
		n=n+1;
	end
	return n;
end
---------------------------
--GetHashByNPCId
---------------------------
function x300301_GetHashByName(sceneId, selfId, NPCId)
	local n = 0;
	local NPCName = GetName(sceneId,selfId,NPCId);
	for i,item in pairs(x300301_g_MissionNPCName) do
		if (item.sceneId == sceneId) and (item.name == NPCName) then
			n=i;
		end	
	end
	return n;
end
---------------------------
--GetExpBonus
--EXP������ʽ
---------------------------
function x300301_GetExpBonus(sceneId,selfId,NPCName)
	local ExpBonus = (GetLevel(sceneId,selfId) + x300301_g_LevelRate1) * x300301_g_LevelRate2 * x300301_g_LevelRate3
	return ExpBonus;
end
-----------------------------
--GetNameByHash
-----------------------------
function x300301_GetNameByHash(sceneId,selfId,NPCHash)
	for i ,item in pairs(x300301_g_MissionNPCName) do
		if (item.hash == NPCHash) then
			return item.name;
		end
	end
	return "ERROR"
end
----------------------------
--x300301_residue
----------------------------
function x300301_residue(a,b)
	return a-b*floor(a/b)
end