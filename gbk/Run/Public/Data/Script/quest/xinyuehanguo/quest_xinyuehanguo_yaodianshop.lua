--���ܣ�ҩ��
--NPC��ҩ���ϰ�

x211024_g_ScriptId = 211024
x211024_g_MissionName="ҩƷ�̵�"
x211024_g_ShopList={1}
--**********************************

--������ں���

--**********************************

function x211024_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211024_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211024_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211024_g_ScriptId, x211024_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211024_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211024_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211024_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211024_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211024_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211024_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211024_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211024_OnItemChanged(sceneId, selfId, itemdataId)

end