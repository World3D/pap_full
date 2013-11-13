--�������

--MisDescBegin
x214009_g_ScriptId = 214009
x214009_g_MissionIdPre =115
x214009_g_MissionId = 116
x214009_g_MissionKind = 3
x214009_g_MissionLevel = 15
x214009_g_ScriptIdNext = {ScriptId = 214010 ,LV = 1 }
x214009_g_Name	="������" 
x214009_g_DemandItem ={}
x214009_g_DemandKill ={{id=364,num=1}}

x214009_g_MissionName="�������"
x214009_g_MissionInfo="    <������һ�������ģ�ֻ����һ������>"  --��������
x214009_g_MissionInfo2="����������Ū����ͨ��֤������������ֵ��۹⿴�ң������Ѿ�û��ʱ���������ˣ��һ���Ҫ�����һ��æ��\n \n    ��������һ���ǳ������Ĺ�����#R����#W��������C��һ������һ��Ҫ�������"
x214009_g_MissionTarget="    #G������#W������C���Ĺ�����#R����#W��"		                                                                                               
x214009_g_MissionComplete="    ������һ���ǳ�����������֡�"					--�������npc˵���Ļ�
x214009_g_ContinueInfo="    ��ܻ�������"
--������
x214009_g_MoneyBonus = 800
--�̶���Ʒ���������8��
x214009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214009_g_RadioItemBonus={}

--MisDescEnd
x214009_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x214009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214009_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x214009_g_MissionId)
		if x214009_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x214009_g_MissionName)
			AddText(sceneId,x214009_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x214009_g_MissionTarget) 
			AddText(sceneId,format("\n    ���ܻ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214009_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x214009_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x214009_g_MissionName)
		     AddText(sceneId,x214009_g_MissionComplete)
		     AddMoneyBonus(sceneId, x214009_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214009_g_ScriptId, x214009_g_MissionId)
                end

        elseif x214009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214009_g_MissionName)
                AddText(sceneId,x214009_g_MissionInfo..GetName(sceneId, selfId)..x214009_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214009_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214009_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214009_g_ScriptId, x214009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214009_g_ScriptId, x214009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214009_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==14) then
		if IsMissionHaveDone(sceneId, selfId, x214009_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x214009_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x214009_g_MissionId, x214009_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x214009_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x214009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214009_g_MissionId)
	for i, item in pairs(x214009_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214009_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x214009_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x214009_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x214009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x214009_g_MissionId)
		AddExp(sceneId, selfId, x214009_g_ExpBonus)
		AddMoney(sceneId, selfId, x214009_g_MoneyBonus)
		for i, item in pairs(x214009_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x214009_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x214009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x214009_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x214009_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x214009_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x214009_g_DemandKill[1].id then 
       		    if num < x214009_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("���ܻ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214009_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x214009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214009_OnItemChanged(sceneId, selfId, itemdataId)

end

