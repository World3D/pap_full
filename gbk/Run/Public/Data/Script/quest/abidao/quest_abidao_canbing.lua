--�б�

--MisDescBegin
x203000_g_ScriptId = 203000
--x203000_g_MissionIdPre =41
x203000_g_MissionId = 68
x203000_g_MissionKind = 13
x203000_g_MissionLevel = 50
--x203000_g_ScriptIdNext = {ScriptId = 205003 ,LV = 1 }
x203000_g_Name	="����" 
x203000_g_DemandItem ={}
x203000_g_DemandKill ={{id=322,num=10}}

x203000_g_MissionName="�б�"
x203000_g_MissionInfo="    ��Щ�����Ǵ�ܵ�#R������ʿ#W������֯�����ǵĲб���ͻϮ���ǵ�Ӫ�أ����Ǿ;ۼ��ڶ�������"  --��������
x203000_g_MissionInfo2="������¾ͽ������ˣ�һ��ҪС�ġ�"
x203000_g_MissionTarget="    ɱ��10��#R������ʿ#W��������#G����#W������"		                                                                                               
x203000_g_MissionComplete="    ���úܺã�"					--�������npc˵���Ļ�
x203000_g_ContinueInfo="    ɱ��������ʿ����"
--������
x203000_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203000_g_RadioItemBonus={}

--MisDescEnd
x203000_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x203000_g_MissionId)
		if x203000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x203000_g_MissionName)
			AddText(sceneId,x203000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x203000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203000_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x203000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203000_g_MissionName)
		     AddText(sceneId,x203000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x203000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203000_g_ScriptId, x203000_g_MissionId)
                end

        elseif x203000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203000_g_MissionName)
                AddText(sceneId,x203000_g_MissionInfo..GetName(sceneId, selfId)..x203000_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203000_g_ScriptId, x203000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203000_g_ScriptId, x203000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==3) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x203000_g_MissionId, x203000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x203000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x203000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203000_g_MissionId)
	for i, item in x203000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x203000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203000_g_MissionId)
		AddExp(sceneId, selfId, x203000_g_ExpBonus)
		AddMoney(sceneId, selfId, x203000_g_MoneyBonus)
		for i, item in x203000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x203000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x203000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203000_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x203000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x203000_g_DemandKill[1].id then 
       		    if num < x203000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x203000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203000_OnItemChanged(sceneId, selfId, itemdataId)

end

