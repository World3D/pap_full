
x207015_g_ScriptId = 207015
x207014_g_MissionId= 15


x207015_g_MissionId = 16
x207015_g_MissionName="�ɼ���̴Ҷ"

x207015_g_MissionItem = {{id=12090006,num=1}}


function x207015_OnDefaultEvent(sceneId, selfId, targetId)
        x207015_g_MissionName2 = format("�Ѿ��ռ���̴Ҷ   %d/15", LuaFnGetItemCount(sceneId,selfId,12090006)+1 )
        BeginAddItem(sceneId)
		--����������б�
		for i, item in pairs(x207015_g_MissionItem) do
		AddItem(sceneId,item.id, item.num)
		end
                ret = EndAddItem(sceneId, selfId)
	        if ret > 0 then
		AddItemListToHuman(sceneId, selfId)
		BeginEvent(sceneId)
	        AddText(sceneId,"�Ѿ��ɼ�") 
                EndEvent()
                DispatchEventList(sceneId, selfId, targetId)
                BeginEvent(sceneId)
	        AddText(sceneId,x207015_g_MissionName2) 
                EndEvent()
                DispatchMissionTips(sceneId, selfId)
		LuaFnGmKillObj(sceneId,selfId,targetId)
		else
		BeginEvent(sceneId)
	        AddText(sceneId,"��������") 
                EndEvent()
                DispatchMissionTips(sceneId, selfId)
		end
	
		     
end


function x207015_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207014_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207014_g_MissionId) > 0 then
	    if LuaFnGetItemCount(sceneId,selfId,12090006)<15 then
              AddNumText(sceneId, x207015_g_ScriptId, x207015_g_MissionName)
            end
        end
	
end
	       