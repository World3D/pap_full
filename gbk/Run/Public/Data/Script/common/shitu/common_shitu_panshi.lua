-------------------------
--***********************
--Const
--***********************
-------------------------

x800012_g_ScriptId 					= 800012
x800012_g_MissionName				= "��ʦ"
x800012_g_CostMoneyPanShi		= 20000
x800012_g_PenaltyDay				= 3

-------------------------
--***********************
--Define
--***********************
-------------------------

x800012_CHAT_TYPE_NORMAL			= 0
x800012_CHAT_TYPE_SYSTEM			= 4

x800012_OK							= 0
x800012_ERROR_UNKNOWN		= -1
x800012_FAILED_MASTER		= 1
x800012_FAILED_MONEY		= 2

-------------------------
--***********************
--IsCanPanShi
--***********************
-------------------------

function x800012_IsCanPanShi(sceneId, selfId)

	if LuaFnHaveMaster(sceneId, selfId) ~= 1 then
		return x800012_FAILED_MASTER;
	end
	
	if GetMoney(sceneId, selfId) < x800012_g_CostMoneyPanShi then
		return x800012_FAILED_MONEY;
	end
			
	return x800012_OK;

end

-------------------------
--***********************
--DoPanShi
--***********************
-------------------------

function x800012_DoPanShi(sceneId, selfId, NPCId)

	local ret = x800012_SafePanShiCheck(sceneId, selfId, NPCId, 1);

	if ret ~= x800012_OK then
		return ret;
	end
	
	--�۳����Ͻ�Ǯ
	if LuaFnCostMoney(sceneId, selfId, x800012_g_CostMoneyPanShi) == -1 then
		return x800012_FAILED_MONEY;
	end
	
	--��ʦ�����ʼ�
	local mail = format("%s�Ѿ���������ʦͽ��ϵ��", GetName(sceneId, selfId));
	
	--�õ�ʦ��GUID
	local targetGUID = LuaFnGetMasterGUID(sceneId, selfId);
	LuaFnSendNormalMail(sceneId, selfId, LuaFnGetFriendName(sceneId, selfId, targetGUID), mail);
	
	--��ʦ
	LuaFnBetrayMaster(sceneId, selfId);
	
	--��ͽ�ܵ���ʾ��Ϣ
	Msg = format("�����˺�%s��ʦͽ��ϵ��%d��֮��ſ����ٴΰ�ʦ��", LuaFnGetFriendName(sceneId, selfId, targetGUID), x800012_g_PenaltyDay);
	LuaFnMsg2Player(sceneId, selfId, Msg, x800012_CHAT_TYPE_NORMAL);
	
end

-------------------------
--***********************
--SafePanShiCheck
--***********************
-------------------------

function x800012_SafePanShiCheck(sceneId, selfId, NPCId, bDirect)

	local ret 	= x800012_IsCanPanShi(sceneId, selfId);
	local str 	= "�Ѿ���ʦ��";
	
	if ret == x800012_OK then
		str = "ȷ��Ҫ����ʦ�ţ�";
	
	elseif ret == x800012_FAILED_MASTER then
		str = "�㻹û�а�ʦ��";
	
	elseif ret == x800012_FAILED_MONEY then
		str = format("���ʦͽ��ϵ��Ҫ����%dǮ��", x800012_g_CostMoneyPanShi);
	
	end
	
	if ret == x800012_OK and bDirect == 1 then
		return ret;
	end
	
	BeginEvent(sceneId);
	
		AddText(sceneId, str);
	
	EndEvent();

	if ret == x800012_OK then
		DispatchMissionInfo(sceneId, selfId, NPCId, x800012_g_ScriptId);
	else
		DispatchEventList(sceneId, selfId, NPCId);
	end
	
	return ret;
	
end

-------------------------
--***********************
--OnEnumerate
--***********************
-------------------------

function x800012_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x800012_g_ScriptId, x800012_g_MissionName);
end

-------------------------
--***********************
--OnDefaultEvent
--***********************
-------------------------

function x800012_OnDefaultEvent(sceneId, selfId, targetId)

	x800012_SafePanShiCheck(sceneId, selfId, targetId, 0);
	
end

-------------------------
--***********************
--CheckAccept
--***********************
-------------------------

function x800012_CheckAccept(sceneId, selfId, targetId)

	return 1;

end

-------------------------
--***********************
--OnAccept
--***********************
-------------------------

function x800012_OnAccept(sceneId, selfId, targetId)

	local ret = x800012_DoPanShi(sceneId, selfId, targetId);
	
	if ret == x800012_OK then
		return
	end

end