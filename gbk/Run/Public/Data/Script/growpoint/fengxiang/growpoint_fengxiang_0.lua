--������
--��������ʿ��
--
--�ű��� 920000


--������ʿ���б�
x920000_g_MonsterList = {1000,1001,1002,1003,1004,1000}
x920000_g_ChangePosList = {{-1,-1},{0,-1},{1,-1},{-1,0},{0,0},{1,0},{-1,1},{0,1},{1,1}}
x920000_g_MonsterAIList = {108,109,110,111,112,113}

--��̬������ʼ������

if(x920000_g_MonsterTotalNum ==nil) then
x920000_g_MonsterTotalNum = 0
end


--���ɺ�����ʼ************************************************************************

function 		x920000_OnCreate(sceneId,growPointType,x,y)
	
	
	local ItemBoxId = ItemBoxEnterScene(x,y,573,sceneId,0,13010001)
	--SetHumanAbilityLevel(sceneId, 15000,26,1)

	--SetItemBoxMaxGrowTime(sceneId,ItemBoxId,5000)	--�趨����ʱ��
	
	
end


function	 x920000_MonsterNum()
		x920000_g_MonsterTotalNum = x920000_g_MonsterTotalNum - 1
end



--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x920000_OnOpen(sceneId,selfId,targetId)

return 0

end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x920000_OnRecycle(sceneId,selfId,targetId)
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,13010001, 1 )             
	ret = EndAddItem(sceneId,selfId)                                 
	if ret > 0 then                                                  
		BeginEvent(sceneId)
		AddText(sceneId,format("��ʿ֤��   %d/10", LuaFnGetItemCount(sceneId,selfId,13010001)+1 )) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		AddItemListToHuman(sceneId,selfId) 
	else                                                             
		BeginEvent(sceneId)                                      
		AddText(sceneId,"��Ʒ��������")                    
		EndEvent(sceneId)                                        
		DispatchMissionTips(sceneId,selfId) 
	end                     
	
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x920000_OnProcOver(sceneId,selfId,targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function	x920000_OpenCheck(sceneId,selfId,AbilityId,AblityLevel)

end
