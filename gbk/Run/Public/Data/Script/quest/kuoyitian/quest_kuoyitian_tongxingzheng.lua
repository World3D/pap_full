--ͨ��֤

--MisDescBegin
x214008_g_ScriptId = 214008
--x214008_g_MissionIdPre =41
x214008_g_MissionId = 115
x214008_g_MissionKind = 3
x214008_g_MissionLevel = 15
x214008_g_ScriptIdNext = {ScriptId = 214009 ,LV = 1 }
x214008_g_Name	="�����" 
x214008_g_Name2	="������"
x214008_g_DemandItem ={{id=13010037,num=1}}
x214008_g_noDemandKill ={{id=363,num=1}}

x214008_g_MissionName="ͨ��֤"
x214008_g_MissionInfo="    <�����һ�����ŵ���������>"  --��������
x214008_g_MissionInfo2="������������������D���ı��棬����ЩѲ�ߵ��������������õ�һ��ͨ��֤��Ȼ���#c0080C0ͨ��֤#W�ø�#G������#W��\n \n    ��ס��һ��Ҫ��ס��ǧ��Ҫ͵͵�ģ����ܾ����κ��ˣ�����Ҫ�ݣ�����Ҫ�죬��Ҫ��Ϊʲô��"
x214008_g_MissionTarget="    ��D���ı��棬ɱ��#R������Ѳ�߱�#W�ҵ�#c0080C0ͨ��֤#W��Ȼ���ͨ��֤��#G������#W��ȥ��"		                                                                                               
x214008_g_MissionComplete="    ̫���ˣ����¾ͺð��ˡ�"					--�������npc˵���Ļ�
x214008_g_ContinueInfo="    �õ�ͨ��֤����"
--������
x214008_g_MoneyBonus = 600
--�̶���Ʒ���������8��
x214008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214008_g_RadioItemBonus={}

--MisDescEnd
x214008_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x214008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214008_g_MissionId) > 0 then
		if x214008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x214008_g_MissionName)
			AddText(sceneId,x214008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x214008_g_MissionTarget) 
			AddText(sceneId,format("\n    ͨ��֤   %d/%d", LuaFnGetItemCount(sceneId,selfId,x214008_g_DemandItem[1].id),x214008_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x214008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x214008_g_MissionName)
		     AddText(sceneId,x214008_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x214008_g_DemandItem) do  
		     	--AddItemDemand(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x214008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214008_g_ScriptId, x214008_g_MissionId)
                end

        elseif x214008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214008_g_MissionName)
                AddText(sceneId,x214008_g_MissionInfo..GetName(sceneId, selfId)..x214008_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214008_g_ScriptId, x214008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214008_g_ScriptId, x214008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214008_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==14) then
        	if (GetName(sceneId,targetId)==x214008_g_Name) then
        		if IsHaveMission(sceneId,selfId, x214008_g_MissionId) <= 0 then 
        	        	return 1
        	        end
        	end
        	if (GetName(sceneId,targetId)==x214008_g_Name2) then
        		if IsHaveMission(sceneId,selfId, x214008_g_MissionId) > 0 then 
        	        	return 1
        	        end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x214008_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x214008_g_MissionId, x214008_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x214008_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x214008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214008_g_MissionId)
	for i, item in pairs(x214008_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214008_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x214008_g_DemandItem[1].id) == x214008_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x214008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x214008_g_MissionId)
		AddExp(sceneId, selfId, x214008_g_ExpBonus)
		AddMoney(sceneId, selfId, x214008_g_MoneyBonus)
		for i, item in pairs(x214008_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x214008_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x214008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x214008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x214008_g_MissionId) >= 0 then                                       
       		 if objdataId == x214008_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x214008_g_DemandItem[1].id) < x214008_g_DemandItem[1].num then
       		         if random(1,100)>80 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x214008_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("ͨ��֤   %d/%d", LuaFnGetItemCount(sceneId,selfId,x214008_g_DemandItem[1].id)+1,x214008_g_DemandItem[1].num )) 
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

function x214008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214008_OnItemChanged(sceneId, selfId, itemdataId)

end