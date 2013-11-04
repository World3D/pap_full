--֤��ʵ��

--MisDescBegin
x207011_g_ScriptId = 207011
x207011_g_MissionIdPre =11
x207011_g_MissionId = 12
x207011_g_MissionKind = 1
x207011_g_ScriptIdNext = {ScriptId = 207012 ,LV = 1 }
x207011_g_Name	="������" 
x207011_g_DemandItem ={}
x207011_g_DemandKill ={id=279,num=15}

x207011_g_MissionName="֤��ʵ��"
x207011_g_MissionInfo="    �ٺ٣�ɱ�е�ʱ��Ҫ�ѵ��˿��������������ᣬ��ͻ�ս�޲�ʤ���������κ���ԥ���ʴȡ�����Щ#R����#W�������أ�ֻ�ǹ������ģ��ţ��ǵģ�����ȷʵ�е㱾�죬�������������ǡ���������������˵ʲô����Ҳ�������Լ�˵ʲô����\n \n����ʵ��֤��һ�аɣ�������һ�����ܵĽ�����������ˣ���ס�ˣ�������������ĸ���"  --��������
x207011_g_MissionTarget="    ɱ��15��#R���ܵĽ��#W"		                                                                                               
x207011_g_MissionComplete="    ��ϲ�㣬��ᵽ�������ĺ��壬ֻҪ����û�е��ˣ��Լ�������Ǳ�ܻӷ����������������Ǹ��������#R������#W�������ˡ�"					--�������npc˵���Ļ�
x207011_g_ContinueInfo="    �㻹��û���������ĺ��塭��"
--������
x207011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207011_g_RadioItemBonus={}

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x207011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)
		if x207011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207011_g_MissionName)
			AddText(sceneId,x207011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����ܵĽ��   %d/15", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207011_g_MissionName)
		     AddText(sceneId,x207011_g_MissionComplete)
		     AddText(sceneId,"#Y����Ŀ��#W") 
		     AddText(sceneId,x207011_g_MissionTarget) 
		     AddText(sceneId,format("\n    ɱ�����ܵĽ��   %d/15", GetMissionParam(sceneId,selfId,misIndex,0) ))
                     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207011_g_ScriptId, x207011_g_MissionId)
                end

        elseif x207011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207011_g_MissionName)
                AddText(sceneId,x207011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207011_g_ScriptId, x207011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207011_g_MissionId) > 0 then
		return 0
	end
	--����ѽӴ�����
	if  x207011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207011_g_ScriptId, x207011_g_MissionName)
	end
	return 0
	
end



--**********************************

--����������

--**********************************

function x207011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207011_g_Name) then
		return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207011_CheckPushList(sceneId, selfId, targetId)
        if IsMissionHaveDone(sceneId, selfId, x207011_g_MissionIdPre) > 0 then
                return 1
        end
		
end

--**********************************

--����

--**********************************

function x207011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207011_g_MissionId, x207011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x207011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207011_g_MissionId)
	for i, item in x207011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 15 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207011_g_MissionId)
		AddExp(sceneId, selfId, x207011_g_ExpBonus)
		AddMoney(sceneId, selfId, x207011_g_MoneyBonus)
		for i, item in x207011_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207011_g_MissionId) >= 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x207011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
       		 if objdataId == x207011_g_DemandKill.id then 
       		    if num < 15 then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����ܵĽ��   %d/15", GetMissionParam(sceneId,selfId,misIndex,0) )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x207011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207011_OnItemChanged(sceneId, selfId, itemdataId)

end

