--���ܣ�����¼

x300339_g_ScriptId = 300339
x300339_g_MissionName="����¼ר��"
x300339_g_ShopList={1000}
--**********************************

--������ں���

--**********************************

function x300339_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300339_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300339_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300339_g_ScriptId, x300339_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300339_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300339_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300339_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300339_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300339_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300339_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300339_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300339_OnItemChanged(sceneId, selfId, itemdataId)

end