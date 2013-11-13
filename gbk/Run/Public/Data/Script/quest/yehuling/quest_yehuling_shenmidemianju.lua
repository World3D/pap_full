--�����ܾ�

--�ɼ�˼��

--�ű���
x207013_g_ScriptId = 207013

--��һ�������ID
x207013_g_MissionIdPre =13

--�����
x207013_g_MissionId = 14

--����Ŀ��npc
x207013_g_Name	="����" 
x207013_g_Name2	="������" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207013_g_DemandItem = {{id=10400001,num=1}}

--������Ҫ�ύ����Ʒ
--x207013_g_DeleteItem = {{id=10400001,num=1}}

--���񷢷ŵ���Ʒ
x207013_g_MissionItem = {{id=12090002,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207013_g_MissionName="���ص����"
x207013_g_MissionInfo="����߾�����Ⱥ�����˴��ģ����ǿֲ�������ħ��һ�����Ҵ�δ������������ߡ���������ȥ�����£��������Ƿ�֪��������顣   "  --��������
x207013_g_MissionTarget="���ʳ����¹�����ߵ����飬Ȼ�������ิ��"		--����Ŀ��
x207013_g_ContinueInfo="�����͡������ֵ��ױ�ʾʲô�أ������»�֪����"		--δ��������npc�Ի�
x207013_g_ContinueInfo2="�ѵ��ǡ������ͣ����ǹ��͵ı�־������ǰ���Ҿ���һ��������׷ɱ��С��ʿ������С��ʿ��ʦ���𴦻����������ҵġ�����ʹ��������ˣ�һ�����Ǵ��ڽ�������һ�����ǹ��͡��Ҿ�֪����ô�࡭��"
x207013_g_MissionComplete="�����¼���ʶ�㣬����֪�����ǵ����飬�𴦻�����������˵������˵�����������ٶ��꣬��������ǵ�һ����˵����Ҫ����Ȥ�Ļ������԰ѹ��͵��������������"					--�������npc˵���Ļ�
x207013_g_MissionAddItem="�õ����ص����"
x207013_g_ShowMissionTarget="ѯ�ʳ����¹�����ߵ�����   1/1"	
x207013_g_szBackageFull = "����������"
--������
x207013_g_MoneyBonus=200
x207013_g_ItemBonus={}
x207013_g_RadioItemBonus={}
x207013_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207013_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207013_g_MissionId) > 0 then
	     misIndex = GetMissionIndexByID(sceneId,selfId,x207013_g_MissionId)
		if (GetName(sceneId,targetId)==x207013_g_Name) then
		    if x207013_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                     BeginEvent(sceneId)
		     AddText(sceneId,x207013_g_ContinueInfo)
		     EndEvent()local bDone = x207013_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207013_g_ScriptId, x207013_g_MissionId, bDone)
		    end
		    if x207013_CheckSubmit(sceneId, selfId, targetId) > 0 then
		     BeginEvent(sceneId)AddText(sceneId, x207013_g_MissionName)
		     AddText(sceneId,x207013_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207013_g_MoneyBonus)
		     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207013_g_ScriptId, x207013_g_MissionId)
		    end

		
                end
		if (GetName(sceneId,targetId)==x207013_g_Name2) then
                     BeginEvent(sceneId)
		     AddText(sceneId,x207013_g_ContinueInfo2)
		     EndEvent()
		     DispatchEventList(sceneId, selfId, targetId)
		     BeginEvent(sceneId)
     		     AddText(sceneId, x207013_g_ShowMissionTarget)
     		     EndEvent()
     		     DispatchMissionTips(sceneId, selfId)
     		     SetMissionByIndex(sceneId,selfId,misIndex,0,2)
                end
        elseif x207013_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207013_g_MissionName, x207013_g_MissionInfo, x207013_g_MissionTarget, x207013_g_ItemBonus, x207013_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207013_g_ScriptId, x207013_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207013_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207013_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207013_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207013_g_ScriptId, x207013_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207013_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207013_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207013_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207013_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207013_g_MissionIdPre) > 0 then
                    return 1
                end
        end
	if (GetName(sceneId,targetId)==x207013_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207013_g_MissionId) > 0 then
		          misIndex = GetMissionIndexByID(sceneId,selfId,x207013_g_MissionId) 
	                  if (GetMissionParam(sceneId,selfId,misIndex,0)==1) then
                          return 1
                          end
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207013_OnAccept(sceneId, selfId)

	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207013_g_MissionId, x207013_g_ScriptId, 1, 0, 0)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207013_g_MissionId)		--�������                                           
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)                                                         
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x207013_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207013_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207013_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207013_g_MissionId) >= 0 then
	        misIndex = GetMissionIndexByID(sceneId,selfId,x207013_g_MissionId) 
	        if (GetMissionParam(sceneId,selfId,misIndex,0)==2) then
	        return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207013_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207013_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207013_g_MissionId)
		AddExp(sceneId, selfId, x207013_g_ExpBonus)
		AddMoney(sceneId, selfId, x207013_g_MoneyBonus)
		for i, item in pairs(x207013_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207013_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207013_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207013_OnItemChanged(sceneId, selfId, itemdataId)

end

