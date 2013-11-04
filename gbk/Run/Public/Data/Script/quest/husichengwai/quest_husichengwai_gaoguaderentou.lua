--�߹ҵ���ͷ

--MisDescBegin
x204006_g_ScriptId = 204006
x204006_g_MissionIdPre =100
x204006_g_MissionId = 101
x204006_g_MissionKind = 9
x204006_g_MissionLevel = 45
--x204006_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x204006_g_Name	="�ܱ�" 
x204006_g_DemandItem ={{id=13010034,num=10}}
x204006_g_noDemandKill ={{id=356,num=1}}	

x204006_g_MissionName="�߹ҵ���ͷ"
x204006_g_MissionInfo="    ��������Щ�����������������ɵİ����ǻ�ӭ���ǵ�������\n \n    ���ǲ��������ߣ�����ֻ��Ϊ��׷ɱ������������ܵ����������Ӷ�����\n \n    �����ɵ�������Ĺ���֮��Ҫ��˹�ָķ��̣�����Ҫ���������˵ķ�װ����ǿ�����У���������Ⱥ�ڵ��ձ鲻����\n \n    �ҽӵ��ɼ�˼��������������е������£������������ڽ����ɡ�\n \n     <�ܱ��ĵ�Ц��>������Щ���������������µ�����������"  --��������
x204006_g_MissionInfo2="���Ҹ��㰲����һ����ʥ���ֹ��ٵ�����������Ҫ�ٵ����е������£�������ȥ�����Ѿ���·���ˣ���Ҫ��ȥ����ֹ���ǡ�����õķ��������ǰ�����20�˸�ɱ�ˣ�����ͷ�û������һ������ڸ߸ߵĳ����ϡ�"
x204006_g_MissionTarget="    �����붫ȥɱ����������ȥ��#R�������#W������10��#c0080C0���������ͷ#W��#G�ܱ�#W����Ҫ�����ǹ��ڳ�ǽ����������ʾ����"		
x204006_g_MissionComplete="    ���Ѿ����˰����ǵ���ͷ�������������������ɡ�"					--�������npc˵���Ļ�
x204006_g_ContinueInfo="    ��Щ�����������ͷ�أ�"
--������
x204006_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204006_g_RadioItemBonus={}

--MisDescEnd
x204006_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204006_g_MissionId) > 0 then
		if x204006_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204006_g_MissionName)
			AddText(sceneId,x204006_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204006_g_MissionTarget) 
			AddText(sceneId,format("\n    ���������ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x204006_g_DemandItem[1].id),x204006_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204006_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204006_g_MissionName)
		     AddText(sceneId,x204006_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x204006_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x204006_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204006_g_ScriptId, x204006_g_MissionId)
                end

        elseif x204006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204006_g_MissionName)
                AddText(sceneId,x204006_g_MissionInfo..GetName(sceneId, selfId)..x204006_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204006_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204006_g_ScriptId, x204006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204006_g_ScriptId, x204006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204006_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==4) then
        	if IsMissionHaveDone(sceneId, selfId, x204006_g_MissionIdPre) > 0 then
        	         return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204006_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x204006_g_MissionId, x204006_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x204006_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x204006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204006_g_MissionId)
	for i, item in x204006_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204006_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x204006_g_DemandItem[1].id) == x204006_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204006_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204006_g_MissionId)
		AddExp(sceneId, selfId, x204006_g_ExpBonus)
		AddMoney(sceneId, selfId, x204006_g_MoneyBonus)
		for i, item in x204006_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x204006_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x204006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204006_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204006_g_MissionId) >= 0 then                                       
       		 if objdataId == x204006_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x204006_g_DemandItem[1].id) < x204006_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x204006_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("���������ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x204006_g_DemandItem[1].id)+1,x204006_g_DemandItem[1].num )) 
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

function x204006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204006_OnItemChanged(sceneId, selfId, itemdataId)

end

