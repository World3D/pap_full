--���ܣ�����˰������
--NPC����˾��

--MisDescBegin
x211003_g_ScriptId = 211003

x211003_g_MissionName = "˰��"
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y˰��")
		AddText(sceneId, "���˳����˰�գ����ҾͿ��Է�չ�Ƽ������蹤�̡����ǹ��ص�˰��Ҳ�ᵼ����Թ��������֮��֮����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211003_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211003_g_ScriptId, x211003_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211003_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211003_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211003_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211003_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211003_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211003_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211003_OnItemChanged(sceneId, selfId, itemdataId)

end