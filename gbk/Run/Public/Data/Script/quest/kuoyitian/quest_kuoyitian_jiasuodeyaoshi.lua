--������Կ��

--MisDescBegin
x214007_g_ScriptId = 214007
--x214007_g_MissionIdPre =87
x214007_g_MissionId = 114
x214007_g_MissionKind = 3
x214007_g_MissionLevel = 15
--x214007_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x214007_g_Name	="�����" 
x214007_g_DemandItem ={{id=13010036,num=1}}
x214007_g_noDemandKill ={{id=362,num=1}}	

x214007_g_MissionName="������Կ��"
x214007_g_MissionInfo="    "  --��������
x214007_g_MissionInfo2="������Χ����ľ��Ӫ�ص�ʱ���ҵ���һ��������������ľ����ĥ��ֻ�������ˣ�����������\n \n    �Ҷ෽��������֪�������������������ȹ����ǵ���ľ��󺹣���������Ů���кϴ𰲣�\n \n    ���Ǵ󺹵Ķ��ˣ�����Ҫ������������ϵļ�����û�н⿪����Ҫ������������e�����ɱ��#R�Ѷ�#W���������ϵõ�#c0080C0������Կ��#W��"
x214007_g_MissionTarget="    ������������e�����ɱ��#R�Ѷ�#W���������ϵõ�#c0080C0������Կ��#W����Կ�׽���#G�����#W��"		
x214007_g_MissionComplete="    ��ľ����˵��ɱ�����Ѷ䣬���ܸ��ˡ�"					--�������npc˵���Ļ�
x214007_g_ContinueInfo="    ������Կ���أ�"
--������
x214007_g_MoneyBonus = 800
--�̶���Ʒ���������8��
x214007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214007_g_RadioItemBonus={}

--MisDescEnd
x214007_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x214007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214007_g_MissionId) > 0 then
		if x214007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x214007_g_MissionName)
			AddText(sceneId,x214007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x214007_g_MissionTarget) 
			AddText(sceneId,format("\n    ������Կ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x214007_g_DemandItem[1].id),x214007_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x214007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x214007_g_MissionName)
		     AddText(sceneId,x214007_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x214007_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x214007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214007_g_ScriptId, x214007_g_MissionId)
                end

        elseif x214007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214007_g_MissionName)
                AddText(sceneId,x214007_g_MissionInfo..GetName(sceneId, selfId)..x214007_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214007_g_ScriptId, x214007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214007_g_ScriptId, x214007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214007_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==14) then
        	         return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x214007_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x214007_g_MissionId, x214007_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x214007_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x214007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214007_g_MissionId)
	for i, item in pairs(x214007_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214007_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x214007_g_DemandItem[1].id) == x214007_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x214007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x214007_g_MissionId)
		AddExp(sceneId, selfId, x214007_g_ExpBonus)
		AddMoney(sceneId, selfId, x214007_g_MoneyBonus)
		for i, item in pairs(x214007_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x214007_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x214007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x214007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x214007_g_MissionId) >= 0 then                                       
       		 if objdataId == x214007_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x214007_g_DemandItem[1].id) < x214007_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x214007_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("������Կ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x214007_g_DemandItem[1].id)+1,x214007_g_DemandItem[1].num )) 
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

function x214007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214007_OnItemChanged(sceneId, selfId, itemdataId)

end

