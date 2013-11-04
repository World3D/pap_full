--������

--MisDescBegin
x202007_g_ScriptId = 202007
x202007_g_MissionIdPre =125
x202007_g_MissionId = 126
x202007_g_MissionKind = 4
x202007_g_MissionLevel = 20
--x202007_g_ScriptIdNext = {ScriptId = 202006 ,LV = 1 }
x202007_g_Name	="ľ����"
x202007_g_DemandItem ={}
x202007_g_DemandKill ={{id=372,num=10}}

x202007_g_MissionName="������"
x202007_g_MissionInfo="    ����һ���û��ᣬ����һ��Ҫ��׼ʱ����"  --��������
x202007_g_MissionInfo2="������һ���ƻ������ǳ������ǺȾƵ�ʱ���Ȱ����Ǳ��������������͵�ߡ�\n \n    ���о������ǵ�Ӫ�ʣ����ǵı������ڶ���פ�ش����ⲻ��һ�������׵����飬����Ҫ͵͵�Ľ��С�\n \n    Ҫ���������������⣬��Ҫ�Ƚ����ЩѲ�ߵ�ʿ���������£�����Ҫ������������ʿȥ���С������ǽ���ſڵ���10��#R���ҳ��#W��"
x202007_g_MissionTarget="    ��#Gľ����#W֮���������פ�ص�10��#R���ҳ��#W��"		                                                                                               
x202007_g_MissionComplete="    ����̫���ˡ�"					--�������npc˵���Ļ�
x202007_g_ContinueInfo="    ������Щ�������"
--������
x202007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202007_g_RadioItemBonus={}

--MisDescEnd
x202007_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x202007_g_MissionId)
		if x202007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202007_g_MissionName)
			AddText(sceneId,x202007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202007_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����ҳ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202007_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x202007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202007_g_MissionName)
		     AddText(sceneId,x202007_g_MissionComplete)
		     AddMoneyBonus(sceneId, x202007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202007_g_ScriptId, x202007_g_MissionId)
                end

        elseif x202007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202007_g_MissionName)
                AddText(sceneId,x202007_g_MissionInfo..GetName(sceneId, selfId)..x202007_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202007_g_ScriptId, x202007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202007_g_ScriptId, x202007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==2) then
		if IsMissionHaveDone(sceneId, selfId, x202007_g_MissionIdPre) > 0 then
					return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202007_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x202007_g_MissionId, x202007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x202007_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x202007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202007_g_MissionId)
	for i, item in x202007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x202007_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202007_g_MissionId)
		AddExp(sceneId, selfId, x202007_g_ExpBonus)
		AddMoney(sceneId, selfId, x202007_g_MoneyBonus)
		for i, item in x202007_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x202007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x202007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x202007_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x202007_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x202007_g_DemandKill[1].id then 
       		    if num < x202007_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����ҳ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202007_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x202007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202007_OnItemChanged(sceneId, selfId, itemdataId)

end

