--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300419_g_ScriptId = 300419
x300419_g_MissionName="������"
x300419_g_TransScriptId = 800019
x300419_g_TransPos="zhengyangmen"

--**********************************

--������ں���

--**********************************

function x300419_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300419_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300419_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300419_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300419_g_ScriptId, x300419_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300419_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300419_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300419_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300419_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300419_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300419_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300419_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300419_OnItemChanged(sceneId, selfId, itemdataId)

end