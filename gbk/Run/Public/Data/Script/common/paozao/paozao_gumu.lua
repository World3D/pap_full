--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x300314_g_ScriptId = 300314
x300314_g_MissionName="ǰ����Ĺ"

--**********************************

--������ں���

--**********************************

function x300314_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
		NewWorld(sceneId, selfId, 94, 30, 30);
end



--**********************************

--�о��¼�

--**********************************

function x300314_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300314_g_ScriptId, x300314_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300314_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300314_OnAccept(sceneId, selfId)                                                             
	     
end



--**********************************

--����

--**********************************

function x300314_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300314_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300314_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300314_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300314_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300314_OnItemChanged(sceneId, selfId, itemdataId)

end