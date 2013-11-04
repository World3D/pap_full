--׷ɱɣ��

--MisDescBegin
x202003_g_ScriptId = 202003
x202003_g_MissionIdPre =121
x202003_g_MissionId = 122
x202003_g_MissionKind = 4
x202003_g_MissionLevel = 20
--x202003_g_ScriptIdNext = {ScriptId = 202004 ,LV = 1 }
x202003_g_Name	="��ľ��"
x202003_g_DemandItem ={}
x202003_g_DemandKill ={{id=369,num=1}}

x202003_g_MissionName="׷ɱɣ��"
x202003_g_MissionInfo="    ��ħռ����#Rɣ��#W���ģ��ɱ��������Ļ��ۣ������������ⳡս����ɱ���ҵ����������˲��\n \n    ���Գ���������巢�ģ�һ��Ҫ�ֻع�����Ҫ�����Ǹ������ۣ�\n \n    ɣ�����������ķ������ˣ�������ͼ�ٴξۼ������������ǣ��Ҿ����������óѣ�"  --��������
x202003_g_MissionInfo2="�������ҵ����������������ȥ��������"
x202003_g_MissionTarget="    #G��ľ��#W���㵽����������ɱ��#Rɣ��#W��"		                                                                                               
x202003_g_MissionComplete="    ��������ǵĴ��ۡ�"					--�������npc˵���Ļ�
x202003_g_ContinueInfo="    ɣ���Ǹ���������Ҫɱ������"
--������
x202003_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202003_g_RadioItemBonus={}

--MisDescEnd
x202003_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202003_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x202003_g_MissionId)
		if x202003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202003_g_MissionName)
			AddText(sceneId,x202003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202003_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��ɣ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202003_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x202003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202003_g_MissionName)
		     AddText(sceneId,x202003_g_MissionComplete)
		     AddMoneyBonus(sceneId, x202003_g_MoneyBonus)
                     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202003_g_ScriptId, x202003_g_MissionId)
                end

        elseif x202003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202003_g_MissionName)
                AddText(sceneId,x202003_g_MissionInfo..GetName(sceneId, selfId)..x202003_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202003_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202003_g_ScriptId, x202003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202003_g_ScriptId, x202003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202003_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==2) then
		if IsMissionHaveDone(sceneId, selfId, x202003_g_MissionIdPre) > 0 then
					return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202003_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x202003_g_MissionId, x202003_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x202003_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x202003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202003_g_MissionId)
	for i, item in x202003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202003_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202003_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x202003_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202003_g_MissionId)
		AddExp(sceneId, selfId, x202003_g_ExpBonus)
		AddMoney(sceneId, selfId, x202003_g_MoneyBonus)
		for i, item in x202003_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x202003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x202003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x202003_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x202003_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x202003_g_DemandKill[1].id then 
       		    if num < x202003_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��ɣ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202003_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x202003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202003_OnItemChanged(sceneId, selfId, itemdataId)

end

