--������

--�ű��� 301018

--��̬������ʼ������

x301018_g_ScriptId							= 700102
x301018_g_MissionId							= 442
x301018_g_Message_OK						= "�򿪿��أ�"
x301018_g_ErrorMessage_Mission	= "��������������"


--���ɺ�����ʼ************************************************************************

function x301018_OnCreate(sceneId, growPointType, x, z)
	
	CallScriptFunction(x301018_g_ScriptId, "_OnCreate", sceneId, growPointType, x, z);

end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function x301018_OnOpen(sceneId, selfId, targetId)

	if IsHaveMission(sceneId,selfId, x301018_g_MissionId) > 0 then
		
		return CallScriptFunction(x301018_g_ScriptId, "_OnOpen", sceneId, selfId, targetId);
	
	else
		BeginEvent(sceneId);        
		AddText(sceneId, x301018_g_ErrorMessage_Mission);
		EndEvent(sceneId);
		DispatchMissionTips(sceneId,selfId);
		return 1;
	end

end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function x301018_OnRecycle(sceneId, selfId, targetId)

	BeginEvent(sceneId);
		AddText(sceneId, x301018_g_Message_OK);
  EndEvent();
	DispatchMissionTips(sceneId, selfId);
	return 1;
	
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function x301018_OnProcOver(sceneId, selfId, targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function x301018_OpenCheck(sceneId, selfId, AbilityId, AblityLevel)

end
