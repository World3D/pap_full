--���𴬷�

--MisDescBegin
x223006_g_ScriptId = 223006
x223006_g_MissionIdPre =297
x223006_g_MissionId = 298
x223006_g_MissionKind = 20
x223006_g_MissionLevel = 100
x223006_g_ScriptIdNext = {ScriptId = 223007 ,LV = 1 }
x223006_g_Name	="����" 
x223006_g_DemandItem ={}
x223006_g_DemandKill ={{id=443,num=20}}

x223006_g_MissionName="���𴬷�"
x223006_g_MissionInfo="    ������ǵ���÷���������Ҫ���������������ϣ������һ��ϣ�������ܸ����ǡ�\n \n    "  --��������
x223006_g_MissionInfo2="���������ҵ���˼��ɱ����Щ#R�ղ촬��#W�������Ǽ���ȥ�ɡ�"
x223006_g_MissionTarget="    ��#G�����Ӻ���#Wȥɱ��20��#R�ղ촬��#W��"		                                                                                               
x223006_g_MissionComplete="    ��Щ�ղ���ʵ��̫�����ˣ����������ǲ�ԭ�������ţ�Ҳ��һ�ٰ����Ǽ���"					--�������npc˵���Ļ�
x223006_g_ContinueInfo="    һ��Ҫɱ����Щ���򣬲���������һ����ᣡ"
--������
x223006_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x223006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223006_g_RadioItemBonus={}

--MisDescEnd
x223006_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x223006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223006_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x223006_g_MissionId)
		if x223006_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223006_g_MissionName)
			AddText(sceneId,x223006_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223006_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���ղ촬��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223006_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x223006_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223006_g_MissionName)
		     AddText(sceneId,x223006_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223006_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223006_g_ScriptId, x223006_g_MissionId)
                end

        elseif x223006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223006_g_MissionName)
                AddText(sceneId,x223006_g_MissionInfo..GetName(sceneId, selfId)..x223006_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223006_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223006_g_ScriptId, x223006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223006_g_ScriptId, x223006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223006_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==17) then
		if IsMissionHaveDone(sceneId, selfId, x223006_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x223006_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x223006_g_MissionId, x223006_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x223006_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x223006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223006_g_MissionId)
	for i, item in pairs(x223006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223006_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223006_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x223006_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223006_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x223006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223006_g_MissionId)
		AddExp(sceneId, selfId, x223006_g_ExpBonus)
		AddMoney(sceneId, selfId, x223006_g_MoneyBonus)
		for i, item in pairs(x223006_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x223006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x223006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223006_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x223006_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x223006_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x223006_g_DemandKill[1].id then 
       		    if num < x223006_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ղ촬��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223006_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x223006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x223006_OnItemChanged(sceneId, selfId, itemdataId)

end

