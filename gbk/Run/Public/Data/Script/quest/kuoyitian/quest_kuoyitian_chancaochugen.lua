--ն�ݳ���

--MisDescBegin
x214006_g_ScriptId = 214006
--x214006_g_MissionIdPre =41
x214006_g_MissionId = 113
x214006_g_MissionKind = 3
x214006_g_MissionLevel = 15
--x214006_g_ScriptIdNext = {ScriptId = 204001 ,LV = 1 }
x214006_g_Name	="����̳" 
x214006_g_DemandItem ={}
x214006_g_DemandKill ={{id=361,num=10}}

x214006_g_MissionName="ն�ݳ���"
x214006_g_MissionInfo="    �ͼ���������������͵Ϯ�����ǣ���������ľ������ӣ����ڣ���Щ�б��ܽ���Ͷ������ľ�ϡ�\n \n    ���ǰ������꣬�ǲ���õ����²صģ�"  --��������
x214006_g_MissionInfo2="������Ҫ���ݳ��������ܷŹ����ǣ����Ǿͼ�����e����"
x214006_g_MissionTarget="    ����������Ͷ������ľ�ϣ����Ǽ�����e��һ����#G����̳#W����Ҫ��ȥɱ��10��#R��������ʿ#W��"		                                                                                               
x214006_g_MissionComplete="    �ܸ����ܿ����㰲ȫ�Ļ�����"					--�������npc˵���Ļ�
x214006_g_ContinueInfo="    ��Ҫ�Ź��������ˣ�����Ҫ���ǵ���ͷ��"
--������
x214006_g_MoneyBonus = 200
--�̶���Ʒ���������8��
x214006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214006_g_RadioItemBonus={}

--MisDescEnd
x214006_g_ExpBonus = 1500
--**********************************

--������ں���

--**********************************

function x214006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214006_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x214006_g_MissionId)
		if x214006_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x214006_g_MissionName)
			AddText(sceneId,x214006_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x214006_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����������ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214006_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x214006_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x214006_g_MissionName)
		     AddText(sceneId,x214006_g_MissionComplete)
		     AddMoneyBonus(sceneId, x214006_g_MoneyBonus)	
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214006_g_ScriptId, x214006_g_MissionId)
                end

        elseif x214006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214006_g_MissionName)
                AddText(sceneId,x214006_g_MissionInfo..GetName(sceneId, selfId)..x214006_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214006_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214006_g_ScriptId, x214006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214006_g_ScriptId, x214006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214006_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==14) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x214006_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x214006_g_MissionId, x214006_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x214006_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x214006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214006_g_MissionId)
	for i, item in pairs(x214006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214006_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x214006_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x214006_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214006_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x214006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x214006_g_MissionId)
		AddExp(sceneId, selfId, x214006_g_ExpBonus)
		AddMoney(sceneId, selfId, x214006_g_MoneyBonus)
		for i, item in pairs(x214006_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x214006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x214006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x214006_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x214006_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x214006_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x214006_g_DemandKill[1].id then 
       		    if num < x214006_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����������ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214006_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x214006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214006_OnItemChanged(sceneId, selfId, itemdataId)

end

