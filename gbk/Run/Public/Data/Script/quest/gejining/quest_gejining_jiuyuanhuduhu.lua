--��Ԯ������

--MisDescBegin
x215007_g_ScriptId = 215007
--x215007_g_MissionIdPre =41
x215007_g_MissionId = 138
x215007_g_MissionKind = 14
x215007_g_MissionLevel = 55
--x215007_g_ScriptIdNext = {ScriptId = 204008 ,LV = 1 }
x215007_g_Name	="�ܱ�" 
x215007_g_DemandItem ={}
x215007_g_DemandKill ={{id=381,num=20}}

x215007_g_MissionName="��Ԯ������"
x215007_g_MissionInfo="    ���еĽ�ʿ����������������������������������ڰ�³����ս��ʱ����³�����ѱ䣬�����޵������µ����ﱻ����ǰ��й������Ʒǳ��վ�������������һ����Ľ�ʿ�ǣ�����������³����Ԯ��ɱ����Щ#R������ʿ��#W��"  --��������
x215007_g_MissionTarget="    ��Ӧ#G�ܱ�#W�ĺ��ٵ���³��ȥɱ��20��#R������ʿ��#W��"		                                                                                               
x215007_g_MissionComplete="    �����㰲ȫ�����ͺá�"					--�������npc˵���Ļ�
x215007_g_ContinueInfo="    ��Ȼ������ʿ���ܶ࣬����������ܼ�ޣ�ֻ���������ɣ��ҵ������Ϣ��"
--������
x215007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215007_g_RadioItemBonus={}

--MisDescEnd
x215007_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x215007_g_MissionId)
		if x215007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x215007_g_MissionName)
			AddText(sceneId,x215007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x215007_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x215007_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x215007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215007_g_MissionName)
		     AddText(sceneId,x215007_g_MissionComplete)
		     AddMoneyBonus(sceneId, x215007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215007_g_ScriptId, x215007_g_MissionId)
                end

        elseif x215007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215007_g_MissionName)
                AddText(sceneId,x215007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215007_g_ScriptId, x215007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215007_g_ScriptId, x215007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==15) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x215007_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x215007_g_MissionId, x215007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x215007_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x215007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215007_g_MissionId)
	for i, item in x215007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x215007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x215007_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215007_g_MissionId)
		AddExp(sceneId, selfId, x215007_g_ExpBonus)
		AddMoney(sceneId, selfId, x215007_g_MoneyBonus)
		for i, item in x215007_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x215007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x215007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x215007_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x215007_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x215007_g_DemandKill[1].id then 
       		    if num < x215007_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x215007_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x215007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215007_OnItemChanged(sceneId, selfId, itemdataId)

end

