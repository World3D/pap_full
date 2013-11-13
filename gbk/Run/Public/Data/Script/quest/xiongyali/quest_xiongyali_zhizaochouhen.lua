--������

--MisDescBegin
x213000_g_ScriptId = 213000
--x213000_g_MissionIdPre =41
x213000_g_MissionId = 145
x213000_g_MissionKind = 24
x213000_g_MissionLevel = 125
--x213000_g_ScriptIdNext = {ScriptId = 213001 ,LV = 1 }
x213000_g_Name	="�ٲ�̨" 
x213000_g_DemandItem ={}
x213000_g_DemandKill ={{id=398,num=1}}

x213000_g_MissionName="������"
x213000_g_MissionInfo="    ���ǵ����ղ챻�������ܵ��Ǹ������ⵤ�����ܵ�������Ѱ�����ıӻ��ˣ�������ȻҲ�����������������ǵĵ��˵��ˣ��������ǵĵ��ˡ�\n \n    �����ղ��˺���������������һ�𣬲�����������ϰ�����̫�࣬��Ȼ�ⵤ�ͱ����ǳ��ĵ����ϣ��������ǵ�������ô��Ϊ��ֻҪ��#R�ⵤ#W��ɱ�ˣ����ǵ����˾ͻ��߽⡣\n \n    ��ʿ�����벻��������õ���ѡ��ִ����������ˣ���Ը��ȥ��"  --��������
x213000_g_MissionTarget="    ִ��#G�ٲ�̨#W�ļƻ�����ɱ#R�ⵤ#W��"		                                                                                               
x213000_g_MissionComplete="    ���ñ��������е�ҪƯ�����޴����ղ�����Ϊ�Ǳ�����ɱ�˿ⵤ�����̷��ѡ������ղ�������ȥ�ˣ�һ·����ɱ���ӣ�������������Ԯ�������֡����������п�ͷ���ˡ�"					--�������npc˵���Ļ�
x213000_g_ContinueInfo="    ֻҪ�ⵤһ�����ղ��˾Ͳ��ᰲ�Ĵ�����������"
--������
x213000_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x213000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x213000_g_RadioItemBonus={}

--MisDescEnd
x213000_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x213000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x213000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x213000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x213000_g_MissionId)
		if x213000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x213000_g_MissionName)
			AddText(sceneId,x213000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x213000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���ⵤ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x213000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x213000_g_MissionName)
		     AddText(sceneId,x213000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x213000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x213000_g_ScriptId, x213000_g_MissionId)
                end

        elseif x213000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x213000_g_MissionName)
                AddText(sceneId,x213000_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x213000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x213000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x213000_g_ScriptId, x213000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x213000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x213000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x213000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x213000_g_ScriptId, x213000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x213000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x213000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x213000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==13) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x213000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x213000_g_MissionId, x213000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x213000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x213000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x213000_g_MissionId)
	for i, item in pairs(x213000_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x213000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x213000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x213000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x213000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x213000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x213000_g_MissionId)
		AddExp(sceneId, selfId, x213000_g_ExpBonus)
		AddMoney(sceneId, selfId, x213000_g_MoneyBonus)
		for i, item in pairs(x213000_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x213000_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x213000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x213000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x213000_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x213000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x213000_g_DemandKill[1].id then 
       		    if num < x213000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ⵤ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x213000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x213000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x213000_OnItemChanged(sceneId, selfId, itemdataId)

end

