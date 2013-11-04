--������

--�ű��� 301020

--��̬������ʼ������

x301020_g_ScriptId							= 700105
x301020_g_MissionId							= 445
x301020_g_Message_OK						= "�򿪱��䣡"
x301020_g_ErrorMessage_Mission	= "��������������"


--���ɺ�����ʼ************************************************************************

function x301020_OnCreate(sceneId, growPointType, x, z)
	
	CallScriptFunction(x301020_g_ScriptId, "_OnCreate", sceneId, growPointType, x, z);

end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function x301020_OnOpen(sceneId, selfId, targetId)

	if IsHaveMission(sceneId,selfId, x301020_g_MissionId) > 0 then

		return CallScriptFunction(x301020_g_ScriptId, "_OnOpen", sceneId, selfId, targetId);
	
	else
		BeginEvent(sceneId);        
		AddText(sceneId, x301020_g_ErrorMessage_Mission);
		EndEvent(sceneId);
		DispatchMissionTips(sceneId,selfId);
		return 1;
	end

end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function x301020_OnRecycle(sceneId, selfId, targetId)

	BeginEvent(sceneId);
		AddText(sceneId, x301020_g_Message_OK);
  EndEvent();
	DispatchMissionTips(sceneId, selfId);
	CallScriptFunction(x301020_g_ScriptId, "_OnRecycle", sceneId, selfId, targetId);
	return 1;
	
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function x301020_OnProcOver(sceneId, selfId, targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function x301020_OpenCheck(sceneId, selfId, AbilityId, AblityLevel)

end
