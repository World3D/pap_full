--���ܣ�����ʯ�̵�

x300343_g_ScriptId = 300343
x300343_g_MissionName="����ʯ�̵�"
x300343_g_ShopList={1004}
--**********************************

--������ں���

--**********************************

function x300343_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300343_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300343_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300343_g_ScriptId, x300343_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300343_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300343_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300343_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300343_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300343_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300343_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300343_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300343_OnItemChanged(sceneId, selfId, itemdataId)

end