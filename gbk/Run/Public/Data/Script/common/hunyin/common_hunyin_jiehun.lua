
-------------------------
--***********************
--Const
--***********************
-------------------------

x800006_g_ScriptId 					= 800006
x800006_g_MissionName				= "���"
x800006_g_CostMoneyMarriage	= 520520
x800006_g_RingId						= 10280001
x800006_g_FriendPointDemand	= 1000
x800006_g_ManLevelDemand		= 35
x800006_g_WomanLevelDemand	= 20
x800006_SkillId							= 149

-------------------------
--***********************
--Define
--***********************
-------------------------
x800006_CHAT_TYPE_NORMAL	= 0
x800006_CHAT_TYPE_SYSTEM	= 4

x800006_OK										= 0
x800006_ERROR_UNKNOWN					= -1
x800006_FAILED_CAPTAIN				= 1
x800006_FAILED_TEAM						= 2
x800006_FAILED_COUNTRY				= 3
x800006_FAILED_GENDER					= 4
x800006_FAILED_FRIEND					= 5
x800006_FAILED_MARRIGE_SELF		= 6
x800006_FAILED_MARRIGE_TARGET	= 7
x800006_FAILED_LEVEL					= 8
x800006_FAILED_MONEY					= 9
x800006_FAILED_BAG						= 10
x800006_FAILED_TITLE					= 11
x800006_FAILED_DISTANCE				= 12
x800006_FAILED_MASTER					= 13
x800006_FAILED_BROTHER				= 14

-------------------------
--***********************
--IsCanMarrige
--***********************
-------------------------

function x800006_IsCanMarrige(sceneId, selfId)

	if (IsCaptain(sceneId, selfId)) ~= 1 then
		return x800006_FAILED_CAPTAIN;
	end
	
	if (GetTeamSize(sceneId, selfId) ~= 2) then
		return x800006_FAILED_TEAM;		--��ӳ�Ա�������˲��ɽ��
	end

	local targetId = LuaFnGetTeamSceneMember(sceneId, selfId, 0);
	
	if LuaFnIsFriend(sceneId, selfId, targetId) ~= 1 then
		return x800006_FAILED_FRIEND;
	end		
		
	if (GetCurCountry(sceneId, selfId) ~= GetCurCountry(sceneId, targetId)) then
		return x800006_FAILED_COUNTRY;		--���Ҳ�ͬ���ɽ��
	end
	
	local IsSelfMan = GetSex(sceneId, selfId);
	local ManId;
	local WomanId;
	if IsSelfMan then
		ManId = selfId;
		WomanId = targetId;
	else
		ManId = targetId;
		WomanId = selfId;
	end
	
	if GetSex(sceneId, selfId) == GetSex(sceneId, targetId) then
		return x800006_FAILED_GENDER;		--�Ա���ͬ���ɽ��
	end
	
	if LuaFnIsFriend(sceneId, selfId, targetId) ~=1 or LuaFnIsFriend(sceneId, targetId, selfId) ~=1 or LuaFnGetFriendPoint(sceneId, selfId, targetId) < x800006_g_FriendPointDemand	then
		return x800006_FAILED_FRIEND;
	end
	
	if LuaFnIsMarried(sceneId, selfId) == 1 then
		return x800006_FAILED_MARRIGE_SELF;
	end
	
	if LuaFnIsMarried(sceneId, targetId) == 1 then
		return x800006_FAILED_MARRIGE_TARGET;		--˫�����赥��ſ��Խ��
	end
	
	if GetLevel(sceneId, ManId) < x800006_g_ManLevelDemand or GetLevel(sceneId, WomanId) < x800006_g_WomanLevelDemand then
		return x800006_FAILED_LEVEL;
	end
	
	if GetMoney(sceneId, ManId) < x800006_g_CostMoneyMarriage then
		return x800006_FAILED_MONEY;
	end

	if (GetItemIsEmpty(sceneId, selfId) == -1 or GetItemIsEmpty(sceneId, targetId) == -1 ) then
		return x8000006_FAILED_BAG;
	end
	
	--A�Ƿ���һ���ƺſռ䣻B�Ƿ���һ���ƺſռ䡣�����жϣ���Ϊ��ż�ƺ��Ǳ�����
	
	if IsInDist(sceneId, selfId,targetId, 10) ~= 1 then
		return x800006_FAILED_DISTANCE;		--˫���������10�ײ����Խ��
	end
	
	if LuaFnIsMaster(sceneId, selfId, targetId) == 1 or LuaFnIsMaster(sceneId, targetId, selfId) == 1 then
		return x800006_FAILED_MASTER;		--ʦͽ���ɽ��
	end
	
	if LuaFnIsBrother(sceneId, selfId, targetId) ==1 then
		return x800006_FAILED_BROTHER;		--��ݲ����Խ��
	end
	
	return x800006_OK;

