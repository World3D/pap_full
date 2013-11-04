--��ɱ��ʹ

--MisDescBegin
x204003_g_ScriptId = 204003
--x204003_g_MissionIdPre =95
x204003_g_MissionId = 98
x204003_g_MissionKind = 9
x204003_g_MissionLevel = 45
--x204003_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x204003_g_Name	="�ɼ�˼��" 
x204003_g_DemandItem ={{id=13010032,num=1}}
x204003_g_noDemandKill ={{id=349,num=1}}	

x204003_g_MissionName="��ɱ��ʹ"
x204003_g_MissionInfo="    ���ǵ��ڻ��Ѿ����������ǵĳ�ǽ�ϣ������Ѿ����������ǵĲ��Ӵ�����³���Ĺ����Զ�����������κ�һ���¸ҵĲ�ԭ��ʿ���ϣ�\n \n    �ƻ��������ɣ�����ı����óѣ���Ҫ�ϵ������ȥ��������ǲ����ʹ�����������û��ܺ���#c0080C0�ܺ�#W������Ⱥ#R��ʹ#W�е�ĳһ�������ϡ�"  --��������
x204003_g_MissionTarget="    �������ȥ�ػ�#R��ʹ#W���ϵ�#c0080C0�ܺ�#W���û�ȥ��#G�ɼ�˼��#W��"		
x204003_g_MissionComplete="    ̫���ˣ����������ɹ��Ứ�ݹ�����Ҫ֤�ݡ�"					--�������npc˵���Ļ�
x204003_g_ContinueInfo="    �ܺ������أ�"
--������
x204003_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204003_g_RadioItemBonus={}

--MisDescEnd
x204003_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204003_g_MissionId) > 0 then
		if x204003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204003_g_MissionName)
			AddText(sceneId,x204003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204003_g_MissionTarget) 
			AddText(sceneId,format("\n    �ܺ�   %d/%d", LuaFnGetItemCount(sceneId,selfId,x204003_g_DemandItem[1].id),x204003_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204003_g_MissionName)
		     AddText(sceneId,x204003_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x204003_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x204003_g_MoneyBonus)	
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204003_g_ScriptId, x204003_g_MissionId)
                end

        elseif x204003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204003_g_MissionName)
                AddText(sceneId,x204003_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204003_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204003_g_ScriptId, x204003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204003_g_ScriptId, x204003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204003_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==4) then
        	         return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204003_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x204003_g_MissionId, x204003_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x204003_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x204003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204003_g_MissionId)
	for i, item in x204003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204003_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x204003_g_DemandItem[1].id) == x204003_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204003_g_MissionId)
		AddExp(sceneId, selfId, x204003_g_ExpBonus)
		AddMoney(sceneId, selfId, x204003_g_MoneyBonus)
		for i, item in x204003_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x204003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x204003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204003_g_MissionId) >= 0 then                                       
       		 if objdataId == x204003_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x204003_g_DemandItem[1].id) < x204003_g_DemandItem[1].num then
       		         if random(1,100)>90 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x204003_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�ܺ�   %d/%d", LuaFnGetItemCount(sceneId,selfId,x204003_g_DemandItem[1].id)+1,x204003_g_DemandItem[1].num )) 
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

function x204003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204003_OnItemChanged(sceneId, selfId, itemdataId)

end

