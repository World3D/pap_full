--����ʹ��

--MisDescBegin
x206009_g_ScriptId = 206009
x206009_g_MissionIdPre =35
x206009_g_MissionId = 36
x206009_g_MissionKind = 8
x206009_g_MissionLevel = 40
x206009_g_ScriptIdNext = {ScriptId = 206010 ,LV = 1 }
x206009_g_Name	="�ɼ�˼��" 
x206009_g_Name2	="����̨" 
x206009_g_husongName	="��������" 

x206009_g_MissionName="����ʹ��"
x206009_g_MissionInfo="    �����ҵ�һ�μ����ɼ�˼������û���������������������࣬����һ���ĺͰ������Ҽ�������̵ľ��������۾��������˼ᶨ�����Ϻ��ǻۡ�\n \n    ���󺹿�������������ʦ���Ƽ��ŵ�ʱ��������������࣬������ȴ�о����������۾������һ���ɻ����۽ǵ�����ڲ��ϵĴ����ҡ�\n \n    ǧ����������飬���Ҹо��������ʹ��ƺ�����һЩ�Ҳ�֪�������ܡ��������������Ҷ����ˣ��ɼ�˼����Ȼ�������һ������İ�����������ȥȰ�����ҳ�����εĻ���ʹ�ߡ�"  --��������
x206009_g_MissionTarget="    �����������˳ɼ�˼���Ŀ��ͣ��ҵ������Ǳ����ù������������͵�������#G����̨#W����"		
x206009_g_MissionComplete="    ��֪������ô����ҵ����飬�󺹵�һ�μ�������Ȼ���һ�������ϲ�����ˣ����������Σ�����ʮ�ֵĸм���\n \n    ��ֻ��һ�����ˣ�һ�����ˣ�һ��ç�򣡻켣�������У��޷Ǿ���ϣ������һ��ֵ�����ε��ˡ�\n \n    ��һ�̿�ʼ�����Ѿ���������һ���������ɼ�˼��������Ҫ����֪��֮�����һ�����˽�ĵģ�Ҳ����Ϊ���һ������һ�����������Ǻ����������Ҳ���������һֱ͵͵���ղ��š�"					--�������npc˵���Ļ�
x206009_g_ContinueInfo = "    ���������Ǵ󺹵����İ���������"

--������
--��Ǯ����
x206009_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x206009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206009_g_RadioItemBonus={}

--MisDescEnd
x206009_g_ExpBonus = 1000

if x206009_g_PROTECTINFO == nil then
	x206009_g_PROTECTINFO={ScneneTimerIndex = -1, Step = 0, StartTime = 0, PlayerNum = 0, PlayerId= {0,0,0,0,0,0}}
end
if x206009_g_husongobj == nil then
	x206009_g_husongobj = 0
end


--**********************************

--������ں���

--**********************************

function x206009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206009_g_MissionId) > 0 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x206009_g_MissionId)
		if x206009_CheckSubmit(sceneId, selfId, targetId) > 0 then
			BeginEvent(sceneId)
                	AddText(sceneId,"#Y"..x206009_g_MissionName)
			AddText(sceneId,x206009_g_MissionComplete)
			AddMoneyBonus(sceneId, x206009_g_MoneyBonus)
                	EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x206009_g_ScriptId, x206009_g_MissionId)
               else
			BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x206009_g_MissionName)
			AddText(sceneId,x206009_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x206009_g_MissionTarget) 
			AddText(sceneId,format("    ���ͺ�������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end
        elseif x206009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206009_g_MissionName)
                AddText(sceneId,x206009_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206009_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206009_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206009_g_ScriptId, x206009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x206009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206009_g_ScriptId, x206009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x206009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x206009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206009_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==6) then
		if IsMissionHaveDone(sceneId, selfId, x206009_g_MissionIdPre) > 0 then
		        if (GetName(sceneId,targetId)==x206009_g_Name) then
		                if IsHaveMission(sceneId,selfId, x206009_g_MissionId)<= 0 then
		                    return 1
		                end
		        end
			if (GetName(sceneId,targetId)==x206009_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x206009_g_MissionId) > 0 then
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

function x206009_OnAccept(sceneId, selfId)
	if x206009_g_husongobj == 0 then
		if x206009_g_PROTECTINFO.Step == 0  then
			x206009_g_husongobj = LuaFnCreateMonster(sceneId,63,38.4042,100.1512,0,1,-1)
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x206009_g_MissionId, x206009_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x206009_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			x206009_g_PROTECTINFO.PlayerNum = 1                    
			x206009_g_PROTECTINFO.PlayerId[1] = selfId             
                        x206009_g_PROTECTINFO.Step = 1                         
			x206009_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
			x206009_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 206009, "OnScneneTimer", 1)
			
	       
		elseif x206009_g_PROTECTINFO.Step == 2  then
			if x206009_g_PROTECTINFO.PlayerNum > 5  then
				return
			end
			x206009_g_PROTECTINFO.PlayerNum = x206009_g_PROTECTINFO.PlayerNum + 1
			x206009_g_PROTECTINFO.PlayerId[x206009_g_PROTECTINFO.PlayerNum] = selfId
			BeginEvent(sceneId)
			AddMission( sceneId, selfId, x206009_g_MissionId, x206009_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x206009_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		end	
	elseif x206009_g_husongobj ~= 0 then 
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

function x206009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206009_g_MissionId)
	for i=1, x206009_g_PROTECTINFO.PlayerNum  do
		if x206009_g_PROTECTINFO.PlayerId[i] == selfId  then
			x206009_g_PROTECTINFO.PlayerId[i] = 0
		end
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206009_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x206009_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206009_g_MissionId)
		AddExp(sceneId, selfId, x206009_g_ExpBonus)
		AddMoney(sceneId, selfId, x206009_g_MoneyBonus)
		for i, item in x206009_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        CallScriptFunction( x206009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x206009_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x206009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206009_OnItemChanged(sceneId, selfId, itemdataId)

end


--**********************************

--��ʱ��

--**********************************

function x206009_OnScneneTimer(sceneId, selfId)
	if x206009_g_PROTECTINFO.Step == 1   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x206009_g_Name  then
				HeadNPCID = nMonsterId
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((206009), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x206009_g_PROTECTINFO.Step = 2
	end
	if x206009_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x206009_g_PROTECTINFO.StartTime >= 10   then
			x206009_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x206009_g_PROTECTINFO.Step == 3   then
		SetPatrolId(sceneId, x206009_g_husongobj, 0)
		x206009_g_PROTECTINFO.Step = 4
	end
	-- ���͹���
	if x206009_g_PROTECTINFO.Step == 4   then
		if x206009_g_husongobj < 1   then
			x206009_CloseTimer(sceneId, x206009_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		if x206009_g_husongobj ~= 0   then
			local targetX, targetZ = GetWorldPos(sceneId, x206009_g_husongobj)
			for i=1, x206009_g_PROTECTINFO.PlayerNum  do
				if x206009_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x206009_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					if distance1 > 20    then
						BeginEvent(sceneId)
						strText = x206009_g_MissionName.."  ʧ��"
						AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x206009_g_PROTECTINFO.PlayerId[i])
						x206009_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
			local targetX, targetZ = GetWorldPos(sceneId, x206009_g_husongobj)
			--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
			local x,z =159.7537,53.5807
			local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
			if distance<=1  then
				for i=1, x206009_g_PROTECTINFO.PlayerNum  do
					if x206009_g_PROTECTINFO.PlayerId[i]~=0   then
						if IsHaveMission(sceneId,x206009_g_PROTECTINFO.PlayerId[i],x206009_g_MissionId) > 0 then
							local misIndex = GetMissionIndexByID(sceneId, x206009_g_PROTECTINFO.PlayerId[i], x206009_g_MissionId)
							SetMissionByIndex(sceneId,x206009_g_PROTECTINFO.PlayerId[i],misIndex,0,1)
							BeginEvent(sceneId)
							AddText(sceneId,format("    ���ͺ�������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,x206009_g_PROTECTINFO.PlayerId[i])
						end
					end
				end
				LuaFnDeleteMonster (sceneId,x206009_g_husongobj )
				x206009_g_PROTECTINFO.Step = 5
				x206009_CloseTimer(sceneId, x206009_g_PROTECTINFO.ScneneTimerIndex)
			end								
		end
	end
end


--**********************************
--�رռ�ʱ��
--**********************************
function x206009_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x206009_g_PROTECTINFO.ScneneTimerIndex = -1
	x206009_g_PROTECTINFO.Step = 0
	x206009_g_PROTECTINFO.StartTime = 0
	x206009_g_PROTECTINFO.PlayerNum = 0
	for i =1, getn(x206009_g_PROTECTINFO.PlayerId) do
		x206009_g_PROTECTINFO.PlayerId[i]=0
	end
	x206009_g_husongobj = 0
end