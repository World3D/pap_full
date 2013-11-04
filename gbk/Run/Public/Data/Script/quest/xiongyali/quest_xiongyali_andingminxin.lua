--��������

--MisDescBegin
x213001_g_ScriptId = 213001
--x213001_g_MissionIdPre =40
x213001_g_MissionId = 146
x213001_g_MissionKind = 24
x213001_g_MissionLevel = 125
x213001_g_ScriptIdNext = {ScriptId = 213002,LV = 1 }
x213001_g_Name	="����" 
x213001_g_DemandItem ={}
x213001_g_noDemandKill ={}	

x213001_g_MissionName="��������"
x213001_g_MissionInfo="    ������Щ�޴��Ͷʯ������������ÿ����һ��ʯͷ��������ĳЩ�������ϵ�ĩ�ա������Ѿ�����ס�ˣ�����Ѿ���ʼ��ƽ���ӳ��ǡ�\n \n    ������һ���ʾ�������ǣ�ֻҪ�������������Ҵ��ɹŵ�Ӫ��Ͷ�������Ǿͻ��������ǡ�\n \n    ��ȥ�����ʾ����������ͷ�ϰɡ�����Щ�������������˰��ģ�ֹͣû������������ɡ�"  --��������
x213001_g_MissionTarget="    ��#G����#W�ĸ�ʾ����������ͷȥ��"		
x213001_g_MissionComplete="    �⼸����ʾ����Ч����������̾ͼ�������������ƽ�����ʡ�����ǲ����鷳��"					--�������npc˵���Ļ�
x213001_g_ContinueInfo="    �����Щƽ�������ˣ������Ժ���ô�ҵ������أ�"
--������
x213001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x213001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x213001_g_RadioItemBonus={}

--MisDescEnd
x213001_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x213001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x213001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x213001_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x213001_g_MissionId)
			if x213001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x213001_g_MissionName)
				AddText(sceneId,x213001_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x213001_g_MissionTarget) 
				AddText(sceneId,format("\n    �����������������ʾ   %d/1\n    ������ɯ����������ʾ   %d/1\n    ��������������ʾ   %d/1", GetMissionParam(sceneId,selfId,misIndex,0), GetMissionParam(sceneId,selfId,misIndex,1), GetMissionParam(sceneId,selfId,misIndex,2) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
	
			     
	                if x213001_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x213001_g_MissionName)
			     AddText(sceneId,x213001_g_MissionComplete)
			     AddMoneyBonus(sceneId, x213001_g_MoneyBonus)
			     EndEvent()
	                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x213001_g_ScriptId, x213001_g_MissionId)
	                end
	     

        elseif x213001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x213001_g_MissionName)
                AddText(sceneId,x213001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x213001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x213001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x213001_g_ScriptId, x213001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x213001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x213001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x213001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x213001_g_ScriptId, x213001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x213001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x213001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x213001_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==13) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x213001_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x213001_g_MissionId, x213001_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x213001_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x213001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x213001_g_MissionId)
	for i, item in x213001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x213001_CheckSubmit( sceneId, selfId, targetId)

	misIndex = GetMissionIndexByID(sceneId,selfId,x213001_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
		if GetMissionParam(sceneId,selfId,misIndex,1) == 1 then
			if GetMissionParam(sceneId,selfId,misIndex,2) == 1 then
	        		return 1
	        	end
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x213001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x213001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x213001_g_MissionId)
		AddExp(sceneId, selfId, x213001_g_ExpBonus)
		AddMoney(sceneId, selfId, x213001_g_MoneyBonus)
		for i, item in x213001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x213001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x213001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x213001_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x213001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x213001_OnItemChanged(sceneId, selfId, itemdataId)

end

