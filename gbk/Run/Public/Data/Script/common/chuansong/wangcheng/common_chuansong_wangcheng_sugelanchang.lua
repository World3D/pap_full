--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300428_g_ScriptId = 300428
x300428_g_MissionName="�ո�����"
x300428_g_TransScriptId = 800019
x300428_g_TransPos="sugelanchang"

--**********************************

--������ں���

--**********************************

function x300428_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300428_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300428_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300428_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300428_g_ScriptId, x300428_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300428_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300428_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300428_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300428_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300428_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300428_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300428_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300428_OnItemChanged(sceneId, selfId, itemdataId)

end