--�󺹵ĸ�ʾ

--MisDescBegin
x208003_g_ScriptId = 208003
x208003_g_MissionIdPre =56
x208003_g_MissionId = 57
x208003_g_MissionKind = 12
x208003_g_MissionLevel = 60
--x208003_g_ScriptIdNext = {ScriptId = 207007 ,LV = 1 }
x208003_g_Name	="����" 
x208003_g_Name2	="�ɼ�˼��" 
x208003_g_noDemandItem ={{id=13010009,num=1}}
x208003_g_MissionName="�󺹵ĸ�ʾ"
x208003_g_MissionInfo="������Ҫ��ս����ڻ�����ģ����ߴ�����ÿ���̫�����ֵ�ʱ�򣬵�һʱ���յ����ǵ�ս�졣��ÿ����һ̧ͷ�������ľ������ɹŴ�������ġ�\n \n    ����һ�����ٵ�������Ҫ���ҵ�������������ȫ�İ����͵��ʹ��ſڣ�Ȼ�󣬰������ʾ���ڻʹ��ſڴ����Ҹ�����������ġ�"
x208003_g_MissionTarget="    ��#G�ɼ�˼��#W�����������ൽ�ʹ��ſڣ�Ȼ��Ѹ�ʾ���ڳ��Ŵ���"		
x208003_g_MissionComplete="    лл��İ�æ�����Ǹ���Ľ�����"					--�������npc˵���Ļ�
x208003_g_ContinueInfo = "    һ�ж�ƽ����"

--������
--��Ǯ����
x208003_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208003_g_RadioItemBonus={}

--MisDescEnd
x208003_g_ExpBonus = 1000

if x208003_g_husongobj == nil then
	x208003_g_husongobj = 0
end
if x208003_g_husongid == nil then
	x208003_g_husongid = 0
end
if x208003_g_PROTECTINFO == nil then
	x208003_g_PROTECTINFO={ScneneTimerIndex = -1, Step = 0, StartTime = 0, PlayerNum = 0, PlayerId= {0,0,0,0,0,0}}
end
--**********************************

--������ں���

--**********************************

