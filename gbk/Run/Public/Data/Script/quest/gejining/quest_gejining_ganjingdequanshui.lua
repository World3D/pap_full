--�ɾ���Ȫˮ

--MisDescBegin
x215005_g_ScriptId = 215005
x215005_g_MissionIdPre =135
x215005_g_MissionId = 136
x215005_g_MissionKind = 14
x215005_g_MissionLevel = 55
x215005_g_ScriptIdNext = {ScriptId = 215006 ,LV = 1 }
x215005_g_Name	="����ʦ" 
x215005_g_Name2	="ľ����С��" 
x215005_g_DemandItem ={{id=13010028,num=12}}
x215005_g_noDemandKill ={{id=380,num=1}}	

x215005_g_MissionName="�ɾ���Ȫˮ"
x215005_g_MissionInfo="    <����ʦ����������ű��е�ˮ����ɫ��˲���ó����ġ�>��̫����ˣ�һ������Щ���������˵�ʿ�������������������кҩ�������ǽ̻�Ľ��Ѻ�һЩ��ͽ������к���������������������ȥ�����Ǹ���û����������ݣ���ɶ���ǣ���������Ĳ�ֽ���ص�ϡȱ������\n \n    ����Ҫ�ɾ���Ȫˮ�������ǽⶾ��ֻ��װˮ�������㡣��Ҫ�Ӱ�����ʿ���������ռ���װˮ�����󣬰���Щ���󽻸�#Gľ����С��#W��"  --��������
x215005_g_MissionTarget="    ��#R������ʿ��#W�����ռ�12��#c0080C0װˮ�ĺ�«#W�������ǽ���#Gľ����С��#W��"		
x215005_g_MissionComplete="    кҩ����µú��أ������һ�㣡"					--�������npc˵���Ļ�
x215005_g_ContinueInfo="    �ҵ���ܾ��ˡ�"
--������
x215005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215005_g_RadioItemBonus={}

--MisDescEnd
x215005_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215005_g_MissionId) > 0 then
		if x215005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x215005_g_MissionName)
			AddText(sceneId,x215005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x215005_g_MissionTarget) 
			AddText(sceneId,format("\n    װˮ�ĺ�«   %d/%d", LuaFnGetItemCount(sceneId,selfId,x215005_g_DemandItem[1].id),x215005_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x215005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215005_g_MissionName)
		     AddText(sceneId,x215005_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x215005_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x215005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215005_g_ScriptId, x215005_g_MissionId)
                end

        elseif x215005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215005_g_MissionName)
                AddText(sceneId,x215005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215005_g_ScriptId, x215005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215005_g_ScriptId, x215005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215005_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==15) then
        	if IsMissionHaveDone(sceneId, selfId, x215005_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x215005_g_Name) then
        			if IsHaveMission(sceneId,selfId, x215005_g_MissionId) <= 0 then 
        	         		return 1
        	         	end
        	        end
        	        if (GetName(sceneId,targetId)==x215005_g_Name2) then
        			if IsHaveMission(sceneId,selfId, x215005_g_MissionId) > 0 then 
        	         		return 1
        	         	end
        	        end
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x215005_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x215005_g_MissionId, x215005_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x215005_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x215005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215005_g_MissionId)
	for i, item in pairs(x215005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215005_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x215005_g_DemandItem[1].id) == x215005_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215005_g_MissionId)
		AddExp(sceneId, selfId, x215005_g_ExpBonus)
		AddMoney(sceneId, selfId, x215005_g_MoneyBonus)
		for i, item in pairs(x215005_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x215005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x215005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x215005_g_MissionId) >= 0 then                                       
       		 if objdataId == x215005_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x215005_g_DemandItem[1].id) < x215005_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x215005_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("װˮ�ĺ�«   %d/%d", LuaFnGetItemCount(sceneId,selfId,x215005_g_DemandItem[1].id)+1,x215005_g_DemandItem[1].num )) 
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

function x215005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215005_OnItemChanged(sceneId, selfId, itemdataId)

end

