--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300448_g_ScriptId = 300448
x300448_g_MissionName="׷˼̨"
x300448_g_TransScriptId = 800019
x300448_g_TransPos="zhuisitai"

--**********************************

--������ں���

--**********************************

function x300448_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300448_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300448_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300448_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300448_g_ScriptId, x300448_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300448_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300448_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300448_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300448_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300448_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300448_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300448_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300448_OnItemChanged(sceneId, selfId, itemdataId)

end