function x208003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208003_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x208003_g_MissionId)
		if x208003_CheckSubmit(sceneId, selfId, targetId) > 0 then
			BeginEvent(sceneId)
                	AddText(sceneId,"#Y"..x208003_g_MissionName)
			AddText(sceneId,x208003_g_MissionComplete)
			AddMoneyBonus(sceneId, x208003_g_MoneyBonus)
			EndEvent()
                	DispatchMissionContinueInfo(sceneId, selfId, targetId, x208003_g_ScriptId, x208003_g_MissionId)
               else
			BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x208003_g_MissionName)
			AddText(sceneId,x208003_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x208003_g_MissionTarget) 
			AddText(sceneId,format("\n    �������ൽ�ʹ��ſ�   %d/1\n    �Ѹ�ʾ���ڳ���   %d/1", GetMissionParam(sceneId,selfId,misIndex,0), GetMissionParam(sceneId,selfId,misIndex,1) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end
        elseif x208003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208003_g_MissionName)
                AddText(sceneId,"    "..GetName(sceneId, selfId)..x208003_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208003_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208003_g_ScriptId, x208003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208003_g_ScriptId, x208003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208003_CheckAccept(sceneId, selfId, targetId)
	
	if (GetName(sceneId,targetId)==x208003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208003_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==8) then
		if IsMissionHaveDone(sceneId, selfId, x208003_g_MissionIdPre) > 0 then
			if (GetName(sceneId,targetId)==x208003_g_Name) then 
				x208003_g_husongid = targetId
				if IsHaveMission(sceneId,selfId, x208003_g_MissionId) <= 0 then
					if x208003_g_husongobj == 0 then
						return 1
					end
				end
			end
			if (GetName(sceneId,targetId)==x208003_g_Name2) then 
				if x208003_g_husongobj == 0 then
					SetPatrolId(sceneId, x208003_g_husongid, -1)
					if IsHaveMission(sceneId,selfId, x208003_g_MissionId) > 0 then
						return 1
					end
				end
				if x208003_g_husongobj == 1 then
					if IsHaveMission(sceneId,selfId, x208003_g_MissionId) > 0 then
						return 1
					end
				end
			end
		        return 0
		end
	end
	return 0
	
end

--**********************************

--����

--**********************************

function x208003_OnAccept(sceneId, selfId)
	if x208003_g_husongobj == 0 then
		if x208003_g_PROTECTINFO.Step == 0  then
			BeginAddItem(sceneId)                                                    
			AddItem( sceneId,x208003_g_noDemandItem[1].id, x208003_g_noDemandItem[1].num )             
			ret = EndAddItem(sceneId,selfId)                                 
	        	if ret > 0 then                                                  
	        		x208003_g_husongobj = 1
	        		BeginEvent(sceneId)
				AddMission( sceneId, selfId, x208003_g_MissionId, x208003_g_ScriptId, 1, 0, 0)
				AddText(sceneId,"��������"..x208003_g_MissionName) 
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				AddItemListToHuman(sceneId,selfId)
				x208003_g_PROTECTINFO.PlayerNum = 1                    
				x208003_g_PROTECTINFO.PlayerId[1] = selfId             
                        	x208003_g_PROTECTINFO.Step = 1                         
				x208003_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
				x208003_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 208003, "OnScneneTimer", 1)
	        	else                                                             
		     		BeginEvent(sceneId)                                      
		     		AddText(sceneId,"��Ʒ����������������������")                    
		    		EndEvent(sceneId)                                        
		     		DispatchMissionTips(sceneId,selfId)                      
	        	end     
			
			
	       
		elseif x208003_g_PROTECTINFO.Step == 2  then
			if x208003_g_PROTECTINFO.PlayerNum > 5  then
				return
			end
			x208003_g_PROTECTINFO.PlayerNum = x208003_g_PROTECTINFO.PlayerNum + 1
			x208003_g_PROTECTINFO.PlayerId[x208003_g_PROTECTINFO.PlayerNum] = selfId
			BeginEvent(sceneId)
			AddMission( sceneId, selfId, x208003_g_MissionId, x208003_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x208003_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		end	
	elseif x208003_g_husongobj ~= 0 then 
		BeginEvent(sceneId)
		strText = "#Y���ڲ��ܽ��������"
		AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
	
end



--**********************************

--����

--**********************************

function x208003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208003_g_MissionId)
	for i=1, x208003_g_PROTECTINFO.PlayerNum  do
		if x208003_g_PROTECTINFO.PlayerId[i] == selfId  then
			x208003_g_PROTECTINFO.PlayerId[i] = 0
		end
	end
	for i, item in pairs(x208003_g_noDemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end
end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208003_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208003_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
		if GetMissionParam(sceneId,selfId,misIndex,1) == 1 then
			return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208003_g_MissionId)
		AddExp(sceneId, selfId, x208003_g_ExpBonus)
		AddMoney(sceneId, selfId, x208003_g_MoneyBonus)
		for i, item in pairs(x208003_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        --CallScriptFunction( x208003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x208003_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x208003_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208003_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,2,1)
	
end

function x208003_OnLeaveArea(sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x208003_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)
end

function x208003_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x208003_OnItemChanged(sceneId, selfId, itemdataId)

end


--**********************************

--��ʱ��

--**********************************

function x208003_OnScneneTimer(sceneId, selfId)
	if x208003_g_PROTECTINFO.Step == 1   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x208003_g_Name  then
				HeadNPCID = nMonsterId
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((208003), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x208003_g_PROTECTINFO.Step = 2
	end
	if x208003_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x208003_g_PROTECTINFO.StartTime >= 10   then
			x208003_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x208003_g_PROTECTINFO.Step == 3   then
		SetPatrolId(sceneId, x208003_g_husongid, 1)

		x208003_g_PROTECTINFO.Step = 4
	end
	-- ���͹���
	if x208003_g_PROTECTINFO.Step == 4   then
		if x208003_g_husongobj < 1   then
			x208003_CloseTimer(sceneId, x208003_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		if x208003_g_husongobj ~= 0   then
			local targetX, targetZ = GetWorldPos(sceneId, x208003_g_husongid)
			for i=1, x208003_g_PROTECTINFO.PlayerNum  do
				if x208003_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x208003_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					if distance1 > 20    then
						BeginEvent(sceneId)
						strText = x208003_g_MissionName.."  ʧ��"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x208003_g_PROTECTINFO.PlayerId[i])
						x208003_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
			local targetX, targetZ = GetWorldPos(sceneId, x208003_g_husongid)
			--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
			local x,z =39.9,34.1
			local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
			if distance<=1  then
				for i=1, x208003_g_PROTECTINFO.PlayerNum  do
					if x208003_g_PROTECTINFO.PlayerId[i]~=0   then
						if IsHaveMission(sceneId,x208003_g_PROTECTINFO.PlayerId[i],x208003_g_MissionId) > 0 then
							local misIndex = GetMissionIndexByID(sceneId, x208003_g_PROTECTINFO.PlayerId[i], x208003_g_MissionId)
							SetMissionByIndex(sceneId,x208003_g_PROTECTINFO.PlayerId[i],misIndex,0,1)
							BeginEvent(sceneId)
							AddText(sceneId,format("    �������ൽ�ʹ��ſ�   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,x208003_g_PROTECTINFO.PlayerId[i])
						end
					end
				end
				x208003_g_PROTECTINFO.Step = 5
				x208003_CloseTimer(sceneId, x208003_g_PROTECTINFO.ScneneTimerIndex)
			end								
		end
	end
end


--**********************************
--�رռ�ʱ��
--**********************************
function x208003_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x208003_g_PROTECTINFO.ScneneTimerIndex = -1
	x208003_g_PROTECTINFO.Step = 0
	x208003_g_PROTECTINFO.StartTime = 0
	x208003_g_PROTECTINFO.PlayerNum = 0
	for i =1, getn(x208003_g_PROTECTINFO.PlayerId) do
		x208003_g_PROTECTINFO.PlayerId[i]=0
	end
	x208003_g_husongobj = 0
	SetPatrolId(sceneId, x208003_g_husongid, -1)
end