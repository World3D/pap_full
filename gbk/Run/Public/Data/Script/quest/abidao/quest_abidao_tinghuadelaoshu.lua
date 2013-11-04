--����������

--MisDescBegin
x203003_g_ScriptId = 203003
x203003_g_MissionIdPre =70
x203003_g_MissionId = 71
x203003_g_MissionKind = 13
x203003_g_MissionLevel = 50
x203003_g_ScriptIdNext = {ScriptId = 203004 ,LV = 1 }
x203003_g_Name	="����" 
x203003_g_Name2	="����" 
x203003_g_DemandItem ={{id=13010018,num=1}}
x203003_g_noDemandKill ={{id=323,num=1}}	

x203003_g_MissionName="����������"
x203003_g_MissionInfo="    ����������棬�������Ѿ��Ի�����������С�Ӹ����ϣ���Һȸ�ʹ�졭��\n \n    ��������������������𣿾������ֵ����Ҵܵ�С�һһ����ȭͷ��С����ͷ���ԣ�������ġ�������������Щ����������ѵ�������ģ�\n \n    �������˸������⣬������ЩҩͿ�����������Ϻ����ǵ�צ�ϣ�ֻҪ��Щ����ȥ����̣���ǵ����ݣ���ҩ��Ȼ������Щ�����ϡ�\n \n    ����������Ҫ̫���ȣ��Ҹ�����ȥ��ҩ�������Ͷ���ĥ���ɵ�кҩ����Щʿ��Ҫ�ǳ��ˡ���\n \n    ��������Щ�������֣����Ƕ�һ��ҩ�Ƶ�ζ���ܼɵ������������ң��ڵ���������һ���ˣ���һ����������ϲ��������ҩ�Ƶģ���Ҫ���������Ȼ�������#c0080C0ҩ�ƺ�«#W����#G����#W�� "  --��������
x203003_g_MissionTarget="    ɱ��#R��ҩ�Ƶľ���#W��#G����#W����#c0080C0ҩ�ƺ�«#W��"		
x203003_g_MissionComplete="    ��ľ�����������ǵĻ�����������һ�̴��Ư����"					--�������npc˵���Ļ�
x203003_g_ContinueInfo="    ��Щ������ģ�˲�ֵ�ÿ�����ֻ��ɱ�����ǲ���ƽϢ���ǳ�޵�ŭ��"
--������
x203003_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203003_g_RadioItemBonus={}

--MisDescEnd
x203003_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203003_g_MissionId) > 0 then
		if x203003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x203003_g_MissionName)
			AddText(sceneId,x203003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x203003_g_MissionTarget) 
			AddText(sceneId,format("\n    ҩ�ƺ�«   %d/%d", LuaFnGetItemCount(sceneId,selfId,x203003_g_DemandItem[1].id),x203003_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x203003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203003_g_MissionName)
		     AddText(sceneId,x203003_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x203003_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x203003_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203003_g_ScriptId, x203003_g_MissionId)
                end

        elseif x203003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203003_g_MissionName)
                AddText(sceneId,x203003_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203003_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203003_g_ScriptId, x203003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203003_g_ScriptId, x203003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203003_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==3) then
        	if IsMissionHaveDone(sceneId, selfId, x203003_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x203003_g_Name) then
        			if IsHaveMission(sceneId,selfId, x203003_g_MissionId) <= 0 then
        	            		return 1
        	            	end
        	        end
        	        if (GetName(sceneId,targetId)==x203003_g_Name2) then
        			if IsHaveMission(sceneId,selfId, x203003_g_MissionId) > 0 then
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

function x203003_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x203003_g_MissionId, x203003_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x203003_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x203003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203003_g_MissionId)
	for i, item in x203003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203003_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x203003_g_DemandItem[1].id) == x203003_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203003_g_MissionId)
		AddExp(sceneId, selfId, x203003_g_ExpBonus)
		AddMoney(sceneId, selfId, x203003_g_MoneyBonus)
		for i, item in x203003_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x203003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x203003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203003_g_MissionId) >= 0 then                                       
       		 if objdataId == x203003_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x203003_g_DemandItem[1].id) < x203003_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x203003_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("ҩ�ƺ�«   %d/%d", LuaFnGetItemCount(sceneId,selfId,x203003_g_DemandItem[1].id)+1,x203003_g_DemandItem[1].num )) 
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

function x203003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203003_OnItemChanged(sceneId, selfId, itemdataId)

end

