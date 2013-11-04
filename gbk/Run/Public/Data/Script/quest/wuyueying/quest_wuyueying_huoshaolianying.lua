--������Ӫ

--MisDescBegin
x217006_g_ScriptId = 217006
x217006_g_MissionIdPre =177
x217006_g_MissionId = 178
x217006_g_MissionKind = 6
x217006_g_MissionLevel = 30
--x217006_g_ScriptIdNext = {ScriptId = 217006 ,LV = 1 }
x217006_g_Name	="������"
--x217006_g_noDemandItem ={{id=13010007,num=1}}
x217006_g_DemandKill ={{id=454,num=10}}	

x217006_g_MissionName="������Ӫ"
x217006_g_MissionInfo="    ������һ��һ�������Һܸ��ˣ�ϣ�����ڽ���·�ϣ������鵽���Һ�������������壬Ϊ��������\n \n    �ǵģ�ÿ���˶�ҪΪ���ҳ�����\n \n    �ó����������ȥΪ���Ǵ��ɹŹ���ս���������ǵ�#R����ʿ��#W���ջ����ǵ����ݣ�  "  --��������
x217006_g_MissionTarget="    ��#G������#Wȥ����10��#R����ʿ��#W����ȼ���ǵ����ݣ�������#G������#W������"		
x217006_g_MissionComplete="    ��ÿ�ε��ж������Ҷ��������࿴���������������ͽ�����ߣ��Һ���ο��"					--�������npc˵���Ļ�
x217006_g_ContinueInfo="    �������ʮ����Ҫ���ҵ��������Ϣ��"
--������
x217006_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x217006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217006_g_RadioItemBonus={}

--MisDescEnd
x217006_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x217006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217006_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x217006_g_MissionId)
		if x217006_CheckSubmit(sceneId, selfId, targetId) <= 0 then
			if (GetName(sceneId,targetId)==x217006_g_Name) then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x217006_g_MissionName)
				AddText(sceneId,x217006_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x217006_g_MissionTarget) 
				AddText(sceneId,format("\n    ɱ������ʿ��   %d/%d\n    �ջ�����   %d/1", GetMissionParam(sceneId,selfId,misIndex,0),x217006_g_DemandKill[1].num, GetMissionParam(sceneId,selfId,misIndex,1) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
		end

		     
                if x217006_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217006_g_MissionName)
		     AddText(sceneId,x217006_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217006_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217006_g_ScriptId, x217006_g_MissionId)
                end

        elseif x217006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217006_g_MissionName)
                AddText(sceneId,x217006_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217006_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217006_g_ScriptId, x217006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217006_g_ScriptId, x217006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217006_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==20) then
        	 	if IsMissionHaveDone(sceneId, selfId, x217006_g_MissionIdPre) > 0 then
                    			return 1
                    	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217006_OnAccept(sceneId, selfId)

	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x217006_g_MissionId, x217006_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x217006_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	
end



--**********************************

--����

--**********************************

function x217006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217006_g_MissionId)
	for i, item in x217006_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217006_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217006_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x217006_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == 1 then
	        	return 1
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217006_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x217006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217006_g_MissionId)
		AddExp(sceneId, selfId, x217006_g_ExpBonus)
		AddMoney(sceneId, selfId, x217006_g_MoneyBonus)
		for i, item in x217006_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x217006_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x217006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217006_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217006_g_MissionId) >= 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x217006_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x217006_g_DemandKill[1].id then 
       		    if num < x217006_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217006_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x217006_OnEnterArea(sceneId, selfId, zoneId)
	

end

function x217006_OnLeaveArea(sceneId, selfId )
	
end

function x217006_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x217006_OnItemChanged(sceneId, selfId, itemdataId)

end
