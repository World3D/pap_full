--�����ܾ�

--�ɼ�˼��

--�ű���
x207011_g_ScriptId = 207011

--��һ�������ID
x207011_g_MissionIdPre =11

--�����
x207011_g_MissionId = 12

--����Ŀ��npc
x207011_g_Name	="ľ����" 
x207011_g_Name1	="Ү�ɰ���" 
x207011_g_Name2	="����" 
--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************


x207011_g_MissionItem = {{id=12090004,num=1}}
x207011_g_DemandKill ={{id=3154,num=1},{id=3155,num=1}}	

--�����Ƕ�̬**************************************************************

--�����ı�����
x207011_g_MissionName="�����ֲ�ͼ"
x207011_g_MissionInfo="פ���ںڷ�ڵĽ����Ȼ�����׻����ˣ�����ȴ��ݾ��ߣ��������سǵ���������ʮ��ı������µ������ҵĶ�����³��ױ����ȥ�ñ����ֲ�ͼ���������䲻���������ֲ�ͼ�¹��ش���ֻ𼱣���ȥ�ѱ����ֲ�ͼ�û��������࣬Ү�ɰ���(150,25)���Ӧ�㡣    "  --��������
x207011_g_MissionTarget="ѯ��Ү�ɰ��������ֲ�ͼ�����䣬�õ������ֲ�ͼ��"		--����Ŀ��
x207011_g_ContinueInfo="�õ������ֲ�ͼ����"		--δ��������npc�Ի�
x207011_g_ContinueInfo2="��³̫���Ĵ����ˣ��������ڽ�ͷ��ʱ�򱻽��ץס�����ڲ�Զ��Ӫկ������ֲ�ͼӦ���ڸ����Ľ�����ϡ�"
x207011_g_MissionComplete="�벻������ļ�ϸ��ô��������ʮ�����С�������Ź����Ժ�����û�о������³��ȥ�����ˡ��Ҹ���׼�������̾ƣ���ȫ��ͱ��ؼ�������Ծ������á�"					--�������npc˵���Ļ�
x207011_g_MissionAddItem="�����ֲ�ͼ   1/1"		
x207011_g_szBackageFull = "����������"
x207011_g_ShowMissionTarget="ѯ��Ү�ɰ��������ֲ�ͼ������   1/1"
--������
x207011_g_MoneyBonus=200
x207011_g_ItemBonus={}
x207011_g_RadioItemBonus={}
x207011_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207011_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207011_g_Name2) then
		   if  x207011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                     BeginEvent(sceneId)
			
                     AddText(sceneId,x207011_g_ContinueInfo)
                     AddText(sceneId,"��Ҫ��Ʒ")  
                     for i, item in x207011_g_MissionItem do
		     AddItemBonus(sceneId, item.id, item.num)
		     EndEvent()
		     end

		     local bDone = x207011_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId,targetId,x207011_g_ScriptId, x207011_g_MissionId, bDone)
		   end
		   if  x207011_CheckSubmit(sceneId, selfId, targetId) > 0 then
		     BeginEvent(sceneId)
    	             AddText(sceneId, x207011_g_MissionName)
                     AddText(sceneId,x207011_g_MissionComplete)
                     AddMoneyBonus(sceneId, x207011_g_MoneyBonus) 
    	             EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207011_g_ScriptId, x207011_g_MissionId)
                   end

		
                end
               	if (GetName(sceneId,targetId)==x207011_g_Name1) then
               	misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)
		   BeginEvent(sceneId)
                   AddText(sceneId,x207011_g_ContinueInfo2)
                   EndEvent()
		   DispatchEventList(sceneId, selfId, targetId) 
		   SetMissionByIndex(sceneId,selfId,misIndex,0,2)
		   BeginEvent(sceneId)
		   AddText(sceneId, x207011_g_ShowMissionTarget)
		   EndEvent()
		   DispatchMissionTips(sceneId, selfId)
                end
	elseif x207011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207011_g_MissionName, x207011_g_MissionInfo, x207011_g_MissionTarget, x207011_g_ItemBonus, x207011_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207011_g_ScriptId, x207011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207011_CheckPushList(sceneId, selfId, targetId) > 0 then
              if IsMissionHaveDone(sceneId, selfId, x207011_g_MissionIdPre) > 0 then
		AddNumText(sceneId, x207011_g_ScriptId, x207011_g_MissionName)
              end
	end
	
end



--**********************************

--����������

--**********************************

function x207011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207011_g_Name) then
					return 1
		
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207011_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207011_g_Name) then
             if IsHaveMission(sceneId,selfId, x207011_g_MissionId) <= 0 then
             return 1
             end
        end
        if (GetName(sceneId,targetId)==x207011_g_Name2) then
             if IsHaveMission(sceneId,selfId, x207011_g_MissionId) > 0 then
             return 1
             end
        end
	if (GetName(sceneId,targetId)==x207011_g_Name1) then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)
		    if (GetMissionParam(sceneId,selfId,misIndex,0)==1) then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207011_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207011_g_MissionId, x207011_g_ScriptId, 1, 0, 0)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)		--�������                                           
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)
end



--**********************************

--����

--**********************************

function x207011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207011_g_MissionId)

end



--**********************************

--����

--**********************************

function x207011_OnContinue(sceneId, selfId, targetId)

	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
	
	AddText(sceneId, x207011_g_MissionName)
        AddText(sceneId,x207011_g_MissionComplete)
        AddMoneyBonus(sceneId, x207011_g_MoneyBonus) 
	EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207011_g_ScriptId, x207011_g_MissionId)

end


--**********************************

--����Ƿ�����ύ

--**********************************

function x207011_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207011_g_MissionId) >= 0 then
		if x888888_CheckHaveItems(sceneId, selfId, x207011_g_MissionItem) > 0 then
			return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207011_g_MissionId)
		AddExp(sceneId, selfId, x207011_g_ExpBonus)
		AddMoney(sceneId, selfId, x207011_g_MoneyBonus)
		for i, item in x207011_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207011_g_MissionItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207011_OnKillObject(sceneId, selfId, objdataId) 
      if IsHaveMission(sceneId, selfId, x207011_g_MissionId) >= 0 then                                       
         if objdataId == x207011_g_DemandKill[1].id then 
            misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)
            if (GetMissionParam(sceneId,selfId,misIndex,0)==2) then
               if x888888_CheckHaveItems(sceneId, selfId, x207011_g_MissionItem) <= 0 then
                 if random(1,100)>90 then
                 x888888_DeleteAndAddItem(sceneId, selfId, nil, x207011_g_MissionItem, x207011_g_MissionAddItem, x207011_g_szBackageFull)
                 end
               end
            end
         end
         if objdataId == x207011_g_DemandKill[2].id then 
            misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)
            if (GetMissionParam(sceneId,selfId,misIndex,0)==2) then
               if x888888_CheckHaveItems(sceneId, selfId, x207011_g_MissionItem) <= 0 then
                 if random(1,100)>90 then
                 x888888_DeleteAndAddItem(sceneId, selfId, nil, x207011_g_MissionItem, x207011_g_MissionAddItem, x207011_g_szBackageFull)
                 end
               end
            end
         end
      end                                    
            
end          



--**********************************

--���������¼�

--**********************************

function x207011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207011_OnItemChanged(sceneId, selfId, itemdataId)

end

