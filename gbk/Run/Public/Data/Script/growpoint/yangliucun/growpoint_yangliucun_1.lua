--������


--�ű��� 301022




--��̬������ʼ������

--x208011_g_MissionId = 65


--���ɺ�����ʼ************************************************************************

function 		x301022_OnCreate(sceneId,growPointType,x,y)
	
	local ItemBoxId = ItemBoxEnterScene(x,y,2,sceneId,0,11010001)
	
	
	
end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x301022_OnOpen(sceneId,selfId,targetId)
--	if IsHaveMission(sceneId,selfId, x208011_g_MissionId) > 0 then
		
--	if LuaFnGetItemCount(sceneId,selfId,13010223) < 10 then
--		return 0
--	else
--		BeginEvent(sceneId)
--		AddText(sceneId,"���޷�������")                    
--		EndEvent(sceneId)                                        
--		DispatchMissionTips(sceneId,selfId)
--		return 1 
--	end
--	else
--		BeginEvent(sceneId)                                      
		AddText(sceneId,"��û���������")                    
--		EndEvent(sceneId)                                        
--		DispatchMissionTips(sceneId,selfId) 
--		return 1
--	end
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x301022_OnRecycle(sceneId,selfId,targetId)
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,11010001, 1 )             
	ret = EndAddItem(sceneId,selfId)                                 
	if ret > 0 then                                                  
		BeginEvent(sceneId)
		AddText(sceneId,format("΢覲������   %d/10", LuaFnGetItemCount(sceneId,selfId,11010001)+1))
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
function	x301022_OnProcOver(sceneId,selfId,targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function	x301022_OpenCheck(sceneId,selfId,AbilityId,AblityLevel)

end
