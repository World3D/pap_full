--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300415_g_ScriptId = 300415
x300415_g_MissionName="����"
x300415_g_TransScriptId = 800019
x300415_g_TransPos="xisi"

--**********************************

--������ں���

--**********************************

function x300415_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300415_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300415_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300415_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300415_g_ScriptId, x300415_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300415_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300415_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300415_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300415_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300415_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300415_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300415_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300415_OnItemChanged(sceneId, selfId, itemdataId)

end