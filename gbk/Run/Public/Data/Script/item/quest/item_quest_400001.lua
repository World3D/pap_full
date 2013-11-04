
x400001_g_scriptId = 400001 
x400001_g_Impact1 = 3001 
x400001_g_Impact2 = -1 --����
x205007_g_MissionId = 47
x400001_g_DemandItem ={{id=13010007,num=1}}

--**********************************
--�¼��������
--**********************************
function x400001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x400001_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x400001_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x400001_OnConditionCheck( sceneId, selfId )
	 misIndex = GetMissionIndexByID(sceneId,selfId,x205007_g_MissionId)
        local nMonsterNum = GetMonsterCount(sceneId)
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
	local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)  == "����������"  then
			bHaveMonster = 1
		end
	end
	if (GetMissionParam(sceneId,selfId,misIndex,0)==20) then
        	if (GetMissionParam(sceneId,selfId,misIndex,1)==1) then
	        	
			if (bHaveMonster==0) then
				return 1
		        else                                                             
			     BeginEvent(sceneId)                                      
			     AddText(sceneId,"��Ʒ��ʱ�޷�ʹ��")                    
			     EndEvent(sceneId)                                        
			     DispatchMissionTips(sceneId,selfId)                      
		        end
		 else 
		 	     BeginEvent(sceneId)                                      
			     AddText(sceneId,"�뵽ָ������ʹ��")                    
			     EndEvent(sceneId)                                        
			     DispatchMissionTips(sceneId,selfId)  
		end          
		
	end
	if (GetMissionParam(sceneId,selfId,misIndex,0) < 15) then
		BeginEvent(sceneId)
		AddText(sceneId,"������ɳĮ����֮���ٵ�ȼ�̻�")
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
function x400001_OnDeplete( sceneId, selfId )
     
	LuaFnCreateMonster(sceneId, 6,229,158,0,1,-1)
	return 1
	
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x400001_OnActivateOnce( sceneId, selfId )
	
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x400001_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
