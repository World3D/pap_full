--���ܣ��·��̵�

x300331_g_ScriptId = 300331
x300331_g_MissionName="�·��̵�"
x300331_g_ShopList={550}
--**********************************

--������ں���

--**********************************

function x300331_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300331_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300331_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300331_g_ScriptId, x300331_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300331_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300331_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300331_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300331_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300331_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300331_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300331_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300331_OnItemChanged(sceneId, selfId, itemdataId)

end