--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300449_g_ScriptId = 300449
x300449_g_MissionName="������"
x300449_g_TransScriptId = 800019
x300449_g_TransPos="zuihuataolin"

--**********************************

--������ں���

--**********************************

function x300449_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300449_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300449_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300449_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300449_g_ScriptId, x300449_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300449_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300449_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300449_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300449_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300449_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300449_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300449_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300449_OnItemChanged(sceneId, selfId, itemdataId)

end