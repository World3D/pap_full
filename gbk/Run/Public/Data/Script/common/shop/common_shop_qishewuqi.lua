--���ܣ������������̵�

x300324_g_ScriptId = 300324
x300324_g_MissionName="�����������̵�"
x300324_g_ShopList={200}
--**********************************

--������ں���

--**********************************

function x300324_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300324_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300324_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300324_g_ScriptId, x300324_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300324_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300324_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300324_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300324_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300324_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300324_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300324_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300324_OnItemChanged(sceneId, selfId, itemdataId)

end