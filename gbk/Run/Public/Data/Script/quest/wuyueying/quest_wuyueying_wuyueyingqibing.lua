--����Ӫ���

--MisDescBegin
x217013_g_ScriptId = 217013
--x217013_g_MissionIdPre =41
x217013_g_MissionId = 185
x217013_g_MissionKind = 6
x217013_g_MissionLevel = 30
--x217013_g_ScriptIdNext = {ScriptId = 217001 ,LV = 1 }
x217013_g_Name	="������" 
x217013_g_DemandItem ={}
x217013_g_DemandKill ={{id=459,num=15}}

x217013_g_MissionName="����Ӫ���"
x217013_g_MissionInfo="    ǧ��ū�ǽ�������Ľ�����������������ָ�ӣ�û���˼����������࣬������������Ĵ󽫾���ɳ�������������֣�����������һ���ˣ���Ȼ��Ը��һ�������\n \n    �Ҷ�����˷ǳ�����Ȥ�����������л���������֡�\n \n    �㿴��#G������#W�������Щ������������ϵĹ�����Щ���������ȵĽ�����޷������Ǳȣ����ǣ�ǧ��ū����ѵ���ı�ȴ����֮����\n \n    ȥ�����Щ�������Ҫ�������ǵ�ʵ����"  --��������
x217013_g_MissionTarget="    ����#G������#W�����15��#R����Ӫ���#W��#G������#WҪ����ǧ��ū��ʵ����"		                                                                                               
x217013_g_MissionComplete="    �����������������ǵ���ɫ�������ˡ�"					--�������npc˵���Ļ�
x217013_g_ContinueInfo="    ��Щ����ǳ���������ҪС�ġ�"
--������
x217013_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x217013_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217013_g_RadioItemBonus={}

--MisDescEnd
x217013_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x217013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217013_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217013_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x217013_g_MissionId)
		if x217013_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x217013_g_MissionName)
			AddText(sceneId,x217013_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x217013_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������Ӫ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217013_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x217013_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217013_g_MissionName)
		     AddText(sceneId,x217013_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217013_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217013_g_ScriptId, x217013_g_MissionId)
                end

        elseif x217013_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217013_g_MissionName)
                AddText(sceneId,x217013_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217013_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217013_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217013_g_ScriptId, x217013_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217013_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217013_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217013_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217013_g_ScriptId, x217013_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217013_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217013_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217013_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==20) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217013_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x217013_g_MissionId, x217013_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x217013_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x217013_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217013_g_MissionId)
	for i, item in pairs(x217013_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217013_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217013_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x217013_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217013_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x217013_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217013_g_MissionId)
		AddExp(sceneId, selfId, x217013_g_ExpBonus)
		AddMoney(sceneId, selfId, x217013_g_MoneyBonus)
		for i, item in pairs(x217013_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x217013_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x217013_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217013_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217013_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x217013_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x217013_g_DemandKill[1].id then 
       		    if num < x217013_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������Ӫ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217013_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x217013_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217013_OnItemChanged(sceneId, selfId, itemdataId)

end

