--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300444_g_ScriptId = 300444
x300444_g_MissionName="��ˮ��"
x300444_g_TransScriptId = 800019
x300444_g_TransPos="tianshuipu"

--**********************************

--������ں���

--**********************************

function x300444_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300444_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300444_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300444_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300444_g_ScriptId, x300444_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300444_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300444_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300444_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300444_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300444_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300444_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300444_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300444_OnItemChanged(sceneId, selfId, itemdataId)

end