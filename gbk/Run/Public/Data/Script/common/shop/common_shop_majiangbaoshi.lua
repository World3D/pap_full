--���ܣ��齫��ر�ʯ�̵�

x300346_g_ScriptId = 300346
x300346_g_MissionName="�齫��ر�ʯ"
x300346_g_ShopList={1101}
--**********************************

--������ں���

--**********************************

function x300346_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300346_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300346_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300346_g_ScriptId, x300346_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300346_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300346_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300346_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300346_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300346_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300346_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300346_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300346_OnItemChanged(sceneId, selfId, itemdataId)

end