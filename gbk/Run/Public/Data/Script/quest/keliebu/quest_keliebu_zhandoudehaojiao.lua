--ս���ĺŽ�

--MisDescBegin
x202001_g_ScriptId = 202001
x202001_g_MissionIdPre =119
x202001_g_MissionId = 120
x202001_g_MissionKind = 4
x202001_g_MissionLevel = 20
x202001_g_ScriptIdNext = {ScriptId = 202002 ,LV = 1 }
x202001_g_Name	="��ľ��" 
x202001_g_DemandItem ={{id=13010039,num=20}}
x202001_g_noDemandKill ={{id=367,num=1}}	

x202001_g_MissionName="ս���ĺŽ�"
x202001_g_MissionInfo="    ���е���ʿ�����ˣ������Ķ���ɣ���������ǵ��ˣ��׺ݵ������ǹ������Ҵ��ԭ��Ӣ�µ�սʿ�ǣ�վ��������һ�𲢼���ս��\n \n    ����ɳ�ӵ���ߣ������ǵ������������Ҫ����Щ���ݵĿ�����֪����ʲô������������ʿ��\n \n    �����ˣ������Ǻ����̣������������ȫ��ʹ������ÿ���˸����ûؿ��Ҳ���20��ʿ����ͷ��"  --��������
x202001_g_MissionTarget="    ɱ������פ�ش���#R����ʿ��#W������20����ͷ���û�����#G��ľ��#W��"		
x202001_g_MissionComplete="    ÿ���˶�Ӧ��Ϊ�Լ������˳�����"					--�������npc˵���Ļ�
x202001_g_ContinueInfo="    ÿһλ��ʿ�������û�20����ͷ�����أ�"
--������
x202001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202001_g_RadioItemBonus={}

--MisDescEnd
x202001_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202001_g_MissionId) > 0 then
		if x202001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202001_g_MissionName)
			AddText(sceneId,x202001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202001_g_MissionTarget) 
			AddText(sceneId,format("\n    �����˵�ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x202001_g_DemandItem[1].id),x202001_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x202001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202001_g_MissionName)
		     AddText(sceneId,x202001_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x202001_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x202001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202001_g_ScriptId, x202001_g_MissionId)
                end

        elseif x202001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202001_g_MissionName)
                AddText(sceneId,x202001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202001_g_ScriptId, x202001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202001_g_ScriptId, x202001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202001_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==2) then
        	if IsMissionHaveDone(sceneId, selfId, x202001_g_MissionIdPre) > 0 then
        	         return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202001_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x202001_g_MissionId, x202001_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x202001_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x202001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202001_g_MissionId)
	for i, item in pairs(x202001_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202001_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x202001_g_DemandItem[1].id) == x202001_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202001_g_MissionId)
		AddExp(sceneId, selfId, x202001_g_ExpBonus)
		AddMoney(sceneId, selfId, x202001_g_MoneyBonus)
		for i, item in pairs(x202001_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x202001_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x202001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202001_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x202001_g_MissionId) >= 0 then                                       
       		 if objdataId == x202001_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x202001_g_DemandItem[1].id) < x202001_g_DemandItem[1].num then
       		         if random(1,100)>10 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x202001_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�����˵�ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x202001_g_DemandItem[1].id)+1,x202001_g_DemandItem[1].num )) 
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

function x202001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202001_OnItemChanged(sceneId, selfId, itemdataId)

end

