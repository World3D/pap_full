--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300442_g_ScriptId = 300442
x300442_g_MissionName="����´"
x300442_g_TransScriptId = 800019
x300442_g_TransPos="dengyunlu"

--**********************************

--������ں���

--**********************************

function x300442_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300442_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300442_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300442_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300442_g_ScriptId, x300442_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300442_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300442_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300442_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300442_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300442_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300442_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300442_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300442_OnItemChanged(sceneId, selfId, itemdataId)

end