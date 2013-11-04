--�ýű�������ҽ�����ʱ�Ľ��湹��������������ݶ��塢������Ŀ���Ƕ��
--MisDescBegin
--��ǰ�ű���������
x300305_g_ScriptId = 300305

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x300305_g_MissionId = 411

--������ʼnpc
x300305_g_Name	= "������"

--�������
x300305_g_MissionKind = 1
x300305_g_MissionLevel = 3

--�Ƿ��Ǿ�Ӣ����
x300305_g_IfMissionElite = 0

--�����Ƿ��Ѿ����
x300305_g_IsMissionOkFail = 0		--�����ĵ�0λ

x300305_g_DemandKill ={}

--��������
x300305_g_MissionName="����ʣ����ʳ"
--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x300305_g_MissionInfo={"�����ǰ����ߵ���ʳ����������ɱ�����ǣ���ر����ߵ���ʳ��"} 

x300305_g_MissionTarget="����������ɱ����������������100�������ߵ���ʳ"	

x300305_g_ContinueInfo={"����㹻����ʳ��������"}  

x300305_g_MissionComplete="лл�㣬Ӣ�ۣ�������Щ��ʳ������ս�ض��������飡"

x300305_g_MoneyBonus=10000

--�̶���Ʒ���������8��
x300305_g_ItemBonus={{id=12010003,num=5},{id=12010004,num=5}}

--��ѡ��Ʒ���������8��
--x300305_g_RadioItemBonus={{id=12010005,num=5},{id=12010006,num=5}}

--MisDescEnd

--�����ύnpc
x300305_g_NameEnd	= "������"



--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x300305_g_MissionMinLevel = 3
x300305_g_MissionMaxLevel = 200

--ǰ�������MissionID,������д���ǰ������
--x300305_g_MisIdPre = {384}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
--x300305_g_ScriptIdNext = {ScriptId = 211047 ,LV = 4 }

--****************************************�������ݿ�ʼ*********************************************************************


--����Ŀ������(���Զ�����Ŀ��)

--COLLECT						--�ռ���Ʒ                    --itemΪ�ɼ�����Ʒ����,nameΪ��������,numΪ������߸���
x300305_g_COLLECT = {{item=13010081,name="������ʳ",num=100,type="COLLECT",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x300305_g_QuestType = {x300305_g_COLLECT}
x300305_g_Quest = {}
x300305_g_QuestNum = 0

function  x300305_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in QuestType do
		for j, QuestInfo in QuestLabel do
			count = count + 1
			QuestInfo.order = count
			x300305_g_Quest[count] = QuestInfo
		end
	end
	x300305_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x300305_g_ExpBonustxt = "����  1000+�ȼ����ȼ�"
x300305_g_exp = 1

function x300305_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =7000
	return ExpBonus*x300305_g_exp
end

--��Ǯ����
x300305_g_MoneyBonustxt = 10000
x300305_g_money = 1

function x300305_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x300305_g_money
end

--**********************************������ں���**********************************

function x300305_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x300305_g_QuestOrder(x300305_g_QuestType)
    if IsHaveMission(sceneId,selfId,x300305_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x300305_g_NameEnd) then
			local m = 0
			for i, QuestInfo in x300305_g_Quest do
				if (QuestInfo.type == "DELIVERY") then
					if (getn(x300305_g_DELIVERY)==1) and (x300305_g_NameEnd == x300305_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x300305_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x300305_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x300305_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x300305_g_ScriptId,x300305_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x300305_g_ScriptId,x300305_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x300305_g_DELIVERY[1].item > 0 and x300305_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x300305_g_DELIVERY[1].item)>=x300305_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x300305_g_MissionId)
					for i, QuestInfo in x300305_g_Quest do
						if (QuestInfo.type == "DELIVERY") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x300305_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x300305_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x300305_g_ScriptId,x300305_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x300305_g_ScriptId,x300305_g_MissionId,0)
				end
			end
		elseif (x300305_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in x300305_g_Quest do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in x300305_g_DELIVERY do
					if (GetName(sceneId,targetId)==DeliveryInfo.npc)then
						if DeliveryInfo.comeitem > 0 and DeliveryInfo.comenum > 0 then
							BeginAddItem(sceneId)		
								AddItem( sceneId,DeliveryInfo.comeitem, DeliveryInfo.comenum )
							local ret = EndAddItem(sceneId,selfId)
							if  ret <=0 then
								BeginEvent(sceneId)
									strText = "��Ʒ����������������������"
									AddText(sceneId,strText);
								EndEvent(sceneId)
								DispatchMissionTips(sceneId,selfId)
								return
							end					
						end
						local m = 0
						if DeliveryInfo.item == 0 or DeliveryInfo.num == 0 then
							m = 1
						elseif DeliveryInfo.item > 0 or DeliveryInfo.num > 0 then
							if	(LuaFnGetItemCount(sceneId,selfId,DeliveryInfo.item)>=DeliveryInfo.num) then
								m = 2
							end
						end
						if m > 0 then
							local misIndex = GetMissionIndexByID(sceneId,selfId,x300305_g_MissionId)
							for i, QuestInfo in x300305_g_Quest do
								if QuestInfo.type == "DELIVERY" then
									if (GetName(sceneId,targetId)==QuestInfo.npc)then
										SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,1)
									end
								end
							end
							BeginEvent(sceneId)
								strText = DeliveryInfo.info.."   1/1"
								AddText(sceneId,strText);
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,selfId)
							BeginEvent(sceneId)
								AddText(sceneId,DeliveryInfo.dialog)
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
							if m == 2 then
								DelItem(sceneId,selfId,DeliveryInfo.item,DeliveryInfo.num)
							end
							if DeliveryInfo.comeitem > 0 and DeliveryInfo.comenum > 0 then
								AddItemListToHuman(sceneId,selfId)
							end	
						elseif m == 0 then
							BeginEvent(sceneId)
								AddText(sceneId,x300305_g_Name.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x300305_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x300305_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x300305_g_ScriptId,x300305_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x300305_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x300305_g_MissionName)
	if DoneEX==2 then
		for i, Info in x300305_g_ContinueInfo do
			AddText(sceneId,Info)
		end
	else
		for i, Info in x300305_g_MissionInfo do
			AddText(sceneId,Info)
		end
	end
	--AddText(sceneId,x300305_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x300305_g_MissionTarget)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x300305_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x300305_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x300305_g_ItemBonus ~= nil then
			for i, item in x300305_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
		if x300305_g_RadioItemBonus ~= nil then
			for i, item in x300305_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		end
	end
end


--**********************************����Ŀ����ʾ**********************************

function	x300305_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x300305_g_QuestOrder(x300305_g_QuestType)
	if x300305_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x300305_g_MissionId)
		for i, QuestInfo in x300305_g_Quest do

			if   (QuestInfo.type == "COLLECT") then
				if Done == 1 then
					Many = LuaFnGetItemCount(sceneId,selfId,QuestInfo.item)
					if Many == nil then
						Many = 0
					elseif Many >  QuestInfo.num then
						Many = QuestInfo.num
					end
				end
				StrTxt = QuestInfo.name.."    "..Many.."/"..QuestInfo.num
				AddText(sceneId,StrTxt)
			end
		end
	end
end

--**********************************�ж������Ƿ���ʾ**********************************
function x300305_OnEnumerate( sceneId, selfId, targetId )
	x300305_g_QuestOrder(x300305_g_QuestType) 	
    if IsMissionHaveDone(sceneId,selfId,x300305_g_MissionId) > 0 then
    	return 
    elseif IsHaveMission(sceneId,selfId,x300305_g_MissionId) > 0 then
    	local m = 0
    	for  i, QuestInfo in x300305_g_Quest do
    		if QuestInfo.type == "DELIVERY" then
    			m = 1
    		end
    	end
    	if  (m == 1)  then
    		if  (GetName(sceneId,targetId)==x300305_g_NameEnd) then
    			AddNumText(sceneId,x300305_g_ScriptId,x300305_g_MissionName);
    		else
				for i, QuestInfo in x300305_g_Quest do
					if QuestInfo.type == "DELIVERY" then
						if (GetName(sceneId,targetId)==QuestInfo.npc)then
					    	if x300305_CheckContinue(sceneId, selfId, targetId) == 1 then
								AddNumText(sceneId,x300305_g_ScriptId,x300305_g_MissionName);	
								break
							end
						end
					end
				end
			end
		elseif  (GetName(sceneId,targetId)==x300305_g_NameEnd) then
			AddNumText(sceneId,x300305_g_ScriptId,x300305_g_MissionName);
		end					
	--��������������ɽ�����,����ʾ�������
    elseif x300305_CheckAccept(sceneId,selfId,targetId) > 0 then
		AddNumText(sceneId,x300305_g_ScriptId,x300305_g_MissionName);
    end
end



--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x300305_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x300305_g_Name) then
		if (GetLevel( sceneId, selfId ) >= x300305_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x300305_g_MissionMaxLevel ) then
			if	x300305_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in x300305_g_MisIdPre do
					if IsMissionHaveDone(sceneId,selfId,questpre) == 0 then
						return 0
					end
				end
				return 1
			end		
		else
			return 0
		end
	else
		return 0
	end	
end
--**********************************�ж������������****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2����Ҫ���������������м价�ڽ����ж�*****************

function x300305_CheckContinue( sceneId, selfId ,targetId )
	x300305_g_QuestOrder(x300305_g_QuestType)
	misIndex = GetMissionIndexByID(sceneId,selfId,x300305_g_MissionId)
	for i, QuestInfo in x300305_g_Quest do
		if QuestInfo.type == "DELIVERY" then
			if (GetName(sceneId,targetId)==QuestInfo.npc)then
		    	local CanContinue = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
				if CanContinue == 0 then
					return 1
				end
			end
		end
	end
	return 0	
end
--**********************************��������**********************************
function x300305_OnAccept(sceneId, selfId )		
	x300305_g_QuestOrder(x300305_g_QuestType)
	if GetMissionCount(sceneId, selfId)>=20 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		BeginEvent(sceneId)
			strText = "#Y���������־�Ѿ�����"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local DoKill,DoArea,DoItem = 0,0,0
	for i, QuestInfo in x300305_g_Quest do
		if QuestInfo.type == "COLLECT"	then			--�ռ���Ʒ
				DoItem = 1
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x300305_g_MissionId, x300305_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x300305_g_MissionId)			--�õ���������к�
	if x300305_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x300305_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,j-1,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x300305_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x300305_OnAbandon( sceneId, selfId )
	x300305_g_QuestOrder(x300305_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x300305_g_MissionId )
end

--**********************************--������ʱ��--**********************************
function x300305_OnScneneTimer(sceneId, selfId)
	x300305_g_QuestOrder(x300305_g_QuestType)
	local bHavePlayer = 0
	-- �ȴ�5�����2
	if x300305_g_PROTECTINFO.Step == 1   then
		-- ֪ͨ�Լ������������ҽ��������
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		local bHaveMonster = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x300305_g_Name  then
				HeadNPCID = nMonsterId
				bHaveMonster = 1
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((300305), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x300305_g_PROTECTINFO.Step = 2
	end
	-- ��ʼ�ȴ���������һ�����������,10����ʱ��
	if x300305_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x300305_g_PROTECTINFO.StartTime >= 10   then
			x300305_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x300305_g_PROTECTINFO.Step == 3   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			for j, ProtectInfo in x300305_g_PROTECT do
				if GetName(sceneId, nMonsterId)  ==  ProtectInfo.name then
					bHaveMonster = bHaveMonster + 1
					x300305_g_ProtectNPCID[j] = nMonsterId
				end
			end
		end
		if bHaveMonster == getn(x300305_g_PROTECT)  then
			for j, ProtectInfo in x300305_g_PROTECT do
				SetPatrolId(sceneId, x300305_g_ProtectNPCID[j], ProtectInfo.patrol)
			end
			x300305_g_PROTECTINFO.Step = 4
		end
	end
	-- ���͹���
	if x300305_g_PROTECTINFO.Step == 4   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0

		local bDone = 0
		for ii=0, nMonsterNum-1   do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			for j, ProtectInfo in x300305_g_PROTECT do
				if GetName(sceneId, nMonsterId)  ==  ProtectInfo.name then
					bHaveMonster = bHaveMonster + 1
					x300305_g_ProtectNPCID[j] = nMonsterId
				end
			end
		end
		if bHaveMonster < getn(x300305_g_PROTECT)   then
			-- �رռ�ʱ��
			x300305_CloseTimer(sceneId, x300305_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		for j, NpcID in x300305_g_ProtectNPCID do 
			-- ���ProtectNPC �����֮��ľ���
			local targetX, targetZ = GetWorldPos(sceneId, NpcID)
			-- ��������ҵľ����Ѿ��뿪�ĳ���������Ҳ��ڻ��Ͷ���10���ڣ�������ʧ��
			for i=1, x300305_g_PROTECTINFO.PlayerNum  do
				if x300305_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x300305_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					
					if distance1 > 20    then
						--��ʾ����������ʧ��
						BeginEvent(sceneId)
							strText = x300305_g_MissionName.."  ʧ��"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x300305_g_PROTECTINFO.PlayerId[i])
						-- ���б���ɾ��������
						x300305_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
		end	
		for j, ProtectInfo in x300305_g_PROTECT do
			for j, NpcID in x300305_g_ProtectNPCID do 
				if  GetName(sceneId, NpcID)==ProtectInfo.name  then		
					local targetX, targetZ = GetWorldPos(sceneId, NpcID)
					--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
					local x,z =18,139
					local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
					-- �����յ�
					if distance<=1  then
						for i=1, x300305_g_PROTECTINFO.PlayerNum  do
							if x300305_g_PROTECTINFO.PlayerId[i]~=0   then
								-- �������ǲ������������
								if IsHaveMission(sceneId,x300305_g_PROTECTINFO.PlayerId[i],x300305_g_MissionId) > 0 then
									local misIndex = GetMissionIndexByID(sceneId, x300305_g_PROTECTINFO.PlayerId[i], x300305_g_MissionId)
									for i, QuestInfo in x300305_g_Quest do
										if QuestInfo.type == "PROTECT" then
											SetMissionByIndex(sceneId,x300305_g_PROTECTINFO.PlayerId[i],misIndex,QuestInfo.order-1,1)
										end
									end
									BeginEvent(sceneId)
										strText = ProtectInfo.info.."  1/1"
										AddText(sceneId,strText);
									EndEvent(sceneId)
									DispatchMissionTips(sceneId,x300305_g_PROTECTINFO.PlayerId[i])
								end
							end
						end
						RemoveMonster(sceneId, NpcID)
						bDone = bDone + 1
					end								
				end
			end
		end
		if (bDone >= getn(x300305_g_PROTECT)) then
			x300305_g_PROTECTINFO.Step = 5
			-- �رռ�ʱ��
			x300305_CloseTimer(sceneId, x300305_g_PROTECTINFO.ScneneTimerIndex)
		end
	end
end

--**********************************
--�رռ�ʱ��
--**********************************
function x300305_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x300305_g_PROTECTINFO.ScneneTimerIndex = -1
	x300305_g_PROTECTINFO.Step = 0
	x300305_g_PROTECTINFO.StartTime = 0
	x300305_g_PROTECTINFO.PlayerNum = 0
	for i =1, getn(x300305_g_PROTECTINFO.PlayerId) do
		x300305_g_PROTECTINFO.PlayerId[i]=0
	end
	x300305_g_ProtectNPCID = {}
end

--**********************************
--����
--**********************************
function x300305_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x300305_CheckSubmit( sceneId, selfId )
	x300305_g_QuestOrder(x300305_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x300305_g_MissionId)
	local bDone = 1
	for i, QuestInfo in x300305_g_Quest do
		if  QuestInfo.type == "COLLECT"  then
			local Many = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
			if QuestInfo.num == nil then
				QuestInfo.num = 1
			end
			if Many == nil then

			elseif	Many < QuestInfo.num then
				bDone = 0
				break
			end
		end
	end
	if bDone == 1 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x300305_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x300305_g_QuestOrder(x300305_g_QuestType)
	if (x300305_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if (getn(x300305_g_ItemBonus) ==0)  and  (getn(x300305_g_RadioItemBonus) == 0 ) then
			givebonus = 1
		else
			for i, item in x300305_g_ItemBonus do
				if item.id>0 and item.num>0 then
					AddItem( sceneId,item.id, item.num )
					giveitem = 1
				end
			end
			for i, item in x300305_g_RadioItemBonus do
				if item.id == selectRadioId and item.num > 0 and item.id > 0 then
					AddItem( sceneId,item.id, item.num )
					giveitem = 1
				end
			end
			if giveitem == 1 then
				giveitem = EndAddItem(sceneId,selfId)
			end
		end				
		if (giveitem<=0) and (givebonus==0)  then
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��Ʒ����������������������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			ret = DelMission( sceneId, selfId, x300305_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in x300305_g_Quest do	
					if QuestInfo.type ==  "COLLECT"   then
						DelItem(sceneId,selfId,QuestInfo.item,QuestInfo.num)
					end						
				end   
				MissionCom( sceneId,selfId, x300305_g_MissionId )
				if (x300305_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x300305_g_ExpBonus(sceneId, selfId, x300305_g_exp))
				end					
				if (x300305_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x300305_g_MoneyBonus(sceneId, selfId, x300305_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x300305_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x300305_g_ScriptIdNext.ScriptId~=nil) and (x300305_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x300305_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x300305_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"���㵽��"..x300305_g_ScriptIdNext.LV.."���������ң��һ��к���Ҫ����Ҫ������ȥ����ǧ���ס�ˣ�")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end
end

--**********************************--ɱ����������--**********************************
function x300305_OnKillObject( sceneId, selfId, objdataId )
	x300305_g_QuestOrder(x300305_g_QuestType)
	local QuestPlace = 0	--�������Ӧ��֮ǰSetMissionByIndex(sceneId,selfId,misIndex,j-1,0)ʱ���ڵ�λ��,==j-1
	for i, QuestInfo in x300305_g_Quest do
		if QuestInfo.type ==  "MONSTER_KILL" then	
			 if objdataId == QuestInfo.id then
				  local misIndex = GetMissionIndexByID(sceneId,selfId,x300305_g_MissionId)
				  num = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
				  if num < QuestInfo.num then						
				    SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,num+1)
				  	BeginEvent(sceneId)
					  	strText = format("��ɱ��  "..QuestInfo.name.."  %d/"..QuestInfo.num, GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1) )
					  	AddText(sceneId,strText);
				  	EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				  end
			 end
		end
		if QuestInfo.type ==  "MONSTER_ITEM" then
			if objdataId == QuestInfo.id then
				local monsteritemnum = LuaFnGetItemCount(sceneId,selfId,QuestInfo.item)
				if monsteritemnum < QuestInfo.num then
					if QuestInfo.per >= random(1,100) then
						local additemnum = random(QuestInfo.max)
						if (monsteritemnum + additemnum > QuestInfo.num ) then
							additemnum = QuestInfo.num - monsteritemnum
						end
						BeginAddItem(sceneId)
							AddItem( sceneId,QuestInfo.item, additemnum )
						ret = EndAddItem(sceneId,selfId)
						if ret > 0 then
								AddItemListToHuman(sceneId,selfId)
						else
							--������û�мӳɹ�
							BeginEvent(sceneId)
								strText = "��������,�޷������Ʒ"
								AddText(sceneId,strText);
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,selfId)
						end
					end
				end
			end
		end
	end
end

--**********************************--���������¼�--**********************************
function x300305_OnEnterArea( sceneId, selfId, areaId )
	x300305_g_QuestOrder(x300305_g_QuestType)
	if IsHaveMission(sceneId,selfId,x300305_g_MissionId) > 0 then
		for i, QuestInfo in x300305_g_Quest do
			if QuestInfo.type == "ENTERAREA" then
				if (areaId == QuestInfo.area) and (sceneId == QuestInfo.mapid) then 
					local misIndex = GetMissionIndexByID(sceneId,selfId,x300305_g_MissionId)
					if (GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1) == 0) then
						SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,1)
						BeginEvent(sceneId)
							strText = QuestInfo.info.."    1/1"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
					end
				end
			end
		end
	end
end

function x300305_OnTimer( sceneId, selfId )

end

function x300305_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x300305_OnItemChanged( sceneId, selfId, itemdataId )
	x300305_g_QuestOrder(x300305_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x300305_g_MissionId)
	for i, QuestInfo in x300305_g_Quest do
		if QuestInfo.type == "COLLECT"  then
			if (QuestInfo.item == itemdataId) then
				local questitemnum = LuaFnGetItemCount(sceneId,selfId,QuestInfo.item)
				if ( questitemnum >= 0 ) and ( questitemnum <= QuestInfo.num )then
					SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,questitemnum)
					BeginEvent(sceneId)
						strText = format("�ѻ��  "..QuestInfo.name.."  %d/"..QuestInfo.num,questitemnum )
					 	AddText(sceneId,strText);
				 	EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				end
			end
		end
	end
end
