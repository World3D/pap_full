--��¹֮��

--MisDescBegin
x202002_g_ScriptId = 202002
x202002_g_MissionIdPre =120
x202002_g_MissionId = 121
x202002_g_MissionKind = 4
x202002_g_MissionLevel = 20
x202002_g_ScriptIdNext = {ScriptId = 202003 ,LV = 1 }
x202002_g_Name	="��ľ��" 
x202002_g_DemandItem ={{id=13010040,num=1}}
x202002_g_noDemandKill ={{id=368,num=1}}	

x202002_g_MissionName="��¹֮��"
x202002_g_MissionInfo="    #c0080C0��¹֮��#W������һ�����ϣ����ǿ��Ҳ���ߵ�������Ͳ������������ϡ����ǲ��������������¶��ȥ���Ͼ������Ƕ�ɽ�������ͷ��������������Ӫ���"  --��������
x202002_g_MissionInfo2="����Ҫ���Ҵ������ϵõ�������"
x202002_g_MissionTarget="    ������Ӫ�����ҵ�#R����#W�����������õ�#c0080C0��¹֮��#W����������#G��ľ��#W��"		
x202002_g_MissionComplete="    ���ĺã���Ȼ�������˾��ߣ����ǣ����ǻ����ҵ����ġ�"					--�������npc˵���Ļ�
x202002_g_ContinueInfo="    �õ���¹֮������"
--������
x202002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202002_g_RadioItemBonus={}

--MisDescEnd
x202002_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202002_g_MissionId) > 0 then
		if x202002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202002_g_MissionName)
			AddText(sceneId,x202002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202002_g_MissionTarget) 
			AddText(sceneId,format("\n    ��¹֮��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x202002_g_DemandItem[1].id),x202002_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x202002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202002_g_MissionName)
		     AddText(sceneId,x202002_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x202002_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x202002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202002_g_ScriptId, x202002_g_MissionId)
                end

        elseif x202002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202002_g_MissionName)
                AddText(sceneId,x202002_g_MissionInfo..GetName(sceneId, selfId)..x202002_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202002_g_ScriptId, x202002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202002_g_ScriptId, x202002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202002_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==2) then
        	if IsMissionHaveDone(sceneId,selfId, x202002_g_MissionIdPre) > 0 then
        	         return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202002_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x202002_g_MissionId, x202002_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x202002_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x202002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202002_g_MissionId)
	for i, item in x202002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202002_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x202002_g_DemandItem[1].id) == x202002_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202002_g_MissionId)
		AddExp(sceneId, selfId, x202002_g_ExpBonus)
		AddMoney(sceneId, selfId, x202002_g_MoneyBonus)
		for i, item in x202002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x202002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x202002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x202002_g_MissionId) >= 0 then                                       
       		 if objdataId == x202002_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x202002_g_DemandItem[1].id) < x202002_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x202002_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��¹֮��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x202002_g_DemandItem[1].id)+1,x202002_g_DemandItem[1].num )) 
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

function x202002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202002_OnItemChanged(sceneId, selfId, itemdataId)

end

