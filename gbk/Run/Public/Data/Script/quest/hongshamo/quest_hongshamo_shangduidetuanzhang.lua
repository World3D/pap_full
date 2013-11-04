--�̶ӵ��ų�

--MisDescBegin
x205000_g_ScriptId = 205000
--x205000_g_MissionIdPre =5
x205000_g_MissionId = 40
x205000_g_MissionKind = 11
x205000_g_MissionLevel = 55
x205000_g_ScriptIdNext = {ScriptId = 205001 ,LV = 1 }
x205000_g_Name	="�ٲ�̨" 
x205000_g_Name2	="��ɽ" 
x205000_g_DemandItem ={}
x205000_g_DemandKill ={{id=300,num=15}}

x205000_g_MissionName="�̶ӵ��ų�"
x205000_g_MissionInfo="�������ܱ�������㣬�����š�ͭ�Ķ�­�������Ƶ��졢�����ġ�׶���Ƶ��ࡱ�����������ɹ���ʿ����ر��ģ��߱�����Щ֮�����ǻ���Ҫ�С��ҳϡ��͡��¸ҡ���������˵��ô�࣬���������������һЩ���顣\n \n    �ҷ��˳ɼ�˼������������̶ӵ��ﻨ����ģ���������ɳĮ�����������Щɽ����������̶ӵ��ų���ɽ�������䲻����\n \n    ���ǵ�̽�Ӳ鵽��һЩ��Ϣ��#G��ɽ#W��#RɳĮ����#W���ڣ�66��112�����ˣ�����Ҫ���ǵİ�����"  --��������
x205000_g_MissionTarget="    ɱ��ʮ����#RɳĮ����#W�����ڽ�ȱ������̶��ų�#G��ɽ#W"		                                                                                               
x205000_g_MissionComplete="    лл����ҽ������Щ������"					--�������npc˵���Ļ�
x205000_g_ContinueInfo="    ̰���ĵ����ƺ��Ƕ������ǵ��䱦����Ʒ���ģ�"
--������
x205000_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205000_g_RadioItemBonus={}

--MisDescEnd
x205000_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x205000_g_MissionId)
		if x205000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x205000_g_MissionName)
			AddText(sceneId,x205000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x205000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��ɳĮ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x205000_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x205000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205000_g_MissionName)
		     AddText(sceneId,x205000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x205000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205000_g_ScriptId, x205000_g_MissionId)
                end

        elseif x205000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205000_g_MissionName)
                AddText(sceneId,"    "..GetName(sceneId, selfId)..x205000_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205000_g_ScriptId, x205000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205000_g_ScriptId, x205000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==5) then
        	if (GetName(sceneId,targetId)==x205000_g_Name) then
                 --if IsMissionHaveDone(sceneId, selfId, x205000_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x205000_g_MissionId)<= 0 then
                    	return 1
                    end
                --end
        	end
        
		if (GetName(sceneId,targetId)==x205000_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x205000_g_MissionId) > 0 then
		    	return 1
                    end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x205000_g_MissionId, x205000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x205000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x205000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205000_g_MissionId)
	for i, item in x205000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x205000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x205000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205000_g_MissionId)
		AddExp(sceneId, selfId, x205000_g_ExpBonus)
		AddMoney(sceneId, selfId, x205000_g_MoneyBonus)
		for i, item in x205000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x205000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x205000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x205000_g_MissionId) >= 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x205000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x205000_g_DemandKill[1].id then 
       		    if num < x205000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��ɳĮ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x205000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x205000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205000_OnItemChanged(sceneId, selfId, itemdataId)

end

