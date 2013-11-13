--�ٽᰲ��

--MisDescBegin
x201006_g_ScriptId = 201006
x201006_g_MissionIdPre =87
x201006_g_MissionId = 88
x201006_g_MissionKind = 2
x201006_g_MissionLevel = 10
x201006_g_ScriptIdNext = {ScriptId = 201013 ,LV = 1 }
x201006_g_Name	="��ľ��" 
x201006_g_DemandItem ={}
x201006_g_DemandKill ={{id=473,num=15}}

x201006_g_MissionName="�ٽᰲ��"
x201006_g_MissionInfo="    ����ľ���ҵ��������Ӻ���Ҫ�����ٽ�һ�ΰ�����ľ�Ϻ���ľ�����ᰲ��ļѻ���һ����������ԭ��\n \n    ��������İ��ţ�����ע�����������ֵ���Զ��һ�𣡴ӽ��Ժ�ͬ�����������ѣ���Զ��������\n \n    ���¸ҵ�սʿ��ȥսʤ#G��Ӫ#W�������Щ#R������Ѳ��#W��"  --��������
x201006_g_MissionTarget="    ɱ��15��#G��Ӫ#W�����#R������Ѳ��#W��Ȼ���ȥ����#G��ľ��#W��"		                                                                                               
x201006_g_MissionComplete="    ���úã���Ϊ�ҽ���˺ܴ�����⡣"					--�������npc˵���Ļ�
x201006_g_ContinueInfo="    ��Щ������а�񣬲�ɱ���������޷�ͻΧ��"
--������
x201006_g_MoneyBonus = 1
--�̶���Ʒ���������8��
x201006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201006_g_RadioItemBonus={}

--MisDescEnd
x201006_g_ExpBonus = 60
--**********************************

--������ں���

--**********************************

function x201006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201006_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x201006_g_MissionId)
		if x201006_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201006_g_MissionName)
			AddText(sceneId,x201006_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201006_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������Ѳ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201006_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201006_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201006_g_MissionName)
		     AddText(sceneId,x201006_g_MissionComplete)
		     AddMoneyBonus(sceneId, x201006_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201006_g_ScriptId, x201006_g_MissionId)
                end

        elseif x201006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201006_g_MissionName)
                AddText(sceneId,x201006_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201006_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x201006_g_ScriptId, x201006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201006_g_ScriptId, x201006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201006_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==1) then
		if IsMissionHaveDone(sceneId, selfId, x201006_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x201006_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x201006_g_MissionId, x201006_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x201006_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x201006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201006_g_MissionId)
	for i, item in pairs(x201006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201006_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x201006_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x201006_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201006_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x201006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x201006_g_MissionId)
		AddExp(sceneId, selfId, x201006_g_ExpBonus)
		AddMoney(sceneId, selfId, x201006_g_MoneyBonus)
		for i, item in pairs(x201006_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x201006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x201006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x201006_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201006_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x201006_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x201006_g_DemandKill[1].id then 
       		    if num < x201006_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������Ѳ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201006_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x201006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201006_OnItemChanged(sceneId, selfId, itemdataId)

end

