--������


--�ű��� 301023




--��̬������ʼ������

--x208011_g_MissionId = 65


--���ɺ�����ʼ************************************************************************

function 		x301023_OnCreate(sceneId,growPointType,x,y)
	
	local ItemBoxId = ItemBoxEnterScene(x,y,3,sceneId,0,12140001)
	
	
	
end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x301023_OnOpen(sceneId,selfId,targetId)
--	if IsHaveMission(sceneId,selfId, x208011_g_MissionId) > 0 then
		
--	if LuaFnGetItemCount(sceneId,selfId,13010233) < 10 then
--		return 0
--	else
--		BeginEvent(sceneId)
		AddText(sceneId,"���޷�������")                    
--		EndEvent(sceneId)                                        
--		DispatchMissionTips(sceneId,selfId)
--		return 1 
--	end
--	else
--		BeginEvent(sceneId)                                      
--		AddText(sceneId,"��û���������")                    
--		EndEvent(sceneId)                                        
--		DispatchMissionTips(sceneId,selfId) 
--		return 1
--	end
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x301023_OnRecycle(sceneId,selfId,targetId)
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,12140001, 1 )             
	ret = EndAddItem(sceneId,selfId)                                 
	if ret > 0 then                                                  
		BeginEvent(sceneId)
		AddText(sceneId,format("��ħʯ   %d", LuaFnGetItemCount(sceneId,selfId,12140001)+1))
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
function	x301023_OnProcOver(sceneId,selfId,targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function	x301023_OpenCheck(sceneId,selfId,AbilityId,AblityLevel)

end
