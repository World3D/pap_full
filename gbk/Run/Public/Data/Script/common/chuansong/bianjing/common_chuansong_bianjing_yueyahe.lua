--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300439_g_ScriptId = 300439
x300439_g_MissionName="������"
x300439_g_TransScriptId = 800019
x300439_g_TransPos="yueyahe"

--**********************************

--������ں���

--**********************************

function x300439_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300439_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300439_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300439_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300439_g_ScriptId, x300439_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300439_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300439_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300439_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300439_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300439_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300439_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300439_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300439_OnItemChanged(sceneId, selfId, itemdataId)

end