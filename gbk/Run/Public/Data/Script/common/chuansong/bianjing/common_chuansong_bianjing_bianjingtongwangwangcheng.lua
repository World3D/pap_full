--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300436_g_ScriptId = 300436
x300436_g_MissionName="�߾�����"
x300436_g_TransScriptId = 800019
x300436_g_TransPos="bianjingtongwangwangcheng"

--**********************************

--������ں���

--**********************************

function x300436_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300436_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300436_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300436_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300436_g_ScriptId, x300436_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300436_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300436_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300436_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300436_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300436_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300436_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300436_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300436_OnItemChanged(sceneId, selfId, itemdataId)

end