--����֮ս

--MisDescBegin
x207004_g_ScriptId = 207004
x207004_g_MissionIdPre =265
x207004_g_MissionId = 266
x207004_g_MissionKind = 18
x207004_g_MissionLevel = 75
x207004_g_ScriptIdNext = {ScriptId = 207005 ,LV = 1 }
x207004_g_Name	="�����"
x207004_g_DemandItem ={}
x207004_g_DemandKill ={{id=414,num=15}}

x207004_g_MissionName="����֮ս"
x207004_g_MissionInfo="    �������ص��ι���Ϊ���ǵĳ������򶯣������Ѿ�ͬ����������֣�һ�����������ڴ˻���Ϊ�磬�����Լ�����֮�أ������ι������Ҫ����Ȼ��������������û��ѡ�����ء�\n \n    �ν������ʱ�2������30��ʯ��֧Ԯ���ǣ�����Ҫ�����;�Ľ�������ǿ�����"  --��������
x207004_g_MissionInfo2="����վ����һ���Ľ���ͽ������ˣ�ɱ�����ǵ�ͷĿ��Ȼ���������һ��ӭ���ι��󽫡�"
x207004_g_MissionTarget="    #G�����#W���㵽��վ����ȥɱ��15��#R���ͷĿ#W��ӭ���ι��󽫡�"		                                                                                               
x207004_g_MissionComplete="    �����������ݣ��Ƴ�������"					--�������npc˵���Ļ�
x207004_g_ContinueInfo="    ɱ�����ͷĿ����"
--������
x207004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207004_g_RadioItemBonus={}

--MisDescEnd
x207004_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207004_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207004_g_MissionId)
		if x207004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207004_g_MissionName)
			AddText(sceneId,x207004_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207004_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����ͷĿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207004_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207004_g_MissionName)
		     AddText(sceneId,x207004_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207004_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207004_g_ScriptId, x207004_g_MissionId)
                end

        elseif x207004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207004_g_MissionName)
                AddText(sceneId,x207004_g_MissionInfo..GetName(sceneId, selfId)..x207004_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207004_g_ScriptId, x207004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207004_g_ScriptId, x207004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207004_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==7) then
		if IsMissionHaveDone(sceneId, selfId, x207004_g_MissionIdPre) > 0 then
					return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207004_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207004_g_MissionId, x207004_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207004_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x207004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207004_g_MissionId)
	for i, item in pairs(x207004_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207004_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207004_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x207004_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207004_g_MissionId)
		AddExp(sceneId, selfId, x207004_g_ExpBonus)
		AddMoney(sceneId, selfId, x207004_g_MoneyBonus)
		for i, item in pairs(x207004_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207004_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207004_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207004_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x207004_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x207004_g_DemandKill[1].id then 
       		    if num < x207004_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����ͷĿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207004_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x207004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207004_OnItemChanged(sceneId, selfId, itemdataId)

end

