--���ܣ��̱�ʯ�̵�

x300341_g_ScriptId = 300341
x300341_g_MissionName="�̱�ʯ�̵�"
x300341_g_ShopList={1002}
--**********************************

--������ں���

--**********************************

function x300341_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300341_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300341_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300341_g_ScriptId, x300341_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300341_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300341_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300341_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300341_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300341_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300341_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300341_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300341_OnItemChanged(sceneId, selfId, itemdataId)

end