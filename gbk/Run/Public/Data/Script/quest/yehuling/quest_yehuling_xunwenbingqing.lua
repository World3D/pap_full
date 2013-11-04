--�����ܾ�

--�ɼ�˼��

--�ű���
x207001_g_ScriptId = 207001

--��һ�������ID
x207001_g_MissionIdPre =1

--�����
x207001_g_MissionId = 2

--����Ŀ��npc
x207001_g_Name	="�ɼ�˼��" 
x207001_g_Name2	="�����" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--���񷢷ŵ���Ʒ
--x207001_g_MissionItem = {{id=10400001,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207001_g_MissionName="ѯ�ʲ���"
x207001_g_MissionInfo="���Ǵ�������˹��£��ܶ�ʿ�������˲������ò��ڴ���Ӫ�����ǵ���ʿ�Ǵ���û���뿪�����ԭ�����п�������Ϊˮ�������������������к��������һЩ��ɫ�����ʿ������������������֮������������˶�ҽ�������о�����ȥ��������ʲô�취��"  --��������
x207001_g_MissionTarget="ѯ�ʻ����ʿ���Ĳ���"		--����Ŀ��
x207001_g_MissionComplete="ˮ������������������к����������������Σ���������֮����������ɫ���࣬���������������ý�ϲ����Σ�һ����������Ĳ�������ô���أ��������������ס���"					--�������npc˵���Ļ�
--x207001_g_MissionAddItem="�õ������ܱ�"		
--x207001_g_szBackageFull = "����������"
--������
x207001_g_MoneyBonus=200
x207001_g_ItemBonus={}
x207001_g_RadioItemBonus={}
x207001_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207001_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207001_g_Name2) then
                     BeginEvent(sceneId)
	             AddText(sceneId, x207001_g_MissionName)
                     AddText(sceneId,x207001_g_MissionComplete)
                     AddMoneyBonus(sceneId, x207001_g_MoneyBonus) 
	             EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207001_g_ScriptId, x207001_g_MissionId)

                end
        elseif x207001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207001_g_MissionName, x207001_g_MissionInfo, x207001_g_MissionTarget, x207001_g_ItemBonus, x207001_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207001_g_ScriptId, x207001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207001_g_ScriptId, x207001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207001_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207001_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207001_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x207001_g_MissionId)<= 0 then
                    return 1
                    end
                end
        end
	if (GetName(sceneId,targetId)==x207001_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207001_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207001_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207001_g_MissionId, x207001_g_ScriptId, 1, 0, 0)		--�������
end



--**********************************

--����

--**********************************

function x207001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207001_g_MissionId)

end



--**********************************

--����

--**********************************

function x207001_OnContinue(sceneId, selfId, targetId)

	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
	
	AddText(sceneId, x207001_g_MissionName)
        AddText(sceneId,x207001_g_MissionComplete)
        AddMoneyBonus(sceneId, x207001_g_MoneyBonus) 
	EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207001_g_ScriptId, x207001_g_MissionId)

end


--**********************************

--����Ƿ�����ύ

--**********************************

function x207001_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207001_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207001_g_MissionId)
		AddExp(sceneId, selfId, x207001_g_ExpBonus)
		AddMoney(sceneId, selfId, x207001_g_MoneyBonus)
		for i, item in x207001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207001_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207001_OnItemChanged(sceneId, selfId, itemdataId)

end

