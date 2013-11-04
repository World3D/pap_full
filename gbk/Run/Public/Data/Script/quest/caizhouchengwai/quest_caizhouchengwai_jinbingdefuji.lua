--����ķ���

--MisDescBegin
x207003_g_ScriptId = 207003
x207003_g_MissionIdPre =264
x207003_g_MissionId = 265
x207003_g_MissionKind = 18
x207003_g_MissionLevel = 75
x207003_g_ScriptIdNext = {ScriptId = 207003 ,LV = 1 }
x207003_g_Name	="���"
x207003_g_Name2	="�����"
x207003_g_DemandItem ={}
x207003_g_DemandKill ={{id=409,num=15}}

x207003_g_MissionName="����ķ���"
x207003_g_MissionInfo="    ��վ��ͨ���Ѿ���ͨ�����ˣ��Ҽ������̣�������һ�����ұ�������㡣\n \n    ��һ��#R��������#W����ҹͨ���ܵ����˲��ݳǣ����ǲؼ���Ǳ�������ߣ�����������ǵĻ��ڶӣ���Ҫ������ֹ���ǡ�"  --��������
x207003_g_MissionTarget="    ����ṩ��Ϣ˵Ǳ����������һ��#R��������#W,��Ҫ���������֮�����#G�����#W�����Ϣ��"		                                                                                               
x207003_g_MissionComplete="    ����������ĺܺã����ǵ��ڱ���һ�����ܳ��£����Ƕ�Ҫ�����ǡ�"					--�������npc˵���Ļ�
x207003_g_ContinueInfo="    ����������������"
--������
x207003_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207003_g_RadioItemBonus={}

--MisDescEnd
x207003_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207003_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207003_g_MissionId)
		if x207003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207003_g_MissionName)
			AddText(sceneId,x207003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207003_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207003_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207003_g_MissionName)
		     AddText(sceneId,x207003_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207003_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207003_g_ScriptId, x207003_g_MissionId)
                end

        elseif x207003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207003_g_MissionName)
                AddText(sceneId,x207003_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207003_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207003_g_ScriptId, x207003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207003_g_ScriptId, x207003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207003_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==7) then
		if IsMissionHaveDone(sceneId, selfId, x207003_g_MissionIdPre) > 0 then
			if (GetName(sceneId,targetId)==x207003_g_Name) then
				 if IsHaveMission(sceneId,selfId, x207003_g_MissionId) <= 0 then
					return 1
				 end
			end
			if (GetName(sceneId,targetId)==x207003_g_Name2) then
				 if IsHaveMission(sceneId,selfId, x207003_g_MissionId) > 0 then
					return 1
				 end
			end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207003_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207003_g_MissionId, x207003_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207003_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x207003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207003_g_MissionId)
	for i, item in x207003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207003_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207003_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x207003_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207003_g_MissionId)
		AddExp(sceneId, selfId, x207003_g_ExpBonus)
		AddMoney(sceneId, selfId, x207003_g_MoneyBonus)
		for i, item in x207003_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207003_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x207003_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x207003_g_DemandKill[1].id then 
       		    if num < x207003_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207003_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x207003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207003_OnItemChanged(sceneId, selfId, itemdataId)

end

