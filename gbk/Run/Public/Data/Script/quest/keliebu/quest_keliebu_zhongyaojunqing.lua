--��Ҫ����

--MisDescBegin
x202006_g_ScriptId = 202006
x202006_g_MissionIdPre =124
x202006_g_MissionId = 125
x202006_g_MissionKind = 4
x202006_g_MissionLevel = 20
x202006_g_ScriptIdNext = {ScriptId = 202007 ,LV = 1 }
x202006_g_Name	="����" 
x202006_g_Name2	="ľ����" 
x202006_g_DemandItem ={}
--x202006_g_noDemandKill ={{id=301,num=1}}	

x202006_g_MissionName="��Ҫ����"
x202006_g_MissionInfo="    �ոմ���һ������Ϣ����������������ɳ��һ����װս�����ߣ����Դ���������˵���ҹ�ڰ������д����ǵĽ�ʿ��\n \n    �����ϵ��ˣ���������͵Ϯ���ǵĺû��ᣬ����������Ϣ���촫��#Gľ����#W���塣"  --��������
x202006_g_MissionTarget="    ������Ļ���ȥ��#Gľ����#W��"		
x202006_g_MissionComplete="    �����Ϣ����Ҫ��"					--�������npc˵���Ļ�
--x202006_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x202006_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202006_g_RadioItemBonus={}

--MisDescEnd
x202006_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202006_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202006_g_MissionName)
		     AddText(sceneId,x202006_g_MissionComplete)
		     AddMoneyBonus(sceneId, x202006_g_MoneyBonus)
                     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202006_g_ScriptId, x202006_g_MissionId)
                

        elseif x202006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202006_g_MissionName)
                AddText(sceneId,x202006_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202006_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202006_g_ScriptId, x202006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202006_g_ScriptId, x202006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202006_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==2) then
        	if IsMissionHaveDone(sceneId, selfId, x202006_g_MissionIdPre) > 0 then
	        	if (GetName(sceneId,targetId)==x202006_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x202006_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x202006_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x202006_g_MissionId) > 0 then
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

function x202006_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x202006_g_MissionId, x202006_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x202006_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x202006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202006_g_MissionId)
	for i, item in x202006_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202006_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202006_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202006_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202006_g_MissionId)
		AddExp(sceneId, selfId, x202006_g_ExpBonus)
		AddMoney(sceneId, selfId, x202006_g_MoneyBonus)
		for i, item in x202006_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x202006_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x202006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202006_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x202006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202006_OnItemChanged(sceneId, selfId, itemdataId)

end

