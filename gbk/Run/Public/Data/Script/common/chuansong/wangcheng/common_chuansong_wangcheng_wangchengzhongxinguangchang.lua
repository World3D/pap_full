--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300426_g_ScriptId = 300426
x300426_g_MissionName="�������Ĺ㳡"
x300426_g_TransScriptId = 800019
x300426_g_TransPos="wangchengzhongxinguangchang"

--**********************************

--������ں���

--**********************************

function x300426_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300426_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300426_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300426_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300426_g_ScriptId, x300426_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300426_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300426_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300426_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300426_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300426_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300426_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300426_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300426_OnItemChanged(sceneId, selfId, itemdataId)

end