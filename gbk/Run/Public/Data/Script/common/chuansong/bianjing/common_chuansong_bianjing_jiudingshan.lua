--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300441_g_ScriptId = 300441
x300441_g_MissionName="�Ŷ�ɽ"
x300441_g_TransScriptId = 800019
x300441_g_TransPos="jiudingshan"

--**********************************

--������ں���

--**********************************

function x300441_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300441_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300441_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300441_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300441_g_ScriptId, x300441_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300441_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300441_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300441_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300441_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300441_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300441_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300441_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300441_OnItemChanged(sceneId, selfId, itemdataId)

end