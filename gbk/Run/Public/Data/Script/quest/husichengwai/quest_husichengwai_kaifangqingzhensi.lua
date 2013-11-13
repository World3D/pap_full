--����������

--MisDescBegin
x204002_g_ScriptId = 204002
--x204002_g_MissionIdPre =41
x204002_g_MissionId = 97
x204002_g_MissionKind = 9
x204002_g_MissionLevel = 45
--x204002_g_ScriptIdNext = {ScriptId = 201001 ,LV = 1 }
x204002_g_Name	="�ɼ�˼��" 
x204002_g_DemandItem ={}
x204002_g_DemandKill ={{id=348,num=15}}

x204002_g_MissionName="����������"
x204002_g_MissionInfo="    ���������������ɵĻ�λ����ǿ�Ⱦ�������ؽ̶������������ɣ��Ѿ����������ҡ�\n \n    "  --��������
x204002_g_MissionInfo2="������ٲ�̨���ܱ�Ƚ������ɾ���֮�󣬿������б���յ������£����ɵİ����Ƕ��ǳ���֧�����ǡ����¹�һ���������»�������ţ������о�����������ȥ����Щ��ɱ�ˣ����������¡�"
x204002_g_MissionTarget="    �¹ص������±�#R��������#W�������ˣ��㵽��ȥ����15���������������ܿ��������¡�#G�ɼ�˼��#W���㿪������"		                                                                                               
x204002_g_MissionComplete="    ����Ҫ����ÿ���˵��������ɡ�"					--�������npc˵���Ļ�
x204002_g_ContinueInfo="    �����¿�������"
--������
x204002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204002_g_RadioItemBonus={}

--MisDescEnd
x204002_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204002_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x204002_g_MissionId)
		if x204002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204002_g_MissionName)
			AddText(sceneId,x204002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204002_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204002_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204002_g_MissionName)
		     AddText(sceneId,x204002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x204002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204002_g_ScriptId, x204002_g_MissionId)
                end

        elseif x204002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204002_g_MissionName)
                AddText(sceneId,x204002_g_MissionInfo..GetName(sceneId, selfId)..x204002_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204002_g_ScriptId, x204002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204002_g_ScriptId, x204002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204002_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==4) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204002_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x204002_g_MissionId, x204002_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x204002_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x204002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204002_g_MissionId)
	for i, item in pairs(x204002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204002_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x204002_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x204002_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204002_g_MissionId)
		AddExp(sceneId, selfId, x204002_g_ExpBonus)
		AddMoney(sceneId, selfId, x204002_g_MoneyBonus)
		for i, item in pairs(x204002_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x204002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x204002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204002_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x204002_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x204002_g_DemandKill[1].id then 
       		    if num < x204002_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204002_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x204002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204002_OnItemChanged(sceneId, selfId, itemdataId)

end

