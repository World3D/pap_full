--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300454_g_ScriptId = 300454
x300454_g_MissionName="�߾�"
x300454_g_TransScriptId = 800019
x300454_g_TransPos="bianjingsuluding"

--**********************************

--������ں���

--**********************************

function x300454_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300454_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300454_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300454_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300454_g_ScriptId, x300454_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300454_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300454_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300454_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300454_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300454_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300454_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300454_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300454_OnItemChanged(sceneId, selfId, itemdataId)

end