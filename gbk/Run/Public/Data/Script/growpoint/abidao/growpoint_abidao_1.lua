--������


--�ű��� 301003




--��̬������ʼ������

x203010_g_MissionId = 78


--���ɺ�����ʼ************************************************************************

function 		x301003_OnCreate(sceneId,growPointType,x,y)
	
	local ItemBoxId = ItemBoxEnterScene(x,y,4,sceneId,0,13010030)
	
	
	
end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x301003_OnOpen(sceneId,selfId,targetId)
	if IsHaveMission(sceneId,selfId, x203010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x203010_g_MissionId)
		if GetMissionParam(sceneId,selfId,misIndex,1) == 0 then
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
function	 x301003_OnRecycle(sceneId,selfId,targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203010_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
       	BeginEvent(sceneId)
	AddText(sceneId,format("�ջ�����   %d/1", GetMissionParam(sceneId,selfId,misIndex,1) )) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x301003_OnProcOver(sceneId,selfId,targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function	x301003_OpenCheck(sceneId,selfId,AbilityId,AblityLevel)

end
