--���ܣ�������
--NPC���������ϰ�

x211059_g_ScriptId = 211059
x211059_g_MissionName="��ʯ�̵��"
x211059_g_ShopList={9}
--**********************************

--������ں���

--**********************************

function x211059_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211059_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211059_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211059_g_ScriptId, x211059_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211059_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211059_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211059_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211059_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211059_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211059_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211059_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211059_OnItemChanged(sceneId, selfId, itemdataId)

end