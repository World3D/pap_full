--���ܣ�������
--NPC���������ϰ�

x211063_g_ScriptId = 211063
x211063_g_MissionName="��ʯ�̵���"
x211063_g_ShopList={13}
--**********************************

--������ں���

--**********************************

function x211063_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211063_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211063_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211063_g_ScriptId, x211063_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211063_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211063_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211063_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211063_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211063_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211063_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211063_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211063_OnItemChanged(sceneId, selfId, itemdataId)

end