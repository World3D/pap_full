--һŭ����

--MisDescBegin
x217011_g_ScriptId = 217011
--x217011_g_MissionIdPre =41
x217011_g_MissionId = 183
x217011_g_MissionKind = 6
x217011_g_MissionLevel = 30
--x217011_g_ScriptIdNext = {ScriptId = 217001 ,LV = 1 }
x217011_g_Name	="����" 
x217011_g_DemandItem ={}
x217011_g_DemandKill ={{id=457,num=20}}

x217011_g_MissionName="һŭ����"
x217011_g_MissionInfo="    ����Ӫ���������ƣ����ǲ�����Ͷ�������Ŷ�����ͼ�������ǣ����ǰ����ǲ��ٵĽ�ʿ���������϶�����ʾ����\n \n    �����ɹ����������µ�һ����Ѫ��ʨ��������ȱ����Ѫ��������Ϊ�����ǵĹ��ң���ʹ����Ҳ������ϧ��\n \n    ������������ս�޲�ʤ�Ĺؼ���Ϊ�����������Ϊ�˸����汨��Ϊ�����к������ֵܽ��ã�����һ��Ҫս����\n \n    ���е��������ҵĺ��٣�������������ǵ�����ſ����ǵĵ������ǣ���Ҫ�����������ǣ�"  --��������
x217011_g_MissionTarget="    #G����#Wһŭ֮�£��������е�սʿ�������ǣ���#G���ʴ�#W��������Ҫ��һ���Լ���������ɱ��20��#R����Ӫ����#W��"		                                                                                               
x217011_g_MissionComplete="    �չ����ǵ����ݣ�ɱ�����е��ˣ������ǿ������ǵ��ֶΣ�"					--�������npc˵���Ļ�
x217011_g_ContinueInfo="    ���е�սʿ��ȥս�������ǵ��������ߣ�ɱ���⡣"
--������
x217011_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x217011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217011_g_RadioItemBonus={}

--MisDescEnd
x217011_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x217011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x217011_g_MissionId)
		if x217011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x217011_g_MissionName)
			AddText(sceneId,x217011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x217011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������Ӫ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x217011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217011_g_MissionName)
		     AddText(sceneId,x217011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217011_g_ScriptId, x217011_g_MissionId)
                end

        elseif x217011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217011_g_MissionName)
                AddText(sceneId,x217011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217011_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217011_g_ScriptId, x217011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217011_g_ScriptId, x217011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==20) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x217011_g_MissionId, x217011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x217011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x217011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217011_g_MissionId)
	for i, item in x217011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x217011_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217011_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x217011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217011_g_MissionId)
		AddExp(sceneId, selfId, x217011_g_ExpBonus)
		AddMoney(sceneId, selfId, x217011_g_MoneyBonus)
		for i, item in x217011_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x217011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x217011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x217011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x217011_g_DemandKill[1].id then 
       		    if num < x217011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������Ӫ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x217011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217011_OnItemChanged(sceneId, selfId, itemdataId)

end

