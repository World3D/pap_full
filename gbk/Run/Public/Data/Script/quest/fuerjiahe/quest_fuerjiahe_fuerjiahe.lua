--�����Ӻ�

--MisDescBegin
x223005_g_ScriptId = 223005
--x223005_g_MissionIdPre =322
x223005_g_MissionId = 297
x223005_g_MissionKind = 20
x223005_g_MissionLevel = 100
x223005_g_ScriptIdNext = {ScriptId = 223006 ,LV = 1 }
x223005_g_Name	="����" 
x223005_g_DemandItem ={}
x223005_g_DemandKill ={}	

x223005_g_MissionName="�����Ӻ�"
x223005_g_MissionInfo="    ����Ϊͬһ��Ŀ���ս���������������ǣ��������ǡ�˵���ﻰ���ζ���Ϊ��˧�����ı��ֲ������������ŷ���\n \n    ������ץһ���˳������ζ���Ȼ�ܳԽ�������ز������������ָ�ӵĻ����ղ��Ů����������ҵ��������ˣ�\n \n    ���鱨˵�������ڷ����Ӻӱ߼��ᣬ���ǲ�֪����������ʲô�������ȥ�ӱ߿�һ�£����ǵ���Ҫ��ʲô�������ˣ���ҪС�����ǵĹ����֣��ҿɲ�ϣ���㻹û���ӱ߾ͳ��˴�⬣�"
x223005_g_MissionTarget="    ��#G�����Ӻ�#W��ȥ#G���#W�ɲ鿴���˵�Ӫ�أ�С����Щ�����֡�"		                                                                                               
x223005_g_MissionComplete="    �����������Ϣ�ǳ���Ҫ���������Ǵ���Ҫ���ߡ�"					--�������npc˵���Ļ�
x223005_g_ContinueInfo="    ������Ҫ�㵽�ӱ�̽��һ�£����ܲ����ҵ����˼���ӱߵ�ԭ��"
--������
x223005_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x223005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223005_g_RadioItemBonus={}

--MisDescEnd
x223005_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x223005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223005_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x223005_g_MissionId)
		if x223005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223005_g_MissionName)
			AddText(sceneId,x223005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223005_g_MissionTarget) 
			AddText(sceneId,format("\n    �������ӺӲ鿴����Ӫ��   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x223005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223005_g_MissionName)
		     AddText(sceneId,x223005_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223005_g_ScriptId, x223005_g_MissionId)
                end

        elseif x223005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223005_g_MissionName)
                AddText(sceneId,x223005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223005_g_ScriptId, x223005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223005_g_ScriptId, x223005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223005_CheckAccept(sceneId, selfId, targetId)

	if IsHaveMission(sceneId,selfId, x223005_g_MissionId)<= 0 then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223005_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==17) then
		--if IsMissionHaveDone(sceneId, selfId, x223005_g_MissionIdPre) > 0 then
                    return 1
        	--end
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x223005_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x223005_g_MissionId, x223005_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x223005_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		misIndex = GetMissionIndexByID(sceneId,selfId,x223005_g_MissionId)
		                                              
	     
end



--**********************************

--����

--**********************************

function x223005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223005_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223005_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x223005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223005_g_MissionId)
		AddExp(sceneId, selfId, x223005_g_ExpBonus)
		AddMoney(sceneId, selfId, x223005_g_MoneyBonus)
		for i, item in x223005_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x223005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x223005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223005_OnKillObject(sceneId, selfId, objdataId)
	
end



--**********************************

--���������¼�

--**********************************

function x223005_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 0 then
		if IsHaveMission(sceneId,selfId, x223005_g_MissionId)> 0 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		BeginEvent(sceneId)
		AddText(sceneId,"    �������ӺӲ鿴����Ӫ��   1/1") 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		BeginEvent(sceneId)
		AddText(sceneId,"    �ڷ����Ӻ��ϣ���һЩС�����ں��ϣ�һЩ����������׼��������������������Ҫ�����ˣ�Ҫ��Щ�������Ϣ�������ɡ�") 
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
		end
	end


end

function x223005_OnTimer(sceneId, selfId )

end
function x223005_OnLeaveArea(sceneId, selfId )

end


--**********************************

--���߸ı�

--**********************************

function x223005_OnItemChanged(sceneId, selfId, itemdataId)

end

