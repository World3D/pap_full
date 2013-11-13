--��ɱ����

--MisDescBegin
x203011_g_ScriptId = 203011
--x203011_g_MissionIdPre =72
x203011_g_MissionId = 79
x203011_g_MissionKind = 13
x203011_g_MissionLevel = 50
--x203011_g_ScriptIdNext = {ScriptId = 208009 ,LV = 1 }
x203011_g_Name	="�ٲ�̨" 
x203011_g_DemandItem ={}
x203011_g_DemandKill ={{id=333,num=1}}

x203011_g_MissionName="��ɱ����"
x203011_g_MissionInfo="     ������ģһ����#R���#W�Ľ������뿪��ħڭħ��Ӫ�أ����������ڵ������洦���֡��������Ҳ�������ţ�����������ı����������֮�����ܵ�·�ߣ��ܳɹ��Ķ�����ǵ�׷��������������ϣ����Ƕ�ǵ����⡣\n \n    ����ħڭħ�������ұۣ�����һ��Ҫɱ����������ħڭħ�ı۰� "  --��������
x203011_g_MissionTarget="    #G�ٲ�̨#W������ɱ��ħڭħ�ĵ�������#R���#W��"		                                                                                               
x203011_g_MissionComplete="    ɱ�˶�Ǻ����ǵ�����ͼ򵥶��ˡ�"					--�������npc˵���Ļ�
x203011_g_ContinueInfo="    ��ǿ���ħڭħ�ĵ�����������ҪС�ġ�"
--������
x203011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203011_g_RadioItemBonus={}

--MisDescEnd
x203011_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x203011_g_MissionId)
		if x203011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x203011_g_MissionName)
			AddText(sceneId,x203011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x203011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x203011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203011_g_MissionName)
		     AddText(sceneId,x203011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x203011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203011_g_ScriptId, x203011_g_MissionId)
                end

        elseif x203011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203011_g_MissionName)
                AddText(sceneId,x203011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203011_g_ScriptId, x203011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203011_g_ScriptId, x203011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==3) then
		--if IsMissionHaveDone(sceneId, selfId, x203011_g_MissionIdPre) > 0 then
		    	return 1
		--end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x203011_g_MissionId, x203011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x203011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x203011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203011_g_MissionId)
	for i, item in pairs(x203011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x203011_g_DemandKill[1].num then
			return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203011_g_MissionId)
		AddExp(sceneId, selfId, x203011_g_ExpBonus)
		AddMoney(sceneId, selfId, x203011_g_MoneyBonus)
		for i, item in pairs(x203011_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x203011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x203011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x203011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x203011_g_DemandKill[1].id then 
       		    if num < x203011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
        
      end  

end



--**********************************

--���������¼�

--**********************************

function x203011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203011_OnItemChanged(sceneId, selfId, itemdataId)

end

