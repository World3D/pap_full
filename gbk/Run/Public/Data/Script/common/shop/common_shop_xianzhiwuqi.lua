--���ܣ���֪�����̵�

x300326_g_ScriptId = 300326
x300326_g_MissionName="��֪�����̵�"
x300326_g_ShopList={300}
--**********************************

--������ں���

--**********************************

function x300326_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300326_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300326_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300326_g_ScriptId, x300326_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300326_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300326_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300326_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300326_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300326_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300326_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300326_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300326_OnItemChanged(sceneId, selfId, itemdataId)

end