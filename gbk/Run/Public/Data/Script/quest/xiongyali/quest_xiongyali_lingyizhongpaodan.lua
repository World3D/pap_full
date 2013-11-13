--��һ���ڵ�

--MisDescBegin
x213002_g_ScriptId = 213002
x213002_g_MissionIdPre =146
x213002_g_MissionId = 147
x213002_g_MissionKind = 24
x213002_g_MissionLevel = 125
--x213002_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x213002_g_Name	="����" 
x213002_g_DemandItem ={{id=13010043,num=30}}
x213002_g_noDemandKill ={{id=388,num=1}}	

x213002_g_MissionName="��һ���ڵ�"
x213002_g_MissionInfo="    ÿ�췢����Щ��ʯͷ�Ҷ����ˣ���������Щ��Ȥ���������ɡ�\n \n    ֪������ʲô������ȷ���ʯͷ�����˿־�����ͷ��û��������ͷ����Ȼ�����������ɹ��˵�ͷ��������Щ����Ѱ������������ƽ���������ǾͰ����ǵ�ͷ�͸���˹�ǵ�����������ɡ�\n \n    ������30��#c0080C0������ƽ���ͷ#W���ɡ�"  --��������
x213002_g_MissionTarget="    ��#G����#W����30��#R������ƽ��#W��ͷ��"		
x213002_g_MissionComplete="    �������������ˣ�������������վ�ŵĵط������겻��ʩ���ˡ�"					--�������npc˵���Ļ�
x213002_g_ContinueInfo="    ����һ�£�����ͻȻ����������ͷ­����ô׳�۰���"
--������
x213002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x213002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x213002_g_RadioItemBonus={}

--MisDescEnd
x213002_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x213002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x213002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x213002_g_MissionId) > 0 then
		if x213002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x213002_g_MissionName)
			AddText(sceneId,x213002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x213002_g_MissionTarget) 
			AddText(sceneId,format("\n    ������ƽ���ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x213002_g_DemandItem[1].id),x213002_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x213002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x213002_g_MissionName)
		     AddText(sceneId,x213002_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x213002_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x213002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x213002_g_ScriptId, x213002_g_MissionId)
                end

        elseif x213002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x213002_g_MissionName)
                AddText(sceneId,x213002_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x213002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x213002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x213002_g_ScriptId, x213002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x213002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x213002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x213002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x213002_g_ScriptId, x213002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x213002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x213002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x213002_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==13) then
        	if IsMissionHaveDone(sceneId, selfId, x213002_g_MissionIdPre) > 0 then
        	         return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x213002_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x213002_g_MissionId, x213002_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x213002_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x213002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x213002_g_MissionId)
	for i, item in pairs(x213002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x213002_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x213002_g_DemandItem[1].id) == x213002_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x213002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x213002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x213002_g_MissionId)
		AddExp(sceneId, selfId, x213002_g_ExpBonus)
		AddMoney(sceneId, selfId, x213002_g_MoneyBonus)
		for i, item in pairs(x213002_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x213002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x213002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x213002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x213002_g_MissionId) >= 0 then                                       
       		 if objdataId == x213002_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x213002_g_DemandItem[1].id) < x213002_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x213002_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("������ƽ���ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x213002_g_DemandItem[1].id)+1,x213002_g_DemandItem[1].num )) 
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

function x213002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x213002_OnItemChanged(sceneId, selfId, itemdataId)

end

