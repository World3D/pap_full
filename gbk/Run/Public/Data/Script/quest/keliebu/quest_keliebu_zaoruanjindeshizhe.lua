--�������ʹ��

--MisDescBegin
x202004_g_ScriptId = 202004
--x202004_g_MissionIdPre =41
x202004_g_MissionId = 123
x202004_g_MissionKind = 4
x202004_g_MissionLevel = 20
x202004_g_ScriptIdNext = {ScriptId = 202005 ,LV = 1 }
x202004_g_Name	="����" 
x202004_g_DemandItem ={}
x202004_g_DemandKill ={{id=370,num=15}}

x202004_g_MissionName="�������ʹ��"
x202004_g_MissionInfo="    ����ʹ��ȥ�˿��Ҳ��Ѿ������ˣ����ڻ�û�л������ѵ����Ӧ�˸����Ļ������Ǹ������磿    "  --��������
x202004_g_MissionInfo2="�����ǲ��ܲ���������ʹ�ߣ�������Ϊ���ҵ����¶�ȥ�ģ��ո�����Ϣ���������Ҳ���ɣ������������ں����������Ӫ�أ�����������һ�ˣ���ֻ����Ұ���15��#R���Ҳ���������#W��ɱ�ˡ�"
x202004_g_MissionTarget="    �����������Ӫ�������ʹ�ߵĵط���#G����#WҪ���æɱ��15��#R���Ҳ���������#W��"		                                                                                               
x202004_g_MissionComplete="    �����Ѿ��ȳ���ʹ�ߡ�"					--�������npc˵���Ļ�
x202004_g_ContinueInfo="    ɱ����Щ��������"
--������
x202004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202004_g_RadioItemBonus={}

--MisDescEnd
x202004_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202004_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x202004_g_MissionId)
		if x202004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202004_g_MissionName)
			AddText(sceneId,x202004_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202004_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����Ҳ���������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202004_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x202004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202004_g_MissionName)
		     AddText(sceneId,x202004_g_MissionComplete)
		     AddMoneyBonus(sceneId, x202004_g_MoneyBonus)
                     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202004_g_ScriptId, x202004_g_MissionId)
                end

        elseif x202004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202004_g_MissionName)
                AddText(sceneId,x202004_g_MissionInfo..GetName(sceneId, selfId)..x202004_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202004_g_ScriptId, x202004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202004_g_ScriptId, x202004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202004_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==2) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202004_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x202004_g_MissionId, x202004_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x202004_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x202004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202004_g_MissionId)
	for i, item in pairs(x202004_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202004_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202004_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x202004_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202004_g_MissionId)
		AddExp(sceneId, selfId, x202004_g_ExpBonus)
		AddMoney(sceneId, selfId, x202004_g_MoneyBonus)
		for i, item in pairs(x202004_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x202004_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x202004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202004_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x202004_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x202004_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x202004_g_DemandKill[1].id then 
       		    if num < x202004_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����Ҳ���������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202004_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x202004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202004_OnItemChanged(sceneId, selfId, itemdataId)

end

