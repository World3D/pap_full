--�����ڹ���

--MisDescBegin
x213004_g_ScriptId = 213004
x213004_g_MissionIdPre =148
x213004_g_MissionId = 149
x213004_g_MissionKind = 24
x213004_g_MissionLevel = 125
--x213004_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x213004_g_Name	="�ϵ�" 
x213004_g_DemandItem ={{id=13010044,num=1}}
x213004_g_noDemandKill ={{id=390,num=1}}	

x213004_g_MissionName="�����ڹ���"
x213004_g_MissionInfo="    ��˵����#R�ڹ���#W�����ⱴ�����سǲ��ԣ����Դ���ʥ����ʿ�ų�����������������Χ�ڱ����У����ͷ�Բ��侲���˸����Ǵ����˴��ķ��㡣����Ҳ�������з��㣬������Щȥ�������ϵ۰ɡ�\n \n    ��˵�ڹ�����ʮ�ּ�����һ�ű�ʯ���Һܸ���Ȥ����ɱ����֮���ʮ�ּܸ��Ҵ������ɡ�"  --��������
x213004_g_MissionTarget="    ɱ��#R�ڹ���#W����#c0080C0�ڹ�����ʮ�ּ�#W����#G�ϵ�#W��"		
x213004_g_MissionComplete="    ���ʮ�ּܹ�Ȼ������������֪���ڹ����������ϵ�ʱû��ʮ�ּܻ᲻���ܵ��ͷ���������"					--�������npc˵���Ļ�
x213004_g_ContinueInfo="    �ҵ��ڹ�������"
--������
x213004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x213004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x213004_g_RadioItemBonus={}

--MisDescEnd
x213004_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x213004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x213004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x213004_g_MissionId) > 0 then
		if x213004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x213004_g_MissionName)
			AddText(sceneId,x213004_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x213004_g_MissionTarget) 
			AddText(sceneId,format("\n    �ڹ�����ʮ�ּ�   %d/%d", LuaFnGetItemCount(sceneId,selfId,x213004_g_DemandItem[1].id),x213004_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x213004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x213004_g_MissionName)
		     AddText(sceneId,x213004_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x213004_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x213004_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x213004_g_ScriptId, x213004_g_MissionId)
                end

        elseif x213004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x213004_g_MissionName)
                AddText(sceneId,x213004_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x213004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x213004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x213004_g_ScriptId, x213004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x213004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x213004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x213004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x213004_g_ScriptId, x213004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x213004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x213004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x213004_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==13) then
        	if IsMissionHaveDone(sceneId, selfId, x213004_g_MissionIdPre) > 0 then
        	         return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x213004_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x213004_g_MissionId, x213004_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x213004_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x213004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x213004_g_MissionId)
	for i, item in x213004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x213004_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x213004_g_DemandItem[1].id) == x213004_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x213004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x213004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x213004_g_MissionId)
		AddExp(sceneId, selfId, x213004_g_ExpBonus)
		AddMoney(sceneId, selfId, x213004_g_MoneyBonus)
		for i, item in x213004_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x213004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x213004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x213004_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x213004_g_MissionId) >= 0 then                                       
       		 if objdataId == x213004_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x213004_g_DemandItem[1].id) < x213004_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x213004_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�ڹ�����ʮ�ּ�   %d/1", LuaFnGetItemCount(sceneId,selfId,x213004_g_DemandItem[1].id)+1,x213004_g_DemandItem[1].num )) 
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

function x213004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x213004_OnItemChanged(sceneId, selfId, itemdataId)

end

