--���ܣ����ҳＯ����
--NPC���������

--MisDescBegin
x211007_g_ScriptId = 211007

x211007_g_MissionName = "�Ｏ����"
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y�Ｏ����")
		AddText(sceneId, "ǰ�ߵ�սʿ������ԡѪ��ս�����������ڵ�һ�����ܵ����ӣ��������ǵĴ�󷽡�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211007_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211007_g_ScriptId, x211007_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211007_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211007_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211007_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211007_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211007_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211007_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211007_OnItemChanged(sceneId, selfId, itemdataId)

end