--���ܣ����ҹ����̵�
--NPC���о�����

--MisDescBegin
x211037_g_ScriptId = 211037

x211037_g_MissionName = "���ҹ����̵�"
x211037_g_ShopList = {1}
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211037_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y���ҹ����̵�")
		AddText(sceneId, "����������ƥ�����𡣷��ǶԹ�����ҵ�й�֮�ˣ����Ҷ����������ǵġ���������һƥ���ʣ�������������·�ϣ�һ�����ǣ��Ҿ�֪ͨ���ǰ����ȡ��\n������ֻ������#G������ҵ#W���й�֮�ˡ��Թ��ҷ�չ�����й�����Ӧ��ȥ�Ҷ���Ĵ�˾��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	--DispatchShopItem( sceneId, selfId, targetId, x211037_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211037_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211037_g_ScriptId, x211037_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211037_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211037_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211037_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211037_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211037_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211037_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211037_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211037_OnItemChanged(sceneId, selfId, itemdataId)

end