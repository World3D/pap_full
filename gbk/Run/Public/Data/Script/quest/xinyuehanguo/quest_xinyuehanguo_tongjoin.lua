--���ܣ�������
--NPC��������

--MisDescBegin
x211035_g_ScriptId = 211035

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211035_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	GuildList(sceneId, selfId, targetId);
end



--**********************************

--�о��¼�

--**********************************

function x211035_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211035_g_ScriptId, "������")
end



--**********************************

--����������

--**********************************

function x211035_CheckAccept(sceneId, selfId, targetId)

end
--**********************************

--����

--**********************************

function x211035_OnAccept(sceneId, selfId)

end



--**********************************

--����

--**********************************

function x211035_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211035_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211035_OnSubmit(sceneId, selfId, targetId, selectRadioId)

end



--**********************************

--ɱ����������

--**********************************

function x211035_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211035_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211035_OnItemChanged(sceneId, selfId, itemdataId)

end