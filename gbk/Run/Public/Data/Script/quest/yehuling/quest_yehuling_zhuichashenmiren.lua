--�����ܾ�

--�ɼ�˼��

--�ű���
x207019_g_ScriptId = 207019

--��һ�������ID
x207019_g_MissionIdPre =18

--�����
x207019_g_MissionId = 22

--����Ŀ��npc
x207019_g_Name	="������" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207019_g_DemandItem = {{id=10400001,num=1}}

--������Ҫ�ύ����Ʒ
x207019_g_DeleteItem = {{id=12090010,num=10}}

--���񷢷ŵ���Ʒ
x207019_g_MissionItem = {{id=12090010,num=1}}

--������Ҫɱ���Ĺ�
x207019_g_DemandKill ={{id=3350,num=1},{id=3351,num=1},{id=3352,num=1}}	

--�����Ƕ�̬**************************************************************

--�����ı�����
x207019_g_MissionName="׷��������"
x207019_g_MissionInfo="���ײ�����Ȱ�棬ȥ׷ɱ������ʱ���ڶ��౻һȺ������(200,50)���ˡ�����ȥ׷����Ⱥ�˵����䡣����һЩ��������������"  --��������
x207019_g_MissionTarget="�������´���10���ʲݵ���"		--����Ŀ��
x207019_g_ContinueInfo="��Щ���������ֲ�����Ӧ�ò�����ͨ����������ز������"		--δ��������npc�Ի�
x207019_g_MissionComplete="ԭ����Щ�����˾��ǹ��ͣ������ǻʵ��������һȺ���֡�����ʵ�����̫�أ����ҵ�Сų��������ôһ���ˣ�һ�����Ա����ɳ�ȥ�Ĵ󳼣��������Լල��Щ�󳼣�������������֮�ġ���Ҫ���ϸ��ߴ󺹣�"					--�������npc˵���Ļ�
x207019_g_szBackageFull = "����������"
--������
x207019_g_MoneyBonus=20000
x207019_g_ItemBonus={}
x207019_g_RadioItemBonus={}
x207019_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207019_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207019_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207019_g_MissionId) > 0 then
	       if x207019_CheckSubmit(sceneId, selfId, targetId) <= 0 then
		     BeginEvent(sceneId)
		     AddText(sceneId, x207019_g_MissionName)
                     AddText(sceneId,x207019_g_ContinueInfo) 
		     AddText(sceneId,"��Ҫ��Ʒ")  
                     for i, item in pairs(x207019_g_MissionItem) do
		     AddItemBonus(sceneId, item.id, item.num)
		     EndEvent()
		     end
		     local bDone = x207019_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207019_g_ScriptId, x207019_g_MissionId, bDone)
	       end
	       if x207019_CheckSubmit(sceneId, selfId, targetId) > 0 then
		     BeginEvent(sceneId)
		     AddText(sceneId, x207019_g_MissionName)
		     AddText(sceneId,x207019_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207019_g_MoneyBonus)
		     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207019_g_ScriptId, x207019_g_MissionId)
	       end
		
        elseif x207019_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207019_g_MissionName, x207019_g_MissionInfo, x207019_g_MissionTarget, x207019_g_ItemBonus, x207019_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207019_g_ScriptId, x207019_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207019_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207019_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207019_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207019_g_ScriptId, x207019_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207019_CheckAccept(sceneId, selfId, targetId)

	if IsMissionHaveDone(sceneId, selfId, x207019_g_MissionIdPre) > 0 then
	    return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207019_CheckPushList(sceneId, selfId, targetId)
        if IsMissionHaveDone(sceneId, selfId, x207019_g_MissionIdPre) > 0 then
                    return 1
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x207019_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207019_g_MissionId, x207019_g_ScriptId, 1, 0, 0)
                                  
	    
end



--**********************************

--����

--**********************************

function x207019_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207019_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207019_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207019_g_MissionId) >= 0 then
	     if LuaFnGetItemCount(sceneId,selfId,12090010)==10 then
		return 1
	     end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207019_OnSubmit(sceneId, selfId, targetId, selectRadioId)
 
        MissionCom( sceneId,selfId, x207019_g_MissionId )
        DelMission( sceneId, selfId, x207019_g_MissionId )
	AddExp(sceneId, selfId, x207019_g_ExpBonus)   
	AddMoney(sceneId, selfId, x207019_g_MoneyBonus)
	for i, item in pairs(x207019_g_DeleteItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
	
			
	     
end


--**********************************

--ɱ����������

--**********************************

function x207019_OnKillObject(sceneId, selfId, objdataId) 
      if IsHaveMission(sceneId, selfId, x207019_g_MissionId) >= 0 then                                       
         if objdataId == x207019_g_DemandKill[1].id then 
            if LuaFnGetItemCount(sceneId,selfId,12090010) < 10 then
                 if random(1,100)>20 then
                 strText = format("�ʲݵ���%d/10", LuaFnGetItemCount(sceneId,selfId,12090010)+1 ) 
                 x888888_DeleteAndAddItem(sceneId, selfId, nil, x207019_g_MissionItem, strText, x207019_g_szBackageFull)
                 end
            end
         end
         if objdataId == x207019_g_DemandKill[2].id then 
            if LuaFnGetItemCount(sceneId,selfId,12090010) < 10 then
                 if random(1,100)>20 then
                 strText = format("�ʲݵ���%d/10", LuaFnGetItemCount(sceneId,selfId,12090010)+1 ) 
                 x888888_DeleteAndAddItem(sceneId, selfId, nil, x207019_g_MissionItem, strText, x207019_g_szBackageFull)
                 end
            end
         end
         if objdataId == x207019_g_DemandKill[3].id then 
            if LuaFnGetItemCount(sceneId,selfId,12090010) < 10 then
                 if random(1,100)>20 then
                 strText = format("�ʲݵ���%d/10", LuaFnGetItemCount(sceneId,selfId,12090010)+1 ) 
                 x888888_DeleteAndAddItem(sceneId, selfId, nil, x207019_g_MissionItem, strText, x207019_g_szBackageFull)
                 end
            end
         end
      end                                    
            
end                                                                                                   
                  




--**********************************

--���������¼�

--**********************************

function x207019_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207019_OnItemChanged(sceneId, selfId, itemdataId)

end

