--������


--�ű��� 301011











--��̬������ʼ������
x207005_g_MissionId = 267


--���ɺ�����ʼ************************************************************************

function 	x301011_OnCreate(sceneId,growPointType,x,y)
	
	local ItemBoxId = ItemBoxEnterScene(x,y,585,sceneId,0,13010020)
	
	
	
end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x301011_OnOpen(sceneId,selfId,targetId)
	if IsHaveMission(sceneId,selfId, x207005_g_MissionId) > 0 then
		if LuaFnGetItemCount(sceneId,selfId,13010051) < 10 then
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
function	 x301011_OnRecycle(sceneId,selfId,targetId)
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,13010051, 1 )             
	ret = EndAddItem(sceneId,selfId)                                 
	if ret > 0 then                                                  
		BeginEvent(sceneId)
		AddText(sceneId,format("���   %d/10", LuaFnGetItemCount(sceneId,selfId,13010051)+1))
	        EndEvent()
		DispatchMissionTips(sceneId, selfId)
		AddItemListToHuman(sceneId,selfId) 
		return 1 
	else                                                             
		BeginEvent(sceneId)                                      
		AddText(sceneId,"��Ʒ��������")                    
		EndEvent(sceneId)                                        
		DispatchMissionTips(sceneId,selfId) 
		return 0
	end       
	
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x301011_OnProcOver(sceneId,selfId,targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function	x301011_OpenCheck(sceneId,selfId,AbilityId,AblityLevel)

end
