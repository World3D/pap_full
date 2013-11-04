--ս����ԭ

--MisDescBegin
x214000_g_ScriptId = 214000
--x214000_g_MissionIdPre =41
x214000_g_MissionId = 107
x214000_g_MissionKind = 3
x214000_g_MissionLevel = 15
x214000_g_ScriptIdNext = {ScriptId = 214001 ,LV = 1 }
x214000_g_Name	="��ľ��" 
x214000_g_DemandItem ={}
x214000_g_DemandKill ={{id=357,num=20}}

x214000_g_MissionName="ս����ԭ"
x214000_g_MissionInfo="    ��ľ�ϵĵܵ�͵�������ǵ���Ⱥ���������������ǣ��ҵļҳ���׷����Ⱥ��ʱ��ɱ������ľ�ϵĵܵܡ�\n \n    ׾�ಢû�����������ľ�ϻ����Ű���֮�飬�����Ͳ���͵�ҵ���Ⱥ��Ҳ���ᰵ�о�������������ˣ����������ղ�����ս����\n \n    �ڲ�ԭ�ϣ��кܶ��Ӣ�ۣ�����ȴֻ����һ��������"  --��������
x214000_g_MissionInfo2="�����Ѿ���������ľ�Ͽ�ս�ˡ���B���ǹ�˳����ľ�ϵ��������ˣ�ɱ���������ˣ��������Ҹ�����"
x214000_g_MissionTarget="    #G��ľ��#W����ɱ����B����20��#R������ʿ��#W��"		                                                                                               
x214000_g_MissionComplete="    ��ι������úܴ�"					--�������npc˵���Ļ�
x214000_g_ContinueInfo="    ��ɱ����Щ������ʿ������"
--������
x214000_g_MoneyBonus = 600
--�̶���Ʒ���������8��
x214000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214000_g_RadioItemBonus={}

--MisDescEnd
x214000_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x214000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x214000_g_MissionId)
		if x214000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x214000_g_MissionName)
			AddText(sceneId,x214000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x214000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214000_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x214000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x214000_g_MissionName)
		     AddText(sceneId,x214000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x214000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214000_g_ScriptId, x214000_g_MissionId)
                end

        elseif x214000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214000_g_MissionName)
                AddText(sceneId,x214000_g_MissionInfo..GetName(sceneId, selfId)..x214000_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214000_g_ScriptId, x214000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214000_g_ScriptId, x214000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==14) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x214000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x214000_g_MissionId, x214000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x214000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x214000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214000_g_MissionId)
	for i, item in x214000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x214000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x214000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x214000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x214000_g_MissionId)
		AddExp(sceneId, selfId, x214000_g_ExpBonus)
		AddMoney(sceneId, selfId, x214000_g_MoneyBonus)
		for i, item in x214000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x214000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x214000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x214000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x214000_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x214000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x214000_g_DemandKill[1].id then 
       		    if num < x214000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x214000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x214000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214000_OnItemChanged(sceneId, selfId, itemdataId)

end

