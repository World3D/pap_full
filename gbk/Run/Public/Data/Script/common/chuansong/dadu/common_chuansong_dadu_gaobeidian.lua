--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300418_g_ScriptId = 300418
x300418_g_MissionName="�߱���"
x300418_g_TransScriptId = 800019
x300418_g_TransPos="gaobeidian"

--**********************************

--������ں���

--**********************************

function x300418_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300418_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300418_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300418_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300418_g_ScriptId, x300418_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300418_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300418_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300418_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300418_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300418_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300418_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300418_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300418_OnItemChanged(sceneId, selfId, itemdataId)

end