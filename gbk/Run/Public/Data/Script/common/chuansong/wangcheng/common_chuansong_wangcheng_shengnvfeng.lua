--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300431_g_ScriptId = 300431
x300431_g_MissionName="ʥŮ��"
x300431_g_TransScriptId = 800019
x300431_g_TransPos="shengnvfeng"

--**********************************

--������ں���

--**********************************

function x300431_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300431_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300431_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300431_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300431_g_ScriptId, x300431_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300431_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300431_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300431_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300431_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300431_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300431_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300431_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300431_OnItemChanged(sceneId, selfId, itemdataId)

end