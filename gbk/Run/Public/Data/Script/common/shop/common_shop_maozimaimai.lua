--���ܣ�ñ���̵�

x300328_g_ScriptId = 300328
x300328_g_MissionName="ñ���̵�"
x300328_g_ShopList={400}
--**********************************

--������ں���

--**********************************

function x300328_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300328_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300328_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300328_g_ScriptId, x300328_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300328_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300328_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300328_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300328_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300328_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300328_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300328_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300328_OnItemChanged(sceneId, selfId, itemdataId)

end