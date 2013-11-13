--�����ܾ�

--�ɼ�˼��

--�ű���
x207016_g_ScriptId = 207016

--��һ�������ID
x207016_g_MissionIdPre =15

--�����
x207016_g_MissionId = 17

--����Ŀ��npc
x207016_g_Name	="�ɼ�˼��" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207016_g_DemandItem = {{id=10400001,num=1}}

--������Ҫ�ύ����Ʒ
--x207016_g_DeleteItem = {{id=10400001,num=1}}

--���񷢷ŵ���Ʒ
x207016_g_MissionItem = {{id=12090007,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207016_g_MissionName="��ȼ����"
x207016_g_MissionInfo="���������һ�ף���Һ��Ϳ��ʿ���ͻ��ڵ��·��ϣ��ڴ����к��ѷ��֣����ǵ�����򵽳��ŵ��µ�ʱ�����ŷ��֡�����Ϊ����ͣ��������Ÿ��ң����ò�������ȡ���˱�����ѷ����õ���100,50����ȼ�����ܱ�Ӳ��湥�ǡ����ſ����ڸߴ������ȼʹ�á�"  --��������
x207016_g_MissionTarget="�ڸߵص�ȼ���ź���ɼ�˼������"		--����Ŀ��
x207016_g_ContinueInfo="���ź���Ҫ�����ȼ����"		--δ��������npc�Ի�
x207016_g_MissionComplete="�ܱ��ľ���裬���ҵ����ұ۰�һ�������������һ���Ӳ��������Ұ�����Ʊ�һ�����¡������������˱������ǳ������롣����Ƣ��̫���꣬��ȥ��������ô���ˡ�"					--�������npc˵���Ļ�
x207016_g_MissionAddItem="�õ�����"
x207016_g_ShowMissionTarget="��ȼ����   1/1"	
x207016_g_szBackageFull = "����������"
--������
x207016_g_MoneyBonus=200
x207016_g_ItemBonus={}
x207016_g_RadioItemBonus={}
x207016_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207016_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207016_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207016_g_MissionId) > 0 then
	     misIndex = GetMissionIndexByID(sceneId,selfId,x207016_g_MissionId)
		if (GetName(sceneId,targetId)==x207016_g_Name) then
		   if x207016_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                     BeginEvent(sceneId)
		     AddText(sceneId,x207016_g_ContinueInfo)
		     EndEvent()
		     local bDone = x207016_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207016_g_ScriptId, x207016_g_MissionId, bDone)
		   end
		    if x207016_CheckSubmit(sceneId, selfId, targetId) > 0 then
                      BeginEvent(sceneId)
                      AddText(sceneId, x207016_g_MissionName)
                      AddText(sceneId,x207016_g_MissionComplete)
                      AddMoneyBonus(sceneId, x207016_g_MoneyBonus)
                      EndEvent()
                      DispatchMissionContinueInfo(sceneId, selfId, targetId, x207016_g_ScriptId, x207016_g_MissionId)
                    end
                 end
        elseif x207016_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207016_g_MissionName, x207016_g_MissionInfo, x207016_g_MissionTarget, x207016_g_ItemBonus, x207016_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207016_g_ScriptId, x207016_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207016_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207016_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207016_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207016_g_ScriptId, x207016_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207016_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207016_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207016_CheckPushList(sceneId, selfId, targetId)
        if IsMissionHaveDone(sceneId, selfId, x207016_g_MissionIdPre) > 0 then
                    return 1
        end
	
        return 0
	
end

--**********************************

--����

--**********************************

function x207016_OnAccept(sceneId, selfId)

	BeginAddItem(sceneId)                                                    
	for i, item in pairs(x207016_g_MissionItem) do                    
	AddItem( sceneId,item.id, item.num )             
	end                                                      
	ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		AddMission( sceneId, selfId, x207016_g_MissionId, x207016_g_ScriptId, 1, 0, 0)
		AddItemListToHuman(sceneId,selfId) 
		BeginEvent(sceneId)
		AddText(sceneId,x207016_g_MissionAddItem)
		DispatchMissionTips(sceneId,selfId) 
		EndEvent(sceneId)
		else                                                             
		BeginEvent(sceneId)                                      
		AddText(sceneId,"��Ʒ����������������������")                    
		EndEvent(sceneId)                                        
		DispatchMissionTips(sceneId,selfId)                      
		end    
        	misIndex = GetMissionIndexByID(sceneId,selfId,x207016_g_MissionId)		--�������                                           
	        SetMissionByIndex(sceneId,selfId,misIndex,0,0)
	        SetMissionByIndex(sceneId,selfId,misIndex,1,0)                                                      
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x207016_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207016_g_MissionId)

end



--**********************************

--����

--**********************************

function x207016_OnContinue(sceneId, selfId, targetId)

	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
	
	AddText(sceneId, x207016_g_MissionName)
        AddText(sceneId,x207016_g_MissionComplete)
        AddMoneyBonus(sceneId, x207016_g_MoneyBonus) 
	EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207016_g_ScriptId, x207016_g_MissionId)

end


--**********************************

--����Ƿ�����ύ

--**********************************

function x207016_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207016_g_MissionId) >= 0 then
	        misIndex = GetMissionIndexByID(sceneId,selfId,x207016_g_MissionId) 
	        if (GetMissionParam(sceneId,selfId,misIndex,0)==1) then
	        return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207016_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207016_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207016_g_MissionId)
		AddExp(sceneId, selfId, x207016_g_ExpBonus)
		AddMoney(sceneId, selfId, x207016_g_MoneyBonus)
		for i, item in pairs(x207016_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207016_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207016_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207016_OnItemChanged(sceneId, selfId, itemdataId)

end

