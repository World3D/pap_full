--������

--�ű��� 301019

--��̬������ʼ������

x301019_g_ScriptId							= 700104
x301019_g_MissionId							= 444
x301019_g_Message_OK						= "���ĳɹ���"
x301019_g_ErrorMessage_Mission	= "��������������"


--���ɺ�����ʼ************************************************************************

function x301019_OnCreate(sceneId, growPointType, x, z)
	
	CallScriptFunction(x301019_g_ScriptId, "_OnCreate", sceneId, growPointType, x, z);

end






--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function x301019_OnOpen(sceneId, selfId, targetId)

	if IsHaveMission(sceneId,selfId, x301019_g_MissionId) > 0 then
		
		return CallScriptFunction(x301019_g_ScriptId, "_OnOpen", sceneId, selfId, targetId);
	
	else
		BeginEvent(sceneId);        
		AddText(sceneId, x301019_g_ErrorMessage_Mission);
		EndEvent(sceneId);
		DispatchMissionTips(sceneId,selfId);
		return 1;
	end

end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function x301019_OnRecycle(sceneId, selfId, targetId)

	BeginEvent(sceneId);
		AddText(sceneId, x301019_g_Message_OK);
  EndEvent();
	DispatchMissionTips(sceneId, selfId);
	CallScriptFunction(x301019_g_ScriptId, "_OnRecycle", sceneId, selfId, targetId);
	return 1;
	
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function x301019_OnProcOver(sceneId, selfId, targetId)

end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



function x301019_OpenCheck(sceneId, selfId, AbilityId, AblityLevel)

end
