--Ѱ������

--MisDescBegin
x201007_g_ScriptId = 201007
x201007_g_MissionIdPre =82
x201007_g_MissionId = 89
x201007_g_MissionKind = 2
x201007_g_MissionLevel = 10
--x201007_g_ScriptIdNext = {ScriptId = 201001 ,LV = 1 }
x201007_g_Name	="ŮӶ���" 
x201007_g_DemandItem ={}
x201007_g_DemandKill ={{id=345,num=1}}

x201007_g_MissionName="Ѱ������"
x201007_g_MissionInfo="    ���ء��� �ҶԲ����ö������ⶼ���ҵĹ���\n \n    ��������͵Ϯ���ǵ����죬��Ҷ�æ�ų��ˣ��Ұ��ö���������ţ���ϵ���ë���棬������ƭ�����������ˣ�û�뵽�������ˣ��ö�����׷�����ĵ��˸������ˡ�\n \n    ��Щ�죬��һֱ���Ҹ���������������ɵģ����Ǹ�����ƥ��ܵ���������#R�����#W��ɱ�����������ܲ��ܴ������ҵ�һЩ������"  --��������
x201007_g_MissionTarget="    ɱ��#G��#W������#R�����#W��Ѱ��������Ȼ�����#GŮӶ���#W��"		                                                                                               
x201007_g_MissionComplete="    һ����Ϣ��û�����ѵ����ҿ����ˣ����˵��ױ�ץ������ȥ�ˣ������һ������ң�"					--�������npc˵���Ļ�
x201007_g_ContinueInfo="    ����׻������ö�������Ϣ��������ô��Ϊ�ġ�"
--������
x201007_g_MoneyBonus = 2
--�̶���Ʒ���������8��
x201007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201007_g_RadioItemBonus={{id=10226001,num=1},{id=10276002,num=1},{id=10266001,num=1}}

--MisDescEnd
x201007_g_ExpBonus = 100
--**********************************

--������ں���

--**********************************

function x201007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x201007_g_MissionId)
		if x201007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201007_g_MissionName)
			AddText(sceneId,x201007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201007_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201007_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201007_g_MissionName)
		     AddText(sceneId,x201007_g_MissionComplete)
		     AddMoneyBonus(sceneId, x201007_g_MoneyBonus)
		     for i, item in x201007_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	             end
		     for i, item in x201007_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	             end
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201007_g_ScriptId, x201007_g_MissionId)
                end

        elseif x201007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201007_g_MissionName)
                AddText(sceneId,x201007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201007_g_MoneyBonus)	
		for i, item in x201007_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in x201007_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end	
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x201007_g_ScriptId, x201007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201007_g_ScriptId, x201007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==1) then
			if IsMissionHaveDone(sceneId, selfId, x201007_g_MissionIdPre) > 0 then
        	    	return 1
        end
  end
        return 0
	
end

--**********************************

--����

--**********************************

function x201007_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x201007_g_MissionId, x201007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x201007_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x201007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201007_g_MissionId)
	for i, item in x201007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x201007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x201007_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		BeginAddItem(sceneId)                                                    
			for i, item in x201007_g_ItemBonus do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in x201007_g_RadioItemBonus do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x201007_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x201007_g_MissionId )
				AddExp(sceneId, selfId, x201007_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x201007_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
			end                                               
		else                                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end 
		--CallScriptFunction( x201007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	

	
end



--**********************************

--ɱ����������

--**********************************

function x201007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201007_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x201007_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x201007_g_DemandKill[1].id then 
       		    if num < x201007_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201007_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x201007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201007_OnItemChanged(sceneId, selfId, itemdataId)

end

