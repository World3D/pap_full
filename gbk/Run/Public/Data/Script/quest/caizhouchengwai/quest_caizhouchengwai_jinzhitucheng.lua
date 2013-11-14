--��ֹ����

--MisDescBegin
x207009_g_ScriptId = 207009
x207009_g_MissionIdPre =270
x207009_g_MissionId = 271
x207009_g_MissionKind = 18
x207009_g_MissionLevel = 75
--x207009_g_ScriptIdNext = {ScriptId = 207007 ,LV = 1 }
x207009_g_Name	="�ٲ�̨" 
x207009_g_Name2	="Ү�ɳ���" 
x207009_g_MissionName="��ֹ����"
x207009_g_MissionInfo="    ��Ȼ��ʦ��ô˵����Ͱ���������͵�#GҮ�ɳ���#W�ǰɡ�"
x207009_g_MissionTarget="    ���뽵�Ľ��Ԫ˧�����͵�#GҮ�ɳ���#W��Ӫ�ء�"		
x207009_g_MissionComplete="    һ·�����ˡ�"					--�������npc˵���Ļ�
x207009_g_ContinueInfo = "    ���Ԫ˧�����أ�"

--������
--��Ǯ����
x207009_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207009_g_RadioItemBonus={}

--MisDescEnd
x207009_g_ExpBonus = 1000
if x207009_g_husongobj == nil then
	x207009_g_husongobj = 0
end
if x207009_g_PROTECTINFO == nil then
	x207009_g_PROTECTINFO={ScneneTimerIndex = -1, Step = 0, StartTime = 0, PlayerNum = 0, PlayerId= {0,0,0,0,0,0}}
end
--**********************************

--������ں���

--**********************************

