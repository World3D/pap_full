--���ܣ�����
--MisDescBegin
x200000_g_ScriptId = 200000
x200000_g_MissionId = 200
x200000_g_MissionName="��Ҫȥ����"

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x200000_OnDefaultEvent(sceneId, selfId, targetId,PosX,PosZ)	--����������ִ�д˽ű�
		NewWorld(sceneId, selfId,9,333,275)
			BeginEvent(sceneId)
			strText = "������������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end

--**********************************

--�о��¼�

--**********************************

function x200000_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x200000_g_ScriptId, x200000_g_MissionName)
end



--**********************************

--����������

--**********************************

function x200000_CheckAccept( sceneId, selfId ,targetId )

end

--**********************************

--����

--**********************************

function x200000_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x200000_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x200000_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x200000_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x200000_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x200000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x200000_OnItemChanged(sceneId, selfId, itemdataId)

end