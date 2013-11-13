
-------------------------
--***********************
--Const
--***********************
-------------------------

x800008_g_ScriptId 					= 800008
x800008_g_MissionName				= "ǿ�����"
x800008_g_CostMoneyDivorce  = 200000
x800008_g_FriendPointNotify	= 100
x800008_g_SkillID						= 149

-------------------------
--***********************
--Define
--***********************
-------------------------

x800008_OK							= 0
x800008_ERROR_UNKNOWN		= -1
x800008_FAILED_MONEY		= 1
x800008_FAILED_MARRIGE	= 2

-------------------------
--***********************
--IsCanDivorce
--***********************
-------------------------

function x800008_IsCanDivorce(sceneId, selfId) 

	if GetMoney(sceneId, selfId) < x800008_g_CostMoneyDivorce then
		return x800008_FAILED_MONEY;
	end	
	
	--�Ƿ��ǽ��״̬
	if LuaFnIsMarried(sceneId, selfId) ~= 1 then
		return x800008_FAILED_MARRIGE;
	end
	
	return x800008_OK;
	
end

-------------------------
--***********************
--DoDivorce
--***********************
-------------------------

function x800008_DoDivorce(sceneId, selfId, NPCId)

	--�۳����Ͻ�Ǯ200000
	local ret = x800008_SafeDivorceCheck(sceneId, selfId, NPCId, 1);
	if ret ~= x800008_OK then
		return ret;
	end
	
	if LuaFnCostMoney(sceneId, selfId,x205009_g_CostMoneyDivorce) == -1 then
		return x800008_FAILED_MONEY;
	end
	
	--�õ���żGUID
	local targetGUId = LuaFnGetSpouseGUID(sceneId, selfId);

	--�Ѻ��Ѷ����ó�X��XΪ�ܹ������Է����ߵ����ֵ�����һ�����������Ƿ����öԷ�
	LuaFnSetDeadLinkFriendPoint(sceneId, selfId, targetGUId, x800008_g_FriendPointNotify, 1);
	
	--ɾ�����޼��ܣ����ɾ���Է����ܣ�
	DelSkill(sceneId, selfId, x800008_g_SkillID);
	
	--ɾ���ƺţ����ɾ���Է��ƺţ�
	LuaFnAwardSpouseTitle(sceneId, selfId, "");

	--����mail���Է�
	local mail = format("%s���㵥��������ˡ�",GetName(sceneId, selfId));
	LuaFnSendNormalMail(sceneId, selfId, LuaFnGetFriendName(sceneId, selfId, targetGUId), mail);
	
	--���һ��,���.��ν���Է��Ļ�����ϵ��
	LuaFnDivorce(sceneId, selfId);
	
	return x800008_OK;
	
end

-------------------------
--***********************
--SafeDivorceCheck
--***********************
-------------------------

function x800008_SafeDivorceCheck(sceneId, selfId, targetId, bDirect)

	local ret 	= x800008_IsCanDivorce(sceneId, selfId);
	local str 	= "�Ѿ�ǿ����顣";
	
	if ret == x800008_OK then
		str = format("ȷ��Ҫǿ����飿\n��Ҫ֧��%d��Ǯ��", x800008_g_CostMoneyDivorce);
	
	elseif ret == x800008_FAILED_MARRIGE then
		str = "��û�н�飬�������ô��";
	
	elseif ret == x800008_FAILED_MONEY then
		str = format("��ҪЯ��%d��Ǯ������顣", x800008_g_CostMoneyDivorce);
	end
	
	if ret == x800008_OK and bDirect == 1 then
		return ret;
	end
	
	BeginEvent(sceneId);
	
		AddText(sceneId, str);
	
	EndEvent();

	if ret == x800008_OK then
		DispatchMissionInfo(sceneId, selfId, targetId, x800008_g_ScriptId);
	else
		DispatchEventList(sceneId, selfId, targetId);
	end
	
	return ret;
	
end

-------------------------
--***********************
--OnEnumerate
--***********************
-------------------------

function x800008_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x800008_g_ScriptId, x800008_g_MissionName);
end

-------------------------
--***********************
--OnDefaultEvent
--***********************
-------------------------

function x800008_OnDefaultEvent(sceneId, selfId, targetId)

	x800008_SafeDivorceCheck(sceneId, selfId, targetId, 0);
	
end

-------------------------
--***********************
--CheckAccept
--***********************
-------------------------

function x800008_CheckAccept(sceneId, selfId, targetId)

	return 1;

end

-------------------------
--***********************
--OnAccept
--***********************
-------------------------

function x800008_OnAccept(sceneId, selfId, targetId)

	local ret = x800008_DoDivorce(sceneId, selfId, targetId);
	
	if ret == x800008_OK then
		return
	end
	
	local str = "ERROR��";
	
	if ret == x800008_FAILED_MONEY then
		str = "�۳���Ǯ����";
	end
	
	BeginEvent(sceneId);
	
		AddText(sceneId, str);
	
	EndEvent();

	DispatchEventList(sceneId, selfId, targetId);

end