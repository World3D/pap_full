--���ܣ�����̵�

x300330_g_ScriptId = 300330
x300330_g_MissionName="����̵�"
x300330_g_ShopList={500}
--**********************************

--������ں���

--**********************************

function x300330_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300330_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300330_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300330_g_ScriptId, x300330_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300330_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300330_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300330_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300330_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300330_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300330_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300330_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300330_OnItemChanged(sceneId, selfId, itemdataId)

end