--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300438_g_ScriptId = 300438
x300438_g_MissionName="�Խ�ڣ"
x300438_g_TransScriptId = 800019
x300438_g_TransPos="shijianzhong"

--**********************************

--������ں���

--**********************************

function x300438_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300438_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300438_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300438_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300438_g_ScriptId, x300438_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300438_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300438_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300438_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300438_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300438_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300438_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300438_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300438_OnItemChanged(sceneId, selfId, itemdataId)

end