--������

--MisDescBegin
x203001_g_ScriptId = 203001
--x203001_g_MissionIdPre =56
x203001_g_MissionId = 69
x203001_g_MissionKind = 13
x203001_g_MissionLevel = 50
x203001_g_ScriptIdNext = {ScriptId = 203002 ,LV = 1 }
x203001_g_Name	="����" 
x203001_g_Name2	="����" 
x203001_g_noDemandItem ={}
x203001_g_MissionName="������"
x203001_g_MissionInfo="    ̫�˷��ˣ�̫�˷��ˣ�\n \n    "
x203001_g_MissionInfo2="������˵�������������������ɹŹ�������������ɼ�˼���ѻ��ݹ��������������\n \n    ������Ҳ�������������˵���������ǵģ��Һܾ�û�м������ˣ������һ�μ�����ʱ���ܱ𽫾���������������أ�\n \n    <���ݺܵ�����ó�һ�����ر�ļ�>���������֤������Ȼ��ֻ��һ���ͼ���ū�ͣ����Ǵ󺹶���ȴ���ֵ�һ�㣬����������Ҳ�����Ǻ����ѣ�����������������͸��ҵġ�������Ĵ������������£�������Ҫһ�����ո�ǿ����ʿ��������ѵ���Ա���ߣ�����ʹ���ȥ������"
x203001_g_MissionTarget="    ����#G����#W�ߣ��������ȥ��������#G����#W��"		
x203001_g_MissionComplete="    �ֵܵĴ������������Ѿá�"					--�������npc˵���Ļ�
x203001_g_ContinueInfo = "    һ�ж�ƽ����"

--������
--��Ǯ����
x203001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203001_g_RadioItemBonus={}

--MisDescEnd
x203001_g_ExpBonus = 1000
if x203001_g_husongobj == nil then
	x203001_g_husongobj = 0
end
if x203001_g_husongid == nil then
	x203001_g_husongid = 0
end
if x203001_g_PROTECTINFO == nil then
	x203001_g_PROTECTINFO={ScneneTimerIndex = -1, Step = 0, StartTime = 0, PlayerNum = 0, PlayerId= {0,0,0,0,0,0}}
end
--**********************************

--������ں���

--**********************************

