--��ս֮��

--MisDescBegin
x203007_g_ScriptId = 203007
--x203007_g_MissionIdPre =56
x203007_g_MissionId = 75
x203007_g_MissionKind = 13
x203007_g_MissionLevel = 50
--x203007_g_ScriptIdNext = {ScriptId = 207007 ,LV = 1 }
x203007_g_Name	="�ܱ�" 
x203007_g_Name2	="������ģʹ��" 
x203007_g_noDemandItem ={{id=13010021,num=1}}
x203007_g_MissionName="��ս֮��"
x203007_g_MissionInfo="    ��֪��������ģ��һ���ӱ���˭���Ǿ������ǵĹ���ħڭħ������׷�����Ǽ�ǧ����ڰ�ħڭħ�����İܱ�Χ������������ˣ����ڣ�������ѷ��ˡ�\n \n    Χ�ߵĺŽ��Ѿ����������Ƕ�ȡħڭħ������ͷ��ʱ���ˡ�"
x203007_g_MissionInfo2="�������д󺹵�һ���ţ���䵱���ǵ�ʹ�ߣ���������͵�#G������ģʹ��#W�����ϣ�ħڭħ��ῴ���ġ�"
x203007_g_MissionTarget="    #G�ܱ�#W��������͵�#G������ģʹ��#W�����ϡ�"		
x203007_g_MissionComplete="    ���ĺã���������ħڭħ�����ڹ���������󺹵��ţ�������Ҳ������"					--�������npc˵���Ļ�
x203007_g_ContinueInfo = "    �����͵�����"
x203007_g_ContinueInfo2 = "    �ܱ𽫾�˵ʲô�أ�"
--������
--��Ǯ����
x203007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203007_g_RadioItemBonus={}

--MisDescEnd
x203007_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x203007_g_MissionId)
	if x203007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203007_g_MissionId) > 0 then
		if x203007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x203007_g_MissionName)
		     	AddText(sceneId,x203007_g_MissionComplete)
		     	AddMoneyBonus(sceneId, x203007_g_MoneyBonus)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x203007_g_ScriptId, x203007_g_MissionId)
                end
                if x203007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	if (GetName(sceneId,targetId)==x203007_g_Name) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x203007_g_MissionName)
				AddText(sceneId,x203007_g_ContinueInfo)
				AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x203007_g_MissionTarget) 
				AddText(sceneId,format("\n    ���ܱ�����͸�������ģʹ��   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
			if (GetName(sceneId,targetId)==x203007_g_Name2) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x203007_g_MissionName)
				AddText(sceneId,x203007_g_ContinueInfo2)
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				BeginEvent(sceneId)
				AddText(sceneId,format("���ܱ�����͸�������ģʹ��   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
		     		DispatchMissionTips(sceneId, selfId)
		     		DelItem(sceneId, selfId, x203007_g_noDemandItem[1].id, 1)
			end
                		
                end

        elseif x203007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203007_g_MissionName)
                AddText(sceneId,x203007_g_MissionInfo..GetName(sceneId, selfId)..x203007_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203007_g_ScriptId, x203007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203007_g_ScriptId, x203007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203007_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==3) then
        misIndex = GetMissionIndexByID(sceneId,selfId,x203007_g_MissionId)
        	if (GetName(sceneId,targetId)==x203007_g_Name) then
        	            	return 1
        	end
		if (GetName(sceneId,targetId)==x203007_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x203007_g_MissionId) > 0 then
			    	if GetMissionParam(sceneId,selfId,misIndex,0) == 0 then
			    		return 1
			    	end
        	            end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203007_OnAccept(sceneId, selfId)

	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x203007_g_noDemandItem[1].id, x203007_g_noDemandItem[1].num )             
	ret = EndAddItem(sceneId,selfId)                                 
	if ret > 0 then                                                  
	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x203007_g_MissionId, x203007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x203007_g_MissionName) 
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

function x203007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203007_g_MissionId)
	for i, item in pairs(x203007_g_noDemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203007_g_MissionId)
		AddExp(sceneId, selfId, x203007_g_ExpBonus)
		AddMoney(sceneId, selfId, x203007_g_MoneyBonus)
		for i, item in pairs(x203007_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		--CallScriptFunction( x203007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203007_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x203007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203007_OnItemChanged(sceneId, selfId, itemdataId)

end