function x207009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207009_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x207009_g_MissionId)
		if x207009_CheckSubmit(sceneId, selfId, targetId) > 0 then
			BeginEvent(sceneId)
                	AddText(sceneId,"#Y"..x207009_g_MissionName)
			AddText(sceneId,x207009_g_MissionComplete)
			AddMoneyBonus(sceneId, x207009_g_MoneyBonus)
			EndEvent()
                	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207009_g_ScriptId, x207009_g_MissionId)
               else
			BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207009_g_MissionName)
			AddText(sceneId,x207009_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207009_g_MissionTarget) 
			AddText(sceneId,format("\n    ���ͽ��Ԫ˧������Ү�ɳ��Ĵ�   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end
        elseif x207009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207009_g_MissionName)
                AddText(sceneId,x207009_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207009_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207009_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207009_g_ScriptId, x207009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207009_g_ScriptId, x207009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207009_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==7) then
		if IsMissionHaveDone(sceneId, selfId, x207009_g_MissionIdPre) > 0 then
			if (GetName(sceneId,targetId)==x207009_g_Name) then 
				if IsHaveMission(sceneId,selfId, x207009_g_MissionId) <= 0 then
					return 1
				end
			end
			if (GetName(sceneId,targetId)==x207009_g_Name2) then 
				if IsHaveMission(sceneId,selfId, x207009_g_MissionId) > 0 then
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

function x207009_OnAccept(sceneId, selfId)
	if x207009_g_husongobj == 0 then
		if x207009_g_PROTECTINFO.Step == 0  then
			x207009_g_husongobj = LuaFnCreateMonster(sceneId,69,218,122.6,0,1,-1)
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x207009_g_MissionId, x207009_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x207009_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			x207009_g_PROTECTINFO.PlayerNum = 1                    
			x207009_g_PROTECTINFO.PlayerId[1] = selfId             
                        x207009_g_PROTECTINFO.Step = 1                         
			x207009_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
			x207009_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 207009, "OnScneneTimer", 1)
			
	       
		elseif x207009_g_PROTECTINFO.Step == 2  then
			if x207009_g_PROTECTINFO.PlayerNum > 5  then
				return
			end
			x207009_g_PROTECTINFO.PlayerNum = x207009_g_PROTECTINFO.PlayerNum + 1
			x207009_g_PROTECTINFO.PlayerId[x207009_g_PROTECTINFO.PlayerNum] = selfId
			BeginEvent(sceneId)
			AddMission( sceneId, selfId, x207009_g_MissionId, x207009_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x207009_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		end	
	elseif x207009_g_husongobj ~= 0 then 
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

function x207009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207009_g_MissionId)
	for i=1, x207009_g_PROTECTINFO.PlayerNum  do
		if x207009_g_PROTECTINFO.PlayerId[i] == selfId  then
			x207009_g_PROTECTINFO.PlayerId[i] = 0
		end
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207009_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207009_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207009_g_MissionId)
		AddExp(sceneId, selfId, x207009_g_ExpBonus)
		AddMoney(sceneId, selfId, x207009_g_MoneyBonus)
		for i, item in pairs(x207009_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        --CallScriptFunction( x207009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207009_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207009_OnItemChanged(sceneId, selfId, itemdataId)

end


--**********************************

--��ʱ��

--**********************************

function x207009_OnScneneTimer(sceneId, selfId)
	if x207009_g_PROTECTINFO.Step == 1   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x207009_g_Name  then
				HeadNPCID = nMonsterId
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((207009), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x207009_g_PROTECTINFO.Step = 2
	end
	if x207009_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x207009_g_PROTECTINFO.StartTime >= 10   then
			x207009_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x207009_g_PROTECTINFO.Step == 3   then
		SetPatrolId(sceneId, x207009_g_husongobj, 0)
		x207009_g_PROTECTINFO.Step = 4
	end
	-- ���͹���
	if x207009_g_PROTECTINFO.Step == 4   then
		if x207009_g_husongobj < 1   then
			x207009_CloseTimer(sceneId, x207009_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		if x207009_g_husongobj ~= 0   then
			local targetX, targetZ = GetWorldPos(sceneId, x207009_g_husongobj)
			for i=1, x207009_g_PROTECTINFO.PlayerNum  do
				if x207009_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x207009_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					if distance1 > 20    then
						BeginEvent(sceneId)
						strText = x207009_g_MissionName.."  ʧ��"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x207009_g_PROTECTINFO.PlayerId[i])
						x207009_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
			local targetX, targetZ = GetWorldPos(sceneId, x207009_g_husongobj)
			--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
			local x,z =209.1229,218.0926
			local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
			if distance<=1  then
				for i=1, x207009_g_PROTECTINFO.PlayerNum  do
					if x207009_g_PROTECTINFO.PlayerId[i]~=0   then
						if IsHaveMission(sceneId,x207009_g_PROTECTINFO.PlayerId[i],x207009_g_MissionId) > 0 then
							local misIndex = GetMissionIndexByID(sceneId, x207009_g_PROTECTINFO.PlayerId[i], x207009_g_MissionId)
							SetMissionByIndex(sceneId,x207009_g_PROTECTINFO.PlayerId[i],misIndex,0,1)
							BeginEvent(sceneId)
							AddText(sceneId,format("    ���ͽ��Ԫ˧������Ү�ɳ��Ĵ�   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,x207009_g_PROTECTINFO.PlayerId[i])
						end
					end
				end
				LuaFnDeleteMonster (sceneId,x207009_g_husongobj )
				x207009_g_PROTECTINFO.Step = 5
				x207009_CloseTimer(sceneId, x207009_g_PROTECTINFO.ScneneTimerIndex)
			end								
		end
	end
end


--**********************************
--�رռ�ʱ��
--**********************************
function x207009_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x207009_g_PROTECTINFO.ScneneTimerIndex = -1
	x207009_g_PROTECTINFO.Step = 0
	x207009_g_PROTECTINFO.StartTime = 0
	x207009_g_PROTECTINFO.PlayerNum = 0
	for i =1, #(x207009_g_PROTECTINFO.PlayerId) do
		x207009_g_PROTECTINFO.PlayerId[i]=0
	end
	x207009_g_husongobj = 0
end