--���̵���

--MisDescBegin
x213009_g_ScriptId = 213009
--x213009_g_MissionIdPre =148
x213009_g_MissionId = 154
x213009_g_MissionKind = 24
x213009_g_MissionLevel = 125
--x213009_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x213009_g_Name	="�ٲ�̨" 
x213009_g_DemandItem ={{id=13010045,num=1}}
x213009_g_noDemandKill ={{id=395,num=1}}	

x213009_g_MissionName="���̵���"
x213009_g_MissionInfo="    һ����#R���綡#W�����̴���һ����ʿ����֧Ԯ������Ŀǰ�����Ѿ���������Ӫ�����ߵĺ��ϡ�\n \n    ������˵��Ҳ��֪����ô���˰ɡ��ɵ��Ǹ����綡�������������̽�ָ��˫�ֿ��������Ҵ���������Ҫ����˫���͸�������"  --��������
x213009_g_MissionTarget="    ɱ��#R���綡#W������˫�ֿ���������#G�ٲ�̨#W��"		
x213009_g_MissionComplete="    ������ôϸ���һ˫�ְ�����������Ҳ�Ҵ�����ս��������ʿ����ĺܱ�����"					--�������npc˵���Ļ�
x213009_g_ContinueInfo="    ���ֵ�ʱ��С��Щ��Ҫ�����ǿ������������綡����һ����"
--������
x213009_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x213009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x213009_g_RadioItemBonus={}

--MisDescEnd
x213009_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x213009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x213009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x213009_g_MissionId) > 0 then
		if x213009_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x213009_g_MissionName)
			AddText(sceneId,x213009_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x213009_g_MissionTarget) 
			AddText(sceneId,format("\n    ���綡��˫��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x213009_g_DemandItem[1].id),x213009_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x213009_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x213009_g_MissionName)
		     AddText(sceneId,x213009_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x213009_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x213009_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x213009_g_ScriptId, x213009_g_MissionId)
                end

        elseif x213009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x213009_g_MissionName)
                AddText(sceneId,x213009_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x213009_g_MissionTarget) 
		AddMoneyBonus(sceneId, x213009_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x213009_g_ScriptId, x213009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x213009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x213009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x213009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x213009_g_ScriptId, x213009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x213009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x213009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x213009_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==13) then
        	         return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x213009_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x213009_g_MissionId, x213009_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x213009_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x213009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x213009_g_MissionId)
	for i, item in x213009_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x213009_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x213009_g_DemandItem[1].id) == x213009_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x213009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x213009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x213009_g_MissionId)
		AddExp(sceneId, selfId, x213009_g_ExpBonus)
		AddMoney(sceneId, selfId, x213009_g_MoneyBonus)
		for i, item in x213009_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x213009_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x213009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x213009_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x213009_g_MissionId) >= 0 then                                       
       		 if objdataId == x213009_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x213009_g_DemandItem[1].id) < x213009_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x213009_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("���綡��˫��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x213009_g_DemandItem[1].id)+1,x213009_g_DemandItem[1].num )) 
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

function x213009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x213009_OnItemChanged(sceneId, selfId, itemdataId)

end

