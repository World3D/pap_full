--�ܱ�

--MisDescBegin
x214010_g_ScriptId = 214010
x214010_g_MissionIdPre =116
x214010_g_MissionId = 117
x214010_g_MissionKind = 3
x214010_g_MissionLevel = 15
--x214010_g_ScriptIdNext = {ScriptId = 204001 ,LV = 1 }
x214010_g_Name	="������" 
x214010_g_DemandItem ={}
x214010_g_DemandKill ={{id=365,num=1}}

x214010_g_MissionName="�ܱ�"
x214010_g_MissionInfo="    ��Ϊ�󺹵õ�һ���������ֺ͸��ˣ������ǻ���������Ŷ��������Ӧ�ý����ܱ���ľ����˸��µ����ָ����������ܱ𣬾��ǡ����������˼��\n \n    "  --��������
x214010_g_MissionInfo2="���㻹��֪���ɣ��ܱ���Ҵ�ģ�ֻҪ�������ղ������˴���������Ȼ�����Ч����ľ�棬�����˴󹦣�\n \n    ���������ҡ����ٺ٣���˵Ҳ�գ�����Ҳ����ȥ�ˡ������м����飬һ��Ҫ����������Ǿ��ǣ�����ľ��Ӫ��ȥ����ɱ��#R��ľ��#W��"
x214010_g_MissionTarget="    #G������#W���㵽��ľ��Ӫ��ȥ����ɱ��#R��ľ��#W��"		                                                                                               
x214010_g_MissionComplete="    ��ľ�Ͼ�������11�����䣬��Ϊ�������������ܡ�"					--�������npc˵���Ļ�
x214010_g_ContinueInfo="    ��ľ����������ľ�����ν�Ϊ���𣬵����ǳ���������ҪС�ġ�"
--������
x214010_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x214010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214010_g_RadioItemBonus={{id=10286001,num=1},{id=10286002,num=1},{id=10286003,num=1}}

--MisDescEnd

--**********************************

--������ں���

--**********************************

function x214010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x214010_g_MissionId)
		if x214010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x214010_g_MissionName)
			AddText(sceneId,x214010_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x214010_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����ľ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214010_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x214010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x214010_g_MissionName)
		     AddText(sceneId,x214010_g_MissionComplete)
		     AddMoneyBonus(sceneId, x214010_g_MoneyBonus)
		     for i, item in x214010_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	             end
		     for i, item in x214010_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	             end
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214010_g_ScriptId, x214010_g_MissionId)
                end

        elseif x214010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214010_g_MissionName)
                AddText(sceneId,x214010_g_MissionInfo..GetName(sceneId, selfId)..x214010_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214010_g_MoneyBonus)	
		for i, item in x214010_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in x214010_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214010_g_ScriptId, x214010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214010_g_ScriptId, x214010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214010_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==14) then
		if IsMissionHaveDone(sceneId, selfId, x214010_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x214010_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x214010_g_MissionId, x214010_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x214010_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x214010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214010_g_MissionId)
	for i, item in x214010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214010_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x214010_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x214010_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		BeginAddItem(sceneId)                                                    
			for i, item in x214010_g_ItemBonus do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in x214010_g_RadioItemBonus do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x214010_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x214010_g_MissionId )
				AddExp(sceneId, selfId, x214010_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x214010_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
			end                                               
		else                                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end 
		--CallScriptFunction( x214010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )	
end



--**********************************

--ɱ����������

--**********************************

function x214010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x214010_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x214010_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x214010_g_DemandKill[1].id then 
       		    if num < x214010_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����ľ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214010_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x214010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214010_OnItemChanged(sceneId, selfId, itemdataId)

end

