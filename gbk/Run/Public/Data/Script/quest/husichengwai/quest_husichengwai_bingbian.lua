--����

--MisDescBegin
x204011_g_ScriptId = 204011
--x204011_g_MissionIdPre =41
x204011_g_MissionId = 106
x204011_g_MissionKind = 9
x204011_g_MissionLevel = 45
x204011_g_IsMissionOkFail = 2
x204011_g_IfMissionElite = 0
--x204011_g_ScriptIdNext = {ScriptId = 204001 ,LV = 1 }
x204011_g_Name	="�ٲ�̨" 
x204011_g_DemandItem ={}
x204011_g_DemandKill ={{id=355,num=15}}

x204011_g_MissionName="����"
x204011_g_MissionInfo="    ս���ı仯����Ī�⣬�ովʹ�������Ϣ�������ɵľ��Ӵ���͵Ϯ���ǵ�פ�ء�\n \n    ������ǲ���Ѿ�͵͵���ʺ��Ÿ����ˣ�"  --��������
x204011_g_MissionInfo2="���������ǵ�ǰ��棬��������������ʺ����ϵ�#R���ɾ���#W��"
x204011_g_MissionTarget="    #G�ٲ�̨#WҪ������15���ʺ����ϵ�#R���ɾ���#W��"		                                                                                               
x204011_g_MissionComplete="    ���ĺܺá�"					--�������npc˵���Ļ�
x204011_g_ContinueInfo="    ������ǲ������"
--������
x204011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204011_g_RadioItemBonus={}

--MisDescEnd
x204011_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x204011_g_MissionId)
		if x204011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204011_g_MissionName)
			AddText(sceneId,x204011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����ɾ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204011_g_MissionName)
		     AddText(sceneId,x204011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x204011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204011_g_ScriptId, x204011_g_MissionId)
                end

        elseif x204011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204011_g_MissionName)
                AddText(sceneId,x204011_g_MissionInfo..GetName(sceneId, selfId)..x204011_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204011_g_ScriptId, x204011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204011_g_ScriptId, x204011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==4) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x204011_g_MissionId, x204011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x204011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x204011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204011_g_MissionId)
	for i, item in x204011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x204011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x204011_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204011_g_MissionId)
		AddExp(sceneId, selfId, x204011_g_ExpBonus)
		AddMoney(sceneId, selfId, x204011_g_MoneyBonus)
		for i, item in x204011_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x204011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x204011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x204011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x204011_g_DemandKill[1].id then 
       		    if num < x204011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����ɾ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x204011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204011_OnItemChanged(sceneId, selfId, itemdataId)

end

