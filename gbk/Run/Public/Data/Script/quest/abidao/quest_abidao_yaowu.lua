--ҩ��

--MisDescBegin
x203002_g_ScriptId = 203002
x203002_g_MissionIdPre =69
x203002_g_MissionId = 70
x203002_g_MissionKind = 13
x203002_g_MissionLevel = 50
x203002_g_ScriptIdNext = {ScriptId = 203003 ,LV = 1 }
x203002_g_Name	="����" 
x203002_g_Name2	="����" 
x203002_g_noDemandItem ={{id=13010017,num=1}}
--x203002_g_noDemandKill ={{id=301,num=1}}	

x203002_g_MissionName="ҩ��"
x203002_g_MissionInfo="����ʿ�������ҩ����������������������ú��������ҩ�ġ�\n \n    <�����ݸ���һ��������ʱ�򣬻�����������һ��>\n \n    �ǵ����������Լ�ҪС�ġ�����֪������Ҫʲô����һ�����跨���Ұ��״��£��ܿ����Ǿͻ��ټ���ġ�"  --��������
x203002_g_MissionTarget="    ��#G����#W��ҩ�͸�#G����#W�������������"		
x203002_g_MissionComplete="    ���úܺã���ϲ���������������µ������ˡ�"					--�������npc˵���Ļ�
x203002_g_ContinueInfo="    �ܶ���ǰ�͸�������ʶ�ˣ���ʱ���Ķ��ˡ������㻹�ǸϽ�ȥ�����ɣ�"
x203002_g_ContinueInfo2="    ��Ȼ���겻�������ǹ������ķ��ʱʱ�̿������Ժ�������Ҽ������������ĵ�Ӣ�ۣ�\n \n    ������ʲô�������Ա���������ľ���֮������Ϊ�����£������ҵ����ң�����߹����������Ѿ�Ū�������ҩ���÷���"
--������
x203002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203002_g_RadioItemBonus={}

--MisDescEnd
x203002_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x203002_g_MissionId)
	if x203002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203002_g_MissionId) > 0 then
		if x203002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x203002_g_MissionName)
		     	AddText(sceneId,x203002_g_MissionComplete)
		     	AddMoneyBonus(sceneId, x203002_g_MoneyBonus)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x203002_g_ScriptId, x203002_g_MissionId)
                end
                if x203002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	if (GetName(sceneId,targetId)==x203002_g_Name) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x203002_g_MissionName)
				AddText(sceneId,x203002_g_ContinueInfo)
				AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x203002_g_MissionTarget) 
				AddText(sceneId,format("\n    ��ҩ�͸�����   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
			if (GetName(sceneId,targetId)==x203002_g_Name2) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x203002_g_MissionName)
				AddText(sceneId,x203002_g_ContinueInfo2)
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				BeginEvent(sceneId)
				AddText(sceneId,format("��ҩ�͸�����   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
		     		DispatchMissionTips(sceneId, selfId)
		     		for i, item in x203002_g_noDemandItem do
					DelItem(sceneId, selfId, item.id, item.num)
				end
			end
                		
                end

        elseif x203002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203002_g_MissionName)
                AddText(sceneId,"    "..GetName(sceneId, selfId)..x203002_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203002_g_ScriptId, x203002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203002_g_ScriptId, x203002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203002_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==3) then
        	if IsMissionHaveDone(sceneId, selfId, x203002_g_MissionIdPre) > 0 then
        	misIndex = GetMissionIndexByID(sceneId,selfId,x203002_g_MissionId)
        		if (GetName(sceneId,targetId)==x203002_g_Name) then
        	            		return 1
        		end
			if (GetName(sceneId,targetId)==x203002_g_Name2) then
			   	 if IsHaveMission(sceneId,selfId, x203002_g_MissionId) > 0 then
			    		if LuaFnGetItemCount(sceneId,selfId,x203002_g_noDemandItem[1].id) == 1 then
			    			return 1
			    		end
        	           	 end
        		end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203002_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x203002_g_noDemandItem[1].id, x203002_g_noDemandItem[1].num )             
	ret = EndAddItem(sceneId,selfId)                                 
	if ret > 0 then                                                  
	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x203002_g_MissionId, x203002_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x203002_g_MissionName) 
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

function x203002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203002_g_MissionId)
	for i, item in x203002_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203002_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203002_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203002_g_MissionId)
		AddExp(sceneId, selfId, x203002_g_ExpBonus)
		AddMoney(sceneId, selfId, x203002_g_MoneyBonus)
		for i, item in x203002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		CallScriptFunction( x203002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203002_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x203002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203002_OnItemChanged(sceneId, selfId, itemdataId)

end

