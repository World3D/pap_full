--����ı���

--MisDescBegin
x207009_g_ScriptId = 207009
x207009_g_MissionIdPre =9
x207009_g_MissionId = 10
x207009_g_MissionKind = 1
x207009_g_ScriptIdNext = {ScriptId = 207009 ,LV = 1 }
x207009_g_Name	="���������" 
x207009_g_Name2	="�ɼ�˼��" 
x207009_g_Name3	="�����" 
x207009_g_DemandItem ={{id=13010003,num=10},{id=13010002,num=10}}
x207009_g_noDemandKill ={{id=278,num=1},{id=279,num=1}}	

x207009_g_MissionName="����ı���"
x207009_g_MissionInfo="    Ұ���ꡭ�����꾫����!�����֮����һֱ��ʹ�࣬�Ҳ�����#Gˮ��#W�Ǻ��꾫������һ����Ů������Ϊ������#G����#W�ĵ�һ���ǹ�����ƫһ��㣬#Gˮ��#W��Ȼ�������������Ѿ���ȥ�ˣ��뿪#G����Ӫ#W֮���Һ�����󺹣���˵�������ˣ����ȥ��ʱ�򣬰��Ҳɼ�ʮ��#c0080C0�����#W��ʮ��#R���ܵĽ��#W�Ķ����ȥ���󺹣��ң���ֻ���뾲һ������һ���ٻ�ȥ��"  --��������
x207009_g_MissionTarget="    �ɼ�ʮ��#c0080C0�����#W,������Щ#R���ܵĽ��#W���������ǵĶ��䡣��#c0080C0�����#W��#c0080C0����Ķ���#W����#G�ɼ�˼��#W��"		                                                                                               
x207009_g_MissionComplete=",������ҵİ���#G�ܱ�#W�ˣ��������Լ��侲һ�°ɣ�\n \n������ʦ#G������#W�������콻����ʱ�򣬳�����������ǣ�#Gˮ��#W�Ǻ��꾫��ģ�����һֻ��Ұ���������ж���ľ�β����\n \n��β����������ô��а�Ķ������������Ǻ��Ѻӵ�ˮ���ˣ���ԭ�ϵĲݿ��ˣ���Ҳ������������#G����#W��\n \nʥ�����ڸ��ﰡ���������һ�аɡ����꾫�ǲ������ģ����ǻ�ƭ�˵ģ�����ĳ��־�����õ�֤����\n \n#G�ܱ�#W�������飬�ǶԵġ���һ��һ�������ˣ��ҵ���ҵ����Ҫ�ҵĶ��������е���ֻҪ�в�ԭ������ƥţ��ĵط����������Ǵ��ɹŵ۹���"					--�������npc˵���Ļ�
x207009_g_ContinueInfo="    Ұ���빥��֮�󣬺ܶ��������ڸ����������˺ܴ��������"
--������
x207009_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x207009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207009_g_RadioItemBonus={}

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x207009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207009_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207009_g_Name2) then
			if x207009_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x207009_g_MissionName)
				AddText(sceneId,x207009_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x207009_g_MissionTarget) 
				AddText(sceneId,format("\n    �����   %d/10", LuaFnGetItemCount(sceneId,selfId,13010002) ))
				AddText(sceneId,format("    ����Ķ���   %d/10", LuaFnGetItemCount(sceneId,selfId,13010003) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
                	
			     
                	if x207009_CheckSubmit(sceneId, selfId, targetId) > 0 then
                	     BeginEvent(sceneId)
                	     AddText(sceneId,"#Y"..x207009_g_MissionName)
			     AddText(sceneId,x207009_g_MissionComplete)
			     AddText(sceneId,"#Y����Ŀ��#W") 
			     AddText(sceneId,x207009_g_MissionTarget) 
			     AddText(sceneId,format("\n    �����   %d/10", LuaFnGetItemCount(sceneId,selfId,13010002) ))
			     AddText(sceneId,format("    ����Ķ���   %d/10", LuaFnGetItemCount(sceneId,selfId,13010003) ))
			     EndEvent()
                	     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207009_g_ScriptId, x207009_g_MissionId)
                	end
                end
                if (GetName(sceneId,targetId)==x207009_g_Name3) then
                	BeginAddItem(sceneId)                                                    
			AddItem( sceneId,x207009_g_DemandItem[2].id, 1 )             
			ret = EndAddItem(sceneId,selfId)                                 
		        if ret > 0 then                                                  
		        	 BeginEvent(sceneId)
				 AddText(sceneId,format("�����   %d/10", LuaFnGetItemCount(sceneId,selfId,13010002)+1 )) 
				 EndEvent()
				 DispatchMissionTips(sceneId, selfId)
				 AddItemListToHuman(sceneId,selfId) 
		        else                                                             
		        	 BeginEvent(sceneId)                                      
				 AddText(sceneId,"��Ʒ��������")                    
				 EndEvent(sceneId)                                        
				 DispatchMissionTips(sceneId,selfId) 
			end
			BeginEvent(sceneId)
			AddText(sceneId,"�Ѿ��ɼ�")
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)    
		end 

        elseif x207009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207009_g_MissionName)
                AddText(sceneId,x207009_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207009_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207009_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207009_g_ScriptId, x207009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207009_g_ScriptId, x207009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207009_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207009_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207009_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x207009_g_MissionId)<= 0 then
                    return 1
                    end
                end
        end
	if (GetName(sceneId,targetId)==x207009_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207009_g_MissionId) > 0 then
		    return 1
                    end
        end
        if (GetName(sceneId,targetId)==x207009_g_Name3) then
		    if IsHaveMission(sceneId,selfId, x207009_g_MissionId) > 0 then
		    	if LuaFnGetItemCount(sceneId,selfId,13010002) < 10 then
		    		return 1
		    	end
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207009_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207009_g_MissionId, x207009_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207009_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x207009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207009_g_MissionId)
	for i, item in pairs(x207009_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207009_CheckSubmit( sceneId, selfId, targetId)
	if LuaFnGetItemCount(sceneId,selfId,13010003) == 10 then
		if LuaFnGetItemCount(sceneId,selfId,13010002) == 10 then
	        return 1
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207009_g_MissionId)
		AddExp(sceneId, selfId, x207009_g_ExpBonus)
		AddMoney(sceneId, selfId, x207009_g_MoneyBonus)
		for i, item in pairs(x207009_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207009_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207009_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207009_g_MissionId) >= 0 then 
	 	 if objdataId == x207009_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,13010003) < 10 then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x207009_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("����Ķ���   %d/10", LuaFnGetItemCount(sceneId,selfId,13010003)+1 )) 
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
		 if objdataId == x207009_g_noDemandKill[2].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,13010003) < 10 then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x207009_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("����Ķ���   %d/10", LuaFnGetItemCount(sceneId,selfId,13010003)+1 )) 
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

function x207009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207009_OnItemChanged(sceneId, selfId, itemdataId)

end

