--��ȼ�ź�

--MisDescBegin
x208007_g_ScriptId = 208007
--x208007_g_MissionIdPre =40
x208007_g_MissionId = 61
x208007_g_MissionKind = 12
x208007_g_MissionLevel = 60
--x208007_g_ScriptIdNext = {ScriptId = 208005 ,LV = 1 }
x208007_g_Name	="�ٲ�̨" 
x208007_g_noDemandItem ={{id=13010015,num=1}}
--x208007_g_noDemandKill ={{id=301,num=1}}	

x208007_g_MissionName="��ȼ�ź�"
x208007_g_MissionInfo="��������Ϊ����ˣ���������ı��֣�������ǰ�ȣ������˺ܶ࣡\n \n    ���ǹ����������ǣ����ǻ�û����ħڭħ�����ħ���������Ķ������������ұ����ֹ�������ߣ��������������õ��̻����뵽��117��122����ȥ��Ϊ�ҵ�ȼ������·�����ͻ����ס�ؿڣ�ֻ������������׽ħڭħ���ӣ�"  --��������
x208007_g_MissionTarget="    ���ߵش���#G�ٲ�̨#W������̻���ȼ"		
x208007_g_MissionComplete="    һ·�����ˣ�"					--�������npc˵���Ļ�
x208007_g_ContinueInfo="    ħڭħ���ӽƻ��ý���Ҫ����֪ͨ��·������"
--������
x208007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208007_g_RadioItemBonus={}

--MisDescEnd
x208007_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x208007_g_MissionId)
	if x208007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208007_g_MissionId) > 0 then
		if x208007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x208007_g_MissionName)
		     	AddText(sceneId,x208007_g_MissionComplete)
		     	AddMoneyBonus(sceneId, x208007_g_MoneyBonus)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x208007_g_ScriptId, x208007_g_MissionId)
                elseif x208007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x208007_g_MissionName)
			AddText(sceneId,x208007_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x208007_g_MissionTarget) 
			AddText(sceneId,format("\n    ��ȼ�ź�   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     	EndEvent()
			DispatchEventList(sceneId, selfId, targetId)	
                end

        elseif x208007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208007_g_MissionName)
                AddText(sceneId,"    <�ٲ�̨���´�����һ�����ѽ��и��򿪣��ݸ�����>"..GetName(sceneId, selfId)..x208007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208007_g_ScriptId, x208007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208007_g_ScriptId, x208007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208007_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==8) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208007_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x208007_g_noDemandItem[1].id, x208007_g_noDemandItem[1].num )             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x208007_g_MissionId, x208007_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x208007_g_MissionName) 
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

function x208007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208007_g_MissionId)
	for i, item in pairs(x208007_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208007_g_MissionId)
		AddExp(sceneId, selfId, x208007_g_ExpBonus)
		AddMoney(sceneId, selfId, x208007_g_MoneyBonus)
		for i, item in pairs(x208007_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		--CallScriptFunction( x208007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208007_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x208007_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208007_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	
end

function x208007_OnLeaveArea(sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x208007_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
end

function x208007_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x208007_OnItemChanged(sceneId, selfId, itemdataId)

end

