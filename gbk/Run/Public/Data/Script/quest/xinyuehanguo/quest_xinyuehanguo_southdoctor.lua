--���ܣ�����ҽ��
--NPC������ҽ��

x211033_g_ScriptId = 211033
x211033_g_MissionName="�������"
--**********************************

--������ں���

--**********************************

function x211033_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
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

function x211033_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211033_g_ScriptId, x211033_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211033_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211033_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211033_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211033_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211033_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211033_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211033_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211033_OnItemChanged(sceneId, selfId, itemdataId)

end