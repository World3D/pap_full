--�����ܾ�

--�ɼ�˼��

--�ű���
x207002_g_ScriptId = 207002
x207003_g_ScriptId = 207003

--��һ�������ID
x207002_g_MissionIdPre =2

--�����
x207002_g_MissionId = 3

--����Ŀ��npc
x207002_g_Name	="�����" 
x207002_g_Name3	="�����" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207002_g_DemandItem = {{id=13010002,num=10}}

--������Ҫ�ύ����Ʒ
--x207002_g_DeleteItem = {{id=13010002,num=10}}

--���񷢷ŵ���Ʒ
x207002_g_MissionItem = {{id=12090002,num=10}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207002_g_MissionName="�����"
x207003_g_MissionName="�ɼ���ҩ"
x207002_g_MissionInfo="������Ҫ�ܶ�����ݣ����߲�Զ�����������(200,150)����ȥ��ʮ�������ҡ�С�ĸ����ĵ���"  --��������
x207002_g_MissionTarget="������ɼ�10�������"		--����Ŀ��
x207002_g_ContinueInfo="�ҵ����������"		--δ��������npc�Ի�
x207002_g_MissionComplete="��ϵ�������л���������ǳ����������������ǵġ�"					--�������npc˵���Ļ�
--x207002_g_MissionAddItem="�õ������ܱ�"		
--x207002_g_szBackageFull = "����������"
--������
x207002_g_MoneyBonus=200
x207002_g_ItemBonus={}
x207002_g_RadioItemBonus={}
x207002_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
       misIndex = GetMissionIndexByID(sceneId,selfId,x207002_g_MissionId)
       
	--����г�����
	if x207002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207002_g_MissionId) > 0 then
	        if (GetName(sceneId,targetId)==x207002_g_Name) then
	            if  x207002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                     BeginEvent(sceneId)
		     AddText(sceneId,x207002_g_ContinueInfo)
		     AddText(sceneId,"��Ҫ��Ʒ") 
                     for i, item in x207002_g_MissionItem do
		     AddItemBonus(sceneId, item.id, item.num)
		     EndEvent()
		     end
		     local bDone = x207002_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207002_g_ScriptId, x207002_g_MissionId, bDone)
		    end
		    if  x207002_CheckSubmit(sceneId, selfId, targetId) > 0 then
		     BeginEvent(sceneId)
		     AddText(sceneId,x207002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207002_g_MoneyBonus) 
		     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207002_g_ScriptId, x207002_g_MissionId)
		    end
		end
        elseif x207002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207002_g_MissionName, x207002_g_MissionInfo, x207002_g_MissionTarget, x207002_g_ItemBonus, x207002_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207002_g_ScriptId, x207002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207002_g_MissionId) > 0 then
		return 
	end
	--�������鿴����
	if  x207002_CheckPushList(sceneId, selfId, targetId) > 0 then
	      if (GetName(sceneId,targetId)==x207002_g_Name) then
		AddNumText(sceneId, x207002_g_ScriptId, x207002_g_MissionName)
	      end
	      if (GetName(sceneId,targetId)==x207002_g_Name3) then
		AddNumText(sceneId, x207003_g_ScriptId, x207003_g_MissionName)
	      end
	end
	
end 



--**********************************

--����������

--**********************************

function x207002_CheckAccept(sceneId, selfId, targetId)

	    if (GetName(sceneId,targetId)==x207002_g_Name) then 
					return 1
	    end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207002_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207002_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207002_g_MissionIdPre) > 0 then
                    return 1
                end
        end
	if (GetName(sceneId,targetId)==x207002_g_Name3) then
	      if LuaFnGetItemCount(sceneId,selfId,12090002)<10 then
                 if IsHaveMission(sceneId,selfId, x207002_g_MissionId) > 0 then
                 return 1
		 end
	      end
        end
        return 0
	
end

--**********************************
                                    
--����                              
                                    
--**********************************

function x207002_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207002_g_MissionId, x207002_g_ScriptId, 1, 0, 0)
	
end



--**********************************

--����

--**********************************

function x207002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207002_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207002_CheckSubmit( sceneId, selfId, targetId)
       
	if LuaFnGetItemCount(sceneId,selfId,12090002)==10 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207002_g_MissionId)
		AddExp(sceneId, selfId, x207002_g_ExpBonus)
		AddMoney(sceneId, selfId, x207002_g_MoneyBonus)
		for i, item in x207002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207002_g_MissionItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207002_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207002_OnItemChanged(sceneId, selfId, itemdataId)

end

