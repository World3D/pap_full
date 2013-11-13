
--�����ܾ�

--�ɼ�˼��

--�ű���
x207005_g_ScriptId = 207005
x207006_g_ScriptId = 207006
x207007_g_ScriptId = 207007

--��һ�������ID
x207005_g_MissionIdPre =5

--�����
x207005_g_MissionId = 6

--����Ŀ��npc
x207005_g_Name	="������" 
x207005_g_Name2	="������" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207005_g_DemandItem = {{id=10400001,num=1}}

--������Ҫ�ύ����Ʒ
--x207005_g_DeleteItem = {{id=10400001,num=1}}

--���񷢷ŵ���Ʒ
--x207005_g_MissionItem = {{id=10400001,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207005_g_MissionName="�ҵ�������"
x207006_g_MissionName="֥�鿪��"
x207006_g_MissionName2="�ػ�������"
x207007_g_MissionName="���������"
x207005_g_MissionInfo="����Ҫ��ԽҰ���룬ȥ���������ò�ҩ��������������˺ܶ࣬��ʹ�㻯��ױ��ҲҪ����С�ġ����ǵĽ�ͷ�����ǣ������ǵػ��������������"  --��������
x207005_g_MissionTarget="�ҵ�������"		--����Ŀ��
x207005_g_ContinueInfo="���Ǵ������񣬽�����ɹűȣ����硭�������ǵػ���ѡ��"		--δ��������npc�Ի�
x207005_g_MissionComplete="���Ұ����׵���ʿ���������ˣ����ﳣ�н����ץ������Ҳ��ܲ�С�ģ���ԭ���ҵ�ð����"					--�������npc˵���Ļ�
--x207005_g_MissionAddItem="�õ������ܱ�"		
--x207005_g_szBackageFull = "����������"
--������
x207005_g_MoneyBonus=200
x207005_g_ItemBonus={}
x207005_g_RadioItemBonus={}
x207005_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207005_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207005_g_Name2) then
                     BeginEvent(sceneId)
		     AddText(sceneId,x207005_g_ContinueInfo) 
                     EndEvent()
		     local bDone = x207005_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207005_g_ScriptId, x207005_g_MissionId, bDone)
		
                end
        elseif x207005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207005_g_MissionName, x207005_g_MissionInfo, x207005_g_MissionTarget, x207005_g_ItemBonus, x207005_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207005_g_ScriptId, x207005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207005_OnEnumerate(sceneId, selfId, targetId)
	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207005_CheckPushList(sceneId, selfId, targetId) > 0 then
	
	
	      if (GetName(sceneId,targetId)==x207005_g_Name) then 
		AddNumText(sceneId, x207005_g_ScriptId, x207005_g_MissionName)
	      end
	      if (GetName(sceneId,targetId)==x207005_g_Name2) then 
	         BeginEvent(sceneId)
		 AddText(sceneId,x207005_g_ContinueInfo) 
                 EndEvent()
                 DispatchEventList(sceneId, selfId, targetId)
                 AddNumText(sceneId, x207006_g_ScriptId, x207006_g_MissionName)
	         AddNumText(sceneId, x207006_g_ScriptId, x207006_g_MissionName2)
	         AddNumText(sceneId, x207007_g_ScriptId, x207007_g_MissionName)
	      end
	end
	
end



--**********************************

--����������

--**********************************

function x207005_CheckAccept(sceneId, selfId, targetId)

	if IsMissionHaveDone(sceneId, selfId, x207005_g_MissionIdPre) > 0 then
	    if (GetName(sceneId,targetId)==x207005_g_Name) then 
					return 1
	    end
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207005_CheckPushList(sceneId, selfId, targetId)

        if (GetName(sceneId,targetId)==x207005_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207005_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x207005_g_MissionId)<= 0 then
                    return 1
                    end
                end
        end
	if (GetName(sceneId,targetId)==x207005_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207005_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207005_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207005_g_MissionId, x207005_g_ScriptId, 1, 0, 0)		--�������
end



--**********************************

--����

--**********************************

function x207005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207005_g_MissionId)

end



--**********************************

--����

--**********************************

function x207005_OnContinue(sceneId, selfId, targetId)

	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
	
	AddText(sceneId, x207005_g_MissionName)
        AddText(sceneId,x207005_g_MissionComplete)
        AddMoneyBonus(sceneId, x207005_g_MoneyBonus) 
	EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207005_g_ScriptId, x207005_g_MissionId)

end


--**********************************

--����Ƿ�����ύ

--**********************************

function x207005_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207005_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207005_g_MissionId)
		AddExp(sceneId, selfId, x207005_g_ExpBonus)
		AddMoney(sceneId, selfId, x207005_g_MoneyBonus)
		for i, item in pairs(x207005_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207005_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207005_OnItemChanged(sceneId, selfId, itemdataId)

end

