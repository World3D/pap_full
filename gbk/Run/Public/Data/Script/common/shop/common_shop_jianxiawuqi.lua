--���ܣ����������̵�

x300323_g_ScriptId = 300323
x300323_g_MissionName="���������̵�"
x300323_g_ShopList={150}
--**********************************

--������ں���

--**********************************

function x300323_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300323_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300323_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300323_g_ScriptId, x300323_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300323_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300323_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300323_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300323_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300323_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300323_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300323_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300323_OnItemChanged(sceneId, selfId, itemdataId)

end