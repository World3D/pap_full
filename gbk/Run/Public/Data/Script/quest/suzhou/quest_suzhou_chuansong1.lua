--���ܣ�����
--MisDescBegin
x100000_g_ScriptId = 100000
x100000_g_MissionId = 100
x100000_g_MissionName="��Ҫȥ�һ���"

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x100000_OnDefaultEvent(sceneId, selfId, targetId,PosX,PosZ)	--����������ִ�д˽ű�
		NewWorld(sceneId, selfId,4,32,180)
			BeginEvent(sceneId)
			strText = "���������һ���"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end

--**********************************

--�о��¼�

--**********************************

function x100000_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x100000_g_ScriptId, x100000_g_MissionName)
end



--**********************************

--����������

--**********************************

function x100000_CheckAccept( sceneId, selfId ,targetId )
end

--**********************************

--����

--**********************************

function x100000_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x100000_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x100000_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x100000_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x100000_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x100000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x100000_OnItemChanged(sceneId, selfId, itemdataId)

end