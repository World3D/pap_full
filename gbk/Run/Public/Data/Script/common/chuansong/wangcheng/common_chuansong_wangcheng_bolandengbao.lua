--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300430_g_ScriptId = 300430
x300430_g_MissionName="�����Ǳ�"
x300430_g_TransScriptId = 800019
x300430_g_TransPos="bolandengbao"

--**********************************

--������ں���

--**********************************

function x300430_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300430_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300430_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300430_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300430_g_ScriptId, x300430_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300430_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300430_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300430_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300430_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300430_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300430_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300430_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300430_OnItemChanged(sceneId, selfId, itemdataId)

end