end

-------------------------
--***********************
--DoMarrige
--***********************
-------------------------

function x800006_DoMarrige(sceneId, selfId, NPCId)

	local ManId = 0;
	local WomanId = 0;

	local ret = x800006_SafeMarrigeCheck(sceneId, selfId, NPCId, 1);
	if ret ~= x800006_OK then
		return ret;
	end
	
	local targetId = LuaFnGetTeamSceneMember(sceneId, selfId, 0);
		
	--�õ���Ů��
	if GetSex(sceneId, selfId) == 1 then
		ManId = selfId;
		WomanId = targetId;
	else
		ManId = targetId;
		WomanId = selfId;
	end
	
	--�ֱ�����һ����ָ����Ů
	if TryRecieveItem(sceneId, ManId, x800006_g_RingId, 1) == -1 or TryRecieveItem(sceneId, WomanId, x800006_g_RingId, 1) == -1 then
		return x800006_FAILED_BAG;
	end
	
	--�۳��з����Ͻ�Ǯ
	if LuaFnCostMoney(sceneId, ManId, x800006_g_CostMoneyMarriage) == -1 then
		return x800006_FAILED_MONEY;
	end
		
	--�ֱ���Ϣ����Ů˫�����к���
	local MailText = format("���װ������ѣ����Ѻ�%sϲ����Ե��ף�����ǰɣ�", LuaFnGetName(sceneId, selfId));
	LuaFnSendMailToAllFriend(sceneId, selfId, MailText, targetId);
	LuaFnSendMailToAllFriend(sceneId, targetId, MailText, selfId);
	
	--Ϊ�з�����һ���ƺ�"ĳĳ�ķ��"��ΪŮ������һ���ƺ�"ĳĳ������"
	local Title = format("%s�ķ��", GetName(sceneId, WomanId));
	LuaFnAwardSpouseTitle(sceneId, ManId, Title);
	Title = format("%s������", GetName(sceneId,ManId));
	LuaFnAwardSpouseTitle(sceneId,WomanId,Title);
	
	--Ϊ����˫������һ�����޼���,Ŀǰû�У��ݲ����
	AddSkill(sceneId, selfId, x800006_SkillId);
	AddSkill(sceneId, targetId, x800006_SkillId);
		
	--������Ƶ��������Ϣ,����ͳ�Ʒ���������������ʱû�д˹���
	local Msg = format("[ϵͳ]��ϲ%s��%sϲ������", GetName(sceneId, ManId), GetName(sceneId, WomanId));
	LuaFnMsg2Player(sceneId, selfId, Msg, x800006_CHAT_TYPE_SYSTEM);
	
	--�����촰�ڸ��з���ʾ,��Ӧ��ʾѧ��ļ���
	Msg = format("��ϲ���%s��Ϊ���ޣ�\n �õ�����ָһö��\n �õ��ƺ�%s�ķ����\n", GetName(sceneId, WomanId), GetName(sceneId, WomanId));
	LuaFnMsg2Player(sceneId, ManId, Msg, x800006_CHAT_TYPE_NORMAL);

	--�����촰�ڸ�Ů����ʾ,��Ӧ��ʾѧ��ļ���
	Msg = format("��ϲ���%s��Ϊ���ޣ�\n �õ�����ָһö��\n �õ��ƺ�%s�����ӡ�\n", GetName(sceneId, ManId), GetName(sceneId, ManId));
	LuaFnMsg2Player(sceneId, WomanId, Msg, x800006_CHAT_TYPE_NORMAL);
	
	--���һ��,˫����Ϊ����
	LuaFnMarry(sceneId, selfId, targetId);
	
	return x800006_OK;

end

-------------------------
--***********************
--SafeMarrigeCheck
--***********************
-------------------------

