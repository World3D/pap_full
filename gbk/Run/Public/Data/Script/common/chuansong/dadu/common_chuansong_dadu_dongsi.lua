--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300413_g_ScriptId = 300413
x300413_g_MissionName="����"
x300413_g_TransScriptId = 800019
x300413_g_TransPos="dongsi"

--**********************************

--������ں���

--**********************************

function x300413_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300413_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300413_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300413_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300413_g_ScriptId, x300413_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300413_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300413_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300413_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300413_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300413_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300413_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300413_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300413_OnItemChanged(sceneId, selfId, itemdataId)

end