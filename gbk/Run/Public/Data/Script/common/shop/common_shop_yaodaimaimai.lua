--���ܣ������̵�

x300334_g_ScriptId = 300334
x300334_g_MissionName="�����̵�"
x300334_g_ShopList={700}
--**********************************

--������ں���

--**********************************

function x300334_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300334_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300334_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300334_g_ScriptId, x300334_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300334_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300334_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300334_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300334_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300334_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300334_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300334_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300334_OnItemChanged(sceneId, selfId, itemdataId)

end