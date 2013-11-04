--�����ķ�װ

--MisDescBegin
x203004_g_ScriptId = 203004
x203004_g_MissionIdPre =71
x203004_g_MissionId = 72
x203004_g_MissionKind = 13
x203004_g_MissionLevel = 50
x203004_g_ScriptIdNext = {ScriptId = 203005 ,LV = 1 }
x203004_g_Name	="����" 
x203004_g_Name2	="����" 
x203004_g_DemandItem ={{id=13010019,num=1}}
x203004_g_noDemandKill ={{id=324,num=1}}	

x203004_g_MissionName="�����ķ�װ"
x203004_g_MissionInfo="    ����ԭ����һ��������С����Ħڭĩ��������֮������ͳ��˵�������\n \n    ����ľ����Ħڭĩ��������ֱ��֮��ǡ����ǵ�ʿ��Ϊ��һ���عϣ����̵�ɱ����������ˣ������޵ֿ����ĺ��Ӷ�û�зŹ�������Ҫ����\n \n    �����������ʿ��̫���ˣ����ǲ���óȻ�ж������������Ѿ�����һ���ð취��ŪһЩ�������·��������ǵ�����Ŀ���飬������������ߵ�ʱ���ɱ����\n \n    ֻ��#R�ƽ�����#W�����л������������ȥ�ռ�#c0080C0�ƽ������Ŀ���#W�����������ɡ�"  --��������
x203004_g_MissionTarget="    ɱ��#R�ƽ�����#W��#G����#W����#c0080C0�ƽ������Ŀ���#W��"		
x203004_g_MissionComplete="    �����Ǹ����ر���ˣ��������׵ĸ�������ֵ��ܣ���㱾������ǰ���������������¶����ⷽ���ܾ��"					--�������npc˵���Ļ�
x203004_g_ContinueInfo="    �ƽ������Ĺ������������ҪС������"
--������
x203004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203004_g_RadioItemBonus={}

--MisDescEnd
x203004_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203004_g_MissionId) > 0 then
		if x203004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x203004_g_MissionName)
			AddText(sceneId,x203004_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x203004_g_MissionTarget) 
			AddText(sceneId,format("\n    �ƽ������Ŀ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x203004_g_DemandItem[1].id),x203004_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x203004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203004_g_MissionName)
		     AddText(sceneId,x203004_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x203004_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x203004_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203004_g_ScriptId, x203004_g_MissionId)
                end

        elseif x203004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203004_g_MissionName)
                AddText(sceneId,x203004_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203004_g_ScriptId, x203004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203004_g_ScriptId, x203004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203004_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==3) then
        	if IsMissionHaveDone(sceneId, selfId, x203004_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x203004_g_Name) then
        			if IsHaveMission(sceneId,selfId, x203004_g_MissionId) <= 0 then
        	            		return 1
        	            	end
        	        end
        	        if (GetName(sceneId,targetId)==x203004_g_Name2) then
        			if IsHaveMission(sceneId,selfId, x203004_g_MissionId) > 0 then
        	            		return 1
        	            	end
        	        end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203004_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x203004_g_MissionId, x203004_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x203004_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x203004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203004_g_MissionId)
	for i, item in x203004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203004_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x203004_g_DemandItem[1].id) == x203004_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203004_g_MissionId)
		AddExp(sceneId, selfId, x203004_g_ExpBonus)
		AddMoney(sceneId, selfId, x203004_g_MoneyBonus)
		for i, item in x203004_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x203004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x203004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203004_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203004_g_MissionId) >= 0 then                                       
       		 if objdataId == x203004_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x203004_g_DemandItem[1].id) < x203004_g_DemandItem[1].num then
       		         if random(1,100)>95 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x203004_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�ƽ������Ŀ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x203004_g_DemandItem[1].id)+1,x203004_g_DemandItem[1].num )) 
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

function x203004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203004_OnItemChanged(sceneId, selfId, itemdataId)

end

