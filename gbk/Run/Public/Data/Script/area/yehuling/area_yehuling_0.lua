
x207016_g_MissionId=17
--��ҽ���һ�� area ʱ����
function x500700_OnEnterArea( sceneId, selfId )
      misIndex = GetMissionIndexByID(sceneId,selfId,x207016_g_MissionId)		--�������                                           
      SetMissionByIndex(sceneId,selfId,misIndex,1,1)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x500700_OnTimer( sceneId, selfId )

end

--����뿪һ�� area ʱ����
function x500700_OnLeaveArea( sceneId, selfId )
      misIndex = GetMissionIndexByID(sceneId,selfId,x207016_g_MissionId)		--�������                                           
      SetMissionByIndex(sceneId,selfId,misIndex,1,0)
      end