function x203001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203001_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x203001_g_MissionId)
		if x203001_CheckSubmit(sceneId, selfId, targetId) > 0 then
			BeginEvent(sceneId)
                	AddText(sceneId,"#Y"..x203001_g_MissionName)
			AddText(sceneId,x203001_g_MissionComplete)
			AddMoneyBonus(sceneId, x203001_g_MoneyBonus)
			EndEvent()
                	DispatchMissionContinueInfo(sceneId, selfId, targetId, x203001_g_ScriptId, x203001_g_MissionId)
		end
        elseif x203001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203001_g_MissionName)
                AddText(sceneId,x203001_g_MissionInfo..GetName(sceneId, selfId)..x203001_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203001_g_ScriptId, x203001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203001_g_ScriptId, x203001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203001_CheckAccept(sceneId, selfId, targetId)
	
	if (GetName(sceneId,targetId)==x203001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203001_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==3) then
			if (GetName(sceneId,targetId)==x203001_g_Name) then 
				x203001_g_husongid = targetId
				if IsHaveMission(sceneId,selfId, x203001_g_MissionId) <= 0 then
					if x203001_g_husongobj == 0 then
						return 1
					end
				end
			end
			if (GetName(sceneId,targetId)==x203001_g_Name2) then
				if x203001_g_husongobj == 0 then 
					SetPatrolId(sceneId, x203001_g_husongid, -1)
					misIndex = GetMissionIndexByID(sceneId,selfId,x203001_g_MissionId)
					if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
						return 1
					end
				end
				if x203001_g_husongobj == 1 then 
					misIndex = GetMissionIndexByID(sceneId,selfId,x203001_g_MissionId)
					if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
						return 1
					end
				end
			end
		        return 0
	end
	
end

--**********************************

--����

--**********************************

function x203001_OnAccept(sceneId, selfId)
	if x203001_g_husongobj == 0 then
		if x203001_g_PROTECTINFO.Step == 0  then
				x203001_g_husongobj = 1
	        		BeginEvent(sceneId)
				AddMission( sceneId, selfId, x203001_g_MissionId, x203001_g_ScriptId, 1, 0, 0)
				AddText(sceneId,"��������"..x203001_g_MissionName) 
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				x203001_g_PROTECTINFO.PlayerNum = 1                    
				x203001_g_PROTECTINFO.PlayerId[1] = selfId             
                        	x203001_g_PROTECTINFO.Step = 1                         
				x203001_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
				x203001_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 203001, "OnScneneTimer", 1)
	        	
		elseif x203001_g_PROTECTINFO.Step == 2  then
			if x203001_g_PROTECTINFO.PlayerNum > 5  then
				return
			end
			x203001_g_PROTECTINFO.PlayerNum = x203001_g_PROTECTINFO.PlayerNum + 1
			x203001_g_PROTECTINFO.PlayerId[x203001_g_PROTECTINFO.PlayerNum] = selfId
			BeginEvent(sceneId)
			AddMission( sceneId, selfId, x203001_g_MissionId, x203001_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x203001_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		end	
	elseif x203001_g_husongobj ~= 0 then 
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

function x203001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203001_g_MissionId)
	for i=1, x203001_g_PROTECTINFO.PlayerNum  do
		if x203001_g_PROTECTINFO.PlayerId[i] == selfId  then
			x203001_g_PROTECTINFO.PlayerId[i] = 0
		end
	end
	for i, item in pairs(x203001_g_noDemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end
end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203001_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203001_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203001_g_MissionId)
		AddExp(sceneId, selfId, x203001_g_ExpBonus)
		AddMoney(sceneId, selfId, x203001_g_MoneyBonus)
		for i, item in pairs(x203001_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        CallScriptFunction( x203001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x203001_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x203001_OnEnterArea(sceneId, selfId, zoneId)

	
end

function x203001_OnLeaveArea(sceneId, selfId )
	
end

function x203001_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x203001_OnItemChanged(sceneId, selfId, itemdataId)

end


--**********************************

--��ʱ��

--**********************************

function x203001_OnScneneTimer(sceneId, selfId)
	if x203001_g_PROTECTINFO.Step == 1   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x203001_g_Name  then
				HeadNPCID = nMonsterId
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((203001), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x203001_g_PROTECTINFO.Step = 2
	end
	if x203001_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x203001_g_PROTECTINFO.StartTime >= 10   then
			x203001_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x203001_g_PROTECTINFO.Step == 3   then
		SetPatrolId(sceneId, x203001_g_husongid, 0)
		x203001_g_PROTECTINFO.Step = 4
	end
	-- ���͹���
	if x203001_g_PROTECTINFO.Step == 4   then
		if x203001_g_husongobj < 1   then
			x203001_CloseTimer(sceneId, x203001_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		if x203001_g_husongobj ~= 0   then
			local targetX, targetZ = GetWorldPos(sceneId, x203001_g_husongid)
			for i=1, x203001_g_PROTECTINFO.PlayerNum  do
				if x203001_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x203001_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					if distance1 > 20    then
						BeginEvent(sceneId)
						strText = x203001_g_MissionName.."  ʧ��"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x203001_g_PROTECTINFO.PlayerId[i])
						x203001_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
			local targetX, targetZ = GetWorldPos(sceneId, x203001_g_husongid)
			--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
			local x,z =177.8,101.9
			local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
			if distance<=1  then
				for i=1, x203001_g_PROTECTINFO.PlayerNum  do
					if x203001_g_PROTECTINFO.PlayerId[i]~=0   then
						if IsHaveMission(sceneId,x203001_g_PROTECTINFO.PlayerId[i],x203001_g_MissionId) > 0 then
							local misIndex = GetMissionIndexByID(sceneId, x203001_g_PROTECTINFO.PlayerId[i], x203001_g_MissionId)
							SetMissionByIndex(sceneId,x203001_g_PROTECTINFO.PlayerId[i],misIndex,0,1)
							BeginEvent(sceneId)
							AddText(sceneId,format("    �������ݵ�������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,x203001_g_PROTECTINFO.PlayerId[i])
						end
					end
				end
				x203001_g_PROTECTINFO.Step = 5
				x203001_CloseTimer(sceneId, x203001_g_PROTECTINFO.ScneneTimerIndex)
			end								
		end
	end
end


--**********************************
--�رռ�ʱ��
--**********************************
function x203001_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x203001_g_PROTECTINFO.ScneneTimerIndex = -1
	x203001_g_PROTECTINFO.Step = 0
	x203001_g_PROTECTINFO.StartTime = 0
	x203001_g_PROTECTINFO.PlayerNum = 0
	for i =1, getn(x203001_g_PROTECTINFO.PlayerId) do
		x203001_g_PROTECTINFO.PlayerId[i]=0
	end
	x203001_g_husongobj = 0
	SetPatrolId(sceneId, x203001_g_husongid, -1)
	
end