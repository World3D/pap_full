--���ܣ�ҩƷ��ҩ�̵�

x300338_g_ScriptId = 300338
x300338_g_MissionName="ҩƷ�̵�"
x300338_g_ShopList={900}
--**********************************

--������ں���

--**********************************

function x300338_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300338_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300338_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300338_g_ScriptId, x300338_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300338_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300338_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300338_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300338_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300338_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300338_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300338_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300338_OnItemChanged(sceneId, selfId, itemdataId)

end