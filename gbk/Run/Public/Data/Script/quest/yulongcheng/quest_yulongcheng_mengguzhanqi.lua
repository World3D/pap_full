--�ɹ�ս��

--MisDescBegin
x208002_g_ScriptId = 208002
--x208002_g_MissionIdPre =40
x208002_g_MissionId = 56
x208002_g_MissionKind = 12
x208002_g_MissionLevel = 60
x208002_g_ScriptIdNext = {ScriptId = 208003 ,LV = 1 }
x208002_g_Name	="�ɼ�˼��" 
x208002_g_Name2	="����" 
--x208002_g_DemandItem ={{id=13010003,num=1}}
--x208002_g_noDemandKill ={{id=301,num=1}}	

x208002_g_MissionName="�ɹ�ս��"
x208002_g_MissionInfo="    �Ҷ����ǵ�Ͷ�����Ѿ�û���κ���Ȥ����Ҫ�����Ǹ������صĴ��ۣ�Ѫϴ������ģ�����ҵĴ�������ཫ��������ɹŴ���������ǵ�ս��������ǵĻʳ��ϣ�\n \n    �ٲ�̨�������ܱ𽫾�����������㣬���������������һ��ȥ�ɣ��㵽#G����#W����ȥ������"  --��������
x208002_g_MissionTarget="    ��#G����#W���ﱨ����"		
x208002_g_MissionComplete="    �������������������ڵ��㡣"					--�������npc˵���Ļ�
--x208002_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x208002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208002_g_RadioItemBonus={}

--MisDescEnd
x208002_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208002_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x208002_g_MissionName)
		     AddText(sceneId,x208002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x208002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x208002_g_ScriptId, x208002_g_MissionId)
                

        elseif x208002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208002_g_MissionName)
                AddText(sceneId,x208002_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208002_g_ScriptId, x208002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208002_g_ScriptId, x208002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208002_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==8) then
        	if (GetName(sceneId,targetId)==x208002_g_Name) then
        	        if IsHaveMission(sceneId,selfId, x208002_g_MissionId)<= 0 then
        	            	return 1
        	        end
        	end
		if (GetName(sceneId,targetId)==x208002_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x208002_g_MissionId) > 0 then
			    	return 1
        	            end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208002_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x208002_g_MissionId, x208002_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x208002_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x208002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208002_g_MissionId)
	for i, item in pairs(x208002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208002_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208002_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208002_g_MissionId)
		AddExp(sceneId, selfId, x208002_g_ExpBonus)
		AddMoney(sceneId, selfId, x208002_g_MoneyBonus)
		for i, item in pairs(x208002_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		
		CallScriptFunction( x208002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208002_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x208002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208002_OnItemChanged(sceneId, selfId, itemdataId)

end

