--̰������ʦ

--MisDescBegin
x226011_g_ScriptId = 226011
x226011_g_MissionIdPre =341
x226011_g_MissionId = 347
x226011_g_MissionKind = 23
x226011_g_MissionLevel = 115
--x226011_g_ScriptIdNext = {ScriptId = 205002 ,LV = 1 }
x226011_g_Name	="�����ָ�ӹ�" 
x226011_g_Name2	="�����" 
x226011_g_DemandItem ={}
--x226011_g_noDemandKill ={{id=301,num=1}}	

x226011_g_MissionName="̰������ʦ"
x226011_g_MissionInfo="     #G�����#WӦ�û���֪��������ɱ����Ϣ��Ҫ��������֪�������Ϣ��������������Ĳ������кܴ���������Ұ�����ݱ��������ɡ�"  --��������
x226011_g_MissionTarget="    ����#G�����#W������ɱ����Ϣ��"		
x226011_g_MissionComplete="    û�������Ϣ����һ����������Ĳ�����������������һ������Ϣ��"					--�������npc˵���Ļ�
--x226011_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x226011_g_MoneyBonus = 0
--�̶���Ʒ���������8��
x226011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x226011_g_RadioItemBonus={}
--MisDescEnd
x226011_g_ExpBonus = 22
--**********************************

--������ں���

--**********************************

function x226011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x226011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x226011_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x226011_g_MissionName)
		     AddText(sceneId,x226011_g_MissionComplete)
		     --AddMoneyBonus(sceneId, x201001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x226011_g_ScriptId, x226011_g_MissionId)
                

        elseif x226011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x226011_g_MissionName)
                AddText(sceneId,x226011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x226011_g_MissionTarget) 
		--AddMoneyBonus(sceneId, x226011_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x226011_g_ScriptId, x226011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x226011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x226011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x226011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x226011_g_ScriptId, x226011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x226011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x226011_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==22) then
        	--if IsMissionHaveDone(sceneId, selfId, x226011_g_MissionIdPre) > 0 then
	        	if (GetName(sceneId,targetId)==x226011_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x226011_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x226011_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x226011_g_MissionId) > 0 then
				    	return 1
	        	            end
	        	end
	       -- end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x226011_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x226011_g_MissionId, x226011_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x226011_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x226011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x226011_g_MissionId)
	for i, item in x226011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x226011_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226011_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x226011_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x226011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x226011_g_MissionId)
		AddExp(sceneId, selfId, x226011_g_ExpBonus)
		AddMoney(sceneId, selfId, x226011_g_MoneyBonus)
		for i, item in x226011_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x226011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x226011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	
	
end



--**********************************

--ɱ����������

--**********************************

function x226011_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x226011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x226011_OnItemChanged(sceneId, selfId, itemdataId)

end

