--���ܣ���̨����
--NPC�����º��� �շ�

x211008_g_ScriptId = 211008
x211008_g_MissionName="��̨����"

--**********************************

--������ں���

--**********************************

function x211008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y��̨����")
		AddText(sceneId, "���䳡���������У��ȵ����䳡���ŵ�ʱ�����Ҫ����������������Ǹ����Ƽ�����Ҫһս��������Ҫ���и�����ѧ�������������ң��һ������ġ���Ȼ���һ���ȡһ���С���ˣ���Ҫ�����ھͱ����������Ը������ۣ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211008_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211008_g_ScriptId, x211008_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211008_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211008_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211008_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211008_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211008_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211008_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211008_OnItemChanged(sceneId, selfId, itemdataId)

end