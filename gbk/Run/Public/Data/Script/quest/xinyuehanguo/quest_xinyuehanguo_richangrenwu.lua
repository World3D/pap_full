--���ܣ��ճ�����
--NPC�����º��� ����

x211012_g_ScriptId = 211012
x211012_g_MissionName="�ճ�����"

--**********************************

--������ں���

--**********************************

function x211012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y�ճ�����")
		AddText(sceneId, "�ҳ�����Ǯ��ʲô��û�С�һ���������£����ܵ�Ҫ���������Ҿͷ�����ʾ��ȫ��������Щ�¡����ºã�ÿ�춼��N����������Ұ�æ�ˣ�������æ�ù��������Ը�����ҷֵ�һЩ����˵���ҳ�����Ǯ��ʲô��û�У������Ҳ��������ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211012_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211012_g_ScriptId, x211012_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211012_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211012_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211012_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211012_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211012_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211012_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211012_OnItemChanged(sceneId, selfId, itemdataId)

end