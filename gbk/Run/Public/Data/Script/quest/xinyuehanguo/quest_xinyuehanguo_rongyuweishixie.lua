--������ʿЬ

--MisDescBegin
x211055_g_ScriptId = 211055
x211055_g_MissionId = 394
x211055_g_MissionKind = 1
x211055_g_MissionLevel = 10
--x211055_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x211055_g_Name	="����" 
x211055_g_DemandItem ={{id=11990003,num=10}}
x211055_g_noDemandKill ={}	

x211055_g_MissionName="������ʿЬ"
x211055_g_MissionInfo="    ���Ǵ�������ʹ�ߣ����͹�Ʒ���������;��Ұ�ⲻ�ұ����˽ٵ���#c0080C0ʹ������#Wȫ����ʧ����Ϊû������Щ�ţ��ҵĳ��Ӷ��ڳ����޷����ǡ�������ܰ���������һЩ���ҽ�������ҴӴ󶼴������ľ���װ���͸��㡣"
x211055_g_MissionTarget="    �ռ�10��#c0080C0ʹ������#W������#G����#W"		
x211055_g_MissionComplete="    û��ʹ�������ҵ�������޷���ɣ��������ˡ�"					--�������npc˵���Ļ�
x211055_g_ContinueInfo="    ������Щʹ�������ҵ���ʧ���˺ܶ࣬лл�㡣"
--������
x211055_g_MoneyBonus = 700
--�̶���Ʒ���������8��
x211055_g_ItemBonus={{id=10277001,num=1}}

--��ѡ��Ʒ���������8��
x211055_g_RadioItemBonus={}
--MisDescEnd
x201004_g_ExpBonus = 40
--**********************************

--������ں���

--**********************************

function x211055_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x211055_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x211055_g_MissionId) > 0 then
		if x211055_CheckSubmit(sceneId, selfId, targetId) <= 0 then
			local haveitem = 0
			if LuaFnGetItemCount(sceneId,selfId,x211055_g_DemandItem[1].id) >= x211055_g_DemandItem[1].num then
				haveitem = x211055_g_DemandItem[1].num
			else
				haveitem = LuaFnGetItemCount(sceneId,selfId,x211055_g_DemandItem[1].id)
			end
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x211055_g_MissionName)
			AddText(sceneId,x211055_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x211055_g_MissionTarget) 
			AddText(sceneId,format("\n    ʹ������   %d/%d", haveitem,x211055_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x211055_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x211055_g_MissionName)
		     AddText(sceneId,x211055_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x211055_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x211055_g_MoneyBonus)
		     for i, item in x211055_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	             end
		     for i, item in x211055_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	             end
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x211055_g_ScriptId, x211055_g_MissionId)
                end

        elseif x211055_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x211055_g_MissionName)
                AddText(sceneId,x211055_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x211055_g_MissionTarget) 
		AddMoneyBonus(sceneId, x211055_g_MoneyBonus)
		for i, item in x211055_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in x211055_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x211055_g_ScriptId, x211055_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x211055_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x211055_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x211055_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x211055_g_ScriptId, x211055_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x211055_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x211055_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x211055_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==11) then
        	if GetLevel( sceneId, selfId ) >= 10 then
        		return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x211055_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x211055_g_MissionId, x211055_g_ScriptId, 1, 1, 1)
			AddText(sceneId,"��������"..x211055_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x211055_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x211055_g_MissionId)
	

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211055_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x211055_g_DemandItem[1].id) >= x211055_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x211055_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		BeginAddItem(sceneId)                                                    
			for i, item in x211055_g_ItemBonus do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in x211055_g_RadioItemBonus do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x211055_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x211055_g_MissionId )
				AddExp(sceneId, selfId, x211055_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x211055_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
	                        for i, item in x211055_g_DemandItem do
					DelItem(sceneId, selfId, item.id, item.num)
				end
			end                                               
		else                                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end   
		--CallScriptFunction( x211055_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	
	
end



--**********************************

--ɱ����������

--**********************************

function x211055_OnKillObject(sceneId, selfId, objdataId)
	

end



--**********************************

--���������¼�

--**********************************

function x211055_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211055_OnItemChanged(sceneId, selfId, itemdataId)
	if itemdataId == x211055_g_DemandItem[1].id then
		local haveitem = 0
		if LuaFnGetItemCount(sceneId,selfId,x211055_g_DemandItem[1].id) <= x211055_g_DemandItem[1].num then
			haveitem = LuaFnGetItemCount(sceneId,selfId,x211055_g_DemandItem[1].id)
			BeginEvent(sceneId)
			AddText(sceneId,format("ʹ������   %d/%d", haveitem,x211055_g_DemandItem[1].num )) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		end
	end

end
