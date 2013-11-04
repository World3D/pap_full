--����

--MisDescBegin
x212005_g_ScriptId = 212005
--x212005_g_MissionIdPre =247
x212005_g_MissionId = 252
x212005_g_MissionKind = 17
x212005_g_MissionLevel = 70
--x212005_g_ScriptIdNext = {ScriptId = 212002 ,LV = 1 }
x212005_g_Name	="����̨" 
x212005_g_DemandItem ={{id=13010054,num=5}}
x212005_g_noDemandKill ={{id=425,num=1}}	

x212005_g_MissionName="����"
x212005_g_MissionInfo="    ������Χ�Ե�ʱ���������Һܵ����������ƣ���˵#c0080C0���ֻش���#W���������Ƿǳ���Ч�ġ�\n \n    �ѵ����ֻش���������ôϡ���𣿲�����Σ���һ��Ҫ�õ�һЩ�����������������ˣ�����ҩ��#R������ʦ#W���ϣ�Ӧ���ܵõ�һЩ���Ҳ������ģ�ֻ��Ҫ5�Ŷ��ѡ�"  --��������
x212005_g_MissionTarget="    ��#G���ǵ�#W��#R������ʦ#W�����ռ�5��#c0080C0���ֻش���#W��"		
x212005_g_MissionComplete="    ������Һܴ��æ��"					--�������npc˵���Ļ�
x212005_g_ContinueInfo="    ��ҩ�Ǹ��Ҹ������˵ģ�����ӽ�һ�㡣"
--������
x212005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x212005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212005_g_RadioItemBonus={}

--MisDescEnd
x212005_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x212005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212005_g_MissionId) > 0 then
		if x212005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212005_g_MissionName)
			AddText(sceneId,x212005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x212005_g_MissionTarget) 
			AddText(sceneId,format("\n    ���ֻش���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x212005_g_DemandItem[1].id),x212005_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x212005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x212005_g_MissionName)
		     AddText(sceneId,x212005_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x212005_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x212005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x212005_g_ScriptId, x212005_g_MissionId)
                end

        elseif x212005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212005_g_MissionName)
                AddText(sceneId,x212005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212005_g_MoneyBonus)
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x212005_g_ScriptId, x212005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212005_g_ScriptId, x212005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212005_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==12) then
        		 		return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x212005_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x212005_g_MissionId, x212005_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x212005_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x212005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212005_g_MissionId)
	for i, item in x212005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212005_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x212005_g_DemandItem[1].id) == x212005_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x212005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212005_g_MissionId)
		AddExp(sceneId, selfId, x212005_g_ExpBonus)
		AddMoney(sceneId, selfId, x212005_g_MoneyBonus)
		for i, item in x212005_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x212005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x212005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	

	
end



--**********************************

--ɱ����������

--**********************************

function x212005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x212005_g_MissionId) >= 0 then                                       
       		 if objdataId == x212005_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x212005_g_DemandItem[1].id) < x212005_g_DemandItem[1].num then
       		         if random(1,100)>30 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x212005_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("���ֻش���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x212005_g_DemandItem[1].id)+1,x212005_g_DemandItem[1].num )) 
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

function x212005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212005_OnItemChanged(sceneId, selfId, itemdataId)

end

