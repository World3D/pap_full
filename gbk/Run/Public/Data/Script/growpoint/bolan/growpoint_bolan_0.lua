--������


--�ű��� 301016




--��̬������ʼ������
x226000_g_MissionId = 337


--���ɺ�����ʼ************************************************************************

function 		x301016_OnCreate(sceneId,growPointType,x,y)
	
	local ItemBoxId = ItemBoxEnterScene(x,y,17,sceneId,0,13010161)
	
	
end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x301016_OnOpen(sceneId,selfId,targetId)
	if IsHaveMission(sceneId,selfId, x226000_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x226000_g_MissionId)
		if GetMissionParam(sceneId,selfId,misIndex,0) < 5 then
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
function	 x301016_OnRecycle(sceneId,selfId,targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x226000_g_MissionId)
	num = GetMissionParam(sceneId,selfId,misIndex,0) 
	SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
		BeginEvent(sceneId)
		AddText(sceneId,format("��ȼ�ݲݶ�   %d/5", GetMissionParam(sceneId,selfId,misIndex,0)))
	        EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return 1 
	 
	
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x301016_OnProcOver(sceneId,selfId,targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function	x301016_OpenCheck(sceneId,selfId,AbilityId,AblityLevel)

end
