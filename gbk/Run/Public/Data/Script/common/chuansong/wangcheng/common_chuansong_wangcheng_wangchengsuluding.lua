--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300433_g_ScriptId = 300433
x300433_g_MissionName="����"
x300433_g_TransScriptId = 800019
x300433_g_TransPos="wangchengsuluding"

--**********************************

--������ں���

--**********************************

function x300433_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300433_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300433_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300433_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300433_g_ScriptId, x300433_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300433_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300433_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300433_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300433_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300433_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300433_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300433_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300433_OnItemChanged(sceneId, selfId, itemdataId)

end