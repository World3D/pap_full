
x207007_g_ScriptId = 207007
x207005_g_MissionId= 6


x207007_g_MissionId = 8
x207005_g_MissionComplete="���Ұ����׵���ʿ���������ˣ����ﳣ�н����ץ������Ҳ��ܲ�С�ģ���ԭ���ҵ�ð����"	
x207005_g_MoneyBonus=200



function x207007_OnDefaultEvent(sceneId, selfId, targetId)
       
	BeginEvent(sceneId)
	AddText(sceneId,x207005_g_MissionComplete)
        AddMoneyBonus(sceneId, x207005_g_MoneyBonus) 
	EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207005_g_ScriptId, x207005_g_MissionId)
	     
end

function x207007_OnEnumerate(sceneId, selfId, targetId)
       
       
     --��������ɹ��������
     if IsMissionHaveDone(sceneId, selfId, x207007_g_MissionId) > 0 then
     	return 
     end
     --����ѽӴ�����
     if IsHaveMission(sceneId,selfId, x207005_g_MissionId) > 0 then
         
         
         
                    end
     	
end
	       