--���ܣ����ⱦʯ�̵�

x300345_g_ScriptId = 300345
x300345_g_MissionName="���ⱦʯ�̵�"
x300345_g_ShopList={1100}
--**********************************

--������ں���

--**********************************

function x300345_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300345_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300345_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300345_g_ScriptId, x300345_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300345_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300345_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300345_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300345_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300345_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300345_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300345_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300345_OnItemChanged(sceneId, selfId, itemdataId)

end