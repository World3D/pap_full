--���ܣ����ҽ��蹤��
--NPC����˾��

--MisDescBegin
x211004_g_ScriptId = 211004

x211004_g_MissionName = "���蹤��"
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y���蹤��")
		AddText(sceneId, "���һ�����������ˣ��������������������ߡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211004_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211004_g_ScriptId, x211004_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211004_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211004_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211004_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211004_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211004_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211004_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211004_OnItemChanged(sceneId, selfId, itemdataId)

end