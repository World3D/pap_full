--���ܣ�PK��Ӫ
--NPC�����º��� �շ�

x211038_g_ScriptId = 211038
x211038_g_MissionName="��̨����"

--**********************************

--������ں���

--**********************************

function x211038_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#YPK��Ӫ")
		AddText(sceneId, "�������Ѿ���PK��Ӫ�ˣ���Щ��������ս��ս�������Լ�������������Σ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	BeginEvent(sceneId)
		strText = "��任ΪPK��Ӫ"
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	SetCurCamp(sceneId, selfId, 4)
end



--**********************************

--�о��¼�

--**********************************

function x211038_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211038_g_ScriptId, "PK��Ӫ")
end



--**********************************

--����������

--**********************************

function x211038_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211038_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211038_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211038_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211038_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211038_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211038_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211038_OnItemChanged(sceneId, selfId, itemdataId)

end