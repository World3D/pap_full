
x207021_g_ScriptId = 207021



x207020_g_MissionId = 21
x207021_g_MissionName="��ȼ"

x207021_g_MissionItem = {{id=30007013,num=1}}


function x207021_OnDefaultEvent(sceneId, selfId, targetId)
        misIndex = GetMissionIndexByID(sceneId,selfId,x207020_g_MissionId)
        BeginEvent(sceneId)
	AddText(sceneId,"�Ѿ���ȼ") 
        EndEvent()
        DispatchEventList(sceneId, selfId, targetId)
        SetMissionByIndex(sceneId,selfId,misIndex,1,GetMissionParam(sceneId,selfId,misIndex,1)+1)
        BeginEvent(sceneId)
        x207021_g_MissionName2 = format("��ȼ��ʳ�ֿ�   %d/3", GetMissionParam(sceneId,selfId,misIndex,1) )
        AddText(sceneId,x207021_g_MissionName2) 
        EndEvent()
        DispatchMissionTips(sceneId, selfId)
	LuaFnGmKillObj(sceneId,selfId,targetId)
		
	
		     
end


function x207021_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207021_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207020_g_MissionId) > 0 then
	    misIndex = GetMissionIndexByID(sceneId,selfId,x207020_g_MissionId)
            if GetMissionParam(sceneId,selfId,misIndex,1) < 3 then
            AddNumText(sceneId, x207021_g_ScriptId, x207021_g_MissionName)
            end
        end
	
end
	       