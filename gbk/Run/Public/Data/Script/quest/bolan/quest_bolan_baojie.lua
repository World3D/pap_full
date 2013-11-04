--����

--MisDescBegin
x226006_g_ScriptId = 226006
x226006_g_MissionIdPre =341
x226006_g_MissionId = 342
x226006_g_MissionKind = 23
x226006_g_MissionLevel = 115
--x226006_g_ScriptIdNext = {ScriptId = 205002 ,LV = 1 }
x226006_g_Name	="����" 
x226006_g_Name2	="�����" 
x226006_g_DemandItem ={}
--x226006_g_noDemandKill ={{id=301,num=1}}	

x226006_g_MissionName="����"
x226006_g_MissionInfo="     #G�����#WӦ�û���֪��������ɱ����Ϣ��Ҫ��������֪�������Ϣ��������������Ĳ������кܴ���������Ұ�����ݱ��������ɡ�"  --��������
x226006_g_MissionTarget="    ����#G�����#W������ɱ����Ϣ��"		
x226006_g_MissionComplete="    û�������Ϣ����һ����������Ĳ�����������������һ������Ϣ��"					--�������npc˵���Ļ�
--x226006_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x226006_g_MoneyBonus = 0
--�̶���Ʒ���������8��
x226006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x226006_g_RadioItemBonus={}
--MisDescEnd
x226006_g_ExpBonus = 22
--**********************************

--������ں���

--**********************************

function x226006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x226006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x226006_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x226006_g_MissionName)
		     AddText(sceneId,x226006_g_MissionComplete)
		     --AddMoneyBonus(sceneId, x201001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x226006_g_ScriptId, x226006_g_MissionId)
                

        elseif x226006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x226006_g_MissionName)
                AddText(sceneId,x226006_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x226006_g_MissionTarget) 
		--AddMoneyBonus(sceneId, x226006_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x226006_g_ScriptId, x226006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x226006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x226006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x226006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x226006_g_ScriptId, x226006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x226006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x226006_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==22) then
        	if IsMissionHaveDone(sceneId, selfId, x226006_g_MissionIdPre) > 0 then
	        	if (GetName(sceneId,targetId)==x226006_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x226006_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x226006_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x226006_g_MissionId) > 0 then
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

function x226006_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x226006_g_MissionId, x226006_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x226006_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x226006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x226006_g_MissionId)
	for i, item in x226006_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x226006_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226006_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x226006_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x226006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x226006_g_MissionId)
		AddExp(sceneId, selfId, x226006_g_ExpBonus)
		AddMoney(sceneId, selfId, x226006_g_MoneyBonus)
		for i, item in x226006_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x226006_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x226006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	
	
end



--**********************************

--ɱ����������

--**********************************

function x226006_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x226006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x226006_OnItemChanged(sceneId, selfId, itemdataId)

end

