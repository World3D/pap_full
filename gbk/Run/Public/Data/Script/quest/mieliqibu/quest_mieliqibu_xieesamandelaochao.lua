--а���������ϳ�

--MisDescBegin
x201012_g_ScriptId = 201012
x201012_g_MissionIdPre =86
x201012_g_MissionId = 94
x201012_g_MissionKind = 2
x201012_g_MissionLevel = 10
--x201012_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x201012_g_Name	="������" 
x201012_g_DemandItem ={{id=13010025,num=1}}
x201012_g_noDemandKill ={{id=343,num=1}}	

x201012_g_MissionName="а���������ϳ�"
x201012_g_MissionInfo="    ��Ща����������� �Ѻ��� ��а����ݶ��������Ҫ�������򲿣�һ��Ҫ���������ϳ����˵���\n \n    �����������ұߣ������������ϳ���а�������Ľ�����ڭ���Ͷ��������ϳ��\n \n    ֻ�еõ����ȣ�����ͳԦ��Ща�����������ȡʱ�䣬��#R��ڭ��#W��ɱ�ˣ��õ����ķ��ȣ�"
x201012_g_MissionTarget="    ɱ��#G������#W������ͷĿ#R��ڭ��#W��������ͷ����#G������#W��"		
x201012_g_MissionComplete="    �⿴����û���κ������ľ�������������̵ķ��ȣ����ǲ���˼�顣"					--�������npc˵���Ļ�
x201012_g_ContinueInfo="    �������κ�һ���������������������һ��Ҫ�õ���"
--������
x201012_g_MoneyBonus = 3
--�̶���Ʒ���������8��
x201012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201012_g_RadioItemBonus={{id=10016001,num=1},{id=10026001,num=1},{id=10036001,num=1},{id=10046001,num=1},{id=10056001,num=1},{id=10066001,num=1}}
--MisDescEnd
x201004_g_ExpBonus = 120
--**********************************

--������ں���

--**********************************

function x201012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201012_g_MissionId) > 0 then
		if x201012_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201012_g_MissionName)
			AddText(sceneId,x201012_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201012_g_MissionTarget) 
			AddText(sceneId,format("\n    ��ڭ���ķ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x201012_g_DemandItem[1].id),x201012_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201012_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201012_g_MissionName)
		     AddText(sceneId,x201012_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x201012_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x201012_g_MoneyBonus)
		     for i, item in pairs(x201012_g_ItemBonus) do
	             	AddItemBonus(sceneId, item.id, item.num)
	             end
		     for i, item in pairs(x201012_g_RadioItemBonus) do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	             end
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201012_g_ScriptId, x201012_g_MissionId)
                end

        elseif x201012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201012_g_MissionName)
                AddText(sceneId,x201012_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201012_g_MoneyBonus)
		for i, item in pairs(x201012_g_ItemBonus) do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in pairs(x201012_g_RadioItemBonus) do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x201012_g_ScriptId, x201012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201012_g_ScriptId, x201012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201012_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==1) then
        	if IsMissionHaveDone(sceneId, selfId, x201012_g_MissionIdPre) > 0 then
        		     		return 1
        	         	end
        	         end
        	return 0
	
end

--**********************************

--����

--**********************************

function x201012_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x201012_g_MissionId, x201012_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x201012_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x201012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201012_g_MissionId)
	for i, item in pairs(x201012_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201012_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x201012_g_DemandItem[1].id) == x201012_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201012_OnSubmit(sceneId, selfId, targetId, selectRadioId)

			BeginAddItem(sceneId)                                                    
			for i, item in pairs(x201012_g_ItemBonus) do                    
			AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in pairs(x201012_g_RadioItemBonus) do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
			ret = EndAddItem(sceneId,selfId)                                 
			if ret > 0 then                                                  
		  	ret = DelMission( sceneId, selfId, x201012_g_MissionId ) 
				if ret > 0 then                                   
				MissionCom( sceneId,selfId, x201012_g_MissionId )
				AddExp(sceneId, selfId, x201012_g_ExpBonus)   
	      AddMoney(sceneId, selfId, x201012_g_MoneyBonus)
	      AddItemListToHuman(sceneId,selfId)
	      for i, item in pairs(x201012_g_DemandItem) do
						DelItem(sceneId, selfId, item.id, item.num)
				end
				end                                               
			else                                                             
				BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
				EndEvent(sceneId)                                        
				DispatchMissionTips(sceneId,selfId)                      
			end   
		--CallScriptFunction( x201012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	
	
end



--**********************************

--ɱ����������

--**********************************

function x201012_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201012_g_MissionId) >= 0 then                                       
       		 if objdataId == x201012_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x201012_g_DemandItem[1].id) < x201012_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x201012_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��ڭ���ķ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x201012_g_DemandItem[1].id)+1,x201012_g_DemandItem[1].num )) 
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

function x201012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201012_OnItemChanged(sceneId, selfId, itemdataId)

end

