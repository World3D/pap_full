
x207003_g_ScriptId = 207003
x207002_g_MissionId= 3


x207003_g_MissionId = 4
x207003_g_MissionName="�ɼ���ҩ"

x207003_g_MissionItem = {{id=12090002,num=1}}


function x207003_OnDefaultEvent(sceneId, selfId, targetId)
        x207003_g_MissionName2 = format("�����   %d/10", LuaFnGetItemCount(sceneId,selfId,12090002)+1 )
        BeginAddItem(sceneId)
		--����������б�
		for i, item in x207003_g_MissionItem do
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
	        AddText(sceneId,x207003_g_MissionName2) 
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


function x207003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x200102_g_MissionId) > 0 then
	    if LuaFnGetItemCount(sceneId,selfId,12090002)<10 then
              AddNumText(sceneId, x207003_g_ScriptId, x207003_g_MissionName)
            end
        end
	
end
	       