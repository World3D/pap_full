--���ܣ�����̵�
--NPC����˵��ϰ�

--MisDescBegin
x211025_g_ScriptId = 211025

x211025_g_MissionName = "����̵�"
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211025_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, 7 )
end



--**********************************

--�о��¼�

--**********************************

function x211025_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211025_g_ScriptId, x211025_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211025_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211025_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211025_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211025_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211025_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211025_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211025_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211025_OnItemChanged(sceneId, selfId, itemdataId)

end