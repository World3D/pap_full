--���Ƶ�ҩ��

--MisDescBegin
x215010_g_ScriptId = 215010
x215010_g_MissionIdPre =140
x215010_g_MissionId = 141
x215010_g_MissionKind = 14
x215010_g_MissionLevel = 55
--x215010_g_ScriptIdNext = {ScriptId = 204011 ,LV = 1 }
x215010_g_Name	="����" 
x215010_g_DemandItem ={{id=13010030,num=10}}
x215010_g_noDemandKill ={{id=384,num=1}}	

x215010_g_MissionName="���Ƶ�ҩ��"
x215010_g_MissionInfo="    ���Ǿ���������Щ�����������ˣ��˿��Ѿ�����ŧ�裬��ҪһЩ���˵�ҩ��\n \n    �ܱ�ոո���������Ϣ���������ң�������Ӫ�ص���ЩͷĿ���϶�����������˵�ҩ�\n \n    ����·ǳ���������Ҫ�Ͻ�ȥ����"  --��������
x215010_g_MissionTarget="    ��#R������ͷĿ#W�����ռ�10��#c0080C0��������ҩ#W���������ø�#G����#W��������ʿ�ǵ��˿ڡ�"		
x215010_g_MissionComplete="    �Ҵ��������˱�������л��"					--�������npc˵���Ļ�
x215010_g_ContinueInfo="    ����ʮ�ּ�����Щҩ�����Ҵ�������"
--������
x215010_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215010_g_RadioItemBonus={}

--MisDescEnd
x215010_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215010_g_MissionId) > 0 then
		if x215010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x215010_g_MissionName)
			AddText(sceneId,x215010_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x215010_g_MissionTarget) 
			AddText(sceneId,format("\n    ��������ҩ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x215010_g_DemandItem[1].id),x215010_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x215010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215010_g_MissionName)
		     AddText(sceneId,x215010_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x215010_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x215010_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215010_g_ScriptId, x215010_g_MissionId)
                end

        elseif x215010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215010_g_MissionName)
                AddText(sceneId,x215010_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215010_g_ScriptId, x215010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215010_g_ScriptId, x215010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215010_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==15) then
        	if IsMissionHaveDone(sceneId, selfId, x215010_g_MissionIdPre) > 0 then
        				return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x215010_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x215010_g_MissionId, x215010_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x215010_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x215010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215010_g_MissionId)
	for i, item in pairs(x215010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215010_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x215010_g_DemandItem[1].id) == x215010_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215010_g_MissionId)
		AddExp(sceneId, selfId, x215010_g_ExpBonus)
		AddMoney(sceneId, selfId, x215010_g_MoneyBonus)
		for i, item in pairs(x215010_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x215010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x215010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x215010_g_MissionId) >= 0 then                                       
       		 if objdataId == x215010_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x215010_g_DemandItem[1].id) < x215010_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x215010_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��������ҩ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x215010_g_DemandItem[1].id)+1,x215010_g_DemandItem[1].num )) 
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

function x215010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215010_OnItemChanged(sceneId, selfId, itemdataId)

end

