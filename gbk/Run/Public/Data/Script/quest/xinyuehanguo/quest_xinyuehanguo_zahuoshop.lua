--���ܣ��ӻ���
--NPC���ӻ����ϰ�

x211018_g_ScriptId = 211018
x211018_g_MissionName="�ӻ��̵�"
x211018_g_ShopList={2}
--**********************************

--������ں���

--**********************************

function x211018_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211018_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211018_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211018_g_ScriptId, x211018_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211018_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211018_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211018_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211018_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211018_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211018_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211018_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211018_OnItemChanged(sceneId, selfId, itemdataId)

end