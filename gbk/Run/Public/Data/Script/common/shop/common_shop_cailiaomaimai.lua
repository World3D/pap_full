--���ܣ������̵�

x300344_g_ScriptId = 300344
x300344_g_MissionName="�����̵�"
x300344_g_ShopList={1050}
--**********************************

--������ں���

--**********************************

function x300344_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300344_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300344_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300344_g_ScriptId, x300344_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300344_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300344_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300344_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300344_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300344_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300344_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300344_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300344_OnItemChanged(sceneId, selfId, itemdataId)

end