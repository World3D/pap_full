--�����в�

--MisDescBegin
x204000_g_ScriptId = 204000
--x204000_g_MissionIdPre =41
x204000_g_MissionId = 95
x204000_g_MissionKind = 9
x204000_g_MissionLevel = 45
x204000_g_ScriptIdNext = {ScriptId = 204001 ,LV = 1 }
x204000_g_Name	="�ɼ�˼��" 
x204000_g_DemandItem ={}
x204000_g_DemandKill ={{id=346,num=20}}

x204000_g_MissionName="�����в�"
x204000_g_MissionInfo="    �����д��������ۼ��ڱ���һ�������������ڶ࣬��ǿ��׳��Ϊ�׵�����ı�Ѿá�\n \n    һ����������Щ�˴��ڣ����Ѿ��������ٲ�̨�󽫵���Χ�˵��ȷ档\n \n    �ٲ�̨��Ҫһ���ܸɵĸ���Э������"  --��������
x204000_g_MissionInfo2="�����������������һ����ս��������ȥ���������ٵ�����ɣ�������һ���Ķ��棬�������Ĳд�����������"
x204000_g_MissionTarget="    #G�ɼ�˼��#W����ɱ����������һ����20��#R����ʿ��#W��"		                                                                                               
x204000_g_MissionComplete="    ����������ܸ��ˡ�"					--�������npc˵���Ļ�
x204000_g_ContinueInfo="    ������Щ�����в�����"
--������
x204000_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204000_g_RadioItemBonus={}

--MisDescEnd
x204000_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x204000_g_MissionId)
		if x204000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204000_g_MissionName)
			AddText(sceneId,x204000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204000_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204000_g_MissionName)
		     AddText(sceneId,x204000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x204000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204000_g_ScriptId, x204000_g_MissionId)
                end

        elseif x204000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204000_g_MissionName)
                AddText(sceneId,x204000_g_MissionInfo..GetName(sceneId, selfId)..x204000_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204000_g_ScriptId, x204000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204000_g_ScriptId, x204000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==4) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x204000_g_MissionId, x204000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x204000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x204000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204000_g_MissionId)
	for i, item in pairs(x204000_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x204000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x204000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204000_g_MissionId)
		AddExp(sceneId, selfId, x204000_g_ExpBonus)
		AddMoney(sceneId, selfId, x204000_g_MoneyBonus)
		for i, item in pairs(x204000_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x204000_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x204000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204000_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x204000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x204000_g_DemandKill[1].id then 
       		    if num < x204000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x204000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204000_OnItemChanged(sceneId, selfId, itemdataId)

end

