--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300423_g_ScriptId = 300423
x300423_g_MissionName="���䳡"
x300423_g_TransScriptId = 800019
x300423_g_TransPos="huiwuchang"

--**********************************

--������ں���

--**********************************

function x300423_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300423_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300423_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300423_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300423_g_ScriptId, x300423_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300423_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300423_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300423_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300423_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300423_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300423_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300423_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300423_OnItemChanged(sceneId, selfId, itemdataId)

end