--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300440_g_ScriptId = 300440
x300440_g_MissionName="������"
x300440_g_TransScriptId = 800019
x300440_g_TransPos="anningcun"

--**********************************

--������ں���

--**********************************

function x300440_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300440_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300440_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300440_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300440_g_ScriptId, x300440_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300440_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300440_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300440_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300440_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300440_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300440_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300440_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300440_OnItemChanged(sceneId, selfId, itemdataId)

end