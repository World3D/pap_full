--���ܣ�������
--NPC���������ϰ�

x211062_g_ScriptId = 211062
x211062_g_MissionName="����̵��"
x211062_g_ShopList={12}
--**********************************

--������ں���

--**********************************

function x211062_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211062_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211062_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211062_g_ScriptId, x211062_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211062_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211062_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211062_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211062_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211062_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211062_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211062_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211062_OnItemChanged(sceneId, selfId, itemdataId)

end