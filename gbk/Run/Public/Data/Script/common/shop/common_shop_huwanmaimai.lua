--���ܣ������̵�

x300332_g_ScriptId = 300332
x300332_g_MissionName="�����̵�"
x300332_g_ShopList={600}
--**********************************

--������ں���

--**********************************

function x300332_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300332_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300332_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300332_g_ScriptId, x300332_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300332_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300332_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300332_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300332_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300332_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300332_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300332_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300332_OnItemChanged(sceneId, selfId, itemdataId)

end