--���ܣ����ҷ�չ�Ƽ�����
--NPC����˾ͽ

--MisDescBegin
x211002_g_ScriptId = 211002

x211002_g_MissionName = "��չ�Ƽ�"
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x211002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y��չ�Ƽ�")
		AddText(sceneId, "����Ҫ��չǿ����Ҫ�Ƽ��Ĳ�����������ǿ����ǿ��������������Ϊ�����ף��岻�ݴǡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211002_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x211002_g_ScriptId, x211002_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211002_CheckAccept(sceneId, selfId, targetId)

end



--**********************************

--����

--**********************************

function x211002_OnAccept(sceneId, selfId)
    
end



--**********************************

--����

--**********************************

function x211002_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211002_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211002_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211002_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211002_OnItemChanged(sceneId, selfId, itemdataId)

end