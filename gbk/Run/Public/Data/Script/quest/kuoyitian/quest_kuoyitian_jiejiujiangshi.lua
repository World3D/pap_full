--��Ƚ�ʿ

--MisDescBegin
x214005_g_ScriptId = 214005
--x214005_g_MissionIdPre =40
x214005_g_MissionId = 112
x214005_g_MissionKind = 3
x214005_g_MissionLevel = 15
--x214005_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x214005_g_Name	="����̳" 
x214005_g_DemandItem ={}
x214005_g_noDemandKill ={}	

x214005_g_MissionName="��Ƚ�ʿ"
x214005_g_MissionInfo="    ��ľ�������ǵ�Ӫ�����������ʮ���͹���Ҫ��Ͷ����ľ�����Щ��ʿ�ӵ��͹��\n \n    ��Щ��ʿ���ǳ��ĳ�����Ͷ����ľ��ģ�������Ҫ�������ٴ��ۣ����Ƕ�Ҫ�����Ǹ��ȳ�����\n \n    "  --��������
x214005_g_MissionInfo2="����ľ�ϵĴ�Ӫ�����ң����Ŵ���ߣ�һ�����ҵ�����Ҫȥ�������ǡ�"
x214005_g_MissionTarget="    #G����̳#WҪ�㵽��ľ�ϴ�Ӫȥ��10����#G��²�Ľ�ʿ#W��"		
x214005_g_MissionComplete="    лл���������Щ��ʿ��"					--�������npc˵���Ļ�
x214005_g_ContinueInfo="    ��Щ��ʿ�ȳ���������"
--������
x214005_g_MoneyBonus = 600
--�̶���Ʒ���������8��
x214005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214005_g_RadioItemBonus={{id=10236002,num=1},{id=10246002,num=1},{id=10256002,num=1}}

--MisDescEnd
x214005_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x214005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214005_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x214005_g_MissionId)
			if x214005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x214005_g_MissionName)
				AddText(sceneId,x214005_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x214005_g_MissionTarget) 
				AddText(sceneId,format("\n    ��Ƚ�ʿ   %d/10", GetMissionParam(sceneId,selfId,misIndex,0) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
	
			     
	                if x214005_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x214005_g_MissionName)
			     AddText(sceneId,x214005_g_MissionComplete)
			     AddMoneyBonus(sceneId, x214005_g_MoneyBonus)
			     for i, item in x214005_g_ItemBonus do
		             	AddItemBonus(sceneId, item.id, item.num)
		             end
			     for i, item in x214005_g_RadioItemBonus do
		            	 AddRadioItemBonus(sceneId, item.id, item.num)
		             end
			     EndEvent()
	                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214005_g_ScriptId, x214005_g_MissionId)
	                end
	     

        elseif x214005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214005_g_MissionName)
                AddText(sceneId,x214005_g_MissionInfo..GetName(sceneId, selfId)..x214005_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214005_g_MoneyBonus)	
		for i, item in x214005_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in x214005_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214005_g_ScriptId, x214005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214005_g_ScriptId, x214005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214005_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==14) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x214005_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x214005_g_MissionId, x214005_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x214005_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x214005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214005_g_MissionId)
	for i, item in x214005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214005_CheckSubmit( sceneId, selfId, targetId)

	misIndex = GetMissionIndexByID(sceneId,selfId,x214005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 10 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		BeginAddItem(sceneId)                                                    
			for i, item in x214005_g_ItemBonus do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in x214005_g_RadioItemBonus do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x214005_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x214005_g_MissionId )
				AddExp(sceneId, selfId, x214005_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x214005_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
			end                                               
		else                                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end 
		--CallScriptFunction( x214005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	

	
end



--**********************************

--ɱ����������

--**********************************

function x214005_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x214005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214005_OnItemChanged(sceneId, selfId, itemdataId)

end

