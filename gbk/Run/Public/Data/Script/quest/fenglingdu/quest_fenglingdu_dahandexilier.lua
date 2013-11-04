--�󺹵�ϴ���

--MisDescBegin
x212010_g_ScriptId = 212010
x212010_g_MissionIdPre =256
x212010_g_MissionId = 257
x212010_g_MissionKind = 17
x212010_g_MissionLevel = 70
x212010_g_ScriptIdNext = {ScriptId = 212011 ,LV = 1 }
x212010_g_Name	="�𴦻�"
x212010_g_Name2	="�ɼ�˼��" 
x212010_g_DemandItem ={}
--x212010_g_noDemandKill ={{id=301,num=1}}	

x212010_g_MissionName="�󺹵�ϴ���"
x212010_g_MissionInfo="    �Ӵ󺹵�����ҿ������������ģ�����ȥ���ߴ󺹣�ֻҪ����ϧ��߸���������Щ��ʿ���ɹŹ����˻���Ӳ�ʢ�����ļ̳��˻����ɹŵĽ������ӵ��ɹ㣡"  --��������
x212010_g_MissionTarget="    ��#G�𴦻�#W�Ļ�����#G�ɼ�˼��#W������������ġ�"		
x212010_g_MissionComplete="    �������ˡ�"
x212010_g_ContinueInfo="    ���ҵĻ�ת���������"
x212010_g_ContinueInfo2="    ��������ô˵���Ҿͷ����ˡ�"
--������
x212010_g_MoneyBonus = 200
--�̶���Ʒ���������8��
x212010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212010_g_RadioItemBonus={}

--MisDescEnd
x212010_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x212010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x212010_g_MissionId)
		if (GetName(sceneId,targetId)==x212010_g_Name) then
			if x212010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
				BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x212010_g_MissionName)
				AddText(sceneId,x212010_g_ContinueInfo)
				AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x212010_g_MissionTarget) 
				AddText(sceneId,format("\n    ���ߴ��𴦻��Ļ�   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
			if x212010_CheckSubmit(sceneId, selfId, targetId) > 0 then
				BeginEvent(sceneId)
                     		AddText(sceneId,"#Y"..x212010_g_MissionName)
		     		AddText(sceneId,x212010_g_MissionComplete)
		     		AddMoneyBonus(sceneId, x212010_g_MoneyBonus)
		     		EndEvent()
                     		DispatchMissionContinueInfo(sceneId, selfId, targetId, x212010_g_ScriptId, x212010_g_MissionId)    			
			end
	        elseif (GetName(sceneId,targetId)==x212010_g_Name2) then
	        	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212010_g_MissionName)
			AddText(sceneId,x212010_g_ContinueInfo2)
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			BeginEvent(sceneId)
			AddText(sceneId,format("���ߴ��𴦻��Ļ�   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     	EndEvent()
		     	DispatchMissionTips(sceneId, selfId)
		end
		
                    
                

        elseif x212010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212010_g_MissionName)
                AddText(sceneId,x212010_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x212010_g_ScriptId, x212010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212010_g_ScriptId, x212010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212010_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==12) then
        	if IsMissionHaveDone(sceneId, selfId, x212010_g_MissionIdPre) > 0 then
        	misIndex = GetMissionIndexByID(sceneId,selfId,x212010_g_MissionId)
        		if (GetName(sceneId,targetId)==x212010_g_Name) then
	        	            	return 1
	        	end
			if (GetName(sceneId,targetId)==x212010_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x212010_g_MissionId) > 0 then
				    		if GetMissionParam(sceneId,selfId,misIndex,0) == 0 then
				    			return 1
				    		end
	        	            end
	        	end
	        end
	end
        return 0
	
end

--**********************************

--����

--**********************************

function x212010_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x212010_g_MissionId, x212010_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x212010_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x212010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212010_g_MissionId)
	for i, item in x212010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212010_CheckSubmit( sceneId, selfId, targetId)

	misIndex = GetMissionIndexByID(sceneId,selfId,x212010_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x212010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212010_g_MissionId)
		AddExp(sceneId, selfId, x212010_g_ExpBonus)
		AddMoney(sceneId, selfId, x212010_g_MoneyBonus)
		for i, item in x212010_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x212010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x212010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x212010_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x212010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212010_OnItemChanged(sceneId, selfId, itemdataId)

end

