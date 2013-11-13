--������

--�ű��� 301017

x300303_g_MissionId		= 405
x300303_MP_SHOUJISHENGZHANGDIAN = 4

--���ɺ�����ʼ************************************************************************

function 		x301017_OnCreate(sceneId,growPointType,x,y)
	
	local ItemBoxId = ItemBoxEnterScene(x,y,18,sceneId,0,13010171) --����λΪ��������Ʒ��ţ��������ֱ������������Ʒ�����ԣ���ʱû��- -||
	
end

--���ɺ�������**********************************************************************
--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x301017_OnOpen(sceneId,selfId,targetId)
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300303_g_MissionId)
	local flag = GetMissionParam(sceneId, selfId, misIndex, x300303_MP_SHOUJISHENGZHANGDIAN)
	if IsHaveMission(sceneId,selfId, x300303_g_MissionId) > 0 and flag == 1 then
		if LuaFnGetItemCount(sceneId,selfId,13010080) < 10 then
			return 0
		else
			BeginEvent(sceneId)
			AddText(sceneId,"�ռ��Ĺ�����~��̫������~����������")                    
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
function	 x301017_OnRecycle(sceneId,selfId,targetId)
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,13010080, 1 )             
	ret = EndAddItem(sceneId,selfId)                                 
	if ret > 0 then                                                  
		BeginEvent(sceneId)
		AddText(sceneId,format("������   %d/10", LuaFnGetItemCount(sceneId,selfId,13010080)+1))
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
function	x301017_OnProcOver(sceneId,selfId,targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function	x301017_OpenCheck(sceneId,selfId,AbilityId,AblityLevel)

end
