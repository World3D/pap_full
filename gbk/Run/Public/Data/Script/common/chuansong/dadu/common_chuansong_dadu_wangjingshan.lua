--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300417_g_ScriptId = 300417
x300417_g_MissionName="����ɽ"
x300417_g_TransScriptId = 800019
x300417_g_TransPos="wangjingshan"

--**********************************

--������ں���

--**********************************

function x300417_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300417_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300417_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300417_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300417_g_ScriptId, x300417_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300417_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300417_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300417_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300417_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300417_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300417_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300417_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300417_OnItemChanged(sceneId, selfId, itemdataId)

end