--�����ܾ�

--�ɼ�˼��
x207000_g_MissionKind = 1

--����ȼ�
x207000_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x207000_g_IfMissionElite = 0


x207000_g_IsMissionOkFail = 0		


x207000_g_ScriptId = 207000

--��һ�������ID
--x207000_g_MissionIdPre =

--�����
x207000_g_MissionId = 1
x207000_g_MissionKind = 1

--����Ŀ��npc
x207000_g_Name	="�ɼ�˼��" 
x207000_g_Name1	="ľ����" 
x207000_g_Name2	="����" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

x207000_g_MissionItem = {{id=12090001,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207000_g_MissionName="�����ܾ�"
x207000_g_MissionInfo="Ұ�����Ǵ�Į����ԭ����Ȼ���ǣ�����Ҫ���Ŵ���ɳ����ʿ����̤ƽҰ���롣���Ů���˵Ĺ��������޳ܣ�̰�����ᣬ�������ܣ����°��մ���ˮ�����֮�С�����Ҫ���������������Ҫ�������������ľ¿�ϵİ��ͺ�������ľ����ȥ̽�Ӿ���ջ�������ȥ����ľ�������Ұ����ľ��顣  "  --��������
x207000_g_MissionTarget="����ľ�������Ұ��������飬�Ѿ����ܾ����������"		--����Ŀ��
x207000_g_ContinueInfo="�����ܾ���������"		--δ��������npc�Ի�
x207000_g_ContinueInfo2="Ұ��������վ���Ҫ����Ұ����ǳأ���Ҫ�������ذ����ⶼ��һ�򵱹أ����Ī�����յء����ֻ�����һ���ذ����ڷ�ڡ����˷��أ���ֵĺܣ����Ѿ������ܾ���ȥ�������þ����ܾ��ȥ���󺹣���ס����Ҫ��������������Ӫ�������¡�"
x207000_g_ContinueInfo3="�����������Ұ���룬�����ذ������ر����أ����ǽ��ȴ������ľ�����������Լ������ף���˵�ǹ��������ˣ�����ʼ���벻ͨ���������ܷ�õľ����ܾ�����ȥ�ɣ��������룬�������ˮ��������߾ͺ��ˡ�����ˮ�¡���"
x207000_g_MissionComplete="�������׸�����ܾ���̫���ˣ��������ҳɼ�˼���Ķ��ӣ�����Ӫ�������Ǵ�ܲ���־���ˮ�����ף���������Ϊһ��Ů�˶����Լ��Ƿϣ�Ӧ���������������������е��������½�����Դ�������Ů�˱������������֮�١���л����������׵ľ�ˡ�"					--�������npc˵���Ļ�
x207000_g_szBackageFull = "����������"
x207000_g_ShowMissionTarget="ѯ��ľ�������   1/1"
x207000_g_ShowMissionTarget2="�����ܾ�   1/1"	
--������
x207000_g_MoneyBonus=200
x207000_g_ItemBonus={}
x207000_g_RadioItemBonus={}
x207000_g_ExpBonus = 1000



--**********************************

--������ں���

--**********************************

function x207000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����

	--����ѽӴ�����
	
	if IsHaveMission(sceneId,selfId, x207000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207000_g_MissionId)
		if (GetName(sceneId,targetId)==x207000_g_Name) then
		     if  x888888_CheckHaveItems(sceneId, selfId, x207000_g_MissionItem)<=0 then
                     BeginEvent(sceneId)
		     AddText(sceneId,x207000_g_ContinueInfo)
                     AddText(sceneId,"��Ҫ��Ʒ") 
                     for i, item in x207000_g_MissionItem do
		     AddItemBonus(sceneId, item.id, item.num)
		     EndEvent()
		     end
		     local bDone = x207000_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId,targetId,x207000_g_ScriptId, x207000_g_MissionId, bDone)
		     end
		     if  x888888_CheckHaveItems(sceneId, selfId, x207000_g_MissionItem)>0 then
		     BeginEvent(sceneId)
	             AddText(sceneId,x207000_g_MissionComplete)
                     AddMoneyBonus(sceneId, x207000_g_MoneyBonus) 
	             EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207000_g_ScriptId, x207000_g_MissionId)
                     end
                end
               	if (GetName(sceneId,targetId)==x207000_g_Name1) then
		   BeginEvent(sceneId)
                   AddText(sceneId,x207000_g_ContinueInfo2)
                   
		   EndEvent()
		   DispatchEventList(sceneId, selfId, targetId) 
		   SetMissionByIndex(sceneId,selfId,misIndex,0,2)
		   BeginEvent(sceneId)
		   AddText(sceneId, x207000_g_ShowMissionTarget)
		   EndEvent()
		   DispatchMissionTips(sceneId, selfId)
                end
		if (GetName(sceneId,targetId)==x207000_g_Name2) then
		   BeginEvent(sceneId)
		   x888888_DeleteAndAddItem(sceneId, selfId, nil, x207000_g_MissionItem, x207000_g_ShowMissionTarget2, x207000_g_szBackageFull)   
		   EndEvent()
		   BeginEvent(sceneId)
                   AddText(sceneId, x207000_g_ContinueInfo3)       
		   EndEvent()
		   DispatchEventList(sceneId, selfId, targetId)
		
		end
	elseif x207000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207000_g_MissionName, x207000_g_MissionInfo, x207000_g_MissionTarget, x207000_g_ItemBonus, x207000_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207000_g_ScriptId, x207000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207000_CheckPushList(sceneId, selfId, targetId) > 0 then
              if GetLevel( sceneId, selfId ) >= 1 then
		AddNumText(sceneId, x207000_g_ScriptId, x207000_g_MissionName)
              end
	end
	
end



--**********************************

--����������

--**********************************

function x207000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207000_g_Name) then
					return 1
		
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207000_CheckPushList(sceneId, selfId, targetId)
        misIndex = GetMissionIndexByID(sceneId,selfId,x207000_g_MissionId)
        if (GetName(sceneId,targetId)==x207000_g_Name) then
             return 1
        end
	if (GetName(sceneId,targetId)==x207000_g_Name1) then
		    if (GetMissionParam(sceneId,selfId,misIndex,0)==1) then
		    return 1
                    end
        end
        if (GetName(sceneId,targetId)==x207000_g_Name2) then
		    if (GetMissionParam(sceneId,selfId,misIndex,0)==2) then
		        if x888888_CheckHaveItems(sceneId, selfId, x207000_g_MissionItem) <= 0 then
		        return 1
		        end
	            end
	end
	return 0
	
end

--**********************************

--����

--**********************************

function x207000_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207000_g_MissionId, x207000_g_ScriptId, 1, 0, 0)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207000_g_MissionId)		--�������                                           
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)
end



--**********************************

--����

--**********************************

function x207000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207000_g_MissionId)

end





--**********************************

--����Ƿ�����ύ

--**********************************

function x207000_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207000_g_MissionId) >= 0 then
		if x888888_CheckHaveItems(sceneId, selfId, x207000_g_MissionItem) > 0 then
			return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207000_g_MissionId)
		AddExp(sceneId, selfId, x207000_g_ExpBonus)
		AddMoney(sceneId, selfId, x207000_g_MoneyBonus)
		for i, item in x207000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        for i, item in x207000_g_MissionItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207000_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207000_OnItemChanged(sceneId, selfId, itemdataId)

end

