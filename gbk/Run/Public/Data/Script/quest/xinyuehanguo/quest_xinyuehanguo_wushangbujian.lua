--���ܣ����Ŵ���
--NPC�����Ŵ���ʹ��

x211051_g_ScriptId = 211051
x211051_g_MissionName="�����㳡"
--**********************************

--������ں���

--**********************************

function x211051_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	SetPos(sceneId, selfId,108,258)
end



--**********************************

--�о��¼�

--**********************************

function x211051_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211051_g_ScriptId, x211051_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211051_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211051_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211051_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211051_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211051_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211051_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211051_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211051_OnItemChanged(sceneId, selfId, itemdataId)

end