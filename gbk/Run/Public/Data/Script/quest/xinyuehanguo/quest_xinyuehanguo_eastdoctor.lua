--���ܣ�����ҽ��
--NPC������ҽ��

x211029_g_ScriptId = 211029
x211029_g_MissionName="�������"
--**********************************

--������ں���

--**********************************

function x211029_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
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

function x211029_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211029_g_ScriptId, x211029_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211029_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211029_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211029_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211029_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211029_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211029_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211029_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211029_OnItemChanged(sceneId, selfId, itemdataId)

end