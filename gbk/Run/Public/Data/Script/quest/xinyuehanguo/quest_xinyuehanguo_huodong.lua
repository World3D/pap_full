--���ܣ���ף�
--NPC�����º��� ����

x211014_g_ScriptId = 211014
x211014_g_MissionName="��ף�"

--**********************************

--������ں���

--**********************************

function x211014_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	BeginEvent(sceneId)
		AddText(sceneId, "#Y��ף�")
		AddText(sceneId, "ÿ����յ��������Ҷ����кܶ����ף�����Ȼ�е�ʱ�򣬹�������һ�ã�ÿ�춼�п����ǽ��գ�����ô���Ȼ�ǡ����Ǻǣ���������˵�˰ɡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�о��¼�

--**********************************

function x211014_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211014_g_ScriptId, x211014_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211014_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211014_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211014_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211014_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211014_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211014_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211014_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211014_OnItemChanged(sceneId, selfId, itemdataId)

end