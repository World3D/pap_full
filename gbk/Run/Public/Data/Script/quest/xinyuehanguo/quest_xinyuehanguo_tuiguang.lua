--���ܣ��ƹ�Ա
--NPC�����º��� �ƹ�Ա

x211016_g_ScriptId = 211016
x211016_g_MissionName="�ƹ�Աϵͳ"

--**********************************

--������ں���

--**********************************

function x211016_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y�ƹ�Աϵͳ")
		AddText(sceneId, "ֻҪ�������������˼��뵽��Ϸ���������Ҷ����������൱�Ľ�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211016_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211016_g_ScriptId, x211016_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211016_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211016_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211016_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211016_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211016_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211016_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211016_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211016_OnItemChanged(sceneId, selfId, itemdataId)

end