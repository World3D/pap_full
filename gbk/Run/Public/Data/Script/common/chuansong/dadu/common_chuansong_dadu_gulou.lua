--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300412_g_ScriptId = 300412
x300412_g_MissionName="��¥"
x300412_g_TransScriptId = 800019
x300412_g_TransPos="gulou"

--**********************************

--������ں���

--**********************************

function x300412_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300412_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300412_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300412_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300412_g_ScriptId, x300412_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300412_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300412_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300412_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300412_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300412_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300412_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300412_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300412_OnItemChanged(sceneId, selfId, itemdataId)

end