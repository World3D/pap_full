--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300447_g_ScriptId = 300447
x300447_g_MissionName="�߾�����"
x300447_g_TransScriptId = 800019
x300447_g_TransPos="bianjingtongwangdadu"

--**********************************

--������ں���

--**********************************

function x300447_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300447_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300447_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300447_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300447_g_ScriptId, x300447_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300447_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300447_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300447_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300447_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300447_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300447_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300447_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300447_OnItemChanged(sceneId, selfId, itemdataId)

end