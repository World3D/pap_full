--�ͷ��Ѿ�

--MisDescBegin
x207000_g_ScriptId = 207000
--x207000_g_MissionIdPre =120
x207000_g_MissionId = 262
x207000_g_MissionKind = 18
x207000_g_MissionLevel = 75
--x207000_g_ScriptIdNext = {ScriptId = 202003 ,LV = 1 }
x207000_g_Name	="����̨" 
x207000_g_DemandItem ={{id=13010050,num=1}}
x207000_g_noDemandKill ={{id=407,num=1}}	

x207000_g_MissionName="�ͷ��Ѿ�"
x207000_g_MissionInfo="    ����̨���洦������#R����#W��������ľ�������岿�£��κӱ���·����Ԫ˧������ǰ�����������ǣ�Ͷ�������\n \n    <����̨΢΢�������۾���������>���������ϣ�����̨��ҪΪ���ɹŹ�����ѵ�����ľ��������Ȫ����֪��    "  --��������
x207000_g_MissionInfo2="�������������ε��ˣ�����¾����������ɣ�ɱ����֮�󣬰������ϵ�#c0080C0�ɻ���#W�û�����"
x207000_g_MissionTarget="    ������̨�ı���ɱ��#R����#W�����������õ�#c0080C0�ɻ���#W������#G����̨#W��"		
x207000_g_MissionComplete="    ���ĺã���Ȼ�������˾��ߣ����ǣ����ǻ����ҵ����ġ�"					--�������npc˵���Ļ�
x207000_g_ContinueInfo="    �õ��ɻ�������"
--������
x207000_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207000_g_RadioItemBonus={}

--MisDescEnd
x207000_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207000_g_MissionId) > 0 then
		if x207000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207000_g_MissionName)
			AddText(sceneId,x207000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207000_g_MissionTarget) 
			AddText(sceneId,format("\n    �ɻ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x207000_g_DemandItem[1].id),x207000_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207000_g_MissionName)
		     AddText(sceneId,x207000_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x207000_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x207000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207000_g_ScriptId, x207000_g_MissionId)
                end

        elseif x207000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207000_g_MissionName)
                AddText(sceneId,x207000_g_MissionInfo..GetName(sceneId, selfId)..x207000_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207000_g_ScriptId, x207000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207000_g_ScriptId, x207000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207000_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==7) then
        	         return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207000_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x207000_g_MissionId, x207000_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x207000_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x207000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207000_g_MissionId)
	for i, item in x207000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207000_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x207000_g_DemandItem[1].id) == x207000_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207000_g_MissionId)
		AddExp(sceneId, selfId, x207000_g_ExpBonus)
		AddMoney(sceneId, selfId, x207000_g_MoneyBonus)
		for i, item in x207000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x207000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207000_g_MissionId) >= 0 then                                       
       		 if objdataId == x207000_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x207000_g_DemandItem[1].id) < x207000_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x207000_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�ɻ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x207000_g_DemandItem[1].id)+1,x207000_g_DemandItem[1].num )) 
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

function x207000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207000_OnItemChanged(sceneId, selfId, itemdataId)

end

