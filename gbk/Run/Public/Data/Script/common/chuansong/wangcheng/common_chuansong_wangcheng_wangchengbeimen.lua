--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300425_g_ScriptId = 300425
x300425_g_MissionName="���Ǳ���"
x300425_g_TransScriptId = 800019
x300425_g_TransPos="wangchengbeimen"

--**********************************

--������ں���

--**********************************

function x300425_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300425_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300425_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300425_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300425_g_ScriptId, x300425_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300425_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300425_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300425_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300425_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300425_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300425_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300425_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300425_OnItemChanged(sceneId, selfId, itemdataId)

end