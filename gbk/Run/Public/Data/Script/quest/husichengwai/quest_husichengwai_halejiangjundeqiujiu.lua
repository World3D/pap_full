--���ս��������

--MisDescBegin
x204004_g_ScriptId = 204004
--x204004_g_MissionIdPre =84
x204004_g_MissionId = 99
x204004_g_MissionKind = 9
x204004_g_MissionLevel = 45
x204004_g_ScriptIdNext = {ScriptId = 204005 ,LV = 1 }
x204004_g_Name	="�ܱ�"
x204004_g_Name2	="�����ʺ�"  
x204004_g_DemandItem ={}
x204004_g_DemandKill ={{id=350,num=20}}

x204004_g_MissionName="���ս��������"
x204004_g_MissionInfo="    ���������ŵ�����ţ����������ɹ��մ󽫾����š�\n \n    ��λ������Ҫ���ǰ�æ������Ү��ֱ�������ڻʹ����������գ�������������ʵ��ϣ�������ܰ����ҳ����࣬�Ʒ���������Ȩ�����ɺ��ɹ������޺á�\n \n    "  --��������
x204004_g_MissionInfo2="����Ҫ�������������˰���ȥ������£����ɹ����Ĵ����ʺ�;�ס�ڽ��봦��������Ҳ�����������\n \n    ����������ܲ�����ô���׾ͼ�������һ��Ҫ������ػ�������20��#R��͢����#W��"
x204004_g_MissionTarget="    ɱ��20�����봦��#R��͢����#W��Ȼ������#G�����ʺ�#W��������û�й������ɹ���Ү��ֱ֮����������"		                                                                                               
x204004_g_MissionComplete="    һ���ˣ������������ˣ�"					--�������npc˵���Ļ�
x204004_g_ContinueInfo="    ��Щ���������Աߡ�"
--������
x204004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204004_g_RadioItemBonus={}

--MisDescEnd
x204004_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204004_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x204004_g_MissionId)
		if x204004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204004_g_MissionName)
			AddText(sceneId,x204004_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204004_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����͢����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204004_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204004_g_MissionName)
		     AddText(sceneId,x204004_g_MissionComplete)
		     AddMoneyBonus(sceneId, x204004_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204004_g_ScriptId, x204004_g_MissionId)
                end

        elseif x204004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204004_g_MissionName)
                AddText(sceneId,x204004_g_MissionInfo..GetName(sceneId, selfId)..x204004_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204004_g_ScriptId, x204004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204004_g_ScriptId, x204004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204004_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==4) then
			if (GetName(sceneId,targetId)==x204004_g_Name) then 
				if IsHaveMission(sceneId,selfId, x204004_g_MissionId) <= 0 then
        	    			return 1
        	    		end
        	    	end
        	    	if (GetName(sceneId,targetId)==x204004_g_Name2) then 
				if IsHaveMission(sceneId,selfId, x204004_g_MissionId) > 0 then
        	    			return 1
        	    		end
        	    	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204004_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x204004_g_MissionId, x204004_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x204004_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x204004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204004_g_MissionId)
	for i, item in x204004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204004_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x204004_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x204004_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204004_g_MissionId)
		AddExp(sceneId, selfId, x204004_g_ExpBonus)
		AddMoney(sceneId, selfId, x204004_g_MoneyBonus)
		for i, item in x204004_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x204004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x204004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204004_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204004_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x204004_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x204004_g_DemandKill[1].id then 
       		    if num < x204004_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����͢����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204004_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x204004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204004_OnItemChanged(sceneId, selfId, itemdataId)

end

