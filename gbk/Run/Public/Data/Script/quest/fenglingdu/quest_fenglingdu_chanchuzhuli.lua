--��������

--MisDescBegin
x212000_g_ScriptId = 212000
--x212000_g_MissionIdPre =83
x212000_g_MissionId = 247
x212000_g_MissionKind = 17
x212000_g_MissionLevel = 70
x212000_g_ScriptIdNext = {ScriptId = 212001 ,LV = 1 }
x212000_g_Name	="�ɼ�˼��"
x212000_g_Name2	="�ٲ�̨" 
x212000_g_DemandItem ={}
--x212000_g_noDemandKill ={{id=301,num=1}}	

x212000_g_MissionName="��������"
x212000_g_MissionInfo="    �ò��˶�ã������Ĺ��������־ͻ���Զ����ʷ����ʧ�������������γ��������������Ĵ��ۡ�\n \n    �������ĵ�������������û�����������ѣ��Ż���Զ���������ǡ�\n \n    #G�ٲ�̨#W���������Ĵ󽫾���"  --��������
x212000_g_MissionInfo2="����ȥ�������������ⷬ��һ�ֲ�©�ĸ�������"
x212000_g_MissionTarget="    �ɼ�˼��Ҫ�����#G�ٲ�̨#W���������ĵ����������ٲ�̨����������Ӫ����"		
x212000_g_MissionComplete="    һ·�������ˣ��󺹵��������Ѿ���֪��"					--�������npc˵���Ļ�
--������
x212000_g_MoneyBonus = 200
--�̶���Ʒ���������8��
x212000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212000_g_RadioItemBonus={}

--MisDescEnd
x212000_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x212000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212000_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x212000_g_MissionName)
		     AddText(sceneId,x212000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x212000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x212000_g_ScriptId, x212000_g_MissionId)
                

        elseif x212000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212000_g_MissionName)
                AddText(sceneId,x212000_g_MissionInfo..GetName(sceneId, selfId)..x212000_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x212000_g_ScriptId, x212000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212000_g_ScriptId, x212000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212000_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==12) then
        		if (GetName(sceneId,targetId)==x212000_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x212000_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x212000_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x212000_g_MissionId) > 0 then
				    	return 1
	        	            end
	        	end
	end
        return 0
	
end

--**********************************

--����

--**********************************

function x212000_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x212000_g_MissionId, x212000_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x212000_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x212000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212000_g_MissionId)
	for i, item in x212000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212000_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212000_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x212000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212000_g_MissionId)
		AddExp(sceneId, selfId, x212000_g_ExpBonus)
		AddMoney(sceneId, selfId, x212000_g_MoneyBonus)
		for i, item in x212000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x212000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x212000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x212000_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x212000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212000_OnItemChanged(sceneId, selfId, itemdataId)

end

