--���ܣ����Ŵ���
--NPC�����Ŵ���ʹ��

x211032_g_ScriptId = 211032
x211032_g_MissionName="�����㳡"
--**********************************

--������ں���

--**********************************

function x211032_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	SetPos(sceneId, selfId,108,258)
end



--**********************************

--�о��¼�

--**********************************

function x211032_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211032_g_ScriptId, x211032_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211032_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211032_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211032_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211032_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211032_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211032_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211032_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211032_OnItemChanged(sceneId, selfId, itemdataId)

end