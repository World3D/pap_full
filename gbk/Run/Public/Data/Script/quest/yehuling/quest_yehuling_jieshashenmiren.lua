--�����ܾ�

--�ɼ�˼��

--�ű���
x207012_g_ScriptId = 207012

--��һ�������ID
x207012_g_MissionIdPre =12

--�����
x207012_g_MissionId = 13

--����Ŀ��npc
x207012_g_Name	="����" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207012_g_DemandItem = {{id=10400001,num=1}}

--������Ҫ�ύ����Ʒ
--x207012_g_DeleteItem = {{id=10400001,num=1}}

--���񷢷ŵ���Ʒ
x207012_g_MissionItem = {{id=12090005,num=1}}

--������Ҫɱ���Ĺ�
x207012_g_DemandKill ={{id=3350,num=1},{id=3351,num=1},{id=3352,num=1}}	

--�����Ƕ�̬**************************************************************

--�����ı�����
x207012_g_MissionName="��ɱ������"
x207012_g_MissionInfo="���ǵ��Ǹ�С������³��ľ���轫���Ķ��ӣ�����ȻС��ȴ������飬�쵽�����ĸ��ڣ��ƺ��õ���һЩ������Ϣ���ý��һȺ������׷ɱ����Ⱥ�����˲�֪����������ϵ���У�ȫ��������ߣ�����֮�����뵽��210,45��ȥ��׷ɱ��³��������ɱ������һ�����ǵ���ݡ�"  --��������
x207012_g_MissionTarget="ɱ��׷ɱ��³�������˴���һ�����ص����"		--����Ŀ��
x207012_g_ContinueInfo="��³���ڵ�Ϧ���̲��ݻ���"		--δ��������npc�Ի�
x207012_g_MissionComplete="����߾�����Ⱥ�����˴��ģ����ǿֲ�������ħ��һ�����Ҵ�δ������������ߡ�"					--�������npc˵���Ļ�
x207012_g_MissionAddItem="���ص����   1/1"		
x207012_g_szBackageFull = "����������"
--������
x207012_g_MoneyBonus=20000
x207012_g_ItemBonus={}
x207012_g_RadioItemBonus={}
x207012_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207012_g_MissionId) > 0 then
	        if x207012_CheckSubmit(sceneId, selfId, targetId) <= 0 then
		     BeginEvent(sceneId)
		     AddText(sceneId, x207012_g_MissionName)
                     AddText(sceneId,x207012_g_ContinueInfo) 
		     AddText(sceneId,"��Ҫ��Ʒ")  
                     for i, item in pairs(x207012_g_MissionItem) do
		     AddItemBonus(sceneId, item.id, item.num)
		     EndEvent()
		     end
		     local bDone = x207012_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207012_g_ScriptId, x207012_g_MissionId, bDone)
		end
		if x207012_CheckSubmit(sceneId, selfId, targetId) > 0 then
		BeginEvent(sceneId)
		     AddText(sceneId, x207012_g_MissionName)
		     AddText(sceneId,x207012_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207012_g_MoneyBonus)
		     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207012_g_ScriptId, x207012_g_MissionId)
		end

		
        elseif x207012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207012_g_MissionName, x207012_g_MissionInfo, x207012_g_MissionTarget, x207012_g_ItemBonus, x207012_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207012_g_ScriptId, x207012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207012_g_ScriptId, x207012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207012_CheckAccept(sceneId, selfId, targetId)

	if IsMissionHaveDone(sceneId, selfId, x207012_g_MissionIdPre) > 0 then
	    return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207012_CheckPushList(sceneId, selfId, targetId)
        if IsMissionHaveDone(sceneId, selfId, x207012_g_MissionIdPre) > 0 then
                    return 1
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x207012_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207012_g_MissionId, x207012_g_ScriptId, 1, 0, 0)

end



--**********************************

--����

--**********************************

function x207012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207012_g_MissionId)

end




--**********************************

--����Ƿ�����ύ

--**********************************

function x207012_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207012_g_MissionId) >= 0 then
	     if x888888_CheckHaveItems(sceneId, selfId, x207012_g_MissionItem) > 0 then
		return 1
	     end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207012_OnSubmit(sceneId, selfId, targetId, selectRadioId)
 
        MissionCom( sceneId,selfId, x207012_g_MissionId )
        DelMission( sceneId, selfId, x207012_g_MissionId )
	AddExp(sceneId, selfId, x207012_g_ExpBonus)   
	AddMoney(sceneId, selfId, x207012_g_MoneyBonus)
	for i, item in pairs(x207012_g_MissionItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
	
			
	     
end


--**********************************

--ɱ����������

--**********************************

function x207012_OnKillObject(sceneId, selfId, objdataId) 
      if IsHaveMission(sceneId, selfId, x207012_g_MissionId) >= 0 then                                       
         if objdataId == x207012_g_DemandKill[1].id then 
            if x888888_CheckHaveItems(sceneId, selfId, x207012_g_MissionItem) <= 0 then
                 if random(1,100)>80 then
                 x888888_DeleteAndAddItem(sceneId, selfId, nil, x207012_g_MissionItem, x207012_g_MissionAddItem, x207012_g_szBackageFull)
                 end
            end
         end
         if objdataId == x207012_g_DemandKill[2].id then 
            if x888888_CheckHaveItems(sceneId, selfId, x207012_g_MissionItem) <= 0 then
                 if random(1,100)>80 then
                 x888888_DeleteAndAddItem(sceneId, selfId, nil, x207012_g_MissionItem, x207012_g_MissionAddItem, x207012_g_szBackageFull)
                 end
            end
         end
         if objdataId == x207012_g_DemandKill[3].id then 
            if x888888_CheckHaveItems(sceneId, selfId, x207012_g_MissionItem) <= 0 then
                 if random(1,100)>80 then
                 x888888_DeleteAndAddItem(sceneId, selfId, nil, x207012_g_MissionItem, x207012_g_MissionAddItem, x207012_g_szBackageFull)
                 end
            end
         end
      end                                    
            
end                                                                                                   
                  




--**********************************

--���������¼�

--**********************************

function x207012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207012_OnItemChanged(sceneId, selfId, itemdataId)

end

