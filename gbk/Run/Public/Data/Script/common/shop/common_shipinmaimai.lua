--���ܣ���Ʒ�̵�

x300337_g_ScriptId = 300337
x300337_g_MissionName="��Ʒ�̵�"
x300337_g_ShopList={850}
--**********************************

--������ں���

--**********************************

function x300337_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300337_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300337_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300337_g_ScriptId, x300337_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300337_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300337_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300337_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300337_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300337_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300337_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300337_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300337_OnItemChanged(sceneId, selfId, itemdataId)

end