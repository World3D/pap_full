--���ܣ�Ь���̵�

x300335_g_ScriptId = 300335
x300335_g_MissionName="Ь���̵�"
x300335_g_ShopList={750}
--**********************************

--������ں���

--**********************************

function x300335_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300335_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300335_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300335_g_ScriptId, x300335_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300335_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300335_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300335_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300335_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300335_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300335_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300335_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300335_OnItemChanged(sceneId, selfId, itemdataId)

end