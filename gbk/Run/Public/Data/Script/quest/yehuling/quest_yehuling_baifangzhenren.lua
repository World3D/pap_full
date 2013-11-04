--�����ܾ�

--�ɼ�˼��

--�ű���
x207023_g_ScriptId = 207023

--��һ�������ID
x207023_g_MissionIdPre =14

--�����
x207023_g_MissionId = 24

--����Ŀ��npc
x207023_g_Name	="����" 
x207023_g_Name1	="�𴦻�" 
x207023_g_Name2	="�����" 
--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************


x207023_g_MissionItem = {{id=12090004,num=1}}
x207023_g_DemandKill ={{id=4000,num=1}}	

--�����Ƕ�̬**************************************************************

--�����ı�����
x207023_g_MissionName="�ݷ�����"
x207023_g_MissionInfo="�ɾ�����ʿ��������̫���ˣ������������(110,120)����һ���ϵ�ʿ�ڲ�ҩ���ɷ���ǵģ���֪���ǲ��ǳ����¿���˵���𴦻�����ȥ������̽һ�¡�    "  --��������
x207023_g_MissionTarget="Ū����ϵ�����ݺ���߻����"		--����Ŀ��
x207023_g_ContinueInfo="�ҵ�����������"		--δ��������npc�Ի�
x207023_g_ContinueInfo2="��Ҫ��֪����˭����Ҫ�������ж���¡�������һֻ����ȥ������ɡ� "
x207023_g_ContinueInfo3="��Ҫ���£������Ȼ���ͣ�����ȴ��������ɵС��ѵ����ͨ�����ԡ� "
x207023_g_ContinueInfo4="ƶ���𴦻���ɽҰ֮�ˣ���Ӧ��������֮�У�ֻ��������ս����������ϣ���ɼ�˼����һͳ���¡� "
x207023_g_MissionComplete="���ϵ�ʿ������𴦻����ˣ���˵���������ٶ��ˣ���һλ�����ɰ���"					--�������npc˵���Ļ�
x207023_g_ShowMissionTarget="Ū���ϵ����   1/1"
--������
x207023_g_MoneyBonus=200
x207023_g_ItemBonus={}
x207023_g_RadioItemBonus={}
x207023_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207023_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207023_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207023_g_Name2) then
		   if  x207023_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,x207023_g_ContinueInfo)
                     EndEvent()
		     local bDone = x207023_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId,targetId,x207023_g_ScriptId, x207023_g_MissionId, bDone)
		   end
		   if  x207023_CheckSubmit(sceneId, selfId, targetId) > 0 then
		     BeginEvent(sceneId)
    	             AddText(sceneId, x207023_g_MissionName)
                     AddText(sceneId,x207023_g_MissionComplete)
                     AddMoneyBonus(sceneId, x207023_g_MoneyBonus) 
    	             EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207023_g_ScriptId, x207023_g_MissionId)
                   end
                end
               	if (GetName(sceneId,targetId)==x207023_g_Name1) then
               	misIndex = GetMissionIndexByID(sceneId,selfId,x207023_g_MissionId)
               	   if (GetMissionParam(sceneId,selfId,misIndex,0)==1) then
		   BeginEvent(sceneId)
                   AddText(sceneId,x207023_g_ContinueInfo3)
                   EndEvent()
		   DispatchEventList(sceneId, selfId, targetId) 
		   end
		   if (GetMissionParam(sceneId,selfId,misIndex,0)==0) then
		   BeginEvent(sceneId)
                   AddText(sceneId,x207023_g_ContinueInfo2)
                   EndEvent()
		   DispatchEventList(sceneId, selfId, targetId) 
		   SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		   end
		   if (GetMissionParam(sceneId,selfId,misIndex,0)==2) then
		   BeginEvent(sceneId)
                   AddText(sceneId,x207023_g_ContinueInfo4)
                   EndEvent()
		   DispatchEventList(sceneId, selfId, targetId) 
		   BeginEvent(sceneId)
     		   AddText(sceneId, x207023_g_ShowMissionTarget)
     		   EndEvent()
     		   DispatchMissionTips(sceneId, selfId)
     		   SetMissionByIndex(sceneId,selfId,misIndex,0,3)
		   end
		 end
		   
	elseif x207023_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207023_g_MissionName, x207023_g_MissionInfo, x207023_g_MissionTarget, x207023_g_ItemBonus, x207023_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207023_g_ScriptId, x207023_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207023_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207023_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207023_CheckPushList(sceneId, selfId, targetId) > 0 then
              if IsMissionHaveDone(sceneId, selfId, x207023_g_MissionIdPre) > 0 then
		AddNumText(sceneId, x207023_g_ScriptId, x207023_g_MissionName)
              end
	end
	
end



--**********************************

--����������

--**********************************

function x207023_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207023_g_Name) then
					return 1
		
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207023_CheckPushList(sceneId, selfId, targetId)
        misIndex = GetMissionIndexByID(sceneId,selfId,x207023_g_MissionId)
        if (GetName(sceneId,targetId)==x207023_g_Name) then
             if IsHaveMission(sceneId,selfId, x207023_g_MissionId) <= 0 then
             return 1
             end
        end
        if (GetName(sceneId,targetId)==x207023_g_Name1) then
             if IsHaveMission(sceneId,selfId, x207023_g_MissionId) > 0 then
                if (GetMissionParam(sceneId,selfId,misIndex,0)<3) then
                return 1
                end
             end
        end
	if (GetName(sceneId,targetId)==x207023_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207023_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207023_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207023_g_MissionId, x207023_g_ScriptId, 1, 0, 0)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207023_g_MissionId)		--�������                                           
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)
end



--**********************************

--����

--**********************************

function x207023_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207023_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207023_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207023_g_MissionId) >= 0 then
		if (GetMissionParam(sceneId,selfId,misIndex,0)==3) then
			return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207023_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207023_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207023_g_MissionId)
		AddExp(sceneId, selfId, x207023_g_ExpBonus)
		AddMoney(sceneId, selfId, x207023_g_MoneyBonus)
		for i, item in x207023_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207023_g_MissionItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207023_OnKillObject(sceneId, selfId, objdataId) 
      if IsHaveMission(sceneId, selfId, x207023_g_MissionId) >= 0 then                                       
         if objdataId == x207023_g_DemandKill[1].id then 
            misIndex = GetMissionIndexByID(sceneId,selfId,x207023_g_MissionId)
            if (GetMissionParam(sceneId,selfId,misIndex,0)==1) then
               SetMissionByIndex(sceneId,selfId,misIndex,0,2)
            end
         end
         
      end                                    
            
end          



--**********************************

--���������¼�

--**********************************

function x207023_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207023_OnItemChanged(sceneId, selfId, itemdataId)

end

