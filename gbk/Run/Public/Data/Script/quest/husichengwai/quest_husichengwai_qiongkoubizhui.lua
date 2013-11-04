--��ܱ�׷

--MisDescBegin
x204001_g_ScriptId = 204001
x204001_g_MissionIdPre =95
x204001_g_MissionId = 96
x204001_g_MissionKind = 9
x204005_g_MissionLevel = 45
--x204001_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x204001_g_Name	="�ɼ�˼��" 
x204001_g_DemandItem ={{id=13010031,num=5}}
x204001_g_noDemandKill ={{id=347,num=1}}	

x204001_g_MissionName="��ܱ�׷"
x204001_g_MissionInfo="    ����ͳһ�ɹŵĸ���ս���У���������Ψһ���ѵ����ӣ����ӵ������ɺ������˵����ԭ�Ͼ��������ľɲ���\n \n    ���������������Բ��������������κ����Ҹ�ȼ�Ļ��ᣬ�ѱ�������������в�һ�����𣬲������ǽ������ͷ���Ҵ�������"  --��������
x204001_g_MissionTarget="    #G�ɼ�˼��#WҪ�㵽��������ȥ��ɱ��5��#R����������#W���û����ǵ���ͷ��"		
x204001_g_MissionComplete="    �ܺã�ɱ�����ǵĽ��죬����Ҳ����Ϊ�塣"					--�������npc˵���Ļ�
x204001_g_ContinueInfo="    ��Щ�����������ͷ�أ�"
--������
x204001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204001_g_RadioItemBonus={}

--MisDescEnd
x204001_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204001_g_MissionId) > 0 then
		if x204001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204001_g_MissionName)
			AddText(sceneId,x204001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204001_g_MissionTarget) 
			AddText(sceneId,format("\n    ���������ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x204001_g_DemandItem[1].id),x204001_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204001_g_MissionName)
		     AddText(sceneId,x204001_g_MissionComplete)
		     AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x204001_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		    -- end
		     AddMoneyBonus(sceneId, x204001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204001_g_ScriptId, x204001_g_MissionId)
                end

        elseif x204001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204001_g_MissionName)
                AddText(sceneId,x204001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204001_g_ScriptId, x204001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204001_g_ScriptId, x204001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204001_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==4) then
        	if IsMissionHaveDone(sceneId, selfId, x204001_g_MissionIdPre) > 0 then
        	         return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204001_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x204001_g_MissionId, x204001_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x204001_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x204001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204001_g_MissionId)
	for i, item in x204001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204001_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x204001_g_DemandItem[1].id) == x204001_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204001_g_MissionId)
		AddExp(sceneId, selfId, x204001_g_ExpBonus)
		AddMoney(sceneId, selfId, x204001_g_MoneyBonus)
		for i, item in x204001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x204001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x204001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204001_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204001_g_MissionId) >= 0 then                                       
       		 if objdataId == x204001_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x204001_g_DemandItem[1].id) < x204001_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x204001_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("���������ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x204001_g_DemandItem[1].id)+1,x204001_g_DemandItem[1].num )) 
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

function x204001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204001_OnItemChanged(sceneId, selfId, itemdataId)

end

