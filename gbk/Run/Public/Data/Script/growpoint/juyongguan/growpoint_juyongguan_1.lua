--������


--�ű��� 301009











--��̬������ʼ������

x206008_g_MissionId = 35


--���ɺ�����ʼ************************************************************************

function 	x301009_OnCreate(sceneId,growPointType,x,y)
	
	local ItemBoxId = ItemBoxEnterScene(x,y,10,sceneId,0,13010020)
	
	
	
end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x301009_OnOpen(sceneId,selfId,targetId)
	if IsHaveMission(sceneId,selfId, x206008_g_MissionId) > 0 then
		if LuaFnGetItemCount(sceneId,selfId,13010048) < 10 then
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
function	 x301009_OnRecycle(sceneId,selfId,targetId)
	local NPCX,NPCY = LuaFnGetWorldPos(sceneId,selfId)
	LuaFnCreateMonster(sceneId, 401,NPCX+random(-3,3),NPCY+random(-3,3),0,1,-1) 
	return 1		
	
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x301009_OnProcOver(sceneId,selfId,targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function	x301009_OpenCheck(sceneId,selfId,AbilityId,AblityLevel)

end
