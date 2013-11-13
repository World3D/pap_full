
-------------------------
--***********************
--Const
--***********************
-------------------------

x800009_g_ScriptId 					= 800009
x800009_g_MissionName				= "��ͽ"
x800009_g_MasterLevelMin		= 50
x800009_g_PrenticeLevelMin	= 15
x800009_g_PrenticeLevelMax	= 25
x800009_g_PenaltyDay				= 3
x800009_g_MaxPrenticeNum		= 2

-------------------------
--***********************
--Define
--***********************
-------------------------

x800009_CHAT_TYPE_NORMAL			= 0
x800009_CHAT_TYPE_SYSTEM			= 4

x800009_OK											= 0
x800009_ERROR_UNKNOWN						= -1
x800009_FAILED_CAPTAIN					= 1
x800009_FAILED_TEAM							= 2
x800009_FAILED_LEVEL_MASTER			= 3
x800009_FAILED_LEVEL_PRENTICE		= 4
x800009_FAILED_BROTHER					= 5
x800009_FAILED_MARRIGE					= 6
x800009_FAILED_PENALTY_PRENTICE	= 7
x800009_FAILED_PENALTY_MASTER		= 8
x800009_FAILED_NUM_PRENTICE			= 9
x800009_FAILED_HAVEMASTER				= 10
x800009_FAILED_FRIEND						= 11

-------------------------
--***********************
--IsCanBaiShi
--***********************
-------------------------

function x800009_IsCanBaiShi(sceneId, selfId)
	
	if (IsCaptain(sceneId, selfId)) ~= 1 then
		return x800009_FAILED_CAPTAIN;
	end
	
	if (GetTeamSize(sceneId, selfId) ~= 2) then
		return x800009_FAILED_TEAM;
	end

	if GetLevel(sceneId, selfId) < x800009_g_MasterLevelMin then
		return x800009_FAILED_LEVEL_MASTER;
	end
	
	--�õ�ͽ�ܵ�objID
	local targetId = LuaFnGetTeamSceneMember(sceneId, selfId, 0);
	
	if GetLevel(sceneId, targetId) < x800009_g_PrenticeLevelMin or GetLevel(sceneId, targetId) > x800009_g_PrenticeLevelMax then
		return x800009_FAILED_LEVEL_PRENTICE;
	end
	
	if LuaFnIsBrother(sceneId, selfId, targetId) == 1 then
		return x800009_FAILED_BROTHER;
	end

	if LuaFnIsSpouses(sceneId, selfId, targetId) == 1 then
		return x800009_FAILED_MARRIGE;
	end
	
	--�õ����һ��ͽ����ʦ��ʱ��,�õ�����ʱ��������
	local iTime = LuaFnGetPrenticeBetrayTime(sceneId, targetId);
	iTime = floor(iTime/3600/24);	--����תΪ��
	
	if iTime > 0 and iTime <= x800009_g_PenaltyDay then
		return x800009_FAILED_PENALTY_PRENTICE;
	end
	
	iTime = LuaFnGetPrenticeBetrayTime(sceneId, selfId);
	iTime = floor(iTime/3600/24);
	
	if iTime > 0 and iTime < x800009_g_PenaltyDay then
		return x800009_FAILED_PENALTY_MASTER;
	end
	
	if LuaFnGetPrenticeCount(sceneId, selfId) >= x800009_g_MaxPrenticeNum then
		return x800009_FAILED_NUM_PRENTICE;
	end
	
	if LuaFnHaveMaster(sceneId, targetId) == 1 then
		return x800009_FAILED_HAVEMASTER;
	end
	
	if LuaFnIsFriend(sceneId, selfId, targetId) ~= 1 or LuaFnIsFriend(sceneId, targetId, selfId) ~= 1 then
		return x800009_FAILED_FRIEND;
	end	
	
	return x800009_OK;

end

-------------------------
--***********************
--DoBaiShi
--***********************
-------------------------

