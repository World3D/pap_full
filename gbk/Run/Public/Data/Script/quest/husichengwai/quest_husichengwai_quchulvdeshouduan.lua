--�����ɵ��ֶ�

--MisDescBegin
x204010_g_ScriptId = 204010
x204010_g_MissionIdPre =104
x204010_g_MissionId = 105
x204010_g_MissionKind = 9
x204010_g_MissionLevel = 45
--x204010_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x204010_g_Name	="������" 
x204010_g_DemandItem ={{id=13010035,num=10}}
x204010_g_noDemandKill ={{id=354,num=1}}	

x204010_g_MissionName="�����ɵ��ֶ�"
x204010_g_MissionInfo="    "  --��������
x204010_g_MissionInfo2="����ȳ���ɽ�ĺ���֮�󣬴�ɽ��������һЩ���ܡ�\n \n    ������������֮���������ܵ����ɣ�������ƭ��δ����Ĵ��鹫����Ȼ���������ɵ������������ϻ��ݹ��Ʒ���Ү��ֱ��������ȡ����Ȩ��\n \n    �������ɵľ��ӣ������˾ɲ������ؽ����������������Ұ�ġ�\n \n    ���Ѿ����˰Ѹ�ʾ����ȥ�ˣ��û�˼�ǵ����о�����֪�����ࡣ����������һ��ʿ��������Щ��ʾ˺�٣������Ұ��ǻ�����ʿ�������������������û˺�ٵĸ�ʾ����������"
x204010_g_MissionTarget="    �ǻ�#R���ɽ�����#W��Ӫ�ؾ�����������Ϸ�����Ҫɱ�����ǣ���#G������#W����10��#c0080C0�����ĸ�ʾ#W��"		
x204010_g_MissionComplete="    ����Ү�ɳ�������д�ĸ�ʾ��������ʧ��"					--�������npc˵���Ļ�
x204010_g_ContinueInfo="    ��Щ��ʾ����Ҫ���û�������"
--������
x204010_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204010_g_RadioItemBonus={}

--MisDescEnd
x204010_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204010_g_MissionId) > 0 then
		if x204010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204010_g_MissionName)
			AddText(sceneId,x204010_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204010_g_MissionTarget) 
			AddText(sceneId,format("\n    �����ĸ�ʾ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x204010_g_DemandItem[1].id),x204010_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204010_g_MissionName)
		     AddText(sceneId,x204010_g_MissionComplete)
		     AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x204010_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x204010_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204010_g_ScriptId, x204010_g_MissionId)
                end

        elseif x204010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204010_g_MissionName)
                AddText(sceneId,x204010_g_MissionInfo..GetName(sceneId, selfId)..x204010_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204010_g_ScriptId, x204010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204010_g_ScriptId, x204010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204010_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==4) then
        	if IsMissionHaveDone(sceneId, selfId, x204010_g_MissionIdPre) > 0 then
        	         return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204010_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x204010_g_MissionId, x204010_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x204010_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x204010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204010_g_MissionId)
	for i, item in pairs(x204010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204010_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x204010_g_DemandItem[1].id) == x204010_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204010_g_MissionId)
		AddExp(sceneId, selfId, x204010_g_ExpBonus)
		AddMoney(sceneId, selfId, x204010_g_MoneyBonus)
		for i, item in pairs(x204010_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x204010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x204010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204010_g_MissionId) >= 0 then                                       
       		 if objdataId == x204010_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x204010_g_DemandItem[1].id) < x204010_g_DemandItem[1].num then
       		         if random(1,100)>50 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x204010_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�����ĸ�ʾ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x204010_g_DemandItem[1].id)+1,x204010_g_DemandItem[1].num )) 
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

function x204010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204010_OnItemChanged(sceneId, selfId, itemdataId)

end

