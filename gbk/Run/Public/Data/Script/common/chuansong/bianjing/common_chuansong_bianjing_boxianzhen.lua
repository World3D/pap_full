--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300434_g_ScriptId = 300434
x300434_g_MissionName="������"
x300434_g_TransScriptId = 800019
x300434_g_TransPos="boxianzhen"

--**********************************

--������ں���

--**********************************

function x300434_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300434_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300434_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300434_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300434_g_ScriptId, x300434_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300434_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300434_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300434_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300434_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300434_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300434_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300434_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300434_OnItemChanged(sceneId, selfId, itemdataId)

end