--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300450_g_ScriptId = 300450
x300450_g_MissionName="С������"
x300450_g_TransScriptId = 800019
x300450_g_TransPos="xiaohelianchi"

--**********************************

--������ں���

--**********************************

function x300450_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300450_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300450_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300450_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300450_g_ScriptId, x300450_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300450_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300450_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300450_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300450_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300450_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300450_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300450_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300450_OnItemChanged(sceneId, selfId, itemdataId)

end