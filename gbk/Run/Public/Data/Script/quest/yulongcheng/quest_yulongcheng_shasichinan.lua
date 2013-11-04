--ɱ������

--MisDescBegin
x208008_g_ScriptId = 208008
--x208008_g_MissionIdPre =58
x208008_g_MissionId = 62
x208008_g_MissionKind = 12
x208008_g_MissionLevel = 60
x208008_g_ScriptIdNext = {ScriptId = 208009 ,LV = 1 }
x208008_g_Name	="�ٲ�̨" 
x208008_g_DemandItem ={}
x208008_g_DemandKill ={{id=313,num=1},{id=314,num=15}}

x208008_g_MissionName="ɱ������"
x208008_g_MissionInfo="     ���������ã��Ҹոյõ�һ����Ϣ����ı����ɱ�������̶ӵ��ˣ���һ����#R����#W�����ӣ�����һ���������٣����Ĺ��裬��ͺ��̫�������׼���������ܡ���Ҫ�������ٶȸϵ���40��77������һ��Ҳ�������������ˡ�"  --��������
x208008_g_MissionTarget="    �ϵ���40��77����ɱ��#R����#W��15��#R���ѵ�����#W��������#G�ٲ�̨#W������"		                                                                                               
x208008_g_MissionComplete="    �ǳ��ĸ�л����Ĺ��ʹ�Ҷ��������һ���ʵ�����󺹵ġ�"					--�������npc˵���Ļ�
x208008_g_ContinueInfo="    ɱ�����������갹����ˣ�ѪծѪ����"
--������
x208008_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208008_g_RadioItemBonus={}

--MisDescEnd
x208008_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208008_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x208008_g_MissionId)
		if x208008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x208008_g_MissionName)
			AddText(sceneId,x208008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x208008_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������   %d/%d\n    ɱ�����ѵ�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x208008_g_DemandKill[1].num, GetMissionParam(sceneId,selfId,misIndex,1),x208008_g_DemandKill[2].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x208008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x208008_g_MissionName)
		     AddText(sceneId,x208008_g_MissionComplete)
		     AddMoneyBonus(sceneId, x208008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x208008_g_ScriptId, x208008_g_MissionId)
                end

        elseif x208008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208008_g_MissionName)
                AddText(sceneId,x208008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208008_g_ScriptId, x208008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208008_g_ScriptId, x208008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208008_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==8) then
		    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x208008_g_MissionId, x208008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x208008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x208008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208008_g_MissionId)
	for i, item in x208008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x208008_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == x208008_g_DemandKill[2].num then
	        	return 1
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208008_g_MissionId)
		AddExp(sceneId, selfId, x208008_g_ExpBonus)
		AddMoney(sceneId, selfId, x208008_g_MoneyBonus)
		for i, item in x208008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x208008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x208008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x208008_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x208008_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x208008_g_DemandKill[1].id then 
       		    if num < 1 then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x208008_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
        num2 = GetMissionParam(sceneId,selfId,misIndex,1) 
	 	 if objdataId == x208008_g_DemandKill[2].id then 
       		    if num2 < 15 then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num2+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����ѵ�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1) ,x208008_g_DemandKill[1].num)) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
      end  

end



--**********************************

--���������¼�

--**********************************

function x208008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208008_OnItemChanged(sceneId, selfId, itemdataId)

end

