--���ܣ����ߵ�
--NPC�����ߵ��ϰ�

x211020_g_ScriptId = 211020
x211020_g_MissionName="�����̵�"
x211020_g_ShopList={4}
--**********************************

--������ں���

--**********************************

function x211020_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211020_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211020_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211020_g_ScriptId, x211020_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211020_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211020_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211020_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211020_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211020_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211020_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211020_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211020_OnItemChanged(sceneId, selfId, itemdataId)

end