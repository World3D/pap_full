--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300452_g_ScriptId = 300452
x300452_g_MissionName="�����"
x300452_g_TransScriptId = 800019
x300452_g_TransPos="luofenglin"

--**********************************

--������ں���

--**********************************

function x300452_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300452_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300452_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300452_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300452_g_ScriptId, x300452_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300452_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300452_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300452_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300452_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300452_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300452_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300452_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300452_OnItemChanged(sceneId, selfId, itemdataId)

end