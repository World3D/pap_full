
x199999_g_ScriptId = 199999
x199999_g_MissionName="���ɼ��"
--**********************************

--������ں���

--*********************************
function x199999_OnDefaultEvent(sceneId, selfId, targetId)
	BeginEvent(sceneId)
		AddText(sceneId, "#Y���ɼ��")
		AddText(sceneId,  "#{quest_ditaohua}")
		AddText(sceneId,  "#{quest_yintaohua}")		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************

--�о��¼�

--**********************************

function x199999_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x199999_g_ScriptId, x199999_g_MissionName)
end



--**********************************

--����������

--**********************************

function x199999_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x199999_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x199999_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x199999_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x199999_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x199999_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x199999_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x199999_OnItemChanged(sceneId, selfId, itemdataId)

end