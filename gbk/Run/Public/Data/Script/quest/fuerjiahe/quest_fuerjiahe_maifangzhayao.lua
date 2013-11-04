--���ըҩ

--MisDescBegin
x223001_g_ScriptId = 223001
--x223001_g_MissionIdPre =40
x223001_g_MissionId = 293
x223001_g_MissionKind = 20
x223001_g_MissionLevel = 100
--x223001_g_ScriptIdNext = {ScriptId = 208005 ,LV = 1 }
x223001_g_Name	="�ɸ�" 
x223001_g_noDemandItem ={{id=13010064,num=1}}
--x223001_g_noDemandKill ={{id=301,num=1}}	

x223001_g_MissionName="���ըҩ"
x223001_g_MissionInfo="    һʱ������ǻ��������Ͻ���˳����ľ��ӣ������µ�̽���������ⵤ����һ��ӵ���������Ԯ��\n \n    "  --��������
x223001_g_MissionInfo2="�����ǵ�Ԯ���������ˣ�����������·�����������ֻ��Ҫ���Ұ�ըҩ����С·�ľ�ʯ��������������ĵ��˺ܶ࣬��ҪС�ģ�"
x223001_g_MissionTarget="    �ڣ��������ըҩ��Ȼ�������#G�ɸ�#W������"		
x223001_g_MissionComplete="    �����������أ������㰲ȫ�����Ҿͳ��׷����ˣ�"					--�������npc˵���Ļ�
x223001_g_ContinueInfo="    Ϊ����ȡ���ʱ�䣬��ըҩ��ã���ס���ǵ�Ԯ����"
--������
x223001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x223001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223001_g_RadioItemBonus={}

--MisDescEnd
x223001_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x223001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x223001_g_MissionId)
	if x223001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223001_g_MissionId) > 0 then
		if x223001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x223001_g_MissionName)
		     	AddText(sceneId,x223001_g_MissionComplete)
		     	AddMoneyBonus(sceneId, x223001_g_MoneyBonus)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x223001_g_ScriptId, x223001_g_MissionId)
                elseif x223001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223001_g_MissionName)
			AddText(sceneId,x223001_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223001_g_MissionTarget) 
			AddText(sceneId,format("\n    ����ɸ��ըҩ   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     	EndEvent()
			DispatchEventList(sceneId, selfId, targetId)	
                end

        elseif x223001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223001_g_MissionName)
                AddText(sceneId,x223001_g_MissionInfo..GetName(sceneId, selfId)..x223001_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223001_g_ScriptId, x223001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223001_g_ScriptId, x223001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223001_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==17) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x223001_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x223001_g_noDemandItem[1].id, x223001_g_noDemandItem[1].num )             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x223001_g_MissionId, x223001_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x223001_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			AddItemListToHuman(sceneId,selfId) 
	        else                                                             
		     BeginEvent(sceneId)                                      
		     AddText(sceneId,"��Ʒ����������������������")                    
		     EndEvent(sceneId)                                        
		     DispatchMissionTips(sceneId,selfId)                      
	        end           	        	                                    
	     
end



--**********************************

--����

--**********************************

function x223001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223001_g_MissionId)
	for i, item in x223001_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223001_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223001_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x223001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223001_g_MissionId)
		AddExp(sceneId, selfId, x223001_g_ExpBonus)
		AddMoney(sceneId, selfId, x223001_g_MoneyBonus)
		for i, item in x223001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		--CallScriptFunction( x223001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223001_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x223001_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223001_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	
end

function x223001_OnLeaveArea(sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x223001_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
end

function x223001_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x223001_OnItemChanged(sceneId, selfId, itemdataId)

end

