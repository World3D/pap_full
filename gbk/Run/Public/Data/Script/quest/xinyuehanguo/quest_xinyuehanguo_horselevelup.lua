--���ܣ����ǿ������
--NPC�����ǿ����ʦ

--MisDescBegin
x211027_g_ScriptId = 211027

x211027_g_MissionName = "��˷�ֳ"
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211027_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y��˷�ֳ")
		AddText(sceneId, "�������ѵð���������һƥ����˭��ϣ�������õø����ء�������ֳ��õ�����ԣ����ǳ����еĳ��ã������е���������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211027_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211027_g_ScriptId, x211027_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211027_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211027_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211027_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211027_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211027_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211027_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211027_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211027_OnItemChanged(sceneId, selfId, itemdataId)

end