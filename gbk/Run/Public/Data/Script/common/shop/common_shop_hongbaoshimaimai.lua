--���ܣ��챦ʯ�̵�

x300340_g_ScriptId = 300340
x300340_g_MissionName="�챦ʯ�̵�"
x300340_g_ShopList={1001}
--**********************************

--������ں���

--**********************************

function x300340_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300340_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300340_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300340_g_ScriptId, x300340_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300340_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300340_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300340_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300340_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300340_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300340_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300340_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300340_OnItemChanged(sceneId, selfId, itemdataId)

end