--���ܣ���������
--NPC�����º��� ����˹


x211010_g_ScriptId = 211010
x211010_g_MissionName="��������"

--**********************************

--������ں���

--**********************************

function x211010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y��������")
		AddText(sceneId, "����˹�����������������������ı����£��Ҳ���������ϻ�ڷ��ԡ��Һ��Ҷ��ܹ���˹�����ǹ���˹���˵�����Ұ�����ʲô����������������˹���˺�æ�����������˵ģ�֪������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211010_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211010_g_ScriptId, x211010_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211010_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211010_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211010_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211010_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211010_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211010_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211010_OnItemChanged(sceneId, selfId, itemdataId)

end