--���ܣ����Ŵ���
--NPC�����Ŵ���ʹ��

x211049_g_ScriptId = 211049
x211049_g_MissionName="�����㳡"
--**********************************

--������ں���

--**********************************

function x211049_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	SetPos(sceneId, selfId,108,258)
end



--**********************************

--�о��¼�

--**********************************

function x211049_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211049_g_ScriptId, x211049_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211049_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211049_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211049_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211049_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211049_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211049_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211049_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211049_OnItemChanged(sceneId, selfId, itemdataId)

end