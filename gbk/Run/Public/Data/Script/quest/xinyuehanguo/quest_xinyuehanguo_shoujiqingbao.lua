--���ܣ������ռ��鱨
--NPC���ȷ潫��

--MisDescBegin
x211005_g_ScriptId = 211005

x211005_g_MissionName = "�ռ��鱨"
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y�ռ��鱨")
		AddText(sceneId, "������ս���鱨���ռ�������Ϊ��Ҫ���鱨��Ա��Ȼ����ս���ϳ������ɱ�У�����һ����Ҫ���鱨������ɱ�������������С�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211005_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211005_g_ScriptId, x211005_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211005_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211005_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211005_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211005_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211005_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211005_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211005_OnItemChanged(sceneId, selfId, itemdataId)

end