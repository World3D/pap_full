--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300445_g_ScriptId = 300445
x300445_g_MissionName="����կ"
x300445_g_TransScriptId = 800019
x300445_g_TransPos="lianchengzhai"

--**********************************

--������ں���

--**********************************

function x300445_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300445_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300445_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300445_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300445_g_ScriptId, x300445_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300445_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300445_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300445_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300445_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300445_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300445_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300445_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300445_OnItemChanged(sceneId, selfId, itemdataId)

end