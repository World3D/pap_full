--�����ܾ�

--�ɼ�˼��

--�ű���
x207009_g_ScriptId = 207009

--��һ�������ID
x207009_g_MissionIdPre =9

--�����
x207009_g_MissionId = 10

--����Ŀ��npc
x207009_g_Name	="������" 
x207009_g_Name2	="�ɼ�˼��" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************


--���񷢷ŵ���Ʒ
x207009_g_MissionItem = {{id=12090003,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207009_g_MissionName="��ҩ"
x207009_g_MissionInfo="��Ů���Ѿ���Ȼ�����ˣ����ǽ�ϲݣ��뽻���󺹣������ߴ󺹣������ڻ���ԶЧ������������һ����ֵ����飬������������������������Ӫ��ս�����飬���׵�δ����ˮ�µ��������Ρ���"  --��������
x207009_g_MissionTarget="�ѽ�ϲݽ����ɼ�˼��"		--����Ŀ��
x207009_g_ContinueInfo="�õ���ϲ��ˣ�"		--δ��������npc�Ի�
x207009_g_MissionComplete="��Щ��ҩ�������ѩ����̿������ĵ��������֣������ٲ�̨�����ķ緶���ٲ�̨������������֮һ�����͹��ˣ�����Ӫ���������µġ�����������Ӫ���������飬ǧ��Ҫ���ᣬ�����ҵİ����������ġ�"					--�������npc˵���Ļ�
x207009_g_MissionAddItem="�õ���ϲ�"		
--x207009_g_szBackageFull = "����������"
--������
x207009_g_MoneyBonus=200
x207009_g_ItemBonus={}
x207009_g_RadioItemBonus={}
x207009_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207009_g_MissionId) > 0 then
		if x207009_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                     BeginEvent(sceneId)
		     AddText(sceneId,x207009_g_ContinueInfo)
		     AddText(sceneId,"��Ҫ��Ʒ")
		     for i, item in pairs(x207009_g_MissionItem) do  
		     AddItemBonus(sceneId, item.id, item.num)
		     EndEvent()
		     end

		     local bDone = x207009_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207009_g_ScriptId, x207009_g_MissionId, bDone)
		
                end
                if x207009_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId, x207009_g_MissionName)
                     AddText(sceneId,x207009_g_MissionComplete)
                     AddMoneyBonus(sceneId, x207009_g_MoneyBonus)
                     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207009_g_ScriptId, x207009_g_MissionId)
                end

        elseif x207009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207009_g_MissionName, x207009_g_MissionInfo, x207009_g_MissionTarget, x207009_g_ItemBonus, x207009_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207009_g_ScriptId, x207009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207009_g_ScriptId, x207009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207009_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207009_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207009_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x207009_g_MissionId)<= 0 then
                    return 1
                    end
                end
        end
	if (GetName(sceneId,targetId)==x207009_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207009_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207009_OnAccept(sceneId, selfId)

	        BeginAddItem(sceneId)                                                    
		for i, item in pairs(x207009_g_MissionItem) do                    
			AddItem( sceneId,item.id, item.num )             
		end                                                      
			                                             
		        ret = EndAddItem(sceneId,selfId)                                 
		        --���������                                                   
		        if ret > 0 then                                                  
		        AddMission( sceneId, selfId, x207009_g_MissionId, x207009_g_ScriptId, 1, 0, 0)
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

function x207009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207009_g_MissionId)

end



--**********************************

--����

--**********************************

function x207009_OnContinue(sceneId, selfId, targetId)

	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
	
	AddText(sceneId, x207009_g_MissionName)
        AddText(sceneId,x207009_g_MissionComplete)
        AddMoneyBonus(sceneId, x207009_g_MoneyBonus) 
	EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207009_g_ScriptId, x207009_g_MissionId)

end


--**********************************

--����Ƿ�����ύ

--**********************************

function x207009_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207009_g_MissionId) >= 0 then
	        if x888888_CheckHaveItems(sceneId, selfId, x207009_g_MissionItem) > 0 then
		return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207009_g_MissionId)
		AddExp(sceneId, selfId, x207009_g_ExpBonus)
		AddMoney(sceneId, selfId, x207009_g_MoneyBonus)
		for i, item in pairs(x207009_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207009_g_MissionItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207009_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207009_OnItemChanged(sceneId, selfId, itemdataId)

end

