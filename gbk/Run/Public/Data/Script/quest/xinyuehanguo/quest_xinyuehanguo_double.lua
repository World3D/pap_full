--���ܣ���˫���
--NPC�����־�ͳ��

--MisDescBegin
x211034_g_ScriptId = 211034

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211034_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	--BeginEvent(sceneId)
	--	AddText(sceneId, "����ȡ��#GһСʱ#W��˫������ʱ�䣬��ȥ�����ɣ�����Լ�����Խ�Լ���")
	--EndEvent(sceneId)
	--DispatchEventList(sceneId,selfId,targetId)
	--
	--BeginEvent(sceneId)
	--	AddText(sceneId, "����ȡ��һСʱ˫������ʱ��")
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)
end



--**********************************

--�о��¼�

--**********************************

function x211034_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, 211034, "һСʱ")
end

--**********************************

--����������

--**********************************

function x211034_CheckAccept(sceneId, selfId, targetId)
end


--**********************************

--����

--**********************************

function x211034_OnAccept(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x211034_OnAbandon(sceneId, selfId)
end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211034_CheckSubmit( sceneId, selfId, targetId)
end



--**********************************

--�ύ

--**********************************

function x211034_OnSubmit(sceneId, selfId, targetId, selectRadioId)
end



--**********************************

--ɱ����������

--**********************************

function x211034_OnKillObject(sceneId, selfId, objdataId)
end



--**********************************

--���������¼�

--**********************************

function x211034_OnEnterArea(sceneId, selfId, zoneId)
end



--**********************************

--���߸ı�

--**********************************

function x211034_OnItemChanged(sceneId, selfId, itemdataId)
end