--���ܣ�����ǿ������
--NPC������ǿ����ʦ

--MisDescBegin
x211026_g_ScriptId = 211026

x211026_g_MissionName = "ǿ�������̵�"

x211026_g_ShopList ={6}
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211026_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211026_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211026_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211026_g_ScriptId, x211026_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211026_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211026_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211026_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211026_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211026_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211026_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211026_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211026_OnItemChanged(sceneId, selfId, itemdataId)

end