--���������

--MisDescBegin
x213005_g_ScriptId = 213005
--x213005_g_MissionIdPre =41
x213005_g_MissionId = 150
x213005_g_MissionKind = 24
x213005_g_MissionLevel = 125
x213005_g_ScriptIdNext = {ScriptId = 213006 ,LV = 1 }
x213005_g_Name	="�ζ�" 
x213005_g_DemandItem ={}
x213005_g_DemandKill ={{id=391,num=15}}

x213005_g_MissionName="���������"
x213005_g_MissionInfo="    Ҫ����ǣ�����Ҫ��ȡ�����š����ߵ�����������Ÿ�����һЩ���޵��Ǹ��ֺ������ͣ��ӻ������ǵĹ��ơ���ʿ����ȥ����ɱ��15��#R���޵��Ǹ���#W���������ǵķ���������"  --��������
x213005_g_MissionTarget="    ����#G�ζ�#Wɱ��15��#R���޵��Ǹ���#W��"		                                                                                               
x213005_g_MissionComplete="    ���ĺã���������źܿ�ͻṥ�����ˡ�"					--�������npc˵���Ļ�
x213005_g_ContinueInfo="    ��Щ���޵��Ǹ��ֶ��Ǻ������սʿ��"
--������
x213005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x213005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x213005_g_RadioItemBonus={}

--MisDescEnd
x213005_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x213005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x213005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x213005_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x213005_g_MissionId)
		if x213005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x213005_g_MissionName)
			AddText(sceneId,x213005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x213005_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����޵��Ǹ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x213005_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x213005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x213005_g_MissionName)
		     AddText(sceneId,x213005_g_MissionComplete)
		     AddMoneyBonus(sceneId, x213005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x213005_g_ScriptId, x213005_g_MissionId)
                end

        elseif x213005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x213005_g_MissionName)
                AddText(sceneId,x213005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x213005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x213005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x213005_g_ScriptId, x213005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x213005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x213005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x213005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x213005_g_ScriptId, x213005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x213005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x213005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x213005_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==13) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x213005_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x213005_g_MissionId, x213005_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x213005_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x213005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x213005_g_MissionId)
	for i, item in pairs(x213005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x213005_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x213005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x213005_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x213005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x213005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x213005_g_MissionId)
		AddExp(sceneId, selfId, x213005_g_ExpBonus)
		AddMoney(sceneId, selfId, x213005_g_MoneyBonus)
		for i, item in pairs(x213005_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x213005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x213005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x213005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x213005_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x213005_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x213005_g_DemandKill[1].id then 
       		    if num < x213005_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����޵��Ǹ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x213005_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x213005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x213005_OnItemChanged(sceneId, selfId, itemdataId)

end

