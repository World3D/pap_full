
--�ű���
x207010_g_ScriptId = 207010

--��һ�������ID
x207010_g_MissionIdPre =23

--�����
x207010_g_MissionId = 11

--����Ŀ��npc
x207010_g_Name	="����" 
x207010_g_Name2	="ľ����" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--���񷢷ŵ���Ʒ
--x207010_g_MissionItem = {{id=10400001,num=1}}

--������Ҫɱ���Ĺ�
x207010_g_DemandKill ={{id=3150,num=1},{id=3151,num=1}}	

--�����Ƕ�̬**************************************************************

--�����ı�����
x207010_g_MissionName="����ڷ��"
x207010_g_MissionInfo="���ǵĴ��һ��Ұ�������������Ӱ��ʿ����Ϊ�������ʿ�ǵ�ʿ�����������ǽ�͵Ϯ�ڷ�ڡ��ڷ���������ذ������վ���һ���������Ƿǳ��������ںڷ�ڸ����е�һ����կ������Ҫ����ҰѺڷ�ڸ����ľ�կ�ڱ�(150,130)������"  --��������
x207010_g_MissionTarget="����15����կ�ڱ�Ȼ�������׸���"		--����Ŀ��
x207010_g_ContinueInfo="��կ�ڱ�������������"		--δ��������npc�Ի�
x207010_g_MissionComplete="ս���úܶ��˳�Ϊ���꣬����Ϊ�������ܰ�Ϣ���Ҳ�ϧ�����κ�ս����лл��Ϊ��ɱ����Щ�ڱ���"					
--x207010_g_MissionAddItem="�õ������ܱ�"		
--x207010_g_szBackageFull = "����������"
--������
x207010_g_MoneyBonus=20000
x207010_g_ItemBonus={}
x207010_g_RadioItemBonus={}
x207010_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207010_g_MissionId) > 0 then
	     misIndex = GetMissionIndexByID(sceneId,selfId,x207010_g_MissionId)
	     if (GetMissionParam(sceneId,selfId,misIndex,0)<15) then
	             BeginEvent(sceneId)
		     AddText(sceneId, x207010_g_MissionName)
                     AddText(sceneId,x207010_g_ContinueInfo) 
		     EndEvent()
		     local bDone = x207010_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207010_g_ScriptId, x207010_g_MissionId, bDone)
	     end
	     if (GetMissionParam(sceneId,selfId,misIndex,0)==15) then
	             BeginEvent(sceneId)
	             AddText(sceneId, x207010_g_MissionName)
	             AddText(sceneId,x207010_g_MissionComplete)
	             AddMoneyBonus(sceneId, x207010_g_MoneyBonus)
	             EndEvent()
	             DispatchMissionContinueInfo(sceneId, selfId, targetId, x207010_g_ScriptId, x207010_g_MissionId)
	     end
		
        elseif x207010_CheckAccept(sceneId, selfId, targetId) > 0 then
                BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207010_g_MissionName, x207010_g_MissionInfo, x207010_g_MissionTarget, x207010_g_ItemBonus, x207010_g_MoneyBonus)

		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x207010_g_ScriptId, x207010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207010_g_ScriptId, x207010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207010_CheckAccept(sceneId, selfId, targetId)

	if IsHaveMission(sceneId,selfId, x207010_g_MissionId) <= 0 then
	    return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207010_CheckPushList(sceneId, selfId, targetId)
        if IsMissionHaveDone(sceneId, selfId, x207010_g_MissionIdPre) > 0 then
           if (GetName(sceneId,targetId)==x207010_g_Name) then
             if IsHaveMission(sceneId,selfId, x207010_g_MissionId) <= 0 then
             return 1
             end
           end
           if (GetName(sceneId,targetId)==x207010_g_Name2) then
             if IsHaveMission(sceneId,selfId, x207010_g_MissionId) > 0 then
             return 1
             end
           end
           
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207010_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207010_g_MissionId, x207010_g_ScriptId, 1, 0, 0)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207010_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--�������
end



--**********************************

--����

--**********************************

function x207010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207010_g_MissionId)

end



--**********************************

--����

--**********************************

function x207010_OnContinue(sceneId, selfId, targetId)

	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
	
	AddText(sceneId, x207010_g_MissionName)
        AddText(sceneId,x207010_g_MissionComplete)
        AddMoneyBonus(sceneId, x207010_g_MoneyBonus)
        EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207010_g_ScriptId, x207010_g_MissionId)

end


--**********************************

--����Ƿ�����ύ

--**********************************

function x207010_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207010_g_MissionId) >= 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207010_g_MissionId)
	     if (GetMissionParam(sceneId,selfId,misIndex,0)==15) then
		return 1
	     end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207010_OnSubmit(sceneId, selfId, targetId, selectRadioId)
 
        if x207010_CheckSubmit( sceneId, selfId, selectRadioId ) then            
    	                  MissionCom( sceneId,selfId, x207010_g_MissionId )
    	                  DelMission( sceneId, selfId, x207010_g_MissionId )
			  AddExp(sceneId, selfId, x207010_g_ExpBonus)   
	                  AddMoney(sceneId, selfId, x207010_g_MoneyBonus)
	end                                                                      
	    
	     
end


                                                                                                 
function x207010_OnKillObject(sceneId, selfId, objdataId)                                        
         if objdataId == x207010_g_DemandKill[1].id then 
         misIndex = GetMissionIndexByID(sceneId,selfId,x207010_g_MissionId)                                        
         num = GetMissionParam(sceneId,selfId,misIndex,0)                                        
             if num<=14  then                                                                     
             BeginEvent(sceneId)                                                                 
             SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)                                  
	     strText = format("��ɱ����կ�ڱ�%d/15", GetMissionParam(sceneId,selfId,misIndex,0) ) 
	     AddText(sceneId, strText) 
             EndEvent()
	   DispatchMissionTips(sceneId, selfId)
             end
         end
         if objdataId == x207010_g_DemandKill[2].id then 
         misIndex = GetMissionIndexByID(sceneId,selfId,x207010_g_MissionId)                                        
         num = GetMissionParam(sceneId,selfId,misIndex,0)                                        
             if num<=14  then                                                                     
             BeginEvent(sceneId)                                                                 
             SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)                                  
	     strText = format("��ɱ����կ�ڱ�%d/15", GetMissionParam(sceneId,selfId,misIndex,0) ) 
	     AddText(sceneId, strText) 
             EndEvent()
	   DispatchMissionTips(sceneId, selfId)
             end
         end
end                    




--**********************************

--���������¼�

--**********************************

function x207010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207010_OnItemChanged(sceneId, selfId, itemdataId)

end

