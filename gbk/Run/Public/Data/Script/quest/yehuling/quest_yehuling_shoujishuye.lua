--�����ܾ�

--�ɼ�˼��

--�ű���
x207014_g_ScriptId = 207014
x207015_g_ScriptId = 207015

--��һ�������ID
x207014_g_MissionIdPre =24

--�����
x207014_g_MissionId = 15

--����Ŀ��npc
x207014_g_Name	="�����" 
x207014_g_Name3	="��̴Ҷ" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
x207014_g_DemandItem = {{id=12090006,num=15}}

--������Ҫ�ύ����Ʒ
x207014_g_DeleteItem = {{id=12090006,num=15}}

--���񷢷ŵ���Ʒ
--x207014_g_MissionItem = {{id=10400001,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207014_g_MissionName="�ռ���Ҷ"
x207015_g_MissionName="�ɼ���̴Ҷ"
x207014_g_MissionInfo="�ܿ��ҾͿ��������������ʮ��������Ů�������ţ����ǳɼ�˼���ƺ�֮ǰ���ҵĳ�ŵ����Ұ�����(65,40)��һ�����л�̴����������Ҷ�ӽ���֮��������Һ�����ɫ�ܽӽ���ľ���轫���Ѿ�������˹��Ƿ���������ЩҺ�嶼Ϳ�����Ϻͻ����ϣ���������ȫ�����ǡ�"  --��������
x207014_g_MissionTarget="����������15Ƭ��̴Ҷ"		--����Ŀ��
x207014_g_ContinueInfo="�뵽��ʮ�����ţ����������˷ܰ�����Ͻ�ȥ�һ�̴Ҷ�����Ǻù��ǡ�"		--δ��������npc�Ի�
x207014_g_MissionComplete="���Ǹм����������Ժ���������ʮ�����ţ��һ������һ�������������ܡ����Ǽ�������Ұ���룬���Ǵ󺹵��ǿɶ���Ҫ�������ߡ�"					--�������npc˵���Ļ�
--x207014_g_MissionAddItem="�õ������ܱ�"		
--x207014_g_szBackageFull = "����������"
--������
x207014_g_MoneyBonus=200
x207014_g_ItemBonus={}
x207014_g_RadioItemBonus={}
x207014_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207014_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
       misIndex = GetMissionIndexByID(sceneId,selfId,x207014_g_MissionId)
       
	--����г�����
	if x207014_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207014_g_MissionId) > 0 then
	        if (GetName(sceneId,targetId)==x207014_g_Name) then
	           if x207014_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                     BeginEvent(sceneId)
		     AddText(sceneId,x207014_g_ContinueInfo) 
                     AddText(sceneId,"��Ҫ��Ʒ")  
                     for i, item in pairs(x207014_g_DeleteItem) do
		     AddItemBonus(sceneId, item.id, item.num)
		     EndEvent()
		     end
		     local bDone = x207014_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207014_g_ScriptId, x207014_g_MissionId, bDone)
		   end
		   if x207014_CheckSubmit(sceneId, selfId, targetId) > 0 then
		      BeginEvent(sceneId)
		      AddText(sceneId,x207014_g_MissionComplete) 
		      AddMoneyBonus(sceneId, x207014_g_MoneyBonus)
		      EndEvent()
		      DispatchMissionContinueInfo(sceneId, selfId, targetId, x207014_g_ScriptId, x207014_g_MissionId)
		   end
		end
                if (GetName(sceneId,targetId)==x207014_g_Name3) then
                     BeginEvent(sceneId)
                     AddNumText(sceneId, x207015_g_ScriptId, x207015_g_MissionName)
                     EndEvent()
		     DispatchEventList(sceneId, selfId, targetId)
		end
        elseif x207014_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207014_g_MissionName, x207014_g_MissionInfo, x207014_g_MissionTarget, x207014_g_ItemBonus, x207014_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207014_g_ScriptId, x207014_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207014_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207014_g_MissionId) > 0 then
		return 
	end
	--�������鿴����
	if  x207014_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207014_g_ScriptId, x207014_g_MissionName)
	end
	
end 



--**********************************

--����������

--**********************************

function x207014_CheckAccept(sceneId, selfId, targetId)

	    if (GetName(sceneId,targetId)==x207014_g_Name) then 
					return 1
	    end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207014_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207014_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207014_g_MissionIdPre) > 0 then
                    return 1
                end
        end
	if (GetName(sceneId,targetId)==x207014_g_Name3) then
	      if LuaFnGetItemCount(sceneId,selfId,12090006)<15 then
                 if IsHaveMission(sceneId,selfId, x207014_g_MissionId) > 0 then
                 return 1
		 end
	      end
        end
        return 0
	
end

--**********************************
                                    
--����                              
                                    
--**********************************

function x207014_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207014_g_MissionId, x207014_g_ScriptId, 1, 0, 0)
	
end



--**********************************

--����

--**********************************

function x207014_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207014_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207014_CheckSubmit( sceneId, selfId, targetId)
	if LuaFnGetItemCount(sceneId,selfId,12090006)==15 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207014_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207014_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207014_g_MissionId)
		AddExp(sceneId, selfId, x207014_g_ExpBonus)
		AddMoney(sceneId, selfId, x207014_g_MoneyBonus)
		for i, item in pairs(x207014_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207014_g_DeleteItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207014_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207014_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207014_OnItemChanged(sceneId, selfId, itemdataId)

end

