--Ѱ������

--MisDescBegin
x225001_g_ScriptId = 225001
x225001_g_MissionIdPre =322
x225001_g_MissionId = 323
x225001_g_MissionKind = 22
x225001_g_MissionLevel = 110
x225001_g_ScriptIdNext = {ScriptId = 225002 ,LV = 1 }
x225001_g_Name	="�ٲ�̨" 
x225001_g_DemandItem ={}
x225001_g_DemandKill ={}	

x225001_g_MissionName="Ѱ������"
x225001_g_MissionInfo="    ͻȻ������һ�����⣬�����������ܵ�����ȥ���أ�û����˵���ӳ������ǰ���\n \n    ����Ϣ˵�����#G���廨԰#W������һȺ���Ż������ˣ����ƾ��������ӵ�����ȥ�ˡ���Ϊ���̻�û����ͨ���ϣ���Ȼ�����ڽ����\n \n    ����ȥ���廨԰����ȥ��������ɡ�"
x225001_g_MissionTarget="    ��#G�ٲ�̨#Wȥ�鿴#G���廨԰#W�������"		                                                                                               
x225001_g_MissionComplete="    ���̴��������ڿӣ��Ա߻���һ�����ӣ�"					--�������npc˵���Ļ�
x225001_g_ContinueInfo="    �Ǹ���԰�ҿ���������һ��õģ���֪��Ϊʲô�����Ĺ�����ôϲ����"
--������
x225001_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x225001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x225001_g_RadioItemBonus={}

--MisDescEnd
x225001_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x225001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x225001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x225001_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x225001_g_MissionId)
		if x225001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x225001_g_MissionName)
			AddText(sceneId,x225001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x225001_g_MissionTarget) 
			AddText(sceneId,format("\n    �����廨԰Ѱ�������ټ�   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x225001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x225001_g_MissionName)
		     AddText(sceneId,x225001_g_MissionComplete)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x225001_g_ScriptId, x225001_g_MissionId)
                end

        elseif x225001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x225001_g_MissionName)
                AddText(sceneId,x225001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x225001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x225001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x225001_g_ScriptId, x225001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x225001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x225001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x225001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x225001_g_ScriptId, x225001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x225001_CheckAccept(sceneId, selfId, targetId)

	if IsHaveMission(sceneId,selfId, x225001_g_MissionId)<= 0 then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x225001_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==16) then
		if IsMissionHaveDone(sceneId, selfId, x225001_g_MissionIdPre) > 0 then
                    return 1
        	end
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x225001_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x225001_g_MissionId, x225001_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x225001_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		misIndex = GetMissionIndexByID(sceneId,selfId,x225001_g_MissionId)
		                                              
	     
end



--**********************************

--����

--**********************************

function x225001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x225001_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x225001_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x225001_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x225001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x225001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x225001_g_MissionId)
		AddExp(sceneId, selfId, x225001_g_ExpBonus)
		AddMoney(sceneId, selfId, x225001_g_MoneyBonus)
		for i, item in pairs(x225001_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x225001_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x225001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x225001_OnKillObject(sceneId, selfId, objdataId)
	
end



--**********************************

--���������¼�

--**********************************

function x225001_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x225001_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 0 then
		if IsHaveMission(sceneId,selfId, x225001_g_MissionId)> 0 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		BeginEvent(sceneId)
		AddText(sceneId,"    �����廨԰Ѱ�������ټ�   1/1") 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		BeginEvent(sceneId)
		AddText(sceneId,"    ԶԶ�Ŀ�ȥ��������������ָ��������ʦ�ڿӡ������̵���߷���һ���������ӣ�������������Ҫ�����������ӡ�") 
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
		end
	end


end

function x225001_OnTimer(sceneId, selfId )

end
function x225001_OnLeaveArea(sceneId, selfId )

end


--**********************************

--���߸ı�

--**********************************

function x225001_OnItemChanged(sceneId, selfId, itemdataId)

end

