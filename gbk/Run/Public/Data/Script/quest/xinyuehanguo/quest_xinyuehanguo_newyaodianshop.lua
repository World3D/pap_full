--���ܣ����ִ�ҩ��
--NPC�����ִ�ҩ��ҽ��

x211041_g_ScriptId = 211041
x211041_g_MissionName="�ӻ��̵�"
x211041_g_ShopList={17}
--**********************************

--������ں���

--**********************************

function x211041_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211041_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211041_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211041_g_ScriptId, x211041_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211041_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211041_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211041_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211041_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211041_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211041_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211041_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211041_OnItemChanged(sceneId, selfId, itemdataId)

end