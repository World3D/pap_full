--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300414_g_ScriptId = 300414
x300414_g_MissionName="������"
x300414_g_TransScriptId = 800019
x300414_g_TransPos="yindianqiao"

--**********************************

--������ں���

--**********************************

function x300414_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300414_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300414_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300414_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300414_g_ScriptId, x300414_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300414_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300414_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300414_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300414_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300414_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300414_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300414_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300414_OnItemChanged(sceneId, selfId, itemdataId)

end