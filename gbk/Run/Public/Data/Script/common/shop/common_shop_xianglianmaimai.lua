--���ܣ������̵�

x300329_g_ScriptId = 300329
x300329_g_MissionName="�����̵�"
x300329_g_ShopList={450}
--**********************************

--������ں���

--**********************************

function x300329_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300329_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300329_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300329_g_ScriptId, x300329_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300329_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300329_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300329_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300329_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300329_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300329_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300329_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300329_OnItemChanged(sceneId, selfId, itemdataId)

end