-------------------------
--***********************
--Const
--***********************
-------------------------

x800011_g_ScriptId 							= 800011
x800011_g_MissionName						= "���ʦ��"
x800011_g_CostMoneyZhuChuShiMen	= 50000
x800011_g_PenaltyDay						= 3

-------------------------
--***********************
--Define
--***********************
-------------------------

x800011_CHAT_TYPE_NORMAL			= 0
x800011_CHAT_TYPE_SYSTEM			= 4

x800011_OK							= 0
x800011_ERROR_UNKNOWN		= -1
x800011_FAILED_PRENTICE	= 1
x800011_FAILED_MONEY		= 2

-------------------------
--***********************
--IsCanZhuChuShiMen
--***********************
-------------------------

function x800011_IsCanZhuChuShiMen(sceneId, selfId)

	if LuaFnGetPrenticeCount(sceneId, selfId) < 1 then
		return x800011_FAILED_PRENTICE;
	end
	
	if GetMoney(sceneId, selfId) < x800011_g_CostMoneyZhuChuShiMen then
		return x800011_FAILED_MONEY;
	end
	
	return x800011_OK;
end

-------------------------
--***********************
--DoZhuChuShiMen
--***********************
-------------------------

function x800011_DoZhuChuShiMen(sceneId, selfId, NPCId)

	local ret = x800011_SafeZhuChuShiMenCheck(sceneId, selfId, NPCId, 1);

	if ret ~= x800011_OK then
		return ret;
	end
	
	--ѡ��ͽ������,����ѡ��õ�ͽ��index����UIδ��
	
	--�õ�ͽ��GUID
	local targetGUID = LuaFnGetPrenticeGUID(sceneId, selfId, 0);
	
	--����ͽ��
	LuaFnExpelPrentice(sceneId, selfId, targetGUID);
	
	--�۳�ʦ�����Ͻ�Ǯ
	if LuaFnCostMoney(sceneId, selfId, x800011_g_CostMoneyZhuChuShiMen) == -1 then
		return x800011_FAILED_MONEY;
	end
	
	--��ͽ�ܷ��ʼ�
	local mail = format("%s�ѽ���������ʦͽ��ϵ��", GetName(sceneId, selfId));
	LuaFnSendNormalMail(sceneId, selfId, LuaFnGetFriendName(sceneId, selfId, targetGUID), mail);
	
	--��ʦ������ʾ
	local Msg = format("�����˺�%s��ʦͽ��ϵ��%d��֮��ſ����ٴ���ͽ��", LuaFnGetFriendName(sceneId,selfId,targetGUID), x800011_g_PenaltyDay);
	LuaFnMsg2Player(sceneId, selfId, Msg, x800011_CHAT_TYPE_NORMAL);
	
end

-------------------------
--***********************
--SafeZhuChuShiMenCheck
--***********************
-------------------------

function x800011_SafeZhuChuShiMenCheck(sceneId, selfId, NPCId, bDirect)

	local ret 	= x800011_IsCanZhuChuShiMen(sceneId, selfId);
	local str 	= "�Ѿ��������ʦ�š�";
	
	if ret == x800011_OK then
		str = "ȷ��Ҫ�������ʦ�ţ�";
	
	elseif ret == x800011_FAILED_PRENTICE then
		str = "��û��ͽ�ܰ���";
	
	elseif ret == x800011_FAILED_MONEY then
		str = format("���ͽ����Ҫ����%dǮ��", x800011_g_CostMoneyZhuChuShiMen);
	
	end
	
	if ret == x800011_OK and bDirect == 1 then
		return ret;
	end
	
	BeginEvent(sceneId);
	
		AddText(sceneId, str);
	
	EndEvent();

	if ret == x800011_OK then
		DispatchMissionInfo(sceneId, selfId, NPCId, x800011_g_ScriptId);
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

function x800011_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x800011_g_ScriptId, x800011_g_MissionName);
end

-------------------------
--***********************
--OnDefaultEvent
--***********************
-------------------------

function x800011_OnDefaultEvent(sceneId, selfId, targetId)

	x800011_SafeZhuChuShiMenCheck(sceneId, selfId, targetId, 0);
	
end

-------------------------
--***********************
--CheckAccept
--***********************
-------------------------

function x800011_CheckAccept(sceneId, selfId, targetId)

	return 1;

end

-------------------------
--***********************
--OnAccept
--***********************
-------------------------

function x800011_OnAccept(sceneId, selfId, targetId)

	local ret = x800011_DoZhuChuShiMen(sceneId, selfId, targetId);
	
	if ret == x800011_OK then
		return
	end

end