--���ܣ��������Լ��������̵�

x300311_g_ScriptId = 300311
x300311_g_MissionName="�������Լ��������̵�"
x300311_g_ShopList={950}
--**********************************

--������ں���

--**********************************

function x300311_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300311_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300311_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300311_g_ScriptId, x300311_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300311_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300311_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300311_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300311_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300311_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300311_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300311_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300311_OnItemChanged(sceneId, selfId, itemdataId)

end