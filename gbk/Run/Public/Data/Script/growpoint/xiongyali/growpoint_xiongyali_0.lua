--������


--�ű��� 301005




--��̬������ʼ������
x213001_g_MissionId = 146


--���ɺ�����ʼ************************************************************************

function 		x301005_OnCreate(sceneId,growPointType,x,y)
	
	local ItemBoxId = ItemBoxEnterScene(x,y,6,sceneId,0,13010051)
	
	
end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x301005_OnOpen(sceneId,selfId,targetId)
	if IsHaveMission(sceneId,selfId, x213001_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x213001_g_MissionId)
		if GetMissionParam(sceneId,selfId,misIndex,0) < 1 then
			return 0
		else
			BeginEvent(sceneId)
			AddText(sceneId,"���޷�������")                    
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)
			return 1 
		end
	else
		BeginEvent(sceneId)                                      
		AddText(sceneId,"��û���������")                    
		EndEvent(sceneId)                                        
		DispatchMissionTips(sceneId,selfId) 
		return 1
	end

end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x301005_OnRecycle(sceneId,selfId,targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x213001_g_MissionId)
	num = GetMissionParam(sceneId,selfId,misIndex,0) 
	SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
		BeginEvent(sceneId)
		AddText(sceneId,format("�����������������ʾ   %d/1", GetMissionParam(sceneId,selfId,misIndex,0)))
	        EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return 0 
	 
	
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x301005_OnProcOver(sceneId,selfId,targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function	x301005_OpenCheck(sceneId,selfId,AbilityId,AblityLevel)

end
