--���ܣ�����
--MisDescBegin
x199998_g_ScriptId = 199998
x199998_g_MissionName="��Ҫȥ�Ϻ�"
--MisDescEnd
--**********************************

--������ں���

--**********************************

function x199998_OnDefaultEvent(sceneId, selfId, targetId,PosX,PosZ)	--����������ִ�д˽ű�
	  if GetLevel(sceneId, selfId ) >= 15 then
		NewWorld(sceneId, selfId,10,100,90)
			BeginEvent(sceneId)
			strText = "���������Ϻ�Ұ��"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
	BeginEvent(sceneId)
			AddText(sceneId, "#Y��Ҫȥ�Ϻ�")
			AddText(sceneId, "�㻹̫���˵㣬���㵽15���Ժ��������Ұ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************

--�о��¼�

--**********************************

function x199998_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x199998_g_ScriptId, x199998_g_MissionName)
end



--**********************************

--����������

--**********************************

function x199998_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x199998_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x199998_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x199998_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x199998_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x199998_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x199998_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x199998_OnItemChanged(sceneId, selfId, itemdataId)

end