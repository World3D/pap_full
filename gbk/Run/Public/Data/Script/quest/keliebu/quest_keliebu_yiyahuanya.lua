--��������

--MisDescBegin
x202000_g_ScriptId = 202000
--x202000_g_MissionIdPre =41
x202000_g_MissionId = 119
x202000_g_MissionKind = 4
x202000_g_MissionLevel = 20
x202000_g_ScriptIdNext = {ScriptId = 202001 ,LV = 1 }
x202000_g_Name	="��ľ��" 
x202000_g_DemandItem ={}
x202000_g_DemandKill ={{id=367,num=20}}

x202000_g_MissionName="��������"
x202000_g_MissionInfo="    ������������������Ҳ��������������ҳ����������������Ǿ���ȴ͵͵�����ˣ�����������������Ը����ǡ�\n \n    ���ǲ���������������ȥ�������ߣ�����Ҳ�ߣ�"  --��������
x202000_g_MissionInfo2="������ɳ��һ�������ſ��Ҳ���һ֧���������ڵ��ſ����Ǻ�����������ɱ�أ��������˵����黹�ֲ������ǣ���ȥ������ɱ�ˡ�"
x202000_g_MissionTarget="    #G��ľ��#W����ɱ������ɳ�ӵ���20��#R����ʿ��#W��"		                                                                                               
x202000_g_MissionComplete="    ���úã����ǲ�ԭ��ɰ�����ʿ��"					--�������npc˵���Ļ�
x202000_g_ContinueInfo="    �������Щʿ���������"
--������
x202000_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202000_g_RadioItemBonus={}

--MisDescEnd
x202000_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x202000_g_MissionId)
		if x202000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202000_g_MissionName)
			AddText(sceneId,x202000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202000_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x202000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202000_g_MissionName)
		     AddText(sceneId,x202000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x202000_g_MoneyBonus)
                     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202000_g_ScriptId, x202000_g_MissionId)
                end

        elseif x202000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202000_g_MissionName)
                AddText(sceneId,x202000_g_MissionInfo..GetName(sceneId, selfId)..x202000_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202000_g_ScriptId, x202000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202000_g_ScriptId, x202000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==2) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x202000_g_MissionId, x202000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x202000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x202000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202000_g_MissionId)
	for i, item in x202000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x202000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202000_g_MissionId)
		AddExp(sceneId, selfId, x202000_g_ExpBonus)
		AddMoney(sceneId, selfId, x202000_g_MoneyBonus)
		for i, item in x202000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x202000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x202000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x202000_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x202000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x202000_g_DemandKill[1].id then 
       		    if num < x202000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x202000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202000_OnItemChanged(sceneId, selfId, itemdataId)

end

