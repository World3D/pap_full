--���ܣ����������̵�

x300327_g_ScriptId = 300327
x300327_g_MissionName="���������̵�"
x300327_g_ShopList={350}
--**********************************

--������ں���

--**********************************

function x300327_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300327_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300327_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300327_g_ScriptId, x300327_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300327_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300327_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300327_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300327_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300327_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300327_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300327_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300327_OnItemChanged(sceneId, selfId, itemdataId)

end