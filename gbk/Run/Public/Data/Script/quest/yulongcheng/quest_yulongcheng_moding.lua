--ī��

--MisDescBegin
x208013_g_ScriptId = 208013
--x208013_g_MissionIdPre =40
x208013_g_MissionId = 67
x208013_g_MissionKind = 12
x208013_g_MissionLevel = 60
--x208013_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x208013_g_Name	="Ү�ɳ���" 
x208013_g_DemandItem ={{id=13010016,num=10}}
x208013_g_noDemandKill ={{id=321,num=1}}	

x208013_g_MissionName="ī��"
x208013_g_MissionInfo="    ���ܰ����ռ�һЩ#c0080C0ī��#W���ҷǳ���Ҫ������˹���̵ĳ��ϸ����ң���Щ#R����ͷĿ#W�����������Ķ�����"  --��������
x208013_g_MissionTarget="    ��ʿ��ͷĿ�����ҵ�10��#c0080C0ī��#W,����#GҮ�ɳ���#W������"		
x208013_g_MissionComplete="    ��Щī������߷ǳ�ϡ�У�лл��İ�æ��"					--�������npc˵���Ļ�
x208013_g_ContinueInfo="    ����Ҫ10��ī����"
--������
x208013_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208013_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208013_g_RadioItemBonus={}

--MisDescEnd
x208013_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208013_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208013_g_MissionId) > 0 then
		if x208013_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x208013_g_MissionName)
			AddText(sceneId,x208013_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x208013_g_MissionTarget) 
			AddText(sceneId,format("\n    ī��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x208013_g_DemandItem[1].id),x208013_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x208013_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x208013_g_MissionName)
		     AddText(sceneId,x208013_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x208013_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x208013_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x208013_g_ScriptId, x208013_g_MissionId)
                end

        elseif x208013_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208013_g_MissionName)
                AddText(sceneId,x208013_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208013_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208013_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208013_g_ScriptId, x208013_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208013_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208013_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208013_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208013_g_ScriptId, x208013_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208013_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208013_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208013_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==8) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208013_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x208013_g_MissionId, x208013_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x208013_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x208013_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208013_g_MissionId)
	for i, item in pairs(x208013_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208013_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x208013_g_DemandItem[1].id) == x208013_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208013_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208013_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208013_g_MissionId)
		AddExp(sceneId, selfId, x208013_g_ExpBonus)
		AddMoney(sceneId, selfId, x208013_g_MoneyBonus)
		for i, item in pairs(x208013_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x208013_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x208013_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208013_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x208013_g_MissionId) >= 0 then                                       
       		 if objdataId == x208013_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x208013_g_DemandItem[1].id) < x208013_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x208013_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("ī��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x208013_g_DemandItem[1].id)+1,x208013_g_DemandItem[1].num )) 
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

function x208013_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208013_OnItemChanged(sceneId, selfId, itemdataId)

end

