--�����ܾ�

--�ɼ�˼��

--�ű���
x207018_g_ScriptId = 207018

x207018_g_MissionIdPre =13

--�����
x207018_g_MissionId = 19

--����Ŀ��npc
x207018_g_Name	="ʯĨ��" 
x207018_g_Name2	="�ɼ�˼��" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207018_g_DemandItem = {{id=10400001,num=1}}

--������Ҫ�ύ����Ʒ
--x207018_g_DeleteItem = {{id=10400001,num=1}}

--���񷢷ŵ���Ʒ
x207018_g_MissionItem = {{id=12090009,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207018_g_MissionName="ս��"
x207018_g_MissionInfo="��������̫�أ�������Ҵ�λ����������ս����󺹣������󺹵��֣����ҳ�����Ҫ���Ǵ�Ӣ����ĩ��������ͷ��أ��󺹲���������֮���ӣ��ܸ���ЧȮ��֮�ͣ�������ʯĨ�������ң�����ߴ󺹣����õ����ҵģ������������ˮ��ˮ��ȥ��  "  --��������
x207018_g_MissionTarget="�ɼ�˼������������ʯĨ����"		--����Ŀ��
x207018_g_ContinueInfo="����ô�֪�����Ҿ����󺹵����Ǻʹ�ȣ�Ը��һ����Ч��������"		--δ��������npc�Ի�
x207018_g_ContinueInfo2="ʯ�����Ǹ���������ң�ֻ��ϧ�����Ұ��ӹ�����������ã�������Ҳ��Ұ�����ؽ������Ѿ�����������ϣ�������˱������Ǽ�װͬ�����������������������ǣ�Ȼ��һ�Ѷ˵���������������͵��Ž���ʯĨ����������ȥ��������"
x207018_g_MissionComplete="�������ô˵����Ʋ�̫���ˣ�ֻҪ��������ǧͷ��ţ��ϳ����ŵ�һ���ǣ��һ�û�����Щ������Ūɢ����ʱ�򣬴󺹵�����ͳû����ǣ��ԣ������ϰ����͹�ȥ��"					--�������npc˵���Ļ�
x207018_g_MissionAddItem="�󺹵������"		
x207018_g_szBackageFull = "����������"
--������
x207018_g_MoneyBonus=200
x207018_g_ItemBonus={}
x207018_g_RadioItemBonus={}
x207018_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207018_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207018_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207018_g_MissionId) > 0 then
		     if (GetName(sceneId,targetId)==x207018_g_Name) then
		        if x207018_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                           BeginEvent(sceneId)
		           AddText(sceneId,x207018_g_ContinueInfo)
		           AddText(sceneId,"��Ҫ��Ʒ")  
                           for i, item in x207018_g_MissionItem do  
		           AddItemBonus(sceneId, item.id, item.num)
		           EndEvent()
		           end
		           local bDone = x207018_CheckSubmit(sceneId, selfId, targetId)
		           DispatchMissionDemandInfo(sceneId, selfId, targetId, x207018_g_ScriptId, x207018_g_MissionId, bDone)
		        end
		        if x207018_CheckSubmit(sceneId, selfId, targetId) > 0 then
                           BeginEvent(sceneId)
                           AddText(sceneId, x207018_g_MissionName)
                           AddText(sceneId,x207018_g_MissionComplete)
                           AddMoneyBonus(sceneId, x207018_g_MoneyBonus)
                           EndEvent()
                           DispatchMissionContinueInfo(sceneId, selfId, targetId, x207018_g_ScriptId, x207018_g_MissionId)

		        end
		    end
                     if (GetName(sceneId,targetId)==x207018_g_Name2) then
                           BeginEvent(sceneId)
		           AddText(sceneId,x207018_g_ContinueInfo2)
		           EndEvent()
		           DispatchEventList(sceneId, selfId, targetId) 
                          x888888_DeleteAndAddItem(sceneId, selfId, nil, x207018_g_MissionItem, x207018_g_MissionAddItem, x207018_g_szBackageFull)  
		     end       
        elseif x207018_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207018_g_MissionName, x207018_g_MissionInfo, x207018_g_MissionTarget, x207018_g_ItemBonus, x207018_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207018_g_ScriptId, x207018_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207018_OnEnumerate(sceneId, selfId, targetId)



	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207018_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207018_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207018_g_ScriptId, x207018_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207018_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207018_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207018_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207018_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207018_g_MissionIdPre) > 0 then
                return 1
                end
        end
	if (GetName(sceneId,targetId)==x207018_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207018_g_MissionId) > 0 then
		         if x888888_CheckHaveItems(sceneId, selfId, x207018_g_MissionItem) <= 0 then
		         return 1
		         end
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207018_OnAccept(sceneId, selfId)

	        BeginAddItem(sceneId)                                                    
		AddMission( sceneId, selfId, x207018_g_MissionId, x207018_g_ScriptId, 1, 0, 0)
		EndEvent(sceneId)                                        
		
end



--**********************************

--����

--**********************************

function x207018_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207018_g_MissionId)

end



--**********************************

--����

--**********************************

function x207018_OnContinue(sceneId, selfId, targetId)

	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
	
	AddText(sceneId, x207018_g_MissionName)
        AddText(sceneId,x207018_g_MissionComplete)
        AddMoneyBonus(sceneId, x207018_g_MoneyBonus) 
	EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207018_g_ScriptId, x207018_g_MissionId)

end


--**********************************

--����Ƿ�����ύ

--**********************************

function x207018_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207018_g_MissionId) >= 0 then
	        if x888888_CheckHaveItems(sceneId, selfId, x207018_g_MissionItem) > 0 then
		return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207018_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207018_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207018_g_MissionId)
		AddExp(sceneId, selfId, x207018_g_ExpBonus)
		AddMoney(sceneId, selfId, x207018_g_MoneyBonus)
		for i, item in x207018_g_MissionItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207018_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207018_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207018_OnItemChanged(sceneId, selfId, itemdataId)

end

