--���ܣ������̵�

x300333_g_ScriptId = 300333
x300333_g_MissionName="�����̵�"
x300333_g_ShopList={650}
--**********************************

--������ں���

--**********************************

function x300333_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300333_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300333_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300333_g_ScriptId, x300333_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300333_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300333_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300333_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300333_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300333_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300333_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300333_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300333_OnItemChanged(sceneId, selfId, itemdataId)

end