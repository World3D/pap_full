--���ܣ���ǹ�������̵�

x300325_g_ScriptId = 300325
x300325_g_MissionName="��ǹ�������̵�"
x300325_g_ShopList={250}
--**********************************

--������ں���

--**********************************

function x300325_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300325_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300325_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300325_g_ScriptId, x300325_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300325_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300325_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300325_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300325_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300325_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300325_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300325_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300325_OnItemChanged(sceneId, selfId, itemdataId)

end