--���ܣ����ҷ�����ս
--NPC���о�����

--MisDescBegin
x211006_g_ScriptId = 211006

x211006_g_MissionName = "������ս"
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y������ս")
		AddText(sceneId, "���ڵ��ˣ����Ǽ������ʾ�������ֹ��˵�ս�����飬�ҹ�������ս���������Ȼ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211006_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211006_g_ScriptId, x211006_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211006_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211006_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211006_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211006_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211006_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211006_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211006_OnItemChanged(sceneId, selfId, itemdataId)

end