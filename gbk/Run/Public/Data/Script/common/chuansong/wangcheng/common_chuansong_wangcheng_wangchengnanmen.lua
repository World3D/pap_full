--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300424_g_ScriptId = 300424
x300424_g_MissionName="��������"
x300424_g_TransScriptId = 800019
x300424_g_TransPos="wangchengnanmen"

--**********************************

--������ں���

--**********************************

function x300424_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300424_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300424_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300424_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300424_g_ScriptId, x300424_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300424_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300424_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300424_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300424_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300424_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300424_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300424_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300424_OnItemChanged(sceneId, selfId, itemdataId)

end