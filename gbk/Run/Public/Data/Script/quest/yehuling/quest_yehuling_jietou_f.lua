
x207015_g_ScriptId = 207015
x207014_g_ScriptId = 207014
x207014_g_MissionId= 15


x207015_g_MissionId = 16
x207015_g_MissionComplete="    С�ֵܣ��벻���㳤�Ĳ�˧������ͦ��Ц����"	
x207014_g_MoneyBonus=200



function x207015_OnDefaultEvent(sceneId, selfId, targetId)

       
	BeginEvent(sceneId)
	AddText(sceneId,x207015_g_MissionComplete)
        EndEvent()

	DispatchEventList(sceneId, selfId, targetId)
end


function x207015_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207015_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207014_g_MissionId) > 0 then
	    
        end
	
end
	       