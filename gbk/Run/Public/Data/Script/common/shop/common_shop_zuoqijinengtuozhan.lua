--���ܣ����＼����չ�̵�

x300312_g_ScriptId = 300312
x300312_g_MissionName="���＼����չ�̵�"
x300312_g_ShopList={951}
--**********************************

--������ں���

--**********************************

function x300312_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300312_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300312_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300312_g_ScriptId, x300312_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300312_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300312_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300312_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300312_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300312_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300312_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300312_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300312_OnItemChanged(sceneId, selfId, itemdataId)

end