--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300446_g_ScriptId = 300446
x300446_g_MissionName="�����߶��ɽ"
x300446_g_TransScriptId = 800019
x300446_g_TransPos="saerwaduohuoshan"

--**********************************

--������ں���

--**********************************

function x300446_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300446_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300446_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300446_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300446_g_ScriptId, x300446_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300446_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300446_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300446_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300446_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300446_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300446_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300446_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300446_OnItemChanged(sceneId, selfId, itemdataId)

end