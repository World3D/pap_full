--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300453_g_ScriptId = 300453
x300453_g_MissionName="����Է"
x300453_g_TransScriptId = 800019
x300453_g_TransPos="jingshuyuan"

--**********************************

--������ں���

--**********************************

function x300453_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction(x300453_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300453_g_TransPos)
end



--**********************************

--�о��¼�

--**********************************

function x300453_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300453_g_ScriptId, x300453_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300453_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300453_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300453_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300453_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300453_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300453_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300453_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300453_OnItemChanged(sceneId, selfId, itemdataId)

end