--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300437_g_ScriptId = 300437
x300437_g_MissionName="������"
x300437_g_TransScriptId = 800019
x300437_g_TransPos="ziluozhang"

--**********************************

--������ں���

--**********************************

function x300437_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300437_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300437_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300437_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300437_g_ScriptId, x300437_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300437_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300437_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300437_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300437_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300437_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300437_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300437_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300437_OnItemChanged(sceneId, selfId, itemdataId)

end