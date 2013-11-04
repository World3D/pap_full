--��������������

--MisDescBegin
x215008_g_ScriptId = 215008
--x215008_g_MissionIdPre =41
x215008_g_MissionId = 139
x215008_g_MissionKind = 14
x215008_g_MissionLevel = 55
x215008_g_ScriptIdNext = {ScriptId = 215009 ,LV = 1 }
x215008_g_Name	="�ܱ�" 
x215008_g_Name2	="����" 
x215008_g_DemandItem ={}
x215008_g_DemandKill ={{id=382,num=1}}

x215008_g_MissionName="��������������"
x215008_g_MissionInfo="    �������ݣ����뱣֤��������ݡ���ͨ����������ˣ�����֮ս���Ǵ�ʤ����ؼ���һ�����ҹ۲��˺ܾã��ڶ���Ͷ���������ľ��Ӷ��������ݡ�\n \n    �����Ѿ��ɹ����������ǵ����֣����ڹ�;��·�ϡ�̽�ӻر��������������˻�����׼���������ࡣ\n \n     ����¾ͽ������ˣ�Ҫ��������֮ǰ����������ǡ������ֵĻ�������������Ҫ��ȫ�Ļ�����"  --��������
x215008_g_MissionTarget="    ɱ��׼������#G����#W��#R�����˻�����#W��"		                                                                                               
x215008_g_MissionComplete="    лл����ȣ�"					--�������npc˵���Ļ�
x215008_g_ContinueInfo="    ��Щ�����ֵ���в�ܴ���Ҫ�����������ǡ�"
--������
x215008_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215008_g_RadioItemBonus={}

--MisDescEnd
x215008_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215008_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x215008_g_MissionId)
		if x215008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x215008_g_MissionName)
			AddText(sceneId,x215008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x215008_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�������˻�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x215008_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x215008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215008_g_MissionName)
		     AddText(sceneId,x215008_g_MissionComplete)
		     AddMoneyBonus(sceneId, x215008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215008_g_ScriptId, x215008_g_MissionId)
                end

        elseif x215008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215008_g_MissionName)
                AddText(sceneId,x215008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215008_g_ScriptId, x215008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215008_g_ScriptId, x215008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215008_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==15) then
		if (GetName(sceneId,targetId)==x215008_g_Name) then
			if IsHaveMission(sceneId,selfId, x215008_g_MissionId) <= 0 then
        	    		return 1
        	    	end
        	end
        	if (GetName(sceneId,targetId)==x215008_g_Name2) then
			if IsHaveMission(sceneId,selfId, x215008_g_MissionId) > 0 then
        	    		return 1
        	    	end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x215008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x215008_g_MissionId, x215008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x215008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x215008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215008_g_MissionId)
	for i, item in x215008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x215008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x215008_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215008_g_MissionId)
		AddExp(sceneId, selfId, x215008_g_ExpBonus)
		AddMoney(sceneId, selfId, x215008_g_MoneyBonus)
		for i, item in x215008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x215008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x215008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x215008_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x215008_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x215008_g_DemandKill[1].id then 
       		    if num < x215008_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�������˻�����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x215008_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x215008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215008_OnItemChanged(sceneId, selfId, itemdataId)

end

