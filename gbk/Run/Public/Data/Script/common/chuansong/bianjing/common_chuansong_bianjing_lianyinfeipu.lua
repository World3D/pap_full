--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300451_g_ScriptId = 300451
x300451_g_MissionName="��������"
x300451_g_TransScriptId = 800019
x300451_g_TransPos="lianyinfeipu"

--**********************************

--������ں���

--**********************************

function x300451_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300451_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300451_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300451_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300451_g_ScriptId, x300451_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300451_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300451_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300451_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300451_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300451_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300451_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300451_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300451_OnItemChanged(sceneId, selfId, itemdataId)

end