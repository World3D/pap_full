--���ܣ�����ҽ��
--NPC������ҽ��

x211023_g_ScriptId = 211023
x211023_g_MissionName="�������"
--**********************************

--������ں���

--**********************************

function x211023_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
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

function x211023_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211023_g_ScriptId, x211023_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211023_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211023_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211023_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211023_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211023_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211023_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211023_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211023_OnItemChanged(sceneId, selfId, itemdataId)

end