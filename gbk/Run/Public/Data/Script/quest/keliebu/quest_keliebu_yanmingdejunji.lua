--�����ľ���

--MisDescBegin
x202009_g_ScriptId = 202009
--x202009_g_MissionIdPre =6
x202009_g_MissionId = 128
x202009_g_MissionKind = 4
x202009_g_MissionLevel = 20
--x202009_g_ScriptIdNext = {ScriptId = 207007 ,LV = 1 }
x202009_g_Name	="�����" 
x202009_g_Name2	="��ľ��" 
x202009_g_husongName	="�����ľ���" 
x202009_g_MissionName="�����ľ���"
x202009_g_MissionInfo="    ����̳����ľ������壬��Ӧ�õ���ߵ����أ�������������һս�У�����ս�۽�������ʹ����������񣬾�Ϊ���У��������챧����Ů�����£�Υ������ľ��֮ǰ���µľ��͡�\n \n    Ҫ�ڲ�ԭ��Ϊǿ�ߣ�һ��Ҫ��һ֧�����絶�ľ��ӣ�������ӣ�����Ҫ�������ľ��ͣ��κ��˷�����Ҫ���ͷ���    ����̳������һ����ϸ������ߣ��Ұ�����ץס�ˣ��������͵�#G��ľ��#W�����"
x202009_g_MissionTarget="    �Ѽ�ϸѺ�͵�#G��ľ��#W���"		
x202009_g_MissionComplete="    ������������"					--�������npc˵���Ļ�
x202009_g_ContinueInfo = "    ������������"

--������
--��Ǯ����
x202009_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202009_g_RadioItemBonus={}

--MisDescEnd
x202009_g_ExpBonus = 6500
if x202009_g_husongobj == nil then
	x202009_g_husongobj = 0
end
if x202009_g_PROTECTINFO == nil then
	x202009_g_PROTECTINFO={ScneneTimerIndex = -1, Step = 0, StartTime = 0, PlayerNum = 0, PlayerId= {0,0,0,0,0,0}}
end
--**********************************

--������ں���

--**********************************

