--���ܣ�������
--NPC���������ϰ�

x211060_g_ScriptId = 211060
x211060_g_MissionName="�����̵��"
x211060_g_ShopList={10}
--**********************************

--������ں���

--**********************************

function x211060_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211060_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211060_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211060_g_ScriptId, x211060_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211060_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211060_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211060_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211060_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211060_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211060_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211060_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211060_OnItemChanged(sceneId, selfId, itemdataId)

end