--���ܣ�������
--NPC���������ϰ�

x211061_g_ScriptId = 211061
x211061_g_MissionName="����̵�һ"
x211061_g_ShopList={11}
--**********************************

--������ں���

--**********************************

function x211061_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId, targetId, x211061_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211061_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211061_g_ScriptId, x211061_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211061_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211061_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211061_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211061_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211061_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211061_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211061_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211061_OnItemChanged(sceneId, selfId, itemdataId)

end