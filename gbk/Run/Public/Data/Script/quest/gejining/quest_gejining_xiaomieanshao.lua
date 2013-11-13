--������

--MisDescBegin
x215011_g_ScriptId = 215011
--x215011_g_MissionIdPre =41
x215011_g_MissionId = 142
x215011_g_MissionKind = 14
x215011_g_MissionLevel = 55
x215011_g_ScriptIdNext = {ScriptId = 215012 ,LV = 1 }
x215011_g_Name	="������" 
x215011_g_DemandItem ={}
x215011_g_DemandKill ={{id=385,num=20}}

x215011_g_MissionName="������"
x215011_g_MissionInfo="    ���������ɣ��󺹸ոո������ţ�����������⣬���������æ����\n \n    ���Ǹ���������ս��һ�죬��������ԶԶ�������ǣ��㿴���Ǳ�!\n \n    <������ָ�Ŵ�Ӫ��Χ��һ�ѶѵĲ���>Ϊ���������ǣ�����ʿ�����˺ܶ�������䵱���������������������Ƿֲ�����١�\n \n    �������������Ǹ��ܽƻ����ˣ����ɳ���һ��������������ǵ���������������ǣ�����������Ӫ�ظ�������20�����ڡ�"  --��������
x215011_g_MissionTarget="    �������#G������#WӪ�ظ�����20��#R�����˰���#W��"		                                                                                               
x215011_g_MissionComplete="    ���Ǹ�����Ϣ��"					--�������npc˵���Ļ�
x215011_g_ContinueInfo="    ��Щ�����㶼�������"
--������
x215011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215011_g_RadioItemBonus={}

--MisDescEnd
x215011_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x215011_g_MissionId)
		if x215011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x215011_g_MissionName)
			AddText(sceneId,x215011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x215011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�������˰���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x215011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x215011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215011_g_MissionName)
		     AddText(sceneId,x215011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x215011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215011_g_ScriptId, x215011_g_MissionId)
                end

        elseif x215011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215011_g_MissionName)
                AddText(sceneId,x215011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215011_g_ScriptId, x215011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215011_g_ScriptId, x215011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==15) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x215011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x215011_g_MissionId, x215011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x215011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x215011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215011_g_MissionId)
	for i, item in pairs(x215011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x215011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x215011_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215011_g_MissionId)
		AddExp(sceneId, selfId, x215011_g_ExpBonus)
		AddMoney(sceneId, selfId, x215011_g_MoneyBonus)
		for i, item in pairs(x215011_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x215011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x215011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x215011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x215011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x215011_g_DemandKill[1].id then 
       		    if num < x215011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�������˰���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x215011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x215011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215011_OnItemChanged(sceneId, selfId, itemdataId)

end

