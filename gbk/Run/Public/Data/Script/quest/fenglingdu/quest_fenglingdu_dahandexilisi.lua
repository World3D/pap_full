--�󺹵�ϴ����

--MisDescBegin
x212012_g_ScriptId = 212012
x212012_g_MissionIdPre =258
x212012_g_MissionId = 259
x212012_g_MissionKind = 17
x212012_g_MissionLevel = 70
--x212012_g_ScriptIdNext = {ScriptId = 212011 ,LV = 1 }
x212012_g_Name	="�𴦻�"
x212012_g_Name2	="����̨" 
x212012_g_Name3	="����"
x212012_g_Name4	="Ү�ɳ���"
x212012_g_DemandItem ={}
x212012_g_noDemandItem ={{id=13010056,num=1},{id=13010057,num=1},{id=13010058,num=1}}
--x212012_g_noDemandKill ={{id=301,num=1}}	

x212012_g_MissionName="�󺹵�ϴ����"
x212012_g_MissionInfo="    ���Ǵ󺹸�����̨�����׺�Ү�ɳ��ĵ��ţ��鷳����ŷֱ𽻸��������ˡ�"  --��������
x212012_g_MissionTarget="    �������ŷֱ��͵�#G����̨#W��#G����#W��#GҮ�ɳ���#W���"		
x212012_g_MissionComplete="    �ܸ�л������ġ�"
x212012_g_ContinueInfo="    �Ŷ��͹�ȥ����"
x212012_g_ContinueInfo2="    ��������ô˵���Ҿͷ����ˡ�"
--������
x212012_g_MoneyBonus = 200
--�̶���Ʒ���������8��
x212012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212012_g_RadioItemBonus={}

--MisDescEnd
x212012_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x212012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212012_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x212012_g_MissionId)
		if (GetName(sceneId,targetId)==x212012_g_Name) then
			if x212012_CheckSubmit(sceneId, selfId, targetId) <= 0 then
				BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x212012_g_MissionName)
				AddText(sceneId,x212012_g_ContinueInfo)
				AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x212012_g_MissionTarget) 
				AddText(sceneId,format("\n    �Ѵ󺹵����͸�����̨   %d/1\n    �Ѵ󺹵����͸�����   %d/1\n    �Ѵ󺹵����͸�Ү�ɳ���   %d/1", GetMissionParam(sceneId,selfId,misIndex,0), GetMissionParam(sceneId,selfId,misIndex,1), GetMissionParam(sceneId,selfId,misIndex,2) ))
		     		EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
			if x212012_CheckSubmit(sceneId, selfId, targetId) > 0 then
				BeginEvent(sceneId)
                     		AddText(sceneId,"#Y"..x212012_g_MissionName)
		     		AddText(sceneId,x212012_g_MissionComplete)
		     		AddMoneyBonus(sceneId, x212012_g_MoneyBonus)
		     		EndEvent()
                     		DispatchMissionContinueInfo(sceneId, selfId, targetId, x212012_g_ScriptId, x212012_g_MissionId)    			
			end
	        elseif (GetName(sceneId,targetId)==x212012_g_Name2) then
	        	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212012_g_MissionName)
			AddText(sceneId,x212012_g_ContinueInfo2)
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			BeginEvent(sceneId)
			AddText(sceneId,format("�Ѵ󺹵����͸�����̨   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     	EndEvent()
		     	DispatchMissionTips(sceneId, selfId)
		     	DelItem(sceneId, selfId, x212012_g_noDemandItem[1].id, x212012_g_noDemandItem[1].num)
		elseif (GetName(sceneId,targetId)==x212012_g_Name3) then
	        	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212012_g_MissionName)
			AddText(sceneId,x212012_g_ContinueInfo2)
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			SetMissionByIndex(sceneId,selfId,misIndex,1,1)
			BeginEvent(sceneId)
			AddText(sceneId,format("�Ѵ󺹵����͸�����   %d/1", GetMissionParam(sceneId,selfId,misIndex,1) ))
		     	EndEvent()
		     	DispatchMissionTips(sceneId, selfId)
		     	DelItem(sceneId, selfId, x212012_g_noDemandItem[2].id, x212012_g_noDemandItem[2].num)
		elseif (GetName(sceneId,targetId)==x212012_g_Name4) then
	        	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212012_g_MissionName)
			AddText(sceneId,x212012_g_ContinueInfo2)
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			SetMissionByIndex(sceneId,selfId,misIndex,2,1)
			BeginEvent(sceneId)
			AddText(sceneId,format("�Ѵ󺹵����͸�Ү�ɳ���   %d/1", GetMissionParam(sceneId,selfId,misIndex,2) ))
		     	EndEvent()
		     	DispatchMissionTips(sceneId, selfId)
		     	DelItem(sceneId, selfId, x212012_g_noDemandItem[3].id, x212012_g_noDemandItem[3].num)
		end
		
                    
                

        elseif x212012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212012_g_MissionName)
                AddText(sceneId,x212012_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212012_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x212012_g_ScriptId, x212012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212012_g_ScriptId, x212012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212012_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==12) then
        	if IsMissionHaveDone(sceneId, selfId, x212012_g_MissionIdPre) > 0 then
        	misIndex = GetMissionIndexByID(sceneId,selfId,x212012_g_MissionId)
        		if (GetName(sceneId,targetId)==x212012_g_Name) then
	        	            	return 1
	        	end
			if (GetName(sceneId,targetId)==x212012_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x212012_g_MissionId) > 0 then
				    		if GetMissionParam(sceneId,selfId,misIndex,0) == 0 then
				    			return 1
				    		end
	        	            end
	        	end
	        	if (GetName(sceneId,targetId)==x212012_g_Name3) then
				    if IsHaveMission(sceneId,selfId, x212012_g_MissionId) > 0 then
				    		if GetMissionParam(sceneId,selfId,misIndex,1) == 0 then
				    			return 1
				    		end
	        	            end
	        	end
	        	if (GetName(sceneId,targetId)==x212012_g_Name4) then
				    if IsHaveMission(sceneId,selfId, x212012_g_MissionId) > 0 then
				    		if GetMissionParam(sceneId,selfId,misIndex,2) == 0 then
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

function x212012_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId) 
	for i, item in x212012_g_noDemandItem do                                                   
	AddItem( sceneId,item.id, item.num ) 
	end            
	ret = EndAddItem(sceneId,selfId)                                 
	if ret > 0 then                                                  
	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x212012_g_MissionId, x212012_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x212012_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		AddItemListToHuman(sceneId,selfId)
	else                                                             
		BeginEvent(sceneId)                                      
		AddText(sceneId,"��Ʒ����������������������")                    
		EndEvent(sceneId)                                        
		DispatchMissionTips(sceneId,selfId)                      
	end  
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x212012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212012_g_MissionId)
	for i, item in x212012_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212012_CheckSubmit( sceneId, selfId, targetId)

	misIndex = GetMissionIndexByID(sceneId,selfId,x212012_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
		if GetMissionParam(sceneId,selfId,misIndex,1) == 1 then
			if GetMissionParam(sceneId,selfId,misIndex,2) == 1 then
	        		return 1
			end
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212012_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x212012_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212012_g_MissionId)
		AddExp(sceneId, selfId, x212012_g_ExpBonus)
		AddMoney(sceneId, selfId, x212012_g_MoneyBonus)
		for i, item in x212012_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x212012_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x212012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x212012_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x212012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212012_OnItemChanged(sceneId, selfId, itemdataId)

end

