--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300420_g_ScriptId = 300420
x300420_g_MissionName="��"
x300420_g_TransScriptId = 800019
x300420_g_TransPos="dadutongwangbianjing"

--**********************************

--������ں���

--**********************************

function x300420_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300420_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300420_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300420_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300420_g_ScriptId, x300420_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300420_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300420_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300420_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300420_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300420_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300420_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300420_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300420_OnItemChanged(sceneId, selfId, itemdataId)

end