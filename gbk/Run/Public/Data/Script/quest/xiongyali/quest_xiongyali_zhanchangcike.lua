--ս���̿�

--MisDescBegin
x213011_g_ScriptId = 213011
--x213011_g_MissionIdPre =41
x213011_g_MissionId = 156
x213011_g_MissionKind = 24
x213011_g_MissionLevel = 125
--x213011_g_ScriptIdNext = {ScriptId = 213001 ,LV = 1 }
x213011_g_Name	="�ٲ�̨" 
x213011_g_DemandItem ={}
x213011_g_DemandKill ={{id=397,num=10}}

x213011_g_MissionName="ս���̿�"
x213011_g_MissionInfo="    ��˵����������һ֧���ӣ�ר��������ɱ���˹�Ա�ġ��Ҳ������Ҵ��ɹţ���Ӧ�û����֧�����ɳ�����ɱ���ǵĹ�Ա��\n \n    ��ҪС���ˡ���ʿ����ȥ���Ÿ������������������Щ�̿;�ɱ�����ǣ����������Ǵ�ɱ���ǵĹ�Ա��"  --��������
x213011_g_MissionTarget="    ɱ��10��#Rս���̿�#W����#G�ٲ�̨#W������"		                                                                                               
x213011_g_MissionComplete="    ��Ȼ�����ɳ�����Щ�̿ͣ�������㣬�������ǻ����ܴܺ���ʧ�ģ�лл����ʿ��"					--�������npc˵���Ļ�
x213011_g_ContinueInfo="    ������Щ�̿͵��ټ��������Ǻܻ�αװ�ġ�"
--������
x213011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x213011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x213011_g_RadioItemBonus={}

--MisDescEnd
x213011_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x213011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x213011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x213011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x213011_g_MissionId)
		if x213011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x213011_g_MissionName)
			AddText(sceneId,x213011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x213011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��ս���̿�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x213011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x213011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x213011_g_MissionName)
		     AddText(sceneId,x213011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x213011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x213011_g_ScriptId, x213011_g_MissionId)
                end

        elseif x213011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x213011_g_MissionName)
                AddText(sceneId,x213011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x213011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x213011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x213011_g_ScriptId, x213011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x213011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x213011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x213011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x213011_g_ScriptId, x213011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x213011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x213011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x213011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==13) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x213011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x213011_g_MissionId, x213011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x213011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x213011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x213011_g_MissionId)
	for i, item in pairs(x213011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x213011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x213011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x213011_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x213011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x213011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x213011_g_MissionId)
		AddExp(sceneId, selfId, x213011_g_ExpBonus)
		AddMoney(sceneId, selfId, x213011_g_MoneyBonus)
		for i, item in pairs(x213011_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x213011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x213011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x213011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x213011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x213011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x213011_g_DemandKill[1].id then 
       		    if num < x213011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��ս���̿�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x213011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x213011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x213011_OnItemChanged(sceneId, selfId, itemdataId)

end

