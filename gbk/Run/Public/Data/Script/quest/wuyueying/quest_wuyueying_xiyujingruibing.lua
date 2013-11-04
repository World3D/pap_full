--���羫���

--MisDescBegin
x217001_g_ScriptId = 217001
x217001_g_MissionIdPre =172
x217001_g_MissionId = 173
x217001_g_MissionKind = 6
x217001_g_MissionLevel = 30
x217001_g_ScriptIdNext = {ScriptId = 217002 ,LV = 1 }
x217001_g_Name	="�ܱ�" 
x217001_g_DemandItem ={}
x217001_g_DemandKill ={{id=451,num=20}}

x217001_g_MissionName="���羫���"
x217001_g_MissionInfo="    ����������Ӫ��ս�۷ǳ�����Ҫ�����ǽ���ڻ������ĵط���Ҳ�ǹ�����ɳ��Ψһ��ͻ�ƿڣ�\n \n    ������Ԯ����֮ǰ������Ҫ��Ѹ�ײ����ڶ����ٶ�ռ������ط���\n \n    "  --��������
x217001_g_MissionInfo2="�����ǵ�һ��Ҫ���ģ�����������פ��#G����#W���Ƕ�#R����Ӫ�����#W����ϣ�����ܻ��Ż�����"
x217001_g_MissionTarget="    #G�ܱ�#WҪ������#G����#W��20��#R����Ӫ�����#W��"		                                                                                               
x217001_g_MissionComplete="    �ǵģ���Ҫ�ľ�����������Ӣ�µ�սʿ��������·�ϣ�����һ�𲢼�ɱ�С�"					--�������npc˵���Ļ�
x217001_g_ContinueInfo="    ��������ĺ��������������������ȥ����������"
--������
x217001_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x217001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217001_g_RadioItemBonus={}

--MisDescEnd
x217001_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x217001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217001_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x217001_g_MissionId)
		if x217001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x217001_g_MissionName)
			AddText(sceneId,x217001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x217001_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������Ӫ�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217001_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x217001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217001_g_MissionName)
		     AddText(sceneId,x217001_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217001_g_ScriptId, x217001_g_MissionId)
                end

        elseif x217001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217001_g_MissionName)
                AddText(sceneId,x217001_g_MissionInfo..GetName(sceneId, selfId)..x217001_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217001_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217001_g_ScriptId, x217001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217001_g_ScriptId, x217001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217001_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==20) then
		if IsMissionHaveDone(sceneId, selfId, x217001_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217001_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x217001_g_MissionId, x217001_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x217001_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x217001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217001_g_MissionId)
	for i, item in x217001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217001_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217001_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x217001_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217001_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x217001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217001_g_MissionId)
		AddExp(sceneId, selfId, x217001_g_ExpBonus)
		AddMoney(sceneId, selfId, x217001_g_MoneyBonus)
		for i, item in x217001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x217001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x217001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217001_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217001_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x217001_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x217001_g_DemandKill[1].id then 
       		    if num < x217001_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������Ӫ�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217001_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x217001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217001_OnItemChanged(sceneId, selfId, itemdataId)

end

