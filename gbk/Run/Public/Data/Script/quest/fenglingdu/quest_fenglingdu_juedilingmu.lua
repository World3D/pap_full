--������Ĺ

--MisDescBegin
x212004_g_ScriptId = 212004
--x212004_g_MissionIdPre =41
x212004_g_MissionId = 251
x212004_g_MissionKind = 17
x212004_g_MissionLevel = 70
--x212004_g_ScriptIdNext = {ScriptId = 201001 ,LV = 1 }
x212004_g_Name	="����" 
x212004_g_DemandItem ={}
x212004_g_DemandKill ={{id=424,num=20}}

x212004_g_MissionName="������Ĺ"
x212004_g_MissionInfo="    ����Ҫ���������顭�����������Ǻܻ��ܵ����飬����ľ�������壬˭������˵�������ʺ�Ҳ���ܣ�\n \n    ������������ң�����¾ͽ������ˣ�����Ҫ�ҵ�һ����ˮ���أ�����ط�һ��Ҫ�����ء����������Ǹ�������������ȥ���ֵ�������ġ�\n \n    ������һ�����أ�����#G����ɿ�#W���ϴ������ﻹ��һ�ɽ����"  --��������
x212004_g_MissionInfo2="��ɱ�����ǣ���Ҫ�����κλ�ڡ�"
x212004_g_MissionTarget="    #G����#WҪ�㵽#G����ɿ�#W���ϴ�ɱ��#R���ʿ��#W����Ҫ�����κλ�ڡ�"		                                                                                               
x212004_g_MissionComplete="    �����Գ���������巢�ģ��������Զ��Ҫ�������ᡣ"					--�������npc˵���Ļ�
x212004_g_ContinueInfo="    ���ܵ����飬������̫����֪����"
--������
x212004_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x212004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212004_g_RadioItemBonus={}

--MisDescEnd
x212004_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x212004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212004_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x212004_g_MissionId)
		if x212004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212004_g_MissionName)
			AddText(sceneId,x212004_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x212004_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x212004_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x212004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x212004_g_MissionName)
		     AddText(sceneId,x212004_g_MissionComplete)
		     AddMoneyBonus(sceneId, x212004_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x212004_g_ScriptId, x212004_g_MissionId)
                end

        elseif x212004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212004_g_MissionName)
                AddText(sceneId,x212004_g_MissionInfo..GetName(sceneId, selfId)..x212004_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212004_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x212004_g_ScriptId, x212004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212004_g_ScriptId, x212004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212004_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==12) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x212004_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x212004_g_MissionId, x212004_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x212004_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x212004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212004_g_MissionId)
	for i, item in pairs(x212004_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212004_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x212004_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x212004_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212004_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x212004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212004_g_MissionId)
		AddExp(sceneId, selfId, x212004_g_ExpBonus)
		AddMoney(sceneId, selfId, x212004_g_MoneyBonus)
		for i, item in pairs(x212004_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x212004_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x212004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x212004_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x212004_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x212004_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x212004_g_DemandKill[1].id then 
       		    if num < x212004_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x212004_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x212004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212004_OnItemChanged(sceneId, selfId, itemdataId)

end

