--���ܣ�������Ӫ
--NPC�����º��� �շ�

x211039_g_ScriptId = 211039
x211039_g_MissionName="��̨����"

--**********************************

--������ں���

--**********************************

function x211039_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y������Ӫ")
		AddText(sceneId, "��ָ���������Ӫ���������˾�û������Ĳ��ˣ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	BeginEvent(sceneId)
		strText = "��任Ϊ������Ӫ"
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	SetCurCamp(sceneId, selfId, 0)
end



--**********************************

--�о��¼�

--**********************************

function x211039_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211039_g_ScriptId, "������Ӫ")
end



--**********************************

--����������

--**********************************

function x211039_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211039_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211039_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211039_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211039_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211039_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211039_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211039_OnItemChanged(sceneId, selfId, itemdataId)

end