--������ʿ

--MisDescBegin
x226004_g_ScriptId = 226004
x226004_g_MissionIdPre =326
x226004_g_MissionId = 340
x226004_g_MissionKind = 23
x226004_g_MissionLevel = 115
x226004_g_ScriptIdNext = {ScriptId = 226005 ,LV = 1 }
x226004_g_Name	="����" 
x226004_g_DemandItem ={{id=13010072,num=5}}
x226004_g_noDemandKill ={{id=480,num=1}}	

x226004_g_MissionName="������ʿ"
x226004_g_MissionInfo="    ŷ���˵Ŀ���������ǵĹ�����û�а취��͸���ǡ�������ʿ��ս��û�����ף����ǵ������ְѵ��˵�ս�������ˡ�\n \n    ��Щ���׺��ص���ʿ��ˤ�ڵ��ϣ��ҿ������������������ѡ�ȥ��ɱ���ǰɣ������ǵ�ͷ����������"  --��������
x226004_g_MissionTarget="    ��ɱ��Щ#R������ʿ#W����5����ʿͷ����#G����#W��������"		
x226004_g_MissionComplete="    ��ô�ص�ͷ�������������ܴ�����"					--�������npc˵���Ļ�
x226004_g_ContinueInfo="    �ǵð�ͷ���е��˵�ͷ�ó������ҿɲ���Ҫ�����ǵ�������"
--������
x226004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x226004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x226004_g_RadioItemBonus={}

--MisDescEnd
x226004_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x226004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x226004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x226004_g_MissionId) > 0 then
		if x226004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x226004_g_MissionName)
			AddText(sceneId,x226004_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x226004_g_MissionTarget) 
			AddText(sceneId,format("\n    ��ʿͷ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x226004_g_DemandItem[1].id),x226004_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x226004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x226004_g_MissionName)
		     AddText(sceneId,x226004_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x226004_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x226004_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x226004_g_ScriptId, x226004_g_MissionId)
                end

        elseif x226004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x226004_g_MissionName)
                AddText(sceneId,x226004_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x226004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x226004_g_MoneyBonus)
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x226004_g_ScriptId, x226004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x226004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x226004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x226004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x226004_g_ScriptId, x226004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x226004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x226004_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==22) then
        	--if IsMissionHaveDone(sceneId, selfId, x226004_g_MissionIdPre) > 0 then
        	         return 1
        	--end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x226004_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x226004_g_MissionId, x226004_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x226004_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x226004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x226004_g_MissionId)
	for i, item in x226004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x226004_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x226004_g_DemandItem[1].id) == x226004_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x226004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x226004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x226004_g_MissionId)
		AddExp(sceneId, selfId, x226004_g_ExpBonus)
		AddMoney(sceneId, selfId, x226004_g_MoneyBonus)
		for i, item in x226004_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x226004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x226004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	

	
end



--**********************************

--ɱ����������

--**********************************

function x226004_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x226004_g_MissionId) >= 0 then                                       
       		 if objdataId == x226004_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x226004_g_DemandItem[1].id) < x226004_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x226004_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��ʿͷ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x226004_g_DemandItem[1].id)+1,x226004_g_DemandItem[1].num ))
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end                     
		         end             
       		    end
       		 end
       		 
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x226004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x226004_OnItemChanged(sceneId, selfId, itemdataId)

end

