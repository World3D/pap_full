--һ����������

--MisDescBegin
x202011_g_ScriptId = 202011
--x202011_g_MissionIdPre =41
x202011_g_MissionId = 130
x202011_g_MissionKind = 4
x202011_g_MissionLevel = 20
--x202011_g_ScriptIdNext = {ScriptId = 202001 ,LV = 1 }
x202011_g_Name	="ľ����" 
x202011_g_DemandItem ={}
x202011_g_DemandKill ={{id=373,num=15}}

x202011_g_MissionName="һ����������"
x202011_g_MissionInfo="    ���ӵĽ�ʿ����������ģ�������Ϊ��ľ�溹���常���Ͳ�Ӧ����������̳�����ˣ����ǣ����ǵõ�����Ϣ�������������������ˡ�\n \n    �ҹ��ƣ���Ϊ���ǵ�������׳���������о�����Σ�������Ѿ������ǵ����˵��ˡ�\n \n    "  --��������
x202011_g_MissionInfo2="����ľ�溹��һ�����ؿ�㣬̹���ޱȵľ�������������������Ը��������ǣ�����ȴ���ܲ�����\n \n    ���˴�����Ϣ��������Ӫ����Χ����һȺ�����ڹ۲������ǣ����ܾ����������ˣ�������ȥ��������ǡ�"
x202011_g_MissionTarget="    #Gľ����#W�ܵ���Ӫ����Χ�İ��ڣ���Ҫȥ�ҵ�15��#R��ԭ����#W��ɱ�����ǡ�"		                                                                                               
x202011_g_MissionComplete="    ���ĺܺá�"					--�������npc˵���Ļ�
x202011_g_ContinueInfo="    ��Щ����ʱʱ�̹̿�ע�����ǵĶ�����һ��Ҳ��������"
--������
x202011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202011_g_RadioItemBonus={}

--MisDescEnd
x202011_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x202011_g_MissionId)
		if x202011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202011_g_MissionName)
			AddText(sceneId,x202011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����ԭ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x202011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202011_g_MissionName)
		     AddText(sceneId,x202011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x202011_g_MoneyBonus)
                     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202011_g_ScriptId, x202011_g_MissionId)
                end

        elseif x202011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202011_g_MissionName)
                AddText(sceneId,x202011_g_MissionInfo..GetName(sceneId, selfId)..x202011_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202011_g_ScriptId, x202011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202011_g_ScriptId, x202011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==2) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x202011_g_MissionId, x202011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x202011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x202011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202011_g_MissionId)
	for i, item in pairs(x202011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x202011_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202011_g_MissionId)
		AddExp(sceneId, selfId, x202011_g_ExpBonus)
		AddMoney(sceneId, selfId, x202011_g_MoneyBonus)
		for i, item in pairs(x202011_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x202011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x202011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x202011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x202011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x202011_g_DemandKill[1].id then 
       		    if num < x202011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����ԭ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x202011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202011_OnItemChanged(sceneId, selfId, itemdataId)

end

