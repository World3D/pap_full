--������

--MisDescBegin
x213007_g_ScriptId = 213007
x213007_g_MissionIdPre =151
x213007_g_MissionId = 152
x213007_g_MissionKind = 24
x213007_g_MissionLevel = 125
x213007_g_ScriptIdNext = {ScriptId = 213008 ,LV = 1 }
x213007_g_Name	="�ζ�" 
x213007_g_DemandItem ={}
x213007_g_DemandKill ={{id=393,num=15}}

x213007_g_MissionName="������"
x213007_g_MissionInfo="    ����ɯ�����ϵĵֿ��Ѿ���΢�����ϱ������Ÿ�����һЩ�����������ڵֿ����Ҳ������ҵ�սʿ�ڵ��˵ļ����³�档��ʿ����ȥ���ҽ����15��#R����������#W��ɨ�����ǵĵ�·��"  --��������
x213007_g_MissionTarget="    ����#G�ζ�#Wɱ��15��#R����������#W��"		                                                                                               
x213007_g_MissionComplete="    ���ĺã��ҿ������ҵ�սʿ����ˡ�"					--�������npc˵���Ļ�
x213007_g_ContinueInfo="    ���óȻ���Ļ�����Щ���ֻ��������ɴ���������"
--������
x213007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x213007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x213007_g_RadioItemBonus={}

--MisDescEnd
x213007_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x213007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x213007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x213007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x213007_g_MissionId)
		if x213007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x213007_g_MissionName)
			AddText(sceneId,x213007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x213007_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x213007_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x213007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x213007_g_MissionName)
		     AddText(sceneId,x213007_g_MissionComplete)
		     AddMoneyBonus(sceneId, x213007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x213007_g_ScriptId, x213007_g_MissionId)
                end

        elseif x213007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x213007_g_MissionName)
                AddText(sceneId,x213007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x213007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x213007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x213007_g_ScriptId, x213007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x213007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x213007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x213007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x213007_g_ScriptId, x213007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x213007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x213007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x213007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==13) then
		if IsMissionHaveDone(sceneId, selfId, x213007_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x213007_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x213007_g_MissionId, x213007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x213007_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x213007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x213007_g_MissionId)
	for i, item in pairs(x213007_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x213007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x213007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x213007_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x213007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x213007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x213007_g_MissionId)
		AddExp(sceneId, selfId, x213007_g_ExpBonus)
		AddMoney(sceneId, selfId, x213007_g_MoneyBonus)
		for i, item in pairs(x213007_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x213007_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x213007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x213007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x213007_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x213007_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x213007_g_DemandKill[1].id then 
       		    if num < x213007_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x213007_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x213007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x213007_OnItemChanged(sceneId, selfId, itemdataId)

end

