--���ܣ�һ������
--NPC�����º��� ����˹

x211009_g_ScriptId = 211009
x211009_g_MissionName="һ������"

--**********************************

--������ں���

--**********************************

function x211009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Yһ������")
		AddText(sceneId, "�������������𣿱�����С���ڵ����ҿ��ǳ������ģ��Ա��������������յ�С�ܡ�\nֻҪ��Ը������ҵ����£������Ժ��ڵ��ϻ�ÿ�����Ȼ���ٺ١����ҵ����ֿɲ��ǽ�����ģ�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211009_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211009_g_ScriptId, x211009_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211009_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211009_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211009_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211009_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211009_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211009_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211009_OnItemChanged(sceneId, selfId, itemdataId)

end