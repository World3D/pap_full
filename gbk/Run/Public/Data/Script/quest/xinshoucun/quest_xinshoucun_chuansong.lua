--���ܣ�����
--MisDescBegin
x999999_g_ScriptId = 999999
x999999_g_MissionId = 999
x999999_g_MissionName="����"

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x999999_OnDefaultEvent(sceneId, selfId, targetId,PosX,PosZ)	--����������ִ�д˽ű�
	  if IsMissionHaveDone(sceneId,selfId,991) == 1 then
		NewWorld(sceneId, selfId,9,333,275)
			BeginEvent(sceneId)
			strText = "������������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
	BeginEvent(sceneId)
			AddText(sceneId, "#Y����")
			AddText(sceneId, "ֻ�д�����õ�����Ͽɵ�Ӣ�ۣ��ҲŻ����˽�������͵����ݡ���������������ִ����������ʱ���һ���㴫�͵����ݳǵġ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************

--�о��¼�

--**********************************

function x999999_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x999999_g_ScriptId, x999999_g_MissionName)
end



--**********************************

--����������

--**********************************

function x999999_CheckAccept( sceneId, selfId ,targetId )
end

--**********************************

--����

--**********************************

function x999999_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x999999_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x999999_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x999999_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x999999_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x999999_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x999999_OnItemChanged(sceneId, selfId, itemdataId)

end