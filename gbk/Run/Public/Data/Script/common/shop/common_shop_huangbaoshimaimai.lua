--���ܣ��Ʊ�ʯ�̵�

x300342_g_ScriptId = 300342
x300342_g_MissionName="�Ʊ�ʯ�̵�"
x300342_g_ShopList={1003}
--**********************************

--������ں���

--**********************************

function x300342_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300342_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300342_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300342_g_ScriptId, x300342_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300342_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300342_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300342_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300342_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300342_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300342_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300342_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300342_OnItemChanged(sceneId, selfId, itemdataId)

end