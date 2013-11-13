--�������

--MisDescBegin
x217000_g_ScriptId = 217000
--x217000_g_MissionIdPre =41
x217000_g_MissionId = 172
x217000_g_MissionKind = 6
x217000_g_MissionLevel = 30
x217000_g_ScriptIdNext = {ScriptId = 217001 ,LV = 1 }
x217000_g_Name	="�ܱ�" 
x217000_g_DemandItem ={}
x217000_g_DemandKill ={{id=450,num=15}}

x217000_g_MissionName="�������"
x217000_g_MissionInfo="    �����ڵȵ���һ�죬������£�Ϊ�ľ���Ѫϴ�������ĳ��裬�����κ�һ��սʿ����Ҫ�ó���ǿ����������������ٶ�ռ������Ӫ���Ӿ����¡�\n \n    Զ��������ǵĺ����Ѿ���������Ҫ����̤ƽ���ȥ���ǱߵĴ����ϡ�\n \n    �������ʿ��Ϊ�������Ӫ�ظ�����Щ�������#R����Ӫ����#W���������Ҹ�����"  --��������
x217000_g_MissionTarget="    ���Ӫ�ظ�����15��#R����Ӫ����#W��Ȼ���#G�ܱ�#W������"		                                                                                               
x217000_g_MissionComplete="    ��һΣ����������������ģ�"					--�������npc˵���Ļ�
x217000_g_ContinueInfo="    ��Щ���ַ���ʤ�������ǵ��������ʮ��ͷ�ۣ���Ҫ�Ƚ�������ǡ�"
--������
x217000_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x217000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217000_g_RadioItemBonus={}

--MisDescEnd
x217000_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x217000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x217000_g_MissionId)
		if x217000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x217000_g_MissionName)
			AddText(sceneId,x217000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x217000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������Ӫ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217000_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x217000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217000_g_MissionName)
		     AddText(sceneId,x217000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217000_g_ScriptId, x217000_g_MissionId)
                end

        elseif x217000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217000_g_MissionName)
                AddText(sceneId,x217000_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217000_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217000_g_ScriptId, x217000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217000_g_ScriptId, x217000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==20) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x217000_g_MissionId, x217000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x217000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x217000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217000_g_MissionId)
	for i, item in pairs(x217000_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x217000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217000_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x217000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217000_g_MissionId)
		AddExp(sceneId, selfId, x217000_g_ExpBonus)
		AddMoney(sceneId, selfId, x217000_g_MoneyBonus)
		for i, item in pairs(x217000_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x217000_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x217000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217000_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x217000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x217000_g_DemandKill[1].id then 
       		    if num < x217000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������Ӫ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x217000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217000_OnItemChanged(sceneId, selfId, itemdataId)

end

