
x207006_g_ScriptId = 207006
x207005_g_ScriptId = 207005
x207005_g_MissionId= 6


x207006_g_MissionId = 7
x207005_g_MissionComplete="���ǵ��سǽ��������ޱȣ��ɾ�ע��Ҫʧ�ܣ��벻Ҫ������ǰ���������Ȼץ��ȥ���١�"	
x207005_g_MoneyBonus=200



function x207006_OnDefaultEvent(sceneId, selfId, targetId)

       
	BeginEvent(sceneId)
	AddText(sceneId,x207005_g_MissionComplete)
        EndEvent()

	DispatchEventList(sceneId, selfId, targetId)
end


function x207006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207005_g_MissionId) > 0 then
	    
        end
	
end
	       