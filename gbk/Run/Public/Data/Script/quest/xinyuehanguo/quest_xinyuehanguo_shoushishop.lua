--���ܣ����ε�
--NPC�����ε��ϰ�

x211021_g_ScriptId = 211021
x211021_g_MissionName="�����̵�"
x211021_g_ShopList={5}
--**********************************

--������ں���

--**********************************

function x211021_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211021_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211021_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211021_g_ScriptId, x211021_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211021_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211021_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211021_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211021_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211021_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211021_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211021_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211021_OnItemChanged(sceneId, selfId, itemdataId)

end