--���ܣ������̵�

x300322_g_ScriptId = 300322
x300322_g_MissionName="�����̵�"
x300322_g_ShopList={100}
--**********************************

--������ں���

--**********************************

function x300322_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300322_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300322_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300322_g_ScriptId, x300322_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300322_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300322_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300322_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300322_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300322_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300322_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300322_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300322_OnItemChanged(sceneId, selfId, itemdataId)

end