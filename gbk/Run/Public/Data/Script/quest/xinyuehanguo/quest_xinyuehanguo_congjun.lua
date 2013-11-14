--���º�����������֮  С����ͯ��
--MisDescBegin
--��ǰ�ű���������
x211050_g_ScriptId = 211050

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x211050_g_MissionId = 389

--������ʼnpc
x211050_g_Name	="����ʹ��" 

--�������
x211050_g_MissionKind = 1
x211050_g_MissionLevel = 9

--�Ƿ��Ǿ�Ӣ����
x211050_g_IfMissionElite = 0

--�����Ƿ��Ѿ����
x211050_g_IsMissionOkFail = 0		--�����ĵ�0λ

x211050_g_DemandKill ={}

x211050_g_MissionName="�Ӿ�"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x211050_g_MissionInfo={"�Ҿ���������ȱ�������������е�ʶ���ˣ�����������Ҫ�ġ���һЩ����������Ϊ���꣬�Ҿ�һ���ܹ��˵���ʤ����ƥ�ɹ���������ǰȥ�������Ǳ�������ס���Ҷ��Ŵ���ʹ�߾Ϳ����ˡ�"} 

x211050_g_MissionTarget="�����ɹ�����ǰ�������Ҷ��Ŵ���ʹ����ɱ���"	

x211050_g_ContinueInfo={"���ھ�����˽���������ô��ûȥ�������Ǳ�����������ɽ���㲻֪����"}  

x211050_g_MissionComplete="�ҹ��ֶ���һλ��ʿ��"
x211050_g_MoneyBonus=10000
x211050_g_ItemBonus={}
x211050_g_RadioItemBonus={{id=12010001,num=5},{id=12020001,num=5}}
--MisDescEnd

--�����ύnpc
x211050_g_NameEnd	= "���Ŵ���ʹ��"

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x211050_g_MissionMinLevel = 9
x211050_g_MissionMaxLevel = 200

--ǰ�������MissionID,������д���ǰ������
x211050_g_MisIdPre = {387}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x211050_g_ScriptIdNext = {}

--****************************************�������ݿ�ʼ*********************************************************************

--����Ŀ������(���Զ�����Ŀ��)
--PROTECT						--����(������Ϊ�����npc,ʹ���Ϊ��������)         --npcΪҪ���͵�npc,nameΪnpc������,patrolΪ���͵�npc·��()
x211050_g_PROTECT={{npc=79,name="�ɹ�����",place={x=431,z=427},ai={baseai=3,scriptai=0},scriptid=-1,patrol=10,info="�����ɹ�����ǰ�������Ҷ��Ŵ���ʹ����ɱ���",type="PROTECT",order=0}}
x211050_g_ProtectNPCID = {}
-- ������صĳ�����ʱ����Index
if x211050_g_PROTECT~=nil then
	if x211050_g_PROTECTINFO == nil then
		x211050_g_PROTECTINFO={ScneneTimerIndex = -1, Step = 0, StartTime = 0, PlayerNum = 0, PlayerId= {0,0,0,0,0,0}}
	end
end
--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x211050_g_QuestType = {x211050_g_PROTECT}
x211050_g_Quest = {}
x211050_g_QuestNum = 0
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x211050_g_ExpBonustxt = "����  100"
x211050_g_exp = 1

--��Ǯ����
x211050_g_MoneyBonustxt = 10000
x211050_g_money = 1

--�̶���Ʒ���������8��
x211050_g_ItemBonus={{id=12010001,num=5},{id=12020001,num=5}}


--��ѡ��Ʒ���������8��
x211050_g_RadioItemBonus={}




function  x211050_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x211050_g_Quest[count] = QuestInfo
		end
	end
	x211050_g_QuestNum = count
end

function x211050_g_ExpBonus(sceneId, selfId, exp)
	return 12000*x211050_g_exp
end

function x211050_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x211050_g_money
end


--**********************************

--������ں���

--**********************************

function x211050_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	x211050_g_QuestOrder(x211050_g_QuestType)
    if IsHaveMission(sceneId,selfId,x211050_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x211050_g_NameEnd) then
			local Done = x211050_CheckSubmit( sceneId, selfId )
			BeginEvent(sceneId)
				if Done == 1 then
					x211050_ShowQuestInfo( sceneId, selfId, targetId , 1)
				else
					x211050_ShowQuestInfo( sceneId, selfId, targetId , 2)
				end
			EndEvent( )
			if (Done == 1) then
				DispatchMissionContinueInfo(sceneId,selfId,targetId,x211050_g_ScriptId,x211050_g_MissionId)
			else
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x211050_g_ScriptId,x211050_g_MissionId,0)
			end
		end
    elseif x211050_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x211050_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211050_g_ScriptId,x211050_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x211050_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x211050_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x211050_g_ContinueInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x211050_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	--AddText(sceneId,x211050_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x211050_g_MissionTarget)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	AddMoneyBonus( sceneId, x211050_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x211050_g_ItemBonus ~= nil then
			for i, item in pairs(x211050_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
		if x211050_g_RadioItemBonus ~= nil then
			for i, item in pairs(x211050_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		end
	end
end


--**********************************����Ŀ����ʾ**********************************

function	x211050_ShowQuestAim( sceneId, selfId, targetId ,Done)

end

--**********************************

--�о��¼�

--**********************************

function x211050_OnEnumerate(sceneId, selfId, targetId)

	    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x211050_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x211050_g_MissionId) > 0 then
		AddNumText(sceneId, x211050_g_ScriptId, x211050_g_MissionName)
    --���������������
    elseif x211050_CheckAccept(sceneId,selfId ,targetId) > 0 then
		AddNumText(sceneId, x211050_g_ScriptId, x211050_g_MissionName)
    end
end



--**********************************

--����������

--**********************************

function x211050_CheckAccept(sceneId, selfId, targetId)	
	if (GetName(sceneId,targetId)==x211050_g_Name) then		
		if (GetLevel( sceneId, selfId ) >= x211050_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x211050_g_MissionMaxLevel ) then
			if	x211050_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x211050_g_MisIdPre) do
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

--**********************************

--����

--**********************************

function x211050_OnAccept(sceneId, selfId)
         x211050_g_QuestOrder(x211050_g_QuestType)
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
	for i, QuestInfo in pairs(x211050_g_Quest) do
		if QuestInfo.type == "PROTECT"	then			--����
			if (x211050_g_PROTECTINFO == nil) then
				print("�û�������û��������صĶ�ʱ��!!!")
				return
			else
				if x211050_g_PROTECTINFO.Step > 2  then
					BeginEvent(sceneId)
						strText = "#Y���ڲ��ܽ��������"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				end
				
				-- �����ǰ 
				if x211050_g_PROTECTINFO.Step == 0  then
					-- �������;���  
					-- ��ⳡ�����ǲ��������������
					local nMonsterNum = GetMonsterCount(sceneId)
					local ii = 0
					local bHaveMonster = 0
					for ii=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,ii)
						for i, QuestInfo in pairs(x211050_g_Quest) do
							if QuestInfo.type == "PROTECT"	then
								if GetName(sceneId, nMonsterId)  == QuestInfo.name  then
									bHaveMonster = 1
								end
							end
						end
					end
					
					-- ��������ˣ�����������ȥ�����ű�
					if bHaveMonster == 1   then 
						BeginEvent(sceneId)
							strText = "#Y���ڲ��ܽ��������"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
					elseif bHaveMonster == 0   then
						for i, QuestInfo in pairs(x211050_g_Quest) do
							if QuestInfo.type == "PROTECT"	then
								local nNpcId = LuaFnCreateMonster(sceneId,  QuestInfo.npc, QuestInfo.place.x, QuestInfo.place.z, QuestInfo.ai.baseai, QuestInfo.ai.scriptai, QuestInfo.scriptid)
								--SetCharacterName(sceneId, nNpcId, ProtectInfo.name)
								-- ����Сʱʱ����10����
								--SetCharacterDieTime(sceneId, nNpcId, 600000)
							end
						end
					end
					-- �������Ҽӵ���������б���
					x211050_g_PROTECTINFO.PlayerNum = 1
					x211050_g_PROTECTINFO.PlayerId[1] = selfId
			
					-- ����һ��������ʱ��,ÿ���3��,�ص�һ��OnScneneTimer����
					x211050_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 211050, "OnScneneTimer", 1)
					x211050_g_PROTECTINFO.Step = 1
					--��ǰʱ��
					x211050_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
				end
				
				-- ���뵽������͵����
				if x211050_g_PROTECTINFO.Step == 2  then
					if x211050_g_PROTECTINFO.PlayerNum > 5  then
						--������
						return
					end
				
					x211050_g_PROTECTINFO.PlayerNum = x211050_g_PROTECTINFO.PlayerNum + 1
					x211050_g_PROTECTINFO.PlayerId[x211050_g_PROTECTINFO.PlayerNum] = selfId
				end
			end
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x211050_g_MissionId, x211050_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x211050_g_MissionId)			--�õ���������к�
	if x211050_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x211050_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,j-1,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x211050_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)                                                          
	     
end


--**********************************--������ʱ��--**********************************
function x211050_OnScneneTimer(sceneId, selfId)
	x211050_g_QuestOrder(x211050_g_QuestType)
	local bHavePlayer = 0
	-- �ȴ�5�����2
	if x211050_g_PROTECTINFO.Step == 1   then
		-- ֪ͨ�Լ������������ҽ��������
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		local bHaveMonster = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x211050_g_NameHead  then
				HeadNPCID = nMonsterId
				bHaveMonster = 1
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((211050), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x211050_g_PROTECTINFO.Step = 2
	end
	-- ��ʼ�ȴ���������һ�����������,10����ʱ��
	if x211050_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x211050_g_PROTECTINFO.StartTime >= 10   then
			x211050_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x211050_g_PROTECTINFO.Step == 3   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			for j, ProtectInfo in pairs(x211050_g_PROTECT) do
				if GetName(sceneId, nMonsterId)  ==  ProtectInfo.name then
					bHaveMonster = bHaveMonster + 1
					x211050_g_ProtectNPCID[j] = nMonsterId
				end
			end
		end
		if bHaveMonster == #(x211050_g_PROTECT)  then
			for j, ProtectInfo in pairs(x211050_g_PROTECT) do
				SetPatrolId(sceneId, x211050_g_ProtectNPCID[j], ProtectInfo.patrol)
			end
			x211050_g_PROTECTINFO.Step = 4
		end
	end
	-- ���͹���
	if x211050_g_PROTECTINFO.Step == 4   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0

		local bDone = 0
		for ii=0, nMonsterNum-1   do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			for j, ProtectInfo in pairs(x211050_g_PROTECT) do
				if GetName(sceneId, nMonsterId)  ==  ProtectInfo.name then
					bHaveMonster = bHaveMonster + 1
					x211050_g_ProtectNPCID[j] = nMonsterId
				end
			end
		end
		if bHaveMonster < #(x211050_g_PROTECT)   then
			-- �رռ�ʱ��
			x211050_CloseTimer(sceneId, x211050_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		for j, NpcID in pairs(x211050_g_ProtectNPCID) do 
			-- ���ProtectNPC �����֮��ľ���
			local targetX, targetZ = GetWorldPos(sceneId, NpcID)
			-- ��������ҵľ����Ѿ��뿪�ĳ���������Ҳ��ڻ��Ͷ���10���ڣ�������ʧ��
			for i=1, x211050_g_PROTECTINFO.PlayerNum  do
				if x211050_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x211050_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					
					if distance1 > 20    then
						--��ʾ����������ʧ��
						BeginEvent(sceneId)
							strText = x211050_g_MissionName.."  ʧ��"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x211050_g_PROTECTINFO.PlayerId[i])
						-- ���б���ɾ��������
						x211050_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
		end	
		for j, ProtectInfo in pairs(x211050_g_PROTECT) do
			for j, NpcID in pairs(x211050_g_ProtectNPCID) do 
				if  GetName(sceneId, NpcID)==ProtectInfo.name  then		
					local targetX, targetZ = GetWorldPos(sceneId, NpcID)
					--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
					local x,z =290,257
					local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
					-- �����յ�
					if distance<=1  then
						for i=1, x211050_g_PROTECTINFO.PlayerNum  do
							if x211050_g_PROTECTINFO.PlayerId[i]~=0   then
								-- �������ǲ������������
								if IsHaveMission(sceneId,x211050_g_PROTECTINFO.PlayerId[i],x211050_g_MissionId) > 0 then
									local misIndex = GetMissionIndexByID(sceneId, x211050_g_PROTECTINFO.PlayerId[i], x211050_g_MissionId)
									for i, QuestInfo in pairs(x211050_g_Quest) do
										if QuestInfo.type == "PROTECT" then
											SetMissionByIndex(sceneId,x211050_g_PROTECTINFO.PlayerId[i],misIndex,QuestInfo.order-1,1)
										end
									end
									BeginEvent(sceneId)
										strText = ProtectInfo.info.."  1/1"
										AddText(sceneId,strText);
									EndEvent(sceneId)
									DispatchMissionTips(sceneId,x211050_g_PROTECTINFO.PlayerId[i])
								end
							end
						end
						LuaFnDeleteMonster(sceneId, NpcID)
						bDone = bDone + 1
					end								
				end
			end
		end
		if (bDone >= #(x211050_g_PROTECT)) then
			x211050_g_PROTECTINFO.Step = 5
			-- �رռ�ʱ��
			x211050_CloseTimer(sceneId, x211050_g_PROTECTINFO.ScneneTimerIndex)
		end
	end
end

--**********************************
--�رռ�ʱ��
--**********************************
function x211050_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x211050_g_PROTECTINFO.ScneneTimerIndex = -1
	x211050_g_PROTECTINFO.Step = 0
	x211050_g_PROTECTINFO.StartTime = 0
	x211050_g_PROTECTINFO.PlayerNum = 0
	for i =1, #(x211050_g_PROTECTINFO.PlayerId) do
		x211050_g_PROTECTINFO.PlayerId[i]=0
	end
	x211050_g_ProtectNPCID = {}
end





--**********************************

--����

--**********************************

function x211050_OnAbandon(sceneId, selfId)
	x211050_g_QuestOrder(x211050_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211050_g_MissionId )
end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211050_CheckSubmit( sceneId, selfId, targetId)
	print("123")
	x211050_g_QuestOrder(x211050_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x211050_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x211050_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" or QuestInfo.type == "COLLECT_SPECIAL" or QuestInfo.type == "ENTERAREA" or QuestInfo.type == "PROTECT"  or QuestInfo.type == "COLLECT" or QuestInfo.type == "MONSTER_ITEM" then
			local Many = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
			if QuestInfo.num == nil then
				QuestInfo.num = 1
			end
			if Many == nil then

			elseif	Many < QuestInfo.num then
				bDone = 0
				break
			end
		elseif QuestInfo.type == "DELIVERY" then
			Many = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
			if Many == nil then

			elseif	Many < 1   then
				bDone = 0
				break
			elseif ( QuestInfo.comeitem >0 and QuestInfo.comeitem>0 ) then
				if (LuaFnGetItemCount(sceneId,selfId,QuestInfo.comeitem) < QuestInfo.comenum) then
					bDone = 0
					break
				end
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

function x211050_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	x211050_g_QuestOrder(x211050_g_QuestType)
	if (x211050_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if (#(x211050_g_ItemBonus) ==0)  and  (#(x211050_g_RadioItemBonus) == 0 ) then
			givebonus = 1
		else
			for i, item in pairs(x211050_g_ItemBonus) do
				if item.id>0 and item.num>0 then
					AddItem( sceneId,item.id, item.num )
					giveitem = 1
				end
			end
			for i, item in pairs(x211050_g_RadioItemBonus) do
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
			ret = DelMission( sceneId, selfId, x211050_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in pairs(x211050_g_Quest) do
					if QuestInfo.type ==  "DELIVERY" then
						if #(x211050_g_DELIVERY) == 1 and QuestInfo == x211050_g_DELIVERY[1] then
							if QuestInfo.npc == x211050_g_NameEnd and QuestInfo.item > 0 and QuestInfo.num > 0 then
								DelItem(sceneId,selfId,QuestInfo.item,QuestInfo.num)
							end								
						end
						if QuestInfo.comeitem > 0 and QuestInfo.comenum >0 then
							DelItem(sceneId,selfId,QuestInfo.comeitem,QuestInfo.comenum)
						end
					end							
					if QuestInfo.type ==  "COLLECT"  or QuestInfo.type ==  "COLLECT_SPECIAL" or QuestInfo.type ==  "MONSTER_ITEM" then
						DelItem(sceneId,selfId,QuestInfo.item,QuestInfo.num)
					end						
				end   
				MissionCom( sceneId,selfId, x211050_g_MissionId )
				if (x211050_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x211050_g_ExpBonus(sceneId, selfId, x211050_g_exp))
				end					
				if (x211050_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x211050_g_MoneyBonus(sceneId, selfId, x211050_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x211050_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x211050_g_ScriptIdNext.ScriptId~=nil) and (x211050_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x211050_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x211050_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"���㵽��"..x211050_g_ScriptIdNext.LV.."���������ң��һ��к���Ҫ����Ҫ������ȥ����ǧ���ס�ˣ�")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end
end



--**********************************

--ɱ����������

--**********************************

function x211050_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211050_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211050_OnItemChanged(sceneId, selfId, itemdataId)

end