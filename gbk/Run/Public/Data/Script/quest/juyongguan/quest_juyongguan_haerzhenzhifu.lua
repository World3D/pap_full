--������֮��

--MisDescBegin
x206007_g_ScriptId = 206007
x206007_g_MissionIdPre =33
x206007_g_MissionId = 34
x206007_g_MissionKind = 8
x206007_g_MissionLevel = 40
x206007_g_ScriptIdNext = {}
x206007_g_Name	="���Ų�" 
x206007_g_Name2	="�׷�����" 
x206007_g_DemandItem ={}
x206007_g_DemandKill ={{id=399,num=1}}

x206007_g_MissionName="������֮��"
x206007_g_MissionInfo="    #R������#W�Ǹ�С�ˣ�һ��СС�ķ�²ӪͷĿ�����쵽���ֻ֪���������Ƹ����ˣ��ϴ�Ұ���������������ˣ����������½���������һ��֮�󣬰������Ƶ����������ϡ��ҵĹ����氡����������������ˣ����������Ҫ�Ѿ���һ���ǰ�����������ʲô�����������ˣ�\n \n    ����ϣ��������һ��Ҫ��������취��������������������׼����棬�Ǹ��׷�����ͷ��������������ȥץ�������أ�������������Ĵ��°���"  --��������
x206007_g_MissionTarget="    ���������������#G�׷�����#W��Χ��"		                                                                                               
x206007_g_MissionComplete="    ��������������ȣ�һ�����Ҷ��ε����յ����ѣ���Ȼ���������ˣ��ҾͲ������ˣ�\n \n    #R������#W���ҵ��������ӣ��������ղ��ƣ���Ȼ���ǽ��ˣ����������Ѵ��������ˣ���������û�м���ɻ��ˣ�����������뿴���ҵ���������һ�ۣ�û�뵽����һ����#R������#W���˸�ץ��!\n \n    �ҵĺ���Ϊ�˾��ң�͵͵�����ҳ��������������ܣ�������׷��ȥ�ˡ��������Ѿ�����������ˣ��һ��и�С���ӣ�������û�в��ƺã�������Ϲ��һֻ�ۣ�������������������֮ǰ������һ�档"					--�������npc˵���Ļ�
x206007_g_ContinueInfo="    �Ⱦ��ң���Щ�ɹ���Ҫɱ�ң�"
--������
x206007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x206007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206007_g_RadioItemBonus={}

--MisDescEnd
x206007_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x206007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x206007_g_MissionId)
		if x206007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x206007_g_MissionName)
				AddText(sceneId,x206007_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x206007_g_MissionTarget) 
				AddText(sceneId,format("\n    ɱ��������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x206007_g_DemandKill[1].num))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			local nMonsterNum = GetMonsterCount(sceneId)
			local bHave = 0
			local ii = 0
			local bOk =0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "������(45)"  then
					bOk =1
				end
			end
			if bOk==0 then
        			LuaFnCreateMonster(sceneId, 399,211,93,0,1,-1)
        		end
		end
		if x206007_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x206007_g_MissionName)
			     AddText(sceneId,x206007_g_MissionComplete)
			     AddMoneyBonus(sceneId, x206007_g_MoneyBonus)
	                     EndEvent()
			     DispatchMissionContinueInfo(sceneId, selfId, targetId, x206007_g_ScriptId, x206007_g_MissionId)
	        end
	       	       
        elseif x206007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206007_g_MissionName)
                AddText(sceneId,x206007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206007_g_ScriptId, x206007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206007_g_MissionId) > 0 then
		return 0
	end
	--����ѽӴ�����
	if  x206007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206007_g_ScriptId, x206007_g_MissionName)
	end
	return 0
	
end



--**********************************

--����������

--**********************************

function x206007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x206007_g_Name) then
		return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==6) then
		if IsMissionHaveDone(sceneId, selfId, x206007_g_MissionIdPre) > 0 then
	        	if (GetName(sceneId,targetId)==x206007_g_Name2) then
		        	if IsHaveMission(sceneId,selfId, x206007_g_MissionId)> 0 then
		        		return 1
		        	end
		        end
		        if (GetName(sceneId,targetId)==x206007_g_Name) then
				if IsHaveMission(sceneId,selfId, x206007_g_MissionId)<= 0 then
		        		return 1
		        	end
			end
		end
	end
        return 0
		
end

--**********************************

--����

--**********************************

function x206007_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x206007_g_MissionId, x206007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x206007_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x206007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206007_g_MissionId)
	for i, item in x206007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x206007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206007_g_MissionId)
		AddExp(sceneId, selfId, x206007_g_ExpBonus)
		AddMoney(sceneId, selfId, x206007_g_MoneyBonus)
		for i, item in x206007_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x206007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x206007_OnKillObject(sceneId, selfId, objdataId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x206007_g_MissionId)  
	if IsHaveMission(sceneId,selfId, x206007_g_MissionId)> 0 then
		if GetMissionParam(sceneId,selfId,misIndex,0) <= 0 then
			if objdataId == x206007_g_DemandKill[1].id then 
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,1)
       		    	 BeginEvent(sceneId)
		    	 AddText(sceneId,format("ɱ��������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x206007_g_DemandKill[1].num )) 
		    	 EndEvent()
		    	 DispatchMissionTips(sceneId, selfId)
		    	end
       		 end	 
       	end

end



--**********************************

--���������¼�

--**********************************

function x206007_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x206007_g_MissionId)
	
        if GetMissionParam(sceneId,selfId,misIndex,0) <= 0 then
        	if IsHaveMission(sceneId,selfId, x206007_g_MissionId) > 0 then
        		local nMonsterNum = GetMonsterCount(sceneId)
			local bHave = 0
			local ii = 0
			local bOk =0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "������(45)"  then
					bOk =1
				end
			end
			if bOk==0 then
        			LuaFnCreateMonster(sceneId, 399,211,93,0,1,-1)
        		end
        	end
        	
        end

end

function x206007_OnTimer(sceneId, selfId )
	
end

function x206007_OnLeaveArea(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x206007_OnItemChanged(sceneId, selfId, itemdataId)

end

