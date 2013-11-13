--��ð��Ԫ˧

--MisDescBegin
x207013_g_ScriptId = 207013
x207013_g_MissionIdPre =13
x207013_g_MissionId = 14
x207013_g_MissionKind = 1
x207013_g_ScriptIdNext = {ScriptId = 207014 ,LV = 1 }
x207013_g_Name	="������" 
x207013_g_Name2	="����" 

x207013_g_MissionName="��ð��Ԫ˧"
x207013_g_MissionInfo="    �����������ģ�������Ұ���븱����#GʯĨ��#W������#G�ɼ�˼��#W���ǿɶ����������ң�#G����#W�Ĳ�������һ�ź����۵ĺ��룬���ǣ���������Ǹ�#G����#W��û�к��롭��\n \n    ����һ����ı�����˰�#G����#W�������ˣ������ұ��ڹ����ǵģ�һ���������������һ������ͷ���ֲ����⼸��������Źֵģ�����һ����#G����#W��ɱ�ˣ���Ȼ����"  --��������
x207013_g_MissionTarget="    ��ܼ�����"		
x207013_g_MissionComplete="    ��һ����#G������#W����׷ɱ�ҵģ���������汰�ɣ������ˣ���ɲ�Ҫ�����Ļ��������ƭ�ˣ�����ƭ���˲����������͡���\n \n    �㿴�����㿴���ҵ�����������ɱǧ����#G������#W����һ��ǰ���Һ������Ӹ�ƭ��#GҰ����#W����˵Ҫ���ҹ��Ϻ����ӣ���������֪�������������˼������˵�Ǹ������ݡ���\n \n    �ң��ҡ������Ҿͳ���#G����#W�����������������������в��һ��û�����������ˡ�\n \n    Ҫ����ʥ����#G�ɼ�˼��#W����#GҰ����#W���һ���֪�����ҵ������Ѿ�������ǿռ�ˣ���ץס������ɱ����ڡ��������ˣ������ɱ��Ҳû�ã����Ǽٵ�������ֻҪ��Ϸ����ң��һ��������������������"					--�������npc˵���Ļ�
--������
x207013_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207013_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207013_g_RadioItemBonus={}

--MisDescEnd


--**********************************

--������ں���

--**********************************

function x207013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207013_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207013_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207013_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207013_g_MissionName)
			AddText(sceneId,x207013_g_MissionComplete)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207013_g_MissionTarget) 
			AddMoneyBonus(sceneId, x207013_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x207013_g_ScriptId, x207013_g_MissionId)
		end
        elseif x207013_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207013_g_MissionName)
                AddText(sceneId,x207013_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207013_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207013_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207013_g_ScriptId, x207013_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207013_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207013_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207013_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207013_g_ScriptId, x207013_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207013_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207013_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207013_CheckPushList(sceneId, selfId, targetId) 
	if IsMissionHaveDone(sceneId, selfId, x207013_g_MissionIdPre) > 0 then
	        if (GetName(sceneId,targetId)==x207013_g_Name) then
	                if IsHaveMission(sceneId,selfId, x207013_g_MissionId)<= 0 then
	                    return 1
	                end
	        end
		if (GetName(sceneId,targetId)==x207013_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x207013_g_MissionId) > 0 then
			    return 1
	                    end
	        end
	end
        return 0
	
end

--**********************************

--����

--**********************************

function x207013_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207013_g_MissionId, x207013_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207013_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x207013_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207013_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207013_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207013_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207013_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207013_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207013_g_MissionId)
		AddExp(sceneId, selfId, x207013_g_ExpBonus)
		AddMoney(sceneId, selfId, x207013_g_MoneyBonus)
		CallScriptFunction( x207013_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207013_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207013_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207013_OnItemChanged(sceneId, selfId, itemdataId)

end

