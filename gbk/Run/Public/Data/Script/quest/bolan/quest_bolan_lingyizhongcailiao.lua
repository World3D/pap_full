--��һ�ֲ���

--MisDescBegin
x226008_g_ScriptId = 226008
x226008_g_MissionIdPre =343
x226008_g_MissionId = 344
x226008_g_MissionKind = 23
x226008_g_MissionLevel = 115
x226008_g_ScriptIdNext = {ScriptId = 226009 ,LV = 1 }
x226008_g_Name	="�����ʦ" 
x226008_g_DemandItem ={{id=13010074,num=10}}
x226008_g_noDemandKill ={{id=483,num=1}}	

x226008_g_MissionName="��һ�ֲ���"
x226008_g_MissionInfo="    ����Ҫ��һ�ֲ��ϲ����Ƴ���ʩ�ض��ķ��������ֲ��Ͼ�����ʿ�Ľ�ָ��\n \n    ������ʿ����ÿ����ʿ�������һö��ָ�������ҳϵ�������\n \n    �ٴγ������ɣ���ʿ���û�10ö��ʿ�Ľ�ָ��"  --��������
x226008_g_MissionTarget="    ɱ��#R������ʿ#W�ľۼ��أ�����10ö#c0080C0��ʿ�Ľ�ָ#W����#G�����ʦ#W��������"		
x226008_g_MissionComplete="    <��ʦ̰���Ŀ��Ž�ָ>\n \n    �õ���Ҫ��ʼ��ҩ�ˣ����Ͼͻ���á�"					--�������npc˵���Ļ�
x226008_g_ContinueInfo="    ��ʿ���ĺͽ�ָ�ں���һ������Ƴ���ʩ�ض��ķ�����"
--������
x226008_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x226008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x226008_g_RadioItemBonus={}

--MisDescEnd
x226008_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x226008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x226008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x226008_g_MissionId) > 0 then
		if x226008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x226008_g_MissionName)
			AddText(sceneId,x226008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x226008_g_MissionTarget) 
			AddText(sceneId,format("\n    ��ʿ�Ľ�ָ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x226008_g_DemandItem[1].id),x226008_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x226008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x226008_g_MissionName)
		     AddText(sceneId,x226008_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x226008_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x226008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x226008_g_ScriptId, x226008_g_MissionId)
                end

        elseif x226008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x226008_g_MissionName)
                AddText(sceneId,x226008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x226008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x226008_g_MoneyBonus)
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x226008_g_ScriptId, x226008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x226008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x226008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x226008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x226008_g_ScriptId, x226008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x226008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x226008_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==22) then
        	if IsMissionHaveDone(sceneId, selfId, x226008_g_MissionIdPre) > 0 then
        	         return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x226008_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x226008_g_MissionId, x226008_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x226008_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x226008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x226008_g_MissionId)
	for i, item in pairs(x226008_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x226008_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x226008_g_DemandItem[1].id) == x226008_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x226008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x226008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x226008_g_MissionId)
		AddExp(sceneId, selfId, x226008_g_ExpBonus)
		AddMoney(sceneId, selfId, x226008_g_MoneyBonus)
		for i, item in pairs(x226008_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x226008_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x226008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	

	
end



--**********************************

--ɱ����������

--**********************************

function x226008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x226008_g_MissionId) >= 0 then                                       
       		 if objdataId == x226008_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x226008_g_DemandItem[1].id) < x226008_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x226008_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��ʿ�Ľ�ָ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x226008_g_DemandItem[1].id)+1,x226008_g_DemandItem[1].num ))
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

function x226008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x226008_OnItemChanged(sceneId, selfId, itemdataId)

end

