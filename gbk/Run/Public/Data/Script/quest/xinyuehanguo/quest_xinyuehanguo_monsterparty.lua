--���ܣ������ܶ�Ա
--NPC�����º��� ����

x211013_g_ScriptId = 211013
x211013_g_MissionName="�����ܶ�Ա"

--**********************************

--������ں���

--**********************************

function x211013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y�����ܶ�Ա")
		AddText(sceneId, "������ں������������ſͣ����ֵ���Ҳ�в������Ը��ص��˲ţ���ɸ������ǽ�����������Ҳ���ÿ��������ǲ������汾�¡��Ķ��䶷������ѡ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211013_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211013_g_ScriptId, x211013_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211013_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211013_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211013_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211013_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211013_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211013_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211013_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211013_OnItemChanged(sceneId, selfId, itemdataId)

end