function x202009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202009_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x202009_g_MissionId)
		if x202009_CheckSubmit(sceneId, selfId, targetId) > 0 then
			BeginEvent(sceneId)
                	AddText(sceneId,"#Y"..x202009_g_MissionName)
			AddText(sceneId,x202009_g_MissionComplete)
			AddMoneyBonus(sceneId, x202009_g_MoneyBonus)
                	EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x202009_g_ScriptId, x202009_g_MissionId)
               else
			BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202009_g_MissionName)
			AddText(sceneId,x202009_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202009_g_MissionTarget) 
			AddText(sceneId,format("\n    Ѻ�ͷ�²����ľ�洦   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end
        elseif x202009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202009_g_MissionName)
                AddText(sceneId,x202009_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202009_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202009_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202009_g_ScriptId, x202009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202009_g_ScriptId, x202009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202009_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==2) then
		if (GetName(sceneId,targetId)==x202009_g_Name) then 
			if IsHaveMission(sceneId,selfId, x202009_g_MissionId) <= 0 then
				return 1
			end
		end
		if (GetName(sceneId,targetId)==x202009_g_Name2) then 
			if IsHaveMission(sceneId,selfId, x202009_g_MissionId) > 0 then
				return 1
			end
		end
	end
	return 0
	
end

--**********************************

--����

--**********************************

function x202009_OnAccept(sceneId, selfId)
	if x202009_g_husongobj == 0 then
		if x202009_g_PROTECTINFO.Step == 0  then
			x202009_g_husongobj = LuaFnCreateMonster(sceneId,47,191.8718,229.6764,0,1,-1)
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x202009_g_MissionId, x202009_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x202009_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			x202009_g_PROTECTINFO.PlayerNum = 1                    
			x202009_g_PROTECTINFO.PlayerId[1] = selfId             
                        x202009_g_PROTECTINFO.Step = 1                         
			x202009_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
			x202009_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 202009, "OnScneneTimer", 1)
			
	       
		elseif x202009_g_PROTECTINFO.Step == 2  then
			if x202009_g_PROTECTINFO.PlayerNum > 5  then
				return
			end
			x202009_g_PROTECTINFO.PlayerNum = x202009_g_PROTECTINFO.PlayerNum + 1
			x202009_g_PROTECTINFO.PlayerId[x202009_g_PROTECTINFO.PlayerNum] = selfId
			BeginEvent(sceneId)
			AddMission( sceneId, selfId, x202009_g_MissionId, x202009_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x202009_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		end	
	elseif x202009_g_husongobj ~= 0 then 
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

function x202009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202009_g_MissionId)
	for i=1, x202009_g_PROTECTINFO.PlayerNum  do
		if x202009_g_PROTECTINFO.PlayerId[i] == selfId  then
			x202009_g_PROTECTINFO.PlayerId[i] = 0
		end
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202009_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202009_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202009_g_MissionId)
		AddExp(sceneId, selfId, x202009_g_ExpBonus)
		AddMoney(sceneId, selfId, x202009_g_MoneyBonus)
		for i, item in x202009_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        --CallScriptFunction( x202009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x202009_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x202009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202009_OnItemChanged(sceneId, selfId, itemdataId)

end


--**********************************

--��ʱ��

--**********************************

function x202009_OnScneneTimer(sceneId, selfId)
	if x202009_g_PROTECTINFO.Step == 1   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x202009_g_Name  then
				HeadNPCID = nMonsterId
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((202009), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x202009_g_PROTECTINFO.Step = 2
	end
	if x202009_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x202009_g_PROTECTINFO.StartTime >= 10   then
			x202009_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x202009_g_PROTECTINFO.Step == 3   then
		SetPatrolId(sceneId, x202009_g_husongobj, 0)
		x202009_g_PROTECTINFO.Step = 4
	end
	-- ���͹���
	if x202009_g_PROTECTINFO.Step == 4   then
		if x202009_g_husongobj < 1   then
			x202009_CloseTimer(sceneId, x202009_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		if x202009_g_husongobj ~= 0   then
			local targetX, targetZ = GetWorldPos(sceneId, x202009_g_husongobj)
			for i=1, x202009_g_PROTECTINFO.PlayerNum  do
				if x202009_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x202009_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					if distance1 > 20    then
						BeginEvent(sceneId)
						strText = x202009_g_MissionName.."  ʧ��"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x202009_g_PROTECTINFO.PlayerId[i])
						x202009_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
			local targetX, targetZ = GetWorldPos(sceneId, x202009_g_husongobj)
			--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
			local x,z =226.6480,224.2180
			local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
			if distance<=1  then
				for i=1, x202009_g_PROTECTINFO.PlayerNum  do
					if x202009_g_PROTECTINFO.PlayerId[i]~=0   then
						if IsHaveMission(sceneId,x202009_g_PROTECTINFO.PlayerId[i],x202009_g_MissionId) > 0 then
							local misIndex = GetMissionIndexByID(sceneId, x202009_g_PROTECTINFO.PlayerId[i], x202009_g_MissionId)
							SetMissionByIndex(sceneId,x202009_g_PROTECTINFO.PlayerId[i],misIndex,0,1)
							BeginEvent(sceneId)
							AddText(sceneId,format("    Ѻ�ͷ�²����ľ�洦   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,x202009_g_PROTECTINFO.PlayerId[i])
						end
					end
				end
				LuaFnDeleteMonster (sceneId,x202009_g_husongobj )
				x202009_g_PROTECTINFO.Step = 5
				x202009_CloseTimer(sceneId, x202009_g_PROTECTINFO.ScneneTimerIndex)
			end								
		end
	end
end


--**********************************
--�رռ�ʱ��
--**********************************
function x202009_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x202009_g_PROTECTINFO.ScneneTimerIndex = -1
	x202009_g_PROTECTINFO.Step = 0
	x202009_g_PROTECTINFO.StartTime = 0
	x202009_g_PROTECTINFO.PlayerNum = 0
	for i =1, getn(x202009_g_PROTECTINFO.PlayerId) do
		x202009_g_PROTECTINFO.PlayerId[i]=0
	end
	x202009_g_husongobj = 0
end