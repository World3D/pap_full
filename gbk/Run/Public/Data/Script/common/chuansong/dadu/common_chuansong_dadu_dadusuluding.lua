--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300422_g_ScriptId = 300422
x300422_g_MissionName="��"
x300422_g_TransScriptId = 800019
x300422_g_TransPos="dadusuluding"

--**********************************

--������ں���

--**********************************

function x300422_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300422_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300422_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300422_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300422_g_ScriptId, x300422_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300422_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300422_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300422_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300422_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300422_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300422_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300422_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300422_OnItemChanged(sceneId, selfId, itemdataId)

end