--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300432_g_ScriptId = 300432
x300432_g_MissionName="����"
x300432_g_TransScriptId = 800019
x300432_g_TransPos="wangchengtongwangbianjing"

--**********************************

--������ں���

--**********************************

function x300432_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300432_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300432_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300432_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300432_g_ScriptId, x300432_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300432_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300432_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300432_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300432_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300432_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300432_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300432_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300432_OnItemChanged(sceneId, selfId, itemdataId)

end