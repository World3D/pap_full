--���ܣ����ҷ�չ�̵�
--NPC����˾��

--MisDescBegin
x211036_g_ScriptId = 211036

x211036_g_MissionName = "���ҷ�չ�̵�"
x211036_g_ShopList = {1}
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211036_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y���ҷ�չ�̵�")
		AddText(sceneId, "Ϊ�˹�����Ҷ�Ϊ���������ף���������ȥ�ɹ��˺ܶ�ö����Խ������Թ��й�֮�ˡ�������Ʒ��û�вɹ��꣬һ�����⿪���һἰʱ֪ͨ���ǰ�����������䣡�����㻹����ȥ�����Щ���Ͳ��ǣ�\n������ֻ������#G���ҽ���#W���й�֮�ˡ��Թ����й�����Ӧ��ȥ�Ҷ�����о�������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	--DispatchShopItem( sceneId, selfId, targetId, x211036_g_ShopList[1] )
end



--**********************************

--�о��¼�

--**********************************

function x211036_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211036_g_ScriptId, x211036_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211036_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211036_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211036_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211036_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211036_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211036_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211036_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211036_OnItemChanged(sceneId, selfId, itemdataId)

end