--���ܣ�����ҽ��
--NPC������ҽ��

x211031_g_ScriptId = 211031
x211031_g_MissionName="�������"
--**********************************

--������ں���

--**********************************

function x211031_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y�������")
		AddText(sceneId, "Ŀǰ���������ڲ��Ϸ�չ�׶Σ�������Ҳ��Ӧ���٣�Ϊ���������ơ��������Ѿ��ָ������ˣ�ȥ����������°ɣ���Ҫ�ķ��˹�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	BeginEvent(sceneId)
		strText = "��ȫ��ָ��˽���"
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	RestoreHp(sceneId, selfId)
	RestoreMp(sceneId, selfId)
end



--**********************************

--�о��¼�

--**********************************

function x211031_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211031_g_ScriptId, x211031_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211031_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211031_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211031_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211031_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211031_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211031_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211031_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211031_OnItemChanged(sceneId, selfId, itemdataId)

end