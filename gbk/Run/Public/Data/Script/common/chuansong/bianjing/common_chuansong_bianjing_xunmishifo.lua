--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300443_g_ScriptId = 300443
x300443_g_MissionName="����ʯ��"
x300443_g_TransScriptId = 800019
x300443_g_TransPos="xunmishifo"

--**********************************

--������ں���

--**********************************

function x300443_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300443_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300443_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300443_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300443_g_ScriptId, x300443_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300443_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300443_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300443_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300443_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300443_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300443_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300443_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300443_OnItemChanged(sceneId, selfId, itemdataId)

end