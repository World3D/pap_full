--�ﹱ������
--��Ӱﹱ

--************************************************************************
--MisDescBegin

--�ű���
x300306_g_ScriptId = 300306


--�����ı�����
x300306_g_MissionName="�񰡣�����Ұﹱ�ɣ�"
x300306_g_MissionInfo="��������100�ﹱ�ɣ�"

function x300306_OnDefaultEvent( sceneId, selfId, targetId )
--AddGuildUserPoint(sceneId,selfId,100)
	BeginEvent(sceneId)
		
		AddText(sceneId,x300306_g_MissionInfo)
	
	EndEvent(sceneId)
	DispatchMissionInfo(sceneId,selfId,targetId,x300306_g_ScriptId,x300306_g_MissionId)
	
end

--**********************************
function x300306_CheckAccept( sceneId, selfId )

	return	1

end

--**********************************
function x300306_OnAccept( sceneId, selfId )

	AddGuildUserPoint(sceneId,selfId,100)

end

--**********************************

function x300306_OnEnumerate(sceneId, selfId, targetId)
--	AddGuildUserPoint(sceneId,selfId,100)
	AddNumText(sceneId, x300306_g_ScriptId, x300306_g_MissionName)
end