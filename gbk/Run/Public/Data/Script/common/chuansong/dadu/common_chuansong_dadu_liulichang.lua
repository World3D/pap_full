--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300416_g_ScriptId = 300416
x300416_g_MissionName="������"
x300416_g_TransScriptId = 800019
x300416_g_TransPos="liulichang"

--**********************************

--������ں���

--**********************************

function x300416_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300416_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300416_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300416_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300416_g_ScriptId, x300416_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300416_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300416_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300416_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300416_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300416_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300416_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300416_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300416_OnItemChanged(sceneId, selfId, itemdataId)

end