--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300429_g_ScriptId = 300429
x300429_g_MissionName="��������"
x300429_g_TransScriptId = 800019
x300429_g_TransPos="boximiya"

--**********************************

--������ں���

--**********************************

function x300429_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300429_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300429_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300429_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300429_g_ScriptId, x300429_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300429_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300429_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300429_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300429_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300429_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300429_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300429_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300429_OnItemChanged(sceneId, selfId, itemdataId)

end