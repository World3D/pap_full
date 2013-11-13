--��·����

--MisDescBegin
x207011_g_ScriptId = 207011
--x207011_g_MissionIdPre =41
x207011_g_MissionId = 273
x207011_g_MissionKind = 18
x207011_g_MissionLevel = 75
--x207011_g_ScriptIdNext = {ScriptId = 207008 ,LV = 1 }
x207011_g_Name	="����" 
x207011_g_DemandItem ={}
x207011_g_DemandKill ={{id=413,num=20}}

x207011_g_MissionName="��·����"
x207011_g_MissionInfo="    ���ǵ���·���Ƶ����裬��ȡ���У���Χ���ݣ��������±�������ս��"  --��������
x207011_g_MissionInfo2="������ȥ֧Ԯ������·����"
x207011_g_MissionTarget="    #G����#W����·���������±����ͽ����ս����Ҫ���20��#RŮ��սʿ#W��֧Ԯ��·����"		                                                                                               
x207011_g_MissionComplete="    ������ʿ��˵�ˣ����ȷ��Ӣ�¡�"					--�������npc˵���Ļ�
x207011_g_ContinueInfo="    ����Ľ�ʿ������Щ���µģ�������Ҫ���֧Ԯ��"
--������
x207011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207011_g_RadioItemBonus={}

--MisDescEnd
x207011_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)
		if x207011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207011_g_MissionName)
			AddText(sceneId,x207011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��Ů��սʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207011_g_MissionName)
		     AddText(sceneId,x207011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207011_g_ScriptId, x207011_g_MissionId)
                end

        elseif x207011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207011_g_MissionName)
                AddText(sceneId,x207011_g_MissionInfo..GetName(sceneId, selfId)..x207011_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207011_g_ScriptId, x207011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207011_g_ScriptId, x207011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==7) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207011_g_MissionId, x207011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x207011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207011_g_MissionId)
	for i, item in pairs(x207011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x207011_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207011_g_MissionId)
		AddExp(sceneId, selfId, x207011_g_ExpBonus)
		AddMoney(sceneId, selfId, x207011_g_MoneyBonus)
		for i, item in pairs(x207011_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x207011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x207011_g_DemandKill[1].id then 
       		    if num < x207011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��Ů��սʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x207011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207011_OnItemChanged(sceneId, selfId, itemdataId)

end

