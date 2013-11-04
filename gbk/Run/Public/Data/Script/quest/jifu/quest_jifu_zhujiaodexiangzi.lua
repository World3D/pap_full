--���̵�����

--MisDescBegin
x225002_g_ScriptId = 225002
x225002_g_MissionIdPre =323
x225002_g_MissionId = 324
x225002_g_MissionKind = 22
x225002_g_MissionLevel = 110
--x225002_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x225002_g_Name	="�ٲ�̨" 
x225002_g_DemandItem ={{id=13010060,num=1}}
x225002_g_noDemandItem ={{id=13010059,num=1}}
x225002_g_noDemandKill ={{id=437,num=1}}	

x225002_g_MissionName="���̵�����"
x225002_g_MissionInfo="    ����������������������������Ƿ��֡�����һ�������Ʊ���\n \n    ȥ��������Ķ������Ҵ����������ǽ�����ָ���ʿ�ǡ��Ǹ����ӿ��ܲ�����ô���״򿪣���������˾͵��Ǹ�������������һ�£���Ӧ�û���Կ�ס�"  --��������
x225002_g_MissionTarget="    ȥ#G���廨԰#Wɱ��#G��������#W�õ�Կ�ף������̵����ӵõ�������Ʒ��"		
x225002_g_MissionComplete="    ���˰���ֻ����ôһ�����ӣ����һ����ǽ������ģ��������̵��Դ��������𣿾�Ȼ����ôһ��������"					--�������npc˵���Ļ�
x225002_g_ContinueInfo="    �����̽��ŵ����ӣ���������һ���ܶ�Ʊ���"
--������
x225002_g_MoneyBonus = 600
--�̶���Ʒ���������8��
x225002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x225002_g_RadioItemBonus={{id=12010001,num=1},{id=12010001,num=1},{id=12010001,num=1}}

--MisDescEnd
x225002_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x225002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x225002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x225002_g_MissionId) > 0 then
			if x225002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x225002_g_MissionName)
				AddText(sceneId,x225002_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x225002_g_MissionTarget) 
				AddText(sceneId,format("\n    ���а���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x225002_g_DemandItem[1].id),x225002_g_DemandItem[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
	
			     
	                if x225002_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x225002_g_MissionName)
			     AddText(sceneId,x225002_g_MissionComplete)
			     AddMoneyBonus(sceneId, x225002_g_MoneyBonus)
			     for i, item in x225002_g_ItemBonus do
		             	AddItemBonus(sceneId, item.id, item.num)
		             end
			     for i, item in x225002_g_RadioItemBonus do
		            	 AddRadioItemBonus(sceneId, item.id, item.num)
		             end
			     EndEvent()
	                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x225002_g_ScriptId, x225002_g_MissionId)
	                end
	     

        elseif x225002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x225002_g_MissionName)
                AddText(sceneId,x225002_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x225002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x225002_g_MoneyBonus)	
		for i, item in x225002_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in x225002_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x225002_g_ScriptId, x225002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x225002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x225002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x225002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x225002_g_ScriptId, x225002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x225002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x225002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x225002_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==16) then
        	if IsMissionHaveDone(sceneId, selfId, x225002_g_MissionIdPre) > 0 then
        	            	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x225002_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x225002_g_MissionId, x225002_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x225002_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x225002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x225002_g_MissionId)
	for i, item in x225002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end
	for i, item in x225002_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x225002_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x225002_g_DemandItem[1].id) == x225002_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x225002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		BeginAddItem(sceneId)                                                    
			for i, item in x225002_g_ItemBonus do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in x225002_g_RadioItemBonus do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x225002_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x225002_g_MissionId )
				AddExp(sceneId, selfId, x225002_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x225002_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
	                        for i, item in x225002_g_DemandItem do
					DelItem(sceneId, selfId, item.id, item.num)
				end
			end                                               
		else                                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end 
		--CallScriptFunction( x225002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	

	
end



--**********************************

--ɱ����������

--**********************************

function x225002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x225002_g_MissionId) >= 0 then                                       
       		 if objdataId == x225002_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x225002_g_noDemandItem[1].id) < x225002_g_noDemandItem[1].num then
       		         if LuaFnGetItemCount(sceneId,selfId,x225002_g_DemandItem[1].id) < x225002_g_DemandItem[1].num then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x225002_g_noDemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�õ����̵�Կ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x225002_g_DemandItem[1].id)+1,x225002_g_DemandItem[1].num ))
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

function x225002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x225002_OnItemChanged(sceneId, selfId, itemdataId)

end

