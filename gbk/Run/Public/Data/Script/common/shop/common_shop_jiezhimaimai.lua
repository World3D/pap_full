--���ܣ���ָ�̵�

x300336_g_ScriptId = 300336
x300336_g_MissionName="��ָ�̵�"
x300336_g_ShopList={800}
--**********************************

--������ں���

--**********************************

function x300336_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300336_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300336_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300336_g_ScriptId, x300336_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300336_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300336_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300336_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300336_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300336_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300336_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300336_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300336_OnItemChanged(sceneId, selfId, itemdataId)

end