--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300421_g_ScriptId = 300421
x300421_g_MissionName="����Ӫ"
x300421_g_TransScriptId = 800019
x300421_g_TransPos="shuweiying"

--**********************************

--������ں���

--**********************************

function x300421_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300421_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300421_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300421_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300421_g_ScriptId, x300421_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300421_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300421_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300421_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300421_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300421_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300421_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300421_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300421_OnItemChanged(sceneId, selfId, itemdataId)

end