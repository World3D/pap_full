--���ܣ�������
--NPC��������

--MisDescBegin
x211000_g_ScriptId = 211000

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	GuildCreate(sceneId, selfId, targetId);
end



--**********************************

--�о��¼�

--**********************************

function x211000_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211000_g_ScriptId, "�������")
end



--**********************************

--����������

--**********************************

function x211000_CheckAccept(sceneId, selfId, targetId)

end
--**********************************

--����

--**********************************

function x211000_OnAccept(sceneId, selfId)

end



--**********************************

--����

--**********************************

function x211000_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211000_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

end



--**********************************

--ɱ����������

--**********************************

function x211000_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211000_OnItemChanged(sceneId, selfId, itemdataId)

end