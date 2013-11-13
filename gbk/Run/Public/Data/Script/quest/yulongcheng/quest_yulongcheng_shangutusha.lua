--ɽ����ɱ

--MisDescBegin
x208010_g_ScriptId = 208010
--x208010_g_MissionIdPre =58
x208010_g_MissionId = 64
x208010_g_MissionKind = 12
x208010_g_MissionLevel = 60
--x208010_g_ScriptIdNext = {ScriptId = 205003 ,LV = 1 }
x208010_g_Name	="����̨" 
x208010_g_DemandItem ={}
x208010_g_DemandKill ={{id=315,num=20}}

x208010_g_MissionName="ɽ����ɱ"
x208010_g_MissionInfo="     ���ո�������·�����������ҵĵڶ�·���Ź����˶���ݳǣ��Ӳ���ֱȡ�����ǣ��������ǵľ������ε������˶����ߵ�ɽ���\n \n    ɽ�ȵĵ��ƶ��ط��������һ���Ҫ��ʱ����ܰ����Ǹ�����"  --��������
x208010_g_MissionInfo2="���Ҿ�������ʿ���������㣬����������ǵĴ����һ��ս���ɡ�"
x208010_g_MissionTarget="    ɱ��20��#R�����Ǿ���#W��������#G����̨#W������"		                                                                                               
x208010_g_MissionComplete="    ��Щ�����治�öԸ����ҿ�����ļ��룬��ս�½�������Ҫ��ȫ�����л�㡣"					--�������npc˵���Ļ�
x208010_g_ContinueInfo="    �벻Ҫ������Щ������ģ�ˣ�ֻ��ɱ�����ǲ���ƽϢ���ǳ�޵�ŭ��"
--������
x208010_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208010_g_RadioItemBonus={}

--MisDescEnd
x208010_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x208010_g_MissionId)
		if x208010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x208010_g_MissionName)
			AddText(sceneId,x208010_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x208010_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�������Ǿ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x208010_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x208010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x208010_g_MissionName)
		     AddText(sceneId,x208010_g_MissionComplete)
		     AddMoneyBonus(sceneId, x208010_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x208010_g_ScriptId, x208010_g_MissionId)
                end

        elseif x208010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208010_g_MissionName)
                AddText(sceneId,x208010_g_MissionInfo..GetName(sceneId, selfId)..x208010_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208010_g_ScriptId, x208010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208010_g_ScriptId, x208010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208010_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==8) then
		--if IsMissionHaveDone(sceneId, selfId, x208010_g_MissionIdPre) > 0 then
        	    	return 1
        	--end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208010_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x208010_g_MissionId, x208010_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x208010_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x208010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208010_g_MissionId)
	for i, item in pairs(x208010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208010_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208010_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x208010_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208010_g_MissionId)
		AddExp(sceneId, selfId, x208010_g_ExpBonus)
		AddMoney(sceneId, selfId, x208010_g_MoneyBonus)
		for i, item in pairs(x208010_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x208010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x208010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x208010_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x208010_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x208010_g_DemandKill[1].id then 
       		    if num < x208010_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�������Ǿ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x208010_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x208010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208010_OnItemChanged(sceneId, selfId, itemdataId)

end

