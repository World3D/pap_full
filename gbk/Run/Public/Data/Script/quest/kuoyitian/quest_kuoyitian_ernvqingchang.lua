--��Ů�鳤

--MisDescBegin
x214002_g_ScriptId = 214002
x214002_g_MissionIdPre =108
x214002_g_MissionId = 109
x214002_g_MissionKind = 3
x214002_g_MissionLevel = 15
x214002_g_ScriptIdNext = {ScriptId = 214003 ,LV = 1 }
x214002_g_Name	="�ϴ�" 
x214002_g_Name2	="��ľ��" 
x214002_g_DemandItem ={}
--x214002_g_noDemandKill ={{id=301,num=1}}	

x214002_g_MissionName="��Ů�鳤"
x214002_g_MissionInfo="    <�ϴ�������ˮ��������˵>��ľ�桭����������������ô�����ˣ��������𡭡�\n \n    �������������ҵ���С��ʱ���Ҿ�֪��������һ����ƽ�����ˣ�������һ���������ģ�\n \n    "  --��������
x214002_g_MissionInfo2="���Ҳ�����ô�����ȥ���ҵ��ɷ�̩������ץ���ˣ���Ҫȥ�����ɷ������ȥ����#G��ľ��#W���ϴ���Զ��������������"
x214002_g_MissionTarget="    �Ѻϴ𰲵Ļ�����#G��ľ��#W��"		
x214002_g_MissionComplete="    лл����Ҵ����ϴ𰲵���Ϣ��"					--�������npc˵���Ļ�
--x214002_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x214002_g_MoneyBonus = 600
--�̶���Ʒ���������8��
x214002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214002_g_RadioItemBonus={}

--MisDescEnd
x214002_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x214002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214002_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x214002_g_MissionName)
		     AddText(sceneId,x214002_g_MissionComplete)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214002_g_ScriptId, x214002_g_MissionId)
                

        elseif x214002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214002_g_MissionName)
                AddText(sceneId,x214002_g_MissionInfo..GetName(sceneId, selfId)..x214002_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214002_g_ScriptId, x214002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214002_g_ScriptId, x214002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214002_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==14) then
        	if IsMissionHaveDone(sceneId, selfId, x214002_g_MissionIdPre) > 0 then
	        	if (GetName(sceneId,targetId)==x214002_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x214002_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x214002_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x214002_g_MissionId) > 0 then
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

function x214002_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x214002_g_MissionId, x214002_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x214002_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x214002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214002_g_MissionId)
	for i, item in x214002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214002_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214002_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x214002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x214002_g_MissionId)
		AddExp(sceneId, selfId, x214002_g_ExpBonus)
		AddMoney(sceneId, selfId, x214002_g_MoneyBonus)
		for i, item in x214002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x214002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x214002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x214002_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x214002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214002_OnItemChanged(sceneId, selfId, itemdataId)

end

