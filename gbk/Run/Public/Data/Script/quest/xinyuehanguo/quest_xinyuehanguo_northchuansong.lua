--���ܣ����Ŵ���
--NPC�����Ŵ���ʹ��

x211030_g_ScriptId = 211030
x211030_g_MissionName="�����㳡"
--**********************************

--������ں���

--**********************************

function x211030_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	SetPos(sceneId, selfId,108,258)
end



--**********************************

--�о��¼�

--**********************************

function x211030_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211030_g_ScriptId, x211030_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211030_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211030_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211030_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211030_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211030_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211030_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211030_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211030_OnItemChanged(sceneId, selfId, itemdataId)

end