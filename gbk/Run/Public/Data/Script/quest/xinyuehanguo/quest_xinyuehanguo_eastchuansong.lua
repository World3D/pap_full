--���ܣ����Ŵ���
--NPC�����Ŵ���ʹ��

x211028_g_ScriptId = 211028
x211028_g_MissionName="�����㳡"
--**********************************

--������ں���

--**********************************

function x211028_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	SetPos(sceneId, selfId,108,258)
end



--**********************************

--�о��¼�

--**********************************

function x211028_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211028_g_ScriptId, x211028_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211028_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211028_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211028_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211028_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211028_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211028_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211028_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211028_OnItemChanged(sceneId, selfId, itemdataId)

end