--Ϊ�ɷ򱨳�

--MisDescBegin
x214003_g_ScriptId = 214003
x214003_g_MissionIdPre =109
x214003_g_MissionId = 110
x214003_g_MissionKind = 3
x214003_g_MissionLevel = 15
--x214003_g_ScriptIdNext = {ScriptId = 204001 ,LV = 1 }
x214003_g_Name	="��ľ��" 
x214003_g_DemandItem ={}
x214003_g_DemandKill ={{id=359,num=20}}

x214003_g_MissionName="Ϊ�ɷ򱨳�"
x214003_g_MissionInfo="    "  --��������
x214003_g_MissionInfo2="���ϴ𰲵��ɷ������������ʿ����O��Ѫս���Ҳ����úϴ����ģ������ٸ�ȥO��������������ʿ����ɱ�ˡ�"
x214003_g_MissionTarget="    ��O��ȥɱ��20��#R������ʿ��#W��Ȼ�������#G��ľ��#W������"		                                                                                               
x214003_g_MissionComplete="    �����⣬�ϴ𰲵��ɷ���ɱ���ˡ���������������һ�ˣ��һ�����ȥ�Ӻϴ𰲻�����"					--�������npc˵���Ļ�
x214003_g_ContinueInfo="    ��������������"
--������
x214003_g_MoneyBonus = 600
--�̶���Ʒ���������8��
x214003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214003_g_RadioItemBonus={{id=10216001,num=1},{id=10216002,num=1},{id=10216003,num=1}}

--MisDescEnd
x214003_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x214003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214003_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x214003_g_MissionId)
		if x214003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x214003_g_MissionName)
			AddText(sceneId,x214003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x214003_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214003_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x214003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x214003_g_MissionName)
		     AddText(sceneId,x214003_g_MissionComplete)
		     AddMoneyBonus(sceneId, x214003_g_MoneyBonus)
		     for i, item in pairs(x214003_g_ItemBonus) do
	             	AddItemBonus(sceneId, item.id, item.num)
	             end
		     for i, item in pairs(x214003_g_RadioItemBonus) do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	             end
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214003_g_ScriptId, x214003_g_MissionId)
                end

        elseif x214003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214003_g_MissionName)
                AddText(sceneId,x214003_g_MissionInfo..GetName(sceneId, selfId)..x214003_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214003_g_MoneyBonus)	
		for i, item in pairs(x214003_g_ItemBonus) do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in pairs(x214003_g_RadioItemBonus) do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214003_g_ScriptId, x214003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214003_g_ScriptId, x214003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214003_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==14) then
		if IsMissionHaveDone(sceneId, selfId, x214003_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x214003_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x214003_g_MissionId, x214003_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x214003_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x214003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214003_g_MissionId)
	for i, item in pairs(x214003_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214003_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x214003_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x214003_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		BeginAddItem(sceneId)                                                    
			for i, item in pairs(x214003_g_ItemBonus) do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in pairs(x214003_g_RadioItemBonus) do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x214003_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x214003_g_MissionId )
				AddExp(sceneId, selfId, x214003_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x214003_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
			end                                               
		else                                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end 
		--CallScriptFunction( x214003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	

	
end



--**********************************

--ɱ����������

--**********************************

function x214003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x214003_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x214003_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x214003_g_DemandKill[1].id then 
       		    if num < x214003_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214003_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x214003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214003_OnItemChanged(sceneId, selfId, itemdataId)

end

