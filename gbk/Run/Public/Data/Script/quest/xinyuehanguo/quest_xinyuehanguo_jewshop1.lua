--���ܣ�������
--NPC���������ϰ�

x211058_g_ScriptId = 211058
x211058_g_MissionName="��ʯ�̵�һ"
x211058_g_ShopList={8}
--**********************************

--������ں���

--**********************************

function x211058_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211058_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211058_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211058_g_ScriptId, x211058_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211058_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211058_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211058_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211058_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211058_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211058_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211058_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211058_OnItemChanged(sceneId, selfId, itemdataId)

end