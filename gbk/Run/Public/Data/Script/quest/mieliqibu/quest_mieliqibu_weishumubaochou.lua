--Ϊ��ĸ����

--MisDescBegin
x201010_g_ScriptId = 201010
--x201010_g_MissionIdPre =41
x201010_g_MissionId = 92
x201010_g_MissionKind = 2
x201010_g_MissionLevel = 10
x201010_g_ScriptIdNext = {ScriptId = 201011 ,LV = 1 }
x201010_g_Name	="ڭ����" 
x201010_g_Name2	="���չ�̨"
x201010_g_DemandItem ={{id=13010071,num=10}}
x201010_g_noDemandKill ={{id=475,num=1}}

x201010_g_MissionName="Ϊ��ĸ����"
x201010_g_MissionInfo="    ��ľ�����ĸ�ٳ౻�����������裬�����ռ����ǣ��Ѿ�Ͷ���Ծ��ˡ�\n \n    ����ҪΪ���������е��������˶�������"  --��������
x201010_g_MissionInfo2="���ֻ�Ѫծ��ʱ���ˣ�ɱ�������µ���Щ����������ǵ���ͷ��ȥ��#G���չ�̨#W��"
x201010_g_MissionTarget="    ����#G������#W��#R���������#W��Ϊ�ٳ౨�𣬴���10��#c0080C0�����������ͷ#W��#G���չ�̨#W��"		                                                                                               
x201010_g_MissionComplete="    ��Щ������ԶԶ������"					--�������npc˵���Ļ�
x201010_g_ContinueInfo="    ����Ҫ�������˵���ͷ�������ҵ����ˣ�"
--������
x201010_g_MoneyBonus = 1
--�̶���Ʒ���������8��
x201010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201010_g_RadioItemBonus={}

--MisDescEnd
x201010_g_ExpBonus = 50
--**********************************

--������ں���

--**********************************

function x201010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201010_g_MissionId) > 0 then
		if x201010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201010_g_MissionName)
			AddText(sceneId,x201010_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201010_g_MissionTarget) 
			AddText(sceneId,format("\n    �����������ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x201010_g_DemandItem[1].id),x201010_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201010_g_MissionName)
		     AddText(sceneId,x201010_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x201010_g_DemandItem do  
		     --	AddItemDemand(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x201010_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201010_g_ScriptId, x201010_g_MissionId)
                end

        elseif x201010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201010_g_MissionName)
                AddText(sceneId,x201010_g_MissionInfo..GetName(sceneId, selfId)..x201010_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x201010_g_ScriptId, x201010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201010_g_ScriptId, x201010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201010_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==1) then
        	if (GetName(sceneId,targetId)==x201010_g_Name) then
        		if IsHaveMission(sceneId,selfId, x201010_g_MissionId) <= 0 then 
        	        	return 1
        	        end
        	end
        	if (GetName(sceneId,targetId)==x201010_g_Name2) then
        		if IsHaveMission(sceneId,selfId, x201010_g_MissionId) > 0 then 
        	        	return 1
        	        end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x201010_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x201010_g_MissionId, x201010_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x201010_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x201010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201010_g_MissionId)
	for i, item in x201010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201010_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x201010_g_DemandItem[1].id) == x201010_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x201010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x201010_g_MissionId)
		AddExp(sceneId, selfId, x201010_g_ExpBonus)
		AddMoney(sceneId, selfId, x201010_g_MoneyBonus)
		for i, item in x201010_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x201010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x201010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x201010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201010_g_MissionId) >= 0 then                                       
       		 if objdataId == x201010_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x201010_g_DemandItem[1].id) < x201010_g_DemandItem[1].num then
       		         if random(1,100)>0then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x201010_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�����������ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x201010_g_DemandItem[1].id)+1,x201010_g_DemandItem[1].num )) 
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

function x201010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201010_OnItemChanged(sceneId, selfId, itemdataId)

end