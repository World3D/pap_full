--����İ���

--MisDescBegin
x225005_g_ScriptId = 225005
x225005_g_MissionIdPre =326
x225005_g_MissionId = 327
x225005_g_MissionKind = 22
x225005_g_MissionLevel = 110
x225005_g_ScriptIdNext = {ScriptId = 225006 ,LV = 1 }
x225005_g_Name	="�ɸ�" 
x225005_g_DemandItem ={{id=13010061,num=10}}
x225005_g_noDemandKill ={{id=432,num=1}}	

x225005_g_MissionName="����İ���"
x225005_g_MissionInfo="    ����ϴ����ƶ��ߣ���������̫���ˣ�û��̫����ջ񡣹�����Ӧ�û��кܶ�����ȥ��������ɱ����Щ���壬���������ϵİ������Ҵ�������"  --��������
x225005_g_MissionTarget="    ��#G�ɸ�#W����10��#R��������#W���ϵİ�����"		
x225005_g_MissionComplete="    �ö������治�٣��������������������ɹ���ʿ�ˡ�"					--�������npc˵���Ļ�
x225005_g_ContinueInfo="    ���������һ���в��ٵĲ��"
--������
x225005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x225005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x225005_g_RadioItemBonus={}

--MisDescEnd
x225005_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x225005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x225005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x225005_g_MissionId) > 0 then
		if x225005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x225005_g_MissionName)
			AddText(sceneId,x225005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x225005_g_MissionTarget) 
			AddText(sceneId,format("\n    ����İ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x225005_g_DemandItem[1].id),x225005_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x225005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x225005_g_MissionName)
		     AddText(sceneId,x225005_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x225005_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x225005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x225005_g_ScriptId, x225005_g_MissionId)
                end

        elseif x225005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x225005_g_MissionName)
                AddText(sceneId,x225005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x225005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x225005_g_MoneyBonus)
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x225005_g_ScriptId, x225005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x225005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x225005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x225005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x225005_g_ScriptId, x225005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x225005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x225005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x225005_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==16) then
        	if IsMissionHaveDone(sceneId, selfId, x225005_g_MissionIdPre) > 0 then
        	         return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x225005_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x225005_g_MissionId, x225005_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x225005_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x225005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x225005_g_MissionId)
	for i, item in x225005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x225005_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x225005_g_DemandItem[1].id) == x225005_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x225005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x225005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x225005_g_MissionId)
		AddExp(sceneId, selfId, x225005_g_ExpBonus)
		AddMoney(sceneId, selfId, x225005_g_MoneyBonus)
		for i, item in x225005_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x225005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x225005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	

	
end



--**********************************

--ɱ����������

--**********************************

function x225005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x225005_g_MissionId) >= 0 then                                       
       		 if objdataId == x225005_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x225005_g_DemandItem[1].id) < x225005_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x225005_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("����İ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x225005_g_DemandItem[1].id)+1,x225005_g_DemandItem[1].num ))
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

function x225005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x225005_OnItemChanged(sceneId, selfId, itemdataId)

end

