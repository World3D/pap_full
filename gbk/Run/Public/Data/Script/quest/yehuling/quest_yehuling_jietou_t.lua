
x207016_g_ScriptId = 207016
x207014_g_ScriptId = 207014
x207014_g_MissionId= 15
x207014_g_MissionName="��ͷ"
x207014_g_MissionTarget="    ��#G���˺�#W��ͷ"	

x207016_g_MissionId = 17
x207014_g_MissionComplete="    �ϻ���ɽ�д����ˣ���ȥ�����ˣ�������һ��ĸ��Ƥ�����ڵ�#G������#W��������ϻ�����ȥ��������"	
x207014_g_MoneyBonus=200



function x207016_OnDefaultEvent(sceneId, selfId, targetId)
       
                BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207014_g_MissionName)
		AddText(sceneId,x207014_g_MissionComplete)
	        AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207014_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207014_g_MoneyBonus)	
		EndEvent()
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x207014_g_ScriptId, x207014_g_MissionId)
	     
end

function x207016_OnEnumerate(sceneId, selfId, targetId)
       
       
     --��������ɹ��������
     --����ѽӴ�����
     
     	
end
	       