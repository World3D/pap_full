--���ܣ����＼��ѵ���̵�

x300313_g_ScriptId = 300313
x300313_g_MissionName="���＼��ѵ���̵�"
x300313_g_ShopList={952}
--**********************************

--������ں���

--**********************************

function x300313_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x300313_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x300313_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x300313_g_ScriptId, x300313_g_MissionName)
end



--**********************************

--����������

--**********************************

function x300313_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x300313_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x300313_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x300313_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x300313_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x300313_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x300313_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x300313_OnItemChanged(sceneId, selfId, itemdataId)

end