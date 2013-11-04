--�󺹵�ϴ����

--MisDescBegin
x212011_g_ScriptId = 212011
x212011_g_MissionIdPre =257
x212011_g_MissionId = 258
x212011_g_MissionKind = 1
x212011_g_MissionLevel = 70
x212011_g_ScriptIdNext = {ScriptId = 212012 ,LV = 1 }
x212011_g_Name	="�𴦻�" 
x212011_g_DemandItem ={{id=13010055,num=5}}
x212011_g_noDemandKill ={{id=430,num=1}}	

x212011_g_MissionName="�󺹵�ϴ����"
x212011_g_MissionInfo="     ����ҪһЩ��Ƥ�������ⲻ����ͨ����Ƥ�����������ܳ��ڱ��棬��ʹ��ˮ�ܹ��������չ�Ҳ�������𻵵�����Ƥ��\n \n    ��Щ��Ƥ����������ųɼ�˼�������������µ�ѵ�ԣ�����������ʱʱ�̲̿�Ҫ�������Ļ���\n \n    "  --��������
x212011_g_MissionInfo2="��#R���Ļʹ�����#W���Ͼ���������#c0080C0����Ƥ#W���������ռ�5�����ɡ�"
x212011_g_MissionTarget="    �����ĵĻʹ���������Ū5��#c0080C0����Ƥ#W�����𴦻���"		
x212011_g_MissionComplete="    лл��ð����ô���Σ�������ҡ�"					--�������npc˵���Ļ�
x212011_g_ContinueInfo="    �õ�����Ƥ����"
--������
x212011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x212011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212011_g_RadioItemBonus={}

--MisDescEnd
x212011_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x212011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212011_g_MissionId) > 0 then
		if x212011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212011_g_MissionName)
			AddText(sceneId,x212011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x212011_g_MissionTarget) 
			AddText(sceneId,format("\n    ����Ƥ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x212011_g_DemandItem[1].id),x212011_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x212011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x212011_g_MissionName)
		     AddText(sceneId,x212011_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x212011_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x212011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x212011_g_ScriptId, x212011_g_MissionId)
                end

        elseif x212011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212011_g_MissionName)
                AddText(sceneId,x212011_g_MissionInfo..GetName(sceneId, selfId)..x212011_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212011_g_MoneyBonus)
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x212011_g_ScriptId, x212011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212011_g_ScriptId, x212011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212011_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==12) then
        	if IsMissionHaveDone(sceneId, selfId, x212011_g_MissionIdPre) > 0 then
        		 		return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x212011_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x212011_g_MissionId, x212011_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x212011_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x212011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212011_g_MissionId)
	for i, item in x212011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212011_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x212011_g_DemandItem[1].id) == x212011_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x212011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212011_g_MissionId)
		AddExp(sceneId, selfId, x212011_g_ExpBonus)
		AddMoney(sceneId, selfId, x212011_g_MoneyBonus)
		for i, item in x212011_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x212011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x212011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	

	
end



--**********************************

--ɱ����������

--**********************************

function x212011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x212011_g_MissionId) >= 0 then                                       
       		 if objdataId == x212011_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x212011_g_DemandItem[1].id) < x212011_g_DemandItem[1].num then
       		         if random(1,100)>50 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x212011_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("����Ƥ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x212011_g_DemandItem[1].id)+1,x212011_g_DemandItem[1].num )) 
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

function x212011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212011_OnItemChanged(sceneId, selfId, itemdataId)

end

