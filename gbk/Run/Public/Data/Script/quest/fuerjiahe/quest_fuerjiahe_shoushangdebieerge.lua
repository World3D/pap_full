--���˵ı����

--MisDescBegin
x223013_g_ScriptId = 223013
x223013_g_MissionIdPre =304
x223013_g_MissionId = 305
x223013_g_MissionKind = 20
x223013_g_MissionLevel = 100
--x223013_g_ScriptIdNext = {ScriptId = 207007 ,LV = 1 }
x223013_g_Name	="�����" 
x223013_g_Name2	="�ٲ�̨" 
x223013_g_MissionName="���˵ı����"
x223013_g_MissionInfo="    �ղ��˷������ǵ�ʱ��Ϊ�����ֵ������г��ˣ������������ǵ�ע�����������������ˣ��Ѿ��޷���ɱ��Щ�ղ����ˡ���ʿ�����ܻ����һص�Ӫ����"
x223013_g_MissionTarget="    ���ͱ���絽�ɾ�Ӫ�غ���#G�ٲ�̨#W������"		
x223013_g_MissionComplete="    ������Ѿ������ˣ������������ˡ���л�㣬û����ĳ��ֻ����Ҿͼ������ҵ��ֵ��ˣ���Ƿ��һ���飡"					--�������npc˵���Ļ�
x223013_g_ContinueInfo = "    ���������������ˣ������أ�"

--������
--��Ǯ����
x223013_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x223013_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223013_g_RadioItemBonus={}

--MisDescEnd
x223013_g_ExpBonus = 1000

if x223013_g_husongobj == nil then
	x223013_g_husongobj = 0
end
if x223013_g_husongid == nil then
	x223013_g_husongid = 0
end
if x223013_g_PROTECTINFO == nil then
	x223013_g_PROTECTINFO={ScneneTimerIndex = -1, Step = 0, StartTime = 0, PlayerNum = 0, PlayerId= {0,0,0,0,0,0}}
end
--**********************************

--������ں���

--**********************************

function x223013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223013_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223013_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x223013_g_MissionId)
		if x223013_CheckSubmit(sceneId, selfId, targetId) > 0 then
			BeginEvent(sceneId)
                	AddText(sceneId,"#Y"..x223013_g_MissionName)
			AddText(sceneId,x223013_g_MissionComplete)
			AddMoneyBonus(sceneId, x223013_g_MoneyBonus)
			EndEvent()
                	DispatchMissionContinueInfo(sceneId, selfId, targetId, x223013_g_ScriptId, x223013_g_MissionId)
               else
			BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223013_g_MissionName)
			AddText(sceneId,x223013_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223013_g_MissionTarget) 
			AddText(sceneId,format("\n    ���ͱ���絽�ɾ�Ӫ��   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end
        elseif x223013_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223013_g_MissionName)
                AddText(sceneId,x223013_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223013_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223013_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223013_g_ScriptId, x223013_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223013_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223013_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223013_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223013_g_ScriptId, x223013_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223013_CheckAccept(sceneId, selfId, targetId)
	
	if (GetName(sceneId,targetId)==x223013_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223013_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==17) then
		if IsMissionHaveDone(sceneId, selfId, x223013_g_MissionIdPre) > 0 then
			if (GetName(sceneId,targetId)==x223013_g_Name) then 
				x223013_g_husongid = targetId
				if IsHaveMission(sceneId,selfId, x223013_g_MissionId) <= 0 then
					if x223013_g_husongobj == 0 then
						return 1
					end
				end
			end
			if (GetName(sceneId,targetId)==x223013_g_Name2) then 
				if x223013_g_husongobj == 0 then
					SetPatrolId(sceneId, x223013_g_husongid, -1)
					if IsHaveMission(sceneId,selfId, x223013_g_MissionId) > 0 then
						return 1
					end
				end
				if x223013_g_husongobj == 1 then
					if IsHaveMission(sceneId,selfId, x223013_g_MissionId) > 0 then
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

function x223013_OnAccept(sceneId, selfId)
	if x223013_g_husongobj == 0 then
		if x223013_g_PROTECTINFO.Step == 0  then
			x223013_g_husongobj = 1
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x223013_g_MissionId, x223013_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x223013_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			x223013_g_PROTECTINFO.PlayerNum = 1                    
			x223013_g_PROTECTINFO.PlayerId[1] = selfId             
                        x223013_g_PROTECTINFO.Step = 1                         
			x223013_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
			x223013_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 223013, "OnScneneTimer", 1)
	        	
			
			
	       
		elseif x223013_g_PROTECTINFO.Step == 2  then
			if x223013_g_PROTECTINFO.PlayerNum > 5  then
				return
			end
			x223013_g_PROTECTINFO.PlayerNum = x223013_g_PROTECTINFO.PlayerNum + 1
			x223013_g_PROTECTINFO.PlayerId[x223013_g_PROTECTINFO.PlayerNum] = selfId
			BeginEvent(sceneId)
			AddMission( sceneId, selfId, x223013_g_MissionId, x223013_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x223013_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		end	
	elseif x223013_g_husongobj ~= 0 then 
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

function x223013_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223013_g_MissionId)
	for i=1, x223013_g_PROTECTINFO.PlayerNum  do
		if x223013_g_PROTECTINFO.PlayerId[i] == selfId  then
			x223013_g_PROTECTINFO.PlayerId[i] = 0
		end
	end
	
end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223013_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223013_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223013_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x223013_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223013_g_MissionId)
		AddExp(sceneId, selfId, x223013_g_ExpBonus)
		AddMoney(sceneId, selfId, x223013_g_MoneyBonus)
		for i, item in x223013_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        --CallScriptFunction( x223013_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x223013_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************





--**********************************

--���߸ı�

--**********************************

function x223013_OnItemChanged(sceneId, selfId, itemdataId)

end


--**********************************

--��ʱ��

--**********************************

function x223013_OnScneneTimer(sceneId, selfId)
	if x223013_g_PROTECTINFO.Step == 1   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x223013_g_Name  then
				HeadNPCID = nMonsterId
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((223013), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x223013_g_PROTECTINFO.Step = 2
	end
	if x223013_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x223013_g_PROTECTINFO.StartTime >= 10   then
			x223013_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x223013_g_PROTECTINFO.Step == 3   then
		SetPatrolId(sceneId, x223013_g_husongid, 0)
		x223013_g_PROTECTINFO.Step = 4
	end
	-- ���͹���
	if x223013_g_PROTECTINFO.Step == 4   then
		if x223013_g_husongobj < 1   then
			x223013_CloseTimer(sceneId, x223013_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		if x223013_g_husongobj ~= 0   then
			local targetX, targetZ = GetWorldPos(sceneId, x223013_g_husongid)
			for i=1, x223013_g_PROTECTINFO.PlayerNum  do
				if x223013_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x223013_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					if distance1 > 20    then
						BeginEvent(sceneId)
						strText = x223013_g_MissionName.."  ʧ��"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x223013_g_PROTECTINFO.PlayerId[i])
						x223013_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
			local targetX, targetZ = GetWorldPos(sceneId, x223013_g_husongid)
			--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
			local x,z =39.9,211.1
			local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
			if distance<=1  then
				for i=1, x223013_g_PROTECTINFO.PlayerNum  do
					if x223013_g_PROTECTINFO.PlayerId[i]~=0   then
						if IsHaveMission(sceneId,x223013_g_PROTECTINFO.PlayerId[i],x223013_g_MissionId) > 0 then
							local misIndex = GetMissionIndexByID(sceneId, x223013_g_PROTECTINFO.PlayerId[i], x223013_g_MissionId)
							SetMissionByIndex(sceneId,x223013_g_PROTECTINFO.PlayerId[i],misIndex,0,1)
							BeginEvent(sceneId)
							AddText(sceneId,format("    ���ͱ���絽�ɾ�Ӫ��   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,x223013_g_PROTECTINFO.PlayerId[i])
						end
					end
				end
				x223013_g_PROTECTINFO.Step = 5
				x223013_CloseTimer(sceneId, x223013_g_PROTECTINFO.ScneneTimerIndex)
			end								
		end
	end
end


--**********************************
--�رռ�ʱ��
--**********************************
function x223013_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x223013_g_PROTECTINFO.ScneneTimerIndex = -1
	x223013_g_PROTECTINFO.Step = 0
	x223013_g_PROTECTINFO.StartTime = 0
	x223013_g_PROTECTINFO.PlayerNum = 0
	for i =1, getn(x223013_g_PROTECTINFO.PlayerId) do
		x223013_g_PROTECTINFO.PlayerId[i]=0
	end
	x223013_g_husongobj = 0
	SetPatrolId(sceneId, x223013_g_husongid, -1)
end