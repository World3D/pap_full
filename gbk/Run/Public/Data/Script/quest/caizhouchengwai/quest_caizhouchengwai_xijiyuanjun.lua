--Ϯ��Ԯ��

--MisDescBegin
x207007_g_ScriptId = 207007
--x207007_g_MissionIdPre =41
x207007_g_MissionId = 269
x207007_g_MissionKind = 18
x207007_g_MissionLevel = 75
x207007_g_ScriptIdNext = {ScriptId = 207008 ,LV = 1 }
x207007_g_Name	="�ٲ�̨" 
x207007_g_DemandItem ={}
x207007_g_DemandKill ={{id=411,num=20}}

x207007_g_MissionName="Ϯ��Ԯ��"
x207007_g_MissionInfo="    ����Ҫ�ٸ������̸��ͣ�����������ͷ������ɱ�����ǵ�ʹ�����������ǣ������ǿ����������̫����\n \n    ����ҪϮ�����ǵ�Ԯ�����������ݳǣ�"  --��������
x207007_g_MissionInfo2="�������´�������#R���Ԯ��#W�ͽ�������"
x207007_g_MissionTarget="    ��#G�ٲ�̨#Wɱ��20�������´���#R���Ԯ��#W��"		                                                                                               
x207007_g_MissionComplete="    ��ν����Ҳ���������ˡ�"					--�������npc˵���Ļ�
x207007_g_ContinueInfo="    Ϯ��Ԯ�����ò��ݳǹ�����Ԯ��"
--������
x207007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207007_g_RadioItemBonus={}

--MisDescEnd
x207007_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207007_g_MissionId)
		if x207007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207007_g_MissionName)
			AddText(sceneId,x207007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207007_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����Ԯ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207007_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207007_g_MissionName)
		     AddText(sceneId,x207007_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207007_g_ScriptId, x207007_g_MissionId)
                end

        elseif x207007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207007_g_MissionName)
                AddText(sceneId,x207007_g_MissionInfo..GetName(sceneId, selfId)..x207007_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207007_g_ScriptId, x207007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207007_g_ScriptId, x207007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==7) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207007_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207007_g_MissionId, x207007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207007_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x207007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207007_g_MissionId)
	for i, item in x207007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x207007_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207007_g_MissionId)
		AddExp(sceneId, selfId, x207007_g_ExpBonus)
		AddMoney(sceneId, selfId, x207007_g_MoneyBonus)
		for i, item in x207007_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207007_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x207007_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x207007_g_DemandKill[1].id then 
       		    if num < x207007_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����Ԯ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207007_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x207007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207007_OnItemChanged(sceneId, selfId, itemdataId)

end