function x800006_SafeMarrigeCheck(sceneId, selfId, NPCId, bDirect)

	local ret 	= x800006_IsCanMarrige(sceneId, selfId);
	local str 	= "�Ѿ���顣";
	local targetId = LuaFnGetTeamSceneMember(sceneId, selfId, 0);
	
	if ret == x800006_OK then
		str = format("ȷ��Ҫ��飿\n�з���Ҫ֧��%d��Ǯ��", x800006_g_CostMoneyMarriage);
	
	elseif ret == x800006_FAILED_CAPTAIN then
		str = "ֻ�жӳ����������顣";

	elseif ret == x800006_FAILED_TEAM then
		str = "������Ϊ���ޣ�����Ů˫���������һ���������ҡ�";

	elseif ret == x800006_FAILED_COUNNTRY then
		str = "���������𣬲��ܽ�顣";
	
	elseif ret == x800006_FAILED_GENDER then
		str = "��ֻ�����ϵĶ�ͷð������һ�κ��飩\n����ĺܾ�������������ս��ͳ�����������ǣ����ǡ��������������ǵ�ʱ�����������޷�����������Ϊ�ģ��뵱���Һ���ʦ�֡�������������Ҳ�գ�����Ҳ�ա�";
	
	elseif ret == x800006_FAILED_FRIEND then
		str = format("˫������Ϊ�����ҶԶԷ����Ѻöȱ���ﵽ%d���ܽ�Ϊ����", x800006_g_FriendPointDemand);
	
	elseif ret == x800006_FAILED_MARRIGE_SELF then
		str = "��Ȼ�Ѿ�����ˣ���Ҫ�԰���һ��һ�⣬С�ķ��ػ��";
		local Msg = "�Է����ѳɻ飬���ǲ��ܽ�顣";
		LuaFnMsg2Player(sceneId, targetId, Msg, x800006_CHAT_TYPE_NORMAL);
	
	elseif ret == x800006_FAILED_MARRIGE_TARGET then
		str = "����������Ѿ�����ˣ�����ô���������أ�"
		local Msg = "���ѳɻ飬���ǲ��ܽ�顣";
		LuaFnMsg2Player(sceneId, targetId, Msg, x800006_CHAT_TYPE_NORMAL);
	
	elseif ret == x800006_FAILED_LEVEL then
		str = format("��ô��������飿�з���Ҫ�ﵽ%d����Ů����Ҫ�ﵽ%d����", x800006_g_ManLevelDemand, x800006_g_WomanLevelDemand);
	
	elseif ret == x800006_FAILED_MONEY then
		str = format("��������������û�е�����ǲ��еģ��з���ҪЯ��%d��Ǯ���ܽ�顣", x800006_g_CostMoneyMarriage);
	
	elseif ret == x800006_FAILED_BAG then
		str = "���Ƕ��˵ı����зֱ�������һ����λ�����ڴ�Ž���ָ��";
	
	elseif ret == x800006_FAILED_TITLE then
		str = "�ƺ��������޷���顣";
	
	elseif ret == x800006_FAILED_DISTANCE then
		str = "ֻ�ж��˶��ߵ�����߲ſ��Խ�顣";
	
	elseif ret == x800006_FAILED_MASTER then
		str = "������ʦͽ����ô���Խ���أ�";
	
	elseif ret == x800006_FAILED_BROTHER then
		str = "���������ǽ�ݹ�ϵ�����ܽ�顣";
	
	end
	
	if ret == x800006_OK and bDirect == 1 then
		return ret;
	end
	
	BeginEvent(sceneId);
	
		AddText(sceneId, str);
	
	EndEvent();

	if ret == x800006_OK then
		DispatchMissionInfo(sceneId, selfId, NPCId, x800006_g_ScriptId);
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

function x800006_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x800006_g_ScriptId, x800006_g_MissionName);
end

-------------------------
--***********************
--OnDefaultEvent
--***********************
-------------------------

function x800006_OnDefaultEvent(sceneId, selfId, targetId)

	x800006_SafeMarrigeCheck(sceneId, selfId, targetId, 0);

end

-------------------------
--***********************
--CheckAccept
--***********************
-------------------------

function x800006_CheckAccept(sceneId, selfId, targetId)

	return 1;

end

-------------------------
--***********************
--OnAccept
--***********************
-------------------------

function x800006_OnAccept(sceneId, selfId, targetId)

	local ret = x800006_DoMarrige(sceneId, selfId, targetId);
	
	if ret == x800006_OK then
		return
	end
	
	local str = "ERROR";
	
	if ret == x800006_FAILED_BAG then
		str = "��ӽ�ָ����";
	elseif ret == x800006_FAILED_MONEY then
		str = "�۳���Ǯ����";
	end
	
	BeginEvent(sceneId);
	
		AddText(sceneId, str);
	
	EndEvent();

	DispatchEventList(sceneId, selfId, targetId);

end