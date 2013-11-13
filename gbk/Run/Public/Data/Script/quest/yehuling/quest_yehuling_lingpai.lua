--�����ܾ�

--�ɼ�˼��

--�ű���
x207022_g_ScriptId = 207022

--��һ�������ID
x207022_g_MissionIdPre =10

--�����
x207022_g_MissionId = 23

--����Ŀ��npc
x207022_g_Name	="�ɼ�˼��" 
x207022_g_Name2	="����" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************


--���񷢷ŵ���Ʒ
x207022_g_MissionItem = {{id=12090011,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207022_g_MissionName="����"
x207022_g_MissionInfo="�����Ҽ����������¸ҵ��ˣ�һ���ǳ����찲���������ҵģ��ӽ�����������ҵ��ǿɶ����������ƣ��뽻���ҵ��Ķ������ס�"  --��������
x207022_g_MissionTarget="�����ƽ�������"		--����Ŀ��
x207022_g_ContinueInfo="ֻ���������Ʋ��ܵ����������������һ�а����ˣ��ҵ��ǿɶ���"		--δ��������npc�Ի�
x207022_g_MissionComplete="���������Ҿ�֪��������Ҹ������ǿɶ���ֻ�������ŵ��˲��������ƣ���ϲ�㡣"					--�������npc˵���Ļ�
--x207022_g_szBackageFull = "����������"
--������
x207022_g_MoneyBonus=200
x207022_g_ItemBonus={}
x207022_g_RadioItemBonus={}
x207022_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207022_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207022_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207022_g_MissionId) > 0 then
		if x207022_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                     BeginEvent(sceneId)
		     AddText(sceneId,x207022_g_ContinueInfo)
		     AddText(sceneId,"��Ҫ��Ʒ")
		     for i, item in pairs(x207022_g_MissionItem) do  
		     AddItemBonus(sceneId, item.id, item.num)
		     EndEvent()
		     end

		     local bDone = x207022_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207022_g_ScriptId, x207022_g_MissionId, bDone)
		
                end
                if x207022_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId, x207022_g_MissionName)
                     AddText(sceneId,x207022_g_MissionComplete)
                     AddMoneyBonus(sceneId, x207022_g_MoneyBonus)
                     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207022_g_ScriptId, x207022_g_MissionId)
                end

        elseif x207022_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207022_g_MissionName, x207022_g_MissionInfo, x207022_g_MissionTarget, x207022_g_ItemBonus, x207022_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207022_g_ScriptId, x207022_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207022_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207022_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207022_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207022_g_ScriptId, x207022_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207022_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207022_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207022_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207022_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207022_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x207022_g_MissionId)<= 0 then
                    return 1
                    end
                end
        end
	if (GetName(sceneId,targetId)==x207022_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207022_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207022_OnAccept(sceneId, selfId)

	        BeginAddItem(sceneId)                                                    
		for i, item in pairs(x207022_g_MissionItem) do                    
			AddItem( sceneId,item.id, item.num )             
		end                                                      
			                                             
		        ret = EndAddItem(sceneId,selfId)                                 
		        --���������                                                   
		        if ret > 0 then                                                  
		        AddMission( sceneId, selfId, x207022_g_MissionId, x207022_g_ScriptId, 1, 0, 0)
		        AddItemListToHuman(sceneId,selfId) 
		        else                                                             
		--������û�мӳɹ�                                             
			     BeginEvent(sceneId)                                      
			     	AddText(sceneId,"��Ʒ����������������������")                    
			     EndEvent(sceneId)                                        
			     DispatchMissionTips(sceneId,selfId)                      
		        end                                                              
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x207022_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207022_g_MissionId)

end



--**********************************

--����

--**********************************

function x207022_OnContinue(sceneId, selfId, targetId)

	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
	
	AddText(sceneId, x207022_g_MissionName)
        AddText(sceneId,x207022_g_MissionComplete)
        AddMoneyBonus(sceneId, x207022_g_MoneyBonus) 
	EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207022_g_ScriptId, x207022_g_MissionId)

end


--**********************************

--����Ƿ�����ύ

--**********************************

function x207022_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207022_g_MissionId) >= 0 then
	        if x888888_CheckHaveItems(sceneId, selfId, x207022_g_MissionItem) > 0 then
		return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207022_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207022_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207022_g_MissionId)
		AddExp(sceneId, selfId, x207022_g_ExpBonus)
		AddMoney(sceneId, selfId, x207022_g_MoneyBonus)
		for i, item in pairs(x207022_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207022_g_MissionItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207022_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207022_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207022_OnItemChanged(sceneId, selfId, itemdataId)

end

