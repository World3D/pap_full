--���ܣ�������
--NPC���������ϰ�

x211019_g_ScriptId = 211019
x211019_g_MissionName="�����̵�"
x211019_g_ShopList={3}
--**********************************

--������ں���

--**********************************

function x211019_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211019_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211019_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211019_g_ScriptId, x211019_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211019_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211019_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211019_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211019_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211019_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211019_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211019_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211019_OnItemChanged(sceneId, selfId, itemdataId)

end