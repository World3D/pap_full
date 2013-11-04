--���׷�

--MisDescBegin
x225010_g_ScriptId = 225010
--x225010_g_MissionIdPre =41
x225010_g_MissionId = 332
x225010_g_MissionKind = 22
x225010_g_MissionLevel = 110
--x225010_g_ScriptIdNext = {ScriptId = 225001 ,LV = 1 }
x225010_g_Name	="�ζ�" 
x225010_g_DemandItem ={}
x225010_g_DemandKill ={{id=439,num=1}}

x225010_g_MissionName="���׷�"
x225010_g_MissionInfo="    ����˵һ����Ϣ��һ������#R���׷�#W�����ڰ������������ܡ�˵ʵ������ֵͦ�þ���ģ��������Կ����ɹŵ���������ԭ�¡���ȥɱ������"  --��������
x225010_g_MissionTarget="    ��#G�ζ�#W������ȥɱ����#Gƶ���#W��#R���׷�#W��"		                                                                                               
x225010_g_MissionComplete="    �ܺã��ó�����˾����ɡ�"					--�������npc˵���Ļ�
x225010_g_ContinueInfo="    ����Ϊ�Լ��Ǿ�������"
--������
x225010_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x225010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x225010_g_RadioItemBonus={}

--MisDescEnd
x225010_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x225010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x225010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x225010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x225010_g_MissionId)
		if x225010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x225010_g_MissionName)
			AddText(sceneId,x225010_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x225010_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����׷�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225010_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x225010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x225010_g_MissionName)
		     AddText(sceneId,x225010_g_MissionComplete)
		     AddMoneyBonus(sceneId, x225010_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x225010_g_ScriptId, x225010_g_MissionId)
                end

        elseif x225010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x225010_g_MissionName)
                AddText(sceneId,x225010_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x225010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x225010_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x225010_g_ScriptId, x225010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x225010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x225010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x225010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x225010_g_ScriptId, x225010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x225010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x225010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x225010_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==16) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x225010_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x225010_g_MissionId, x225010_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x225010_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x225010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x225010_g_MissionId)
	for i, item in x225010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x225010_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x225010_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x225010_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x225010_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x225010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x225010_g_MissionId)
		AddExp(sceneId, selfId, x225010_g_ExpBonus)
		AddMoney(sceneId, selfId, x225010_g_MoneyBonus)
		for i, item in x225010_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x225010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x225010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x225010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x225010_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x225010_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x225010_g_DemandKill[1].id then 
       		    if num < x225010_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����׷�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225010_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x225010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x225010_OnItemChanged(sceneId, selfId, itemdataId)

end

