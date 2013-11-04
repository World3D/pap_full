--���̾�

--MisDescBegin
x201013_g_ScriptId = 201013
x201013_g_MissionIdPre =88
x201013_g_MissionId = 397
x201013_g_MissionKind = 2
x201013_g_MissionLevel = 10
--x201013_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x201013_g_Name	="ڭ����" 
x201013_g_DemandItem ={{id=13010023,num=10}}
x201013_g_noDemandKill ={{id=342,num=1}}	

x201013_g_MissionName="���̾�"
x201013_g_MissionInfo="    ��ľ���⺢�ӣ������г�Ϣ����С��ľ��͸����ǰ�����ζ�����������æ��\n \n    ��˵�������ٺ���ľ���һ�ΰ�������ǲ�ԭ����һ�μѻ�������̫���ˣ�����ҪһЩ���̾�����ף���ǣ�������Ӫ�ز�Զ�Ĵ�����#R���������#W�����ϰ�#c0080C0���̾�#W����������"  --��������
x201013_g_MissionTarget="    ɱ��#G��#W����#R����������#W�������������õ�10��#c0080C0���̾�#W��#Gڭ����#W��������"		
x201013_g_MissionComplete="    лл�㣬���������Ҫ���һ��������æ��"					--�������npc˵���Ļ�
x201013_g_ContinueInfo="    ����Ҫ10�����̾ƣ�������Ӧ�����㹻�ˡ�"
--������
x201013_g_MoneyBonus = 2
--�̶���Ʒ���������8��
x201013_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201013_g_RadioItemBonus={}

--MisDescEnd
x201013_g_ExpBonus = 80
--**********************************

--������ں���

--**********************************

function x201013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201013_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201013_g_MissionId) > 0 then
		if x201013_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201013_g_MissionName)
			AddText(sceneId,x201013_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201013_g_MissionTarget) 
			AddText(sceneId,format("\n    ���̾�   %d/%d", LuaFnGetItemCount(sceneId,selfId,x201013_g_DemandItem[1].id),x201013_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201013_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201013_g_MissionName)
		     AddText(sceneId,x201013_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x201013_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x201013_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201013_g_ScriptId, x201013_g_MissionId)
                end

        elseif x201013_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201013_g_MissionName)
                AddText(sceneId,x201013_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201013_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201013_g_MoneyBonus)
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x201013_g_ScriptId, x201013_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201013_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201013_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201013_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201013_g_ScriptId, x201013_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201013_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201013_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201013_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==1) then
        	if IsMissionHaveDone(sceneId, selfId, x201013_g_MissionIdPre) > 0 then
        	         return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x201013_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x201013_g_MissionId, x201013_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x201013_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x201013_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201013_g_MissionId)
	for i, item in x201013_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201013_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x201013_g_DemandItem[1].id) == x201013_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201013_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x201013_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x201013_g_MissionId)
		AddExp(sceneId, selfId, x201013_g_ExpBonus)
		AddMoney(sceneId, selfId, x201013_g_MoneyBonus)
		for i, item in x201013_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x201013_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x201013_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	

	
end



--**********************************

--ɱ����������

--**********************************

function x201013_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201013_g_MissionId) >= 0 then                                       
       		 if objdataId == x201013_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x201013_g_DemandItem[1].id) < x201013_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x201013_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("���̾�   %d/%d", LuaFnGetItemCount(sceneId,selfId,x201013_g_DemandItem[1].id)+1,x201013_g_DemandItem[1].num )) 
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

function x201013_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201013_OnItemChanged(sceneId, selfId, itemdataId)

end

