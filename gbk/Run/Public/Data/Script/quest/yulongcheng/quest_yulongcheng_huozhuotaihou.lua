--��׽̫��

--MisDescBegin
x208009_g_ScriptId = 208009
x208009_g_MissionIdPre =62
x208009_g_MissionId = 63
x208009_g_MissionKind = 12
x208009_g_MissionLevel = 60
--x208009_g_ScriptIdNext = {ScriptId = 207007 ,LV = 1 }
x208009_g_Name	="�ٲ�̨" 
x208009_g_Name2	="ͺ��̫��" 
x208009_g_noDemandItem ={}
x208009_g_DemandKill ={{id=316,num=15}}
x208009_g_MissionName="��׽̫��"
x208009_g_MissionInfo="    ���ǵĵ�һ�ݶӹ����˳ǳأ����˳��ţ����ǵ���³�����������ǻʹ�����ߴ����ɼ�˼���Ѿ�������ܸ���ʲô���ۣ�һ��Ҫ�ҳ�ħڭħ���������������������ټ�������û���ҵ�����������ʿ��������������ģ��#Gͺ��̫��#W���ڣ�96��52��������ȥ�����ǽ��𣬻�׽̫��"
x208009_g_MissionTarget="    ɱ��15��#R������������#W����׽#Gͺ��̫��#W�����ظ�#G�ٲ�̨#W��"		
x208009_g_MissionComplete="    ͺ��̫���Ѿ���������Ѻ���һᾡ������������һ��֪��ħڭħ���ӵ����䡣"					--�������npc˵���Ļ�
x208009_g_ContinueInfo = "    ͺ��̫���лʹ��������ţ���ҪС��Ϊ�ϡ�"

--������
--��Ǯ����
x208009_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208009_g_RadioItemBonus={}

--MisDescEnd
x208009_g_ExpBonus = 1000

if x208009_g_husongobj == nil then
	x208009_g_husongobj = 0
end
if x208009_g_husongid == nil then
	x208009_g_husongid = 0
end
if x208009_g_PROTECTINFO == nil then
	x208009_g_PROTECTINFO={ScneneTimerIndex = -1, Step = 0, StartTime = 0, PlayerNum = 0, PlayerId= {0,0,0,0,0,0}}
end
--**********************************

--������ں���

--**********************************

function x208009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208009_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x208009_g_MissionId)
		if (GetName(sceneId,targetId)==x208009_g_Name) then
			if x208009_CheckSubmit(sceneId, selfId, targetId) > 0 then
				BeginEvent(sceneId)
	                	AddText(sceneId,"#Y"..x208009_g_MissionName)
				AddText(sceneId,x208009_g_MissionComplete)
				AddMoneyBonus(sceneId, x208009_g_MoneyBonus)
				EndEvent()
	                	DispatchMissionContinueInfo(sceneId, selfId, targetId, x208009_g_ScriptId, x208009_g_MissionId)
	               else
				BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x208009_g_MissionName)
				AddText(sceneId,x208009_g_ContinueInfo)
				AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x208009_g_MissionTarget) 
				AddText(sceneId,format("    ��ͺ���ʺ�����ٲ�̨��   %d/1\n    ɱ��������������   %d/15", GetMissionParam(sceneId,selfId,misIndex,0), GetMissionParam(sceneId,selfId,misIndex,1) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
		end
		if (GetName(sceneId,targetId)==x208009_g_Name2) then
			if x208009_g_husongobj == 0 then
				BeginEvent(sceneId)
				AddText(sceneId,"������·��")
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
				if x208009_g_PROTECTINFO.Step == 0  then
					x208009_g_husongobj = 1
	        			x208009_g_PROTECTINFO.PlayerNum = 1                    
					x208009_g_PROTECTINFO.PlayerId[1] = selfId             
                        		x208009_g_PROTECTINFO.Step = 1                         
					x208009_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
					x208009_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 208009, "OnScneneTimer", 1)
	        	
				elseif x208009_g_PROTECTINFO.Step == 2  then
					if x208009_g_PROTECTINFO.PlayerNum > 5  then
						return
					end
					x208009_g_PROTECTINFO.PlayerNum = x208009_g_PROTECTINFO.PlayerNum + 1
					x208009_g_PROTECTINFO.PlayerId[x208009_g_PROTECTINFO.PlayerNum] = selfId
					
				end	
			elseif x208009_g_husongobj ~= 0 then 
				BeginEvent(sceneId)
				strText = "#Y���ڲ��ܽ��������"
				AddText(sceneId,strText)
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		end
        elseif x208009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208009_g_MissionName)
                AddText(sceneId,x208009_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208009_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208009_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208009_g_ScriptId, x208009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208009_g_ScriptId, x208009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208009_CheckAccept(sceneId, selfId, targetId)
	
	if (GetName(sceneId,targetId)==x208009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208009_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==8) then
		if IsMissionHaveDone(sceneId, selfId, x208009_g_MissionIdPre) > 0 then
			if (GetName(sceneId,targetId)==x208009_g_Name) then 
				return 1
			end
			if (GetName(sceneId,targetId)==x208009_g_Name2) then 
				x208009_g_husongid = targetId
					if x208009_g_husongobj == 0 then
						if IsHaveMission(sceneId,selfId, x208009_g_MissionId) > 0 then
							misIndex = GetMissionIndexByID(sceneId,selfId,x208009_g_MissionId)
							if GetMissionParam(sceneId,selfId,misIndex,0) == 0 then
								return 1
							end
						end
					end
			end
			
		end
	end
	return 0
	
end

--**********************************

--����

--**********************************

function x208009_OnAccept(sceneId, selfId)
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x208009_g_MissionId, x208009_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x208009_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x208009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208009_g_MissionId)
	for i=1, x208009_g_PROTECTINFO.PlayerNum  do
		if x208009_g_PROTECTINFO.PlayerId[i] == selfId  then
			x208009_g_PROTECTINFO.PlayerId[i] = 0
		end
	end
	for i, item in pairs(x208009_g_noDemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end
end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208009_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208009_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
		if GetMissionParam(sceneId,selfId,misIndex,1) == x208009_g_DemandKill[1].num then
			return 1
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208009_g_MissionId)
		AddExp(sceneId, selfId, x208009_g_ExpBonus)
		AddMoney(sceneId, selfId, x208009_g_MoneyBonus)
		for i, item in pairs(x208009_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        --CallScriptFunction( x208009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x208009_OnKillObject(sceneId, selfId, objdataId)
	if IsHaveMission(sceneId, selfId, x208009_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x208009_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,1) 
	 	 if objdataId == x208009_g_DemandKill[1].id then 
       		    if num < x208009_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x208009_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       	end
end



--**********************************

--���������¼�

--**********************************

function x208009_OnEnterArea(sceneId, selfId, zoneId)
	
end

function x208009_OnLeaveArea(sceneId, selfId )
	
end

function x208009_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x208009_OnItemChanged(sceneId, selfId, itemdataId)

end


--**********************************

--��ʱ��

--**********************************

function x208009_OnScneneTimer(sceneId, selfId)
	if x208009_g_PROTECTINFO.Step == 1   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x208009_g_Name  then
				HeadNPCID = nMonsterId
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((208009), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x208009_g_PROTECTINFO.Step = 2
	end
	if x208009_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x208009_g_PROTECTINFO.StartTime >= 10   then
			x208009_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x208009_g_PROTECTINFO.Step == 3   then
		SetPatrolId(sceneId, x208009_g_husongid, 2)
		x208009_g_PROTECTINFO.Step = 4
	end
	-- ���͹���
	if x208009_g_PROTECTINFO.Step == 4   then
		if x208009_g_husongobj < 1   then
			x208009_CloseTimer(sceneId, x208009_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		if x208009_g_husongobj ~= 0   then
			local targetX, targetZ = GetWorldPos(sceneId, x208009_g_husongid)
			for i=1, x208009_g_PROTECTINFO.PlayerNum  do
				if x208009_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x208009_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					if distance1 > 20    then
						BeginEvent(sceneId)
						strText = x208009_g_MissionName.."  ʧ��"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x208009_g_PROTECTINFO.PlayerId[i])
						x208009_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
			local targetX, targetZ = GetWorldPos(sceneId, x208009_g_husongid)
			--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
			local x,z =70.9,180.6
			local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
			if distance<=1  then
				for i=1, x208009_g_PROTECTINFO.PlayerNum  do
					if x208009_g_PROTECTINFO.PlayerId[i]~=0   then
						if IsHaveMission(sceneId,x208009_g_PROTECTINFO.PlayerId[i],x208009_g_MissionId) > 0 then
							local misIndex = GetMissionIndexByID(sceneId, x208009_g_PROTECTINFO.PlayerId[i], x208009_g_MissionId)
							SetMissionByIndex(sceneId,x208009_g_PROTECTINFO.PlayerId[i],misIndex,0,1)
							BeginEvent(sceneId)
							AddText(sceneId,format("��ͺ���ʺ�����ٲ�̨��   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,x208009_g_PROTECTINFO.PlayerId[i])
						end
					end
				end
				x208009_g_PROTECTINFO.Step = 5
				x208009_CloseTimer(sceneId, x208009_g_PROTECTINFO.ScneneTimerIndex)
			end								
		end
	end
end


--**********************************
--�رռ�ʱ��
--**********************************
function x208009_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x208009_g_PROTECTINFO.ScneneTimerIndex = -1
	x208009_g_PROTECTINFO.Step = 0
	x208009_g_PROTECTINFO.StartTime = 0
	x208009_g_PROTECTINFO.PlayerNum = 0
	for i =1, getn(x208009_g_PROTECTINFO.PlayerId) do
		x208009_g_PROTECTINFO.PlayerId[i]=0
	end
	x208009_g_husongobj = 0
	SetPatrolId(sceneId, x208009_g_husongid, -1)
end