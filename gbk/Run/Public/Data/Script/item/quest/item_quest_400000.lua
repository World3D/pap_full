
x400000_g_scriptId = 400000 
x400000_g_Impact1 = 3001 
x400000_g_Impact2 = -1 --����
x205005_g_MissionId = 45
x400000_g_DemandItem ={{id=13010005,num=5}}

--**********************************
--�¼��������
--**********************************
function x400000_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x400000_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x400000_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x400000_OnConditionCheck( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x205005_g_MissionId)
        if (GetMissionParam(sceneId,selfId,misIndex,0)==1) then
        	return 1
	end
	if (GetMissionParam(sceneId,selfId,misIndex,0)==0) then
		BeginEvent(sceneId)
		AddText(sceneId,"���ȵ�������ʹ��")
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
function x400000_OnDeplete( sceneId, selfId )
     misIndex = GetMissionIndexByID(sceneId,selfId,x205005_g_MissionId)
        	BeginAddItem(sceneId)                                                    
		AddItem( sceneId,x400000_g_DemandItem[1].id,1)             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	LuaFnDepletingUsedItem(sceneId, selfId)
			BeginEvent(sceneId)
			AddText(sceneId,format("ʢ����ˮ��   %d/5", LuaFnGetItemCount(sceneId,selfId,x400000_g_DemandItem[1].id)+1 ))
			DispatchMissionTips(sceneId,selfId) 
			AddItemListToHuman(sceneId,selfId) 
			return 1
	        else                                                             
		     BeginEvent(sceneId)                                      
		     AddText(sceneId,"��Ʒ����������������������")                    
		     EndEvent(sceneId)                                        
		     DispatchMissionTips(sceneId,selfId)                      
	        end           
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x400000_OnActivateOnce( sceneId, selfId )
	
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x400000_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
