--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300435_g_ScriptId = 300435
x300435_g_MissionName="�ɺ��ֿ�"
x300435_g_TransScriptId = 800019
x300435_g_TransPos="nahelinkou"

--**********************************

--������ں���

--**********************************

function x300435_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300435_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300435_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300435_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300435_g_ScriptId, x300435_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300435_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300435_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300435_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300435_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300435_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300435_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300435_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300435_OnItemChanged(sceneId, selfId, itemdataId)

end