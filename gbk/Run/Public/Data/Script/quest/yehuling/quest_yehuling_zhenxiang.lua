--����

--MisDescBegin
x207018_g_ScriptId = 207018
x207018_g_MissionIdPre =18
x207018_g_MissionId = 19
x207018_g_MissionKind = 1
x207018_g_ScriptIdNext = {}
x207018_g_Name	="��������" 
x207018_g_Name2	="���Ѿ�" 
x207018_g_Name3	="��ʩ" 
x207018_g_Name4	="����" 
x207018_g_Name5	="����" 
x207018_g_DemandItem ={}
x207018_g_DemandKill ={}

x207018_g_MissionName="����"
x207018_g_MissionInfo="    �������࣬��ͥ������һ��Ӣ������ǰ;����������ֻ��ϧ������ӡ�÷��ڣ���ɷ����壡������Ȼ�����������ң��������������ǲ�������Ĵ��ˣ���Ϊ�����ֽ��ѣ������㡭�����ԣ����������ˣ�������Ů�ˡ��������Ů�˿������ɷ�ǣ���Ȱ�㻹�Ƿ����ɣ��������ļ���Ů����û�п����������������أ���ȥ�����ɣ�"  --��������
x207018_g_MissionTarget="    �鿴�ĸ�Ů��"		                                                                                               
x207018_g_MissionComplete="    ���ܴ��Ѳ������Ѿ��ɹ�����һ�٣�ֻ�����ҵ��Ǹ��ˣ��Ѿ���Զ�ˣ���ֻ������ֱ˵����"					--�������npc˵���Ļ�
x207018_g_ContinueInfo="    ����������,���б������,������֮�����ι�,����֮�����ò"
x207018_g_MidInfo2="    (������Ƽ��ݣ�������������)"
x207018_g_MidInfo3="    (���е���ɫ������ľ��ģ���������ǰ��˭�ҵ�С��̫��)"
x207018_g_MidInfo4="    (�ޡ���������������֣���üëҲ�ܴ֣�Ӧ���ǡ������򣡲��ð�����˼ң���û�к�ᣬ�����еġ�)"
x207018_g_MidInfo5="    (��ô����Ů�ˣ�Ҳ���ǣ�)"
--������
x207018_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207018_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207018_g_RadioItemBonus={}

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x207018_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207018_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207018_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207018_g_MissionId)
		if (GetName(sceneId,targetId)==x207018_g_Name) then
	        	if x207018_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x207018_g_MissionName)
				AddText(sceneId,x207018_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x207018_g_MissionTarget) 
				AddText(sceneId,format("\n    �鿴���Ѿ�   %d/1\n    �鿴��ʩ   %d/1\n    �鿴����   %d/1\n    �鿴����   %d/1", GetMissionParam(sceneId,selfId,misIndex,0),GetMissionParam(sceneId,selfId,misIndex,1),GetMissionParam(sceneId,selfId,misIndex,2),GetMissionParam(sceneId,selfId,misIndex,3) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
	
			     
	                if x207018_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x207018_g_MissionName)
			     AddText(sceneId,x207018_g_MissionComplete)
			     AddText(sceneId,"#Y����Ŀ��#W") 
			     AddText(sceneId,x207018_g_MissionTarget) 
			     AddText(sceneId,format("\n    �鿴���Ѿ�   %d/1\n    �鿴��ʩ   %d/1\n    �鿴����   %d/1\n    �鿴����   %d/1", GetMissionParam(sceneId,selfId,misIndex,0),GetMissionParam(sceneId,selfId,misIndex,1),GetMissionParam(sceneId,selfId,misIndex,2),GetMissionParam(sceneId,selfId,misIndex,3) ))
			     EndEvent()
	                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207018_g_ScriptId, x207018_g_MissionId)
	                end
	       end
	       if (GetName(sceneId,targetId)==x207018_g_Name2) then
	        	SetMissionByIndex(sceneId,selfId,misIndex,0,1)
	        	BeginEvent(sceneId)
			AddText(sceneId,x207018_g_MidInfo2)
        		EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
	       end
	       if (GetName(sceneId,targetId)==x207018_g_Name3) then
	        	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	        	BeginEvent(sceneId)
			AddText(sceneId,x207018_g_MidInfo3)
        		EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
	       end
	       if (GetName(sceneId,targetId)==x207018_g_Name4) then
	        	SetMissionByIndex(sceneId,selfId,misIndex,2,1)
	        	BeginEvent(sceneId)
			AddText(sceneId,x207018_g_MidInfo4)
        		EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
	       end
	       if (GetName(sceneId,targetId)==x207018_g_Name5) then
	        	SetMissionByIndex(sceneId,selfId,misIndex,3,1)
	        	BeginEvent(sceneId)
			AddText(sceneId,x207018_g_MidInfo5)
        		EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
	       end

        elseif x207018_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207018_g_MissionName)
                AddText(sceneId,x207018_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207018_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207018_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207018_g_ScriptId, x207018_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207018_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207018_g_MissionId) > 0 then
		return 0
	end
	--����ѽӴ�����
	if  x207018_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207018_g_ScriptId, x207018_g_MissionName)
	end
	return 0
	
end



--**********************************

--����������

--**********************************

function x207018_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207018_g_Name) then
		return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207018_CheckPushList(sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207018_g_MissionId)
        if IsMissionHaveDone(sceneId, selfId, x207018_g_MissionIdPre) > 0 then
        	if IsHaveMission(sceneId,selfId, x207018_g_MissionId) > 0 then
	        	if (GetName(sceneId,targetId)==x207018_g_Name2) then
	        		if GetMissionParam(sceneId,selfId,misIndex,0) <= 0 then
	        			return 1
	        		end
	        	end
	        	if (GetName(sceneId,targetId)==x207018_g_Name3) then
	        		if GetMissionParam(sceneId,selfId,misIndex,1) <= 0 then
	        			return 1
	        		end
	        	end
	        	if (GetName(sceneId,targetId)==x207018_g_Name4) then
	        		if GetMissionParam(sceneId,selfId,misIndex,2) <= 0 then
	        			return 1
	        		end
	        	end
	        	if (GetName(sceneId,targetId)==x207018_g_Name5) then
	        		if GetMissionParam(sceneId,selfId,misIndex,3) <= 0 then
	        			return 1
	        		end
	        	end
	        	if (GetName(sceneId,targetId)==x207018_g_Name) then
	        			return 1
	        	end
	        end
	        if IsHaveMission(sceneId,selfId, x207018_g_MissionId)<= 0 then
	        	if (GetName(sceneId,targetId)==x207018_g_Name) then
	        			return 1
	        	end
	        end
        end
        return 0
		
end

--**********************************

--����

--**********************************

function x207018_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207018_g_MissionId, x207018_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207018_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x207018_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207018_g_MissionId)
	for i, item in pairs(x207018_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207018_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207018_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
		if GetMissionParam(sceneId,selfId,misIndex,1) == 1 then
			if GetMissionParam(sceneId,selfId,misIndex,2) == 1 then
				if GetMissionParam(sceneId,selfId,misIndex,3) == 1 then
	        			return 1
	        		end
	        	end
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207018_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207018_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207018_g_MissionId)
		AddExp(sceneId, selfId, x207018_g_ExpBonus)
		AddMoney(sceneId, selfId, x207018_g_MoneyBonus)
		for i, item in pairs(x207018_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207018_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207018_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x207018_OnEnterArea(sceneId, selfId, zoneId)

	misIndex = GetMissionIndexByID(sceneId,selfId,x207018_g_MissionId)
        if GetMissionParam(sceneId,selfId,misIndex,4) <= 0 then
        	if IsHaveMission(sceneId,selfId, x207018_g_MissionId) > 0 then
        	SetMissionByIndex(sceneId,selfId,misIndex,4,1)
        	LuaFnCreateMonster(sceneId, 420,43.87,44,0,1,-1)
        	LuaFnCreateMonster(sceneId, 420,43.57,44,0,1,-1)
        	LuaFnCreateMonster(sceneId, 420,43.87,44.5,0,1,-1)
        	LuaFnCreateMonster(sceneId, 420,43.57,44.5,0,1,-1)
        	end
        	
        end

end

function x207018_OnTimer(sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x207018_g_MissionId)
        if GetMissionParam(sceneId,selfId,misIndex,4) <= 0 then
        	if IsHaveMission(sceneId,selfId, x207018_g_MissionId) > 0 then
        	SetMissionByIndex(sceneId,selfId,misIndex,4,1)
        	LuaFnCreateMonster(sceneId, 420,43.87,44,0,1,-1)
        	LuaFnCreateMonster(sceneId, 420,43.57,44,0,1,-1)
        	LuaFnCreateMonster(sceneId, 420,43.87,44.5,0,1,-1)
        	LuaFnCreateMonster(sceneId, 420,43.57,44.5,0,1,-1)
        	end
        	
        end
end

function x207018_OnLeaveArea(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x207018_OnItemChanged(sceneId, selfId, itemdataId)

end