function x800009_DoBaiShi(sceneId, selfId, NPCId)

	local ret = x800009_SafeBaiShiCheck(sceneId, selfId, NPCId, 1);
	if ret ~= x800009_OK then
		return ret;
	end
	
	--�õ�ͽ�ܵ�objID
	local targetId = LuaFnGetTeamSceneMember(sceneId, selfId, 0);
	
	LuaFnAprentice(sceneId, targetId, selfId);		--��ʦ
	
	LuaFnMsg2Player(sceneId, selfId, "��ϲ��ͽ�ɹ���\n ʦ��ҪŬ���̺����ͽ����", x800009_CHAT_TYPE_NORMAL);
	LuaFnMsg2Player(sceneId, targetId, "��ϲ��ʦ�ɹ���", x800009_CHAT_TYPE_NORMAL);
	
	return x800009_OK;
	
end

-------------------------
--***********************
--SafeBaiShiCheck
--***********************
-------------------------

function x800009_SafeBaiShiCheck(sceneId, selfId, targetId, bDirect)

	local ret 	= x800009_IsCanBaiShi(sceneId, selfId);
	local str 	= "�ɹ���ͽ��";
	
	if ret == x800009_OK then
		str = "ȷ��Ҫ����ͽ�ܣ�";
	
	elseif ret == x800009_FAILED_CAPTAIN then
		str = "ֻ�жӳ�����������ͽ��";
	
	elseif ret == x800009_FAILED_TEAM then
		str = "��Ҫʦͽ������������ҡ�";
	
	elseif ret == x800009_FAILED_LEVEL_MASTER then
		str = format("ʦ���ȼ�����ﵽ%d����", x800009_g_MasterLevelMin);
	
	elseif ret == x800009_FAILED_LEVEL_PRENTICE then
		str = format("ͽ�ܵȼ��ﵽ%d���Ҳ�����%d�����ܰ�ʦ��", x800009_g_PrenticeLevelMin, x800009_g_PrenticeLevelMax);
	
	elseif ret == x800009_FAILED_BROTHER then
		str = "�н�ݹ�ϵ���ܰ�ʦ��";
	
	elseif ret == x800009_FAILED_MARRIGE then
		str = "���޹�ϵ���ܰ�ʦ��";
	
	elseif ret == x800009_FAILED_PENALTY_PRENTICE then
		str = format("ͽ��ǿ�н��ʦͽ��ϵ%d�������ٴΰ�ʦ��", x800009_g_PenaltyDay);
	
	elseif ret == x800009_FAILED_PENALTY_MASETER then
		str = format("ʦ��ǿ�н��ʦͽ��ϵ%d�������ٴ���ͽ��", x800009_g_PenaltyDay);
	
	elseif ret == x800009_FAILED_NUM_PRENTICE then
		str = format("ÿ��ʦ�������%d��ͽ��", x800009_g_MaxPrenticeNum);
	
	elseif ret == x800009_FAILED_HAVEMASTER then
		str = "�Է��Ѿ���ʦ�����޷���ʦ��";
	
	elseif ret == x800009_FAILED_FRIEND then
		str = "�໥��Ϊ���Ѳ��ܰ�ʦ��";
	end
	
	if ret == x800009_OK and bDirect == 1 then
		return ret;
	end
	
	BeginEvent(sceneId);
	
		AddText(sceneId, str);
	
	EndEvent();

	if ret == x800009_OK then
		DispatchMissionInfo(sceneId, selfId, targetId, x800009_g_ScriptId);
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

function x800009_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x800009_g_ScriptId, x800009_g_MissionName);
end

-------------------------
--***********************
--OnDefaultEvent
--***********************
-------------------------

function x800009_OnDefaultEvent(sceneId, selfId, targetId)

	x800009_SafeBaiShiCheck(sceneId, selfId, targetId, 0);
	
end

-------------------------
--***********************
--CheckAccept
--***********************
-------------------------

function x800009_CheckAccept(sceneId, selfId, targetId)

	return 1;

end

-------------------------
--***********************
--OnAccept
--***********************
-------------------------

function x800009_OnAccept(sceneId, selfId, targetId)

	local ret = x800009_DoBaiShi(sceneId, selfId, targetId);
	
	if ret == x800009_OK then
		return
	end

end