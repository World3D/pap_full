--��ս���

--MisDescBegin
x207006_g_ScriptId = 207006
x207006_g_MissionIdPre =267
x207006_g_MissionId = 268
x207006_g_MissionKind = 18
x207006_g_MissionLevel = 75
--x207006_g_ScriptIdNext = {ScriptId = 202002 ,LV = 1 }
x207006_g_Name	="��³" 
x207006_g_DemandItem ={{id=13010052,num=10}}
x207006_g_noDemandKill ={{id=410,num=1}}	

x207006_g_MissionName="��ս���"
x207006_g_MissionInfo="    ���ǵĽ�ʿ������������̨������һ�������鼤�������Ĵ���\n \n    ��Ҫ��ȥ���������ϣ���ܴ�һЩ���������ȥ�����������Ͳ��ݳ��Ŵ���#R���������#W�ɣ������ǵĶ�����Ҹ�������"  --��������
x207006_g_MissionTarget="    Ϊ#G��³#W������ݳ��Ŵ���#R���������#W���ռ����ǵĶ��䡣"		
x207006_g_MissionComplete="    �󺹼�����Щ���һ����ʲô�����ˡ�"					--�������npc˵���Ļ�
x207006_g_ContinueInfo="    ����Ҫ���������Ǿ��ǽ����������������"
--������
x207006_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207006_g_RadioItemBonus={}

--MisDescEnd
x207006_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207006_g_MissionId) > 0 then
		if x207006_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207006_g_MissionName)
			AddText(sceneId,x207006_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207006_g_MissionTarget) 
			AddText(sceneId,format("\n    ������֮��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x207006_g_DemandItem[1].id),x207006_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207006_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207006_g_MissionName)
		     AddText(sceneId,x207006_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207006_g_MoneyBonus)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x207006_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207006_g_ScriptId, x207006_g_MissionId)
                end

        elseif x207006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207006_g_MissionName)
                AddText(sceneId,x207006_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207006_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207006_g_ScriptId, x207006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207006_g_ScriptId, x207006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207006_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==7) then
        	if IsMissionHaveDone(sceneId, selfId, x207006_g_MissionIdPre) > 0 then
        	         return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207006_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x207006_g_MissionId, x207006_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x207006_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x207006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207006_g_MissionId)
	for i, item in pairs(x207006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207006_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x207006_g_DemandItem[1].id) == x207006_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207006_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207006_g_MissionId)
		AddExp(sceneId, selfId, x207006_g_ExpBonus)
		AddMoney(sceneId, selfId, x207006_g_MoneyBonus)
		for i, item in pairs(x207006_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x207006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207006_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207006_g_MissionId) >= 0 then                                       
       		 if objdataId == x207006_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x207006_g_DemandItem[1].id) < x207006_g_DemandItem[1].num then
       		         if random(1,100)>10 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x207006_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("������֮��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x207006_g_DemandItem[1].id)+1,x207006_g_DemandItem[1].num )) 
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

function x207006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207006_OnItemChanged(sceneId, selfId, itemdataId)

end

