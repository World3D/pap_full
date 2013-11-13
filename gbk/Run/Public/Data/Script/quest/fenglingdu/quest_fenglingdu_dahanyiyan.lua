--������

--MisDescBegin
x212003_g_ScriptId = 212003
x212003_g_MissionIdPre =249
x212003_g_MissionId = 250
x212003_g_MissionKind = 17
x212003_g_MissionLevel = 70
--x212003_g_ScriptIdNext = {ScriptId = 201003 ,LV = 1 }
x212003_g_Name	="�ɼ�˼��" 
x212003_g_Name2	="����" 
x212003_g_DemandItem ={}
x212003_g_DemandKill ={{id=423,num=1}}

x212003_g_MissionName="������"
x212003_g_MissionInfo="    ������������������ң����ܲ��ã��Ҿ�Ҫ��ȥ��\n \n    ��������ˣ���Ҫ��ɥ���ٰ����ýе��˲�֪�����Ѿ���ȥ���������Թ�����������\n \n    �����ǲ�������ҲҪ�ȿ�������������"  --��������
x212003_g_MissionInfo2="��ɱ�����ĵĻʵ�#R�#W��Ȼ���ҵ��ҵ�����#G����#W���Һ����ټ�������"
x212003_g_MissionTarget="    ��ɼ�˼��ɱ��#G������Ӫ#W�������Ĺ���#R�#W���֪#G����#W�ɼ�˼���Ľ�����"		                                                                                               
x212003_g_MissionComplete="    �����������µģ�лл��İ�æ��"					--�������npc˵���Ļ�
x212003_g_ContinueInfo="    ����������������㶼��������"
--������
x212003_g_MoneyBonus = 500
--�̶���Ʒ���������8��
x212003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212003_g_RadioItemBonus={}
--MisDescEnd
x212003_g_ExpBonus = 4000

--**********************************

--������ں���

--**********************************

function x212003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212003_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x212003_g_MissionId)
		if x212003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212003_g_MissionName)
			AddText(sceneId,x212003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x212003_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x212003_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x212003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x212003_g_MissionName)
		     AddText(sceneId,x212003_g_MissionComplete)
		     AddMoneyBonus(sceneId, x212003_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x212003_g_ScriptId, x212003_g_MissionId)
                end

        elseif x212003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212003_g_MissionName)
                AddText(sceneId,x212003_g_MissionInfo..GetName(sceneId, selfId)..x212003_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212003_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x212003_g_ScriptId, x212003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212003_g_ScriptId, x212003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212003_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==12) then
		if IsMissionHaveDone(sceneId, selfId, x212003_g_MissionIdPre) > 0 then
	         	if (GetName(sceneId,targetId)==x212003_g_Name) then 
	         		if IsHaveMission(sceneId,selfId, x212003_g_MissionId) <= 0 then
        			    	return 1
        			end
        		end
        		if (GetName(sceneId,targetId)==x212003_g_Name2) then 
	         		if IsHaveMission(sceneId,selfId, x212003_g_MissionId) > 0 then
        			    	return 1
        			end
        		end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x212003_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x212003_g_MissionId, x212003_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x212003_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x212003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212003_g_MissionId)
	for i, item in pairs(x212003_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212003_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x212003_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x212003_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x212003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212003_g_MissionId)
		AddExp(sceneId, selfId, x212003_g_ExpBonus)
		AddMoney(sceneId, selfId, x212003_g_MoneyBonus)
		for i, item in pairs(x212003_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x212003_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x212003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x212003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x212003_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x212003_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x212003_g_DemandKill[1].id then 
       		    if num < x212003_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x212003_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x212003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212003_OnItemChanged(sceneId, selfId, itemdataId)

end

