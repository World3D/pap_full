--���ܣ���˫���
--NPC�����־�ͳ��

--MisDescBegin
x211001_g_ScriptId = 211001
x211001_g_EventList={211034}

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId,"�������Ǿ��ӻ������࣬����������󣬽��������º�������ʿ���Ÿ����˫������ʱ�䡣���Ҫע�����ǵ�������ʾ�ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)	
end



--**********************************

--�о��¼�

--**********************************

function x211001_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211001_g_ScriptId, "��ȡ˫��ʱ��")
end

--**********************************

--����������

--**********************************

function x211001_CheckAccept(sceneId, selfId, targetId)

end


--**********************************

--����

--**********************************

function x211001_OnAccept(sceneId, selfId)

end



--**********************************

--����

--**********************************

function x211001_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211001_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

end



--**********************************

--ɱ����������

--**********************************

function x211001_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211001_OnItemChanged(sceneId, selfId, itemdataId)

end