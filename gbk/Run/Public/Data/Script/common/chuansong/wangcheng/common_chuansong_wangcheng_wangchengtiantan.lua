--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300427_g_ScriptId = 300427
x300427_g_MissionName="������̳"
x300427_g_TransScriptId = 800019
x300427_g_TransPos="wangchengtiantan"

--**********************************

--������ں���

--**********************************

function x300427_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300427_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300427_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300427_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300427_g_ScriptId, x300427_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300427_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300427_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300427_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300427_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300427_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300427_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300427_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300427_OnItemChanged(sceneId, selfId, itemdataId)

end