
x400002_g_scriptId = 400002 
x400002_g_Impact1 = 3001 
x400002_g_Impact2 = -1 --����
x208003_g_MissionId = 57
x400002_g_DemandItem ={{id=13010009,num=1}}

--**********************************
--�¼��������
--**********************************
function x400002_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x400002_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x400002_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x400002_OnConditionCheck( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x208003_g_MissionId)
        if (GetMissionParam(sceneId,selfId,misIndex,2)==1) then
        		return 1
	end
	if (GetMissionParam(sceneId,selfId,misIndex,2)==0) then
		BeginEvent(sceneId)
		AddText(sceneId,"���ȵ�����ǰ��ʹ��")
		DispatchMissionTips(sceneId,selfId) 
		EndEvent(sceneId)
	end
	return 0
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x400002_OnDeplete( sceneId, selfId )
     misIndex = GetMissionIndexByID(sceneId,selfId,x208003_g_MissionId)
        		LuaFnDepletingUsedItem(sceneId, selfId)
        		SetMissionByIndex(sceneId,selfId,misIndex,1,1)
			BeginEvent(sceneId)
			AddText(sceneId,format("�Ѹ�ʾ���ڳ���   %d/1", GetMissionParam(sceneId,selfId,misIndex,1)))
			DispatchMissionTips(sceneId,selfId) 
			return 1
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x400002_OnActivateOnce( sceneId, selfId )
	
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x400002_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
