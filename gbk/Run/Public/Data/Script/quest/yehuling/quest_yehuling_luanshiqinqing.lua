--�ýű�������ҽ�����ʱ�Ľ��湹��������������ݶ��塢������Ŀ���Ƕ��

--��ǰ�ű���������
x207006_g_ScriptId = 207006

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x207006_g_MissionId = 7

--�������
x207006_g_MissionKind = 1

--������ʼnpc
x207006_g_NameHead	= "��������"

--�����ύnpc
x207006_g_NameEnd	= "��������"

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x207006_g_MissionMinLevel = 1
x207006_g_MissionMaxLevel = 200

--ǰ�������MissionID,������д���ǰ������
x207006_g_MisIdPre = {6}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x207006_g_ScriptIdNext = {ScriptId = 207007 ,LV = 0 }

--****************************************�������ݿ�ʼ*********************************************************************
--��������
x207006_g_MissionName="��������"
--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x207006_g_MissionInfo={"    �����Լ��������������ˣ�������˵�����æ���������Ȱ���һ��æ��\n \n��~����������Ȼ������м��ҵģ��ҵ�Ů�ˡ���������һ�ֺ���˽�Ķ��Ϊ��˽����ʲô���ɵó�����ս�������򣬾������������ģ��Ҳ���������������Ĳпᡣ\n \n���ܻ�����Ů���뿪����ط���"} 
--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x207006_g_UnDoneMissionInfo={"    ���ҵ�Ů�˰�ȫ֮ǰ����ʲô������˵�ġ�"}  
--�ܵĴ�������Ŀ��������һ�仰����
x207006_g_MissionAim="    ��������������Ů�˵����Ŵ�"		

--����Ŀ������(���Զ�����Ŀ��)
--MONSTER_KILL					--ɱ��                        --idΪɱ�����ͣ�nameΪ��������,numΪ��Ӧɱ������
x207006_g_MONSTER_KILL = {{id=284,name="Ұ����Ǳ����",num=1,type="MONSTER_KILL",order=0},{id=285,name="Ǳ����",num=1,type="MONSTER_KILL",order=0}	}

--DELIVERY						--����                        --npcΪҪ���Ÿ��Ķ���,itemΪ�Ƿ���������ƷҪ�����Ŷ���,��item�����񷢲���ֱ�Ӹ������; infoΪ����Ŀ����ʾ
x207006_g_DELIVERY = {{npc = "�����",item = 0,num = 0,comeitem = 0,comenum = 0,info="ѯ��ľ�������",dialog="����������",type="DELIVERY",order=0},{npc = "������",item = 12010002,num = 1,comeitem = 0,comenum = 0,info="ѯ��ľ�������",dialog="����������",type="DELIVERY",order=0}}

--COLLECT_SPECIAL				--�ɼ�(��ʱ�Ȳ������)         --itemΪ�ɼ�����Ʒ����,nameΪ��������,numΪ������߸���
x207006_g_COLLECT_SPECIAL = {{item=300010,name="����������",num=30,type="COLLECT_SPECIAL",order=0},{item=300011,name="�������",num=15,type="COLLECT_SPECIAL",order=0}}

--ENTERAREA						--����̽��           --mapΪ����̽����Ŀ���ͼ���,areaΪ��Ŀ���ͼ���¼�������
x207006_g_ENTERAREA = {{mapid=7,area=0,info="ǰ���鿴����ɽ����������",type="ENTERAREA",order=0},{mapid=7,area=1,info="ǰ���鿴��ɽ",type="ENTERAREA",order=0}}

--PROTECT						--����(������Ϊ�����npc,ʹ���Ϊ��������)         --npcΪҪ���͵�npc,nameΪnpc������,patrolΪ���͵�npc·��()
x207006_g_PROTECT={{npc=121,name="����",place={x=52.9247,z=53.1867},ai={baseai=3,scriptai=0},patrol=3,info="    �������������ķ���",type="PROTECT",order=0}}
x207006_g_ProtectNPCID = {}
-- ������صĳ�����ʱ����Index
if x207006_g_PROTECT~=nil then
	if x207006_g_PROTECTINFO == nil then
		x207006_g_PROTECTINFO={ScneneTimerIndex = -1, Step = 0, StartTime = 0, PlayerNum = 0, PlayerId= {0,0,0,0,0,0}}
	end
end

--COLLECT						--�ռ���Ʒ                    --itemΪ�ɼ�����Ʒ����,nameΪ��������,numΪ������߸���
x207006_g_COLLECT = {{item=12010001,name="����������",num=30,type="COLLECT",order=0},{item=12010002,name="����",num=10,type="COLLECT",order=0}}

--MONSTER_ITEM					--��ֵ���                    --idΪɱ�����ͣ�itemΪ���������Ʒ����,nameΪ�������ƣ�perΪ������ʣ�maxΪһ�ε�����Ʒ�ĸ�������,numΪ������߸���
x207006_g_MONSTER_ITEM = {{id=284,item=12010001,name="����������",per=100,max=3,num=2,type="MONSTER_ITEM",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x207006_g_QuestType = {x207006_g_PROTECT}
x207006_g_Quest = {}
x207006_g_QuestNum = 0

function  x207006_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x207006_g_Quest[count] = QuestInfo
		end
	end
	x207006_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x207006_g_ExpBonustxt = "����  1000+�ȼ����ȼ�"
x207006_g_exp = 1

function x207006_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =1000+LV*LV
	return ExpBonus*x207006_g_exp
end

--��Ǯ����
x207006_g_MoneyBonustxt = 10000
x207006_g_money = 1

function x207006_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x207006_g_money
end

--�̶���Ʒ���������8��
x207006_g_ItemBonus={{id=12010003,num=5},{id=12010004,num=5}}

--��ѡ��Ʒ���������8��
x207006_g_RadioItemBonus={{id=12010005,num=5},{id=12010006,num=5}}
--MisDescEnd
--**********************************������ں���**********************************

function x207006_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
--DelMission(sceneId, selfId, x207006_g_MissionId)       
	x207006_g_QuestOrder(x207006_g_QuestType)
    if IsHaveMission(sceneId,selfId,x207006_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207006_g_NameEnd) then
			local m = 0
			for i, QuestInfo in pairs(x207006_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					if (#(x207006_g_DELIVERY)==1) and (x207006_g_NameEnd == x207006_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x207006_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x207006_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x207006_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x207006_g_ScriptId,x207006_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x207006_g_ScriptId,x207006_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x207006_g_DELIVERY[1].item > 0 and x207006_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x207006_g_DELIVERY[1].item)>=x207006_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x207006_g_MissionId)
					for i, QuestInfo in pairs(x207006_g_Quest) do
						if (QuestInfo.type == "DELIVERY") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x207006_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x207006_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x207006_g_ScriptId,x207006_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x207006_g_ScriptId,x207006_g_MissionId,0)
				end
			end
		elseif (x207006_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in pairs(x207006_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in pairs(x207006_g_DELIVERY) do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x207006_g_MissionId)
							for i, QuestInfo in pairs(x207006_g_Quest) do
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
								AddText(sceneId,x207006_g_NameHead.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x207006_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x207006_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x207006_g_ScriptId,x207006_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x207006_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x207006_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x207006_g_UnDoneMissionInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x207006_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	AddText(sceneId,x207006_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x207006_g_MissionAim)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x207006_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x207006_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x207006_g_ItemBonus ~= nil then
			for i, item in pairs(x207006_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
		if x207006_g_RadioItemBonus ~= nil then
			for i, item in pairs(x207006_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		end
	end
end


--**********************************����Ŀ����ʾ**********************************

function	x207006_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x207006_g_QuestOrder(x207006_g_QuestType)
	if x207006_g_Quest ==nil then
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x207006_g_MissionId)
		for i, QuestInfo in pairs(x207006_g_Quest) do

			if QuestInfo.type == "MONSTER_KILL" or QuestInfo.type == "COLLECT_SPECIAL"  or QuestInfo.type == "MONSTER_ITEM" then
				if Done == 1 then
					Many = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
					if Many == nil then
						Many = 0
					end
				end
				StrTxt = QuestInfo.name.."    "..Many.."/"..QuestInfo.num
				AddText(sceneId,StrTxt)				
			elseif  (QuestInfo.type == "COLLECT") then
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
			elseif  QuestInfo.type == "DELIVERY" or QuestInfo.type == "ENTERAREA" or QuestInfo.type == "PROTECT" then
				if Done == 1 then
					Many = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
					if Many == nil then
						Many = 0
					end
				end
				StrTxt = QuestInfo.info.."    "..Many.."/1"
				AddText(sceneId,StrTxt)
			end
		end
	end
end

--**********************************�ж������Ƿ���ʾ**********************************
function x207006_OnEnumerate( sceneId, selfId, targetId )
	--DelMission( sceneId, selfId, x207006_g_MissionId )
	--LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
	x207006_g_QuestOrder(x207006_g_QuestType) 	
    if IsMissionHaveDone(sceneId,selfId,x207006_g_MissionId) > 0 then
    	return 
    elseif IsHaveMission(sceneId,selfId,x207006_g_MissionId) > 0 then
    	local m = 0
    	for  i, QuestInfo in pairs(x207006_g_Quest) do
    		if QuestInfo.type == "DELIVERY" then
    			m = 1
    		end
    	end
    	if  (m == 1)  then
    		if  (GetName(sceneId,targetId)==x207006_g_NameEnd) then
    			AddNumText(sceneId,x207006_g_ScriptId,x207006_g_MissionName);
    		else
				for i, QuestInfo in pairs(x207006_g_Quest) do
					if QuestInfo.type == "DELIVERY" then
						if (GetName(sceneId,targetId)==QuestInfo.npc)then
					    	if x207006_CheckContinue(sceneId, selfId, targetId) == 1 then
								AddNumText(sceneId,x207006_g_ScriptId,x207006_g_MissionName);	
								break
							end
						end
					end
				end
			end
		elseif  (GetName(sceneId,targetId)==x207006_g_NameEnd) then
			AddNumText(sceneId,x207006_g_ScriptId,x207006_g_MissionName);
		end					
	--��������������ɽ�����,����ʾ�������
    elseif x207006_CheckAccept(sceneId,selfId,targetId) > 0 then
		AddNumText(sceneId,x207006_g_ScriptId,x207006_g_MissionName);
    end
end



--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x207006_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x207006_g_NameHead) then
		if (GetLevel( sceneId, selfId ) >= x207006_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x207006_g_MissionMaxLevel ) then
			if	x207006_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x207006_g_MisIdPre) do
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

function x207006_CheckContinue( sceneId, selfId ,targetId )
	x207006_g_QuestOrder(x207006_g_QuestType)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207006_g_MissionId)
	for i, QuestInfo in pairs(x207006_g_Quest) do
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
function x207006_OnAccept(sceneId, selfId )		
	x207006_g_QuestOrder(x207006_g_QuestType)
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
	for i, QuestInfo in pairs(x207006_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		elseif (QuestInfo.type == "DELIVERY") then
				DoItem = 1	
				local m = 0
				local ret = 1
				for i, QuestLableInfo in pairs(x207006_g_Quest) do
					if (QuestLableInfo.type == "DELIVERY")and (QuestLableInfo.order==QuestInfo.order)then
						if QuestInfo.item > 0 and QuestInfo.num > 0 then
							m = 1
							break
						end	
					end
				end
				if m == 1 then
					BeginAddItem(sceneId)
					if QuestInfo.item > 0 and QuestInfo.num > 0 then
						AddItem( sceneId,QuestInfo.item, QuestInfo.num )
					end
					local ret = EndAddItem(sceneId,selfId)
				end				
				if ret > 0 then
					if m == 1 then
						AddItemListToHuman(sceneId,selfId)
					end
				else
					BeginEvent(sceneId)
						strText = "��������,�޷����������Ʒ"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				end
		elseif QuestInfo.type == "COLLECT_SPECIAL"	then	--�ɼ�(��ʱ�Ȳ������)
				DoItem = 1
		elseif QuestInfo.type == "ENTERAREA"	then			--����̽��
				DoArea = 1
		elseif QuestInfo.type == "COLLECT"	then			--�ռ���Ʒ
				DoItem = 1
		elseif QuestInfo.type == "MONSTER_ITEM"	then			--��ֵ���
				DoKill = 1
				DoItem = 1
		elseif QuestInfo.type == "PROTECT"	then			--����
			if (x207006_g_PROTECTINFO == nil) then
				return
			else
				if x207006_g_PROTECTINFO.Step > 2  then
					BeginEvent(sceneId)
						strText = "#Y���ڲ��ܽ��������"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				end
				
				-- �����ǰ 
				if x207006_g_PROTECTINFO.Step == 0  then
					-- �������;���  
					-- ��ⳡ�����ǲ��������������
					local nMonsterNum = GetMonsterCount(sceneId)
					local ii = 0
					local bHaveMonster = 0
					for ii=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,ii)
						for i, QuestInfo in pairs(x207006_g_Quest) do
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
						for i, QuestInfo in pairs(x207006_g_Quest) do
							if QuestInfo.type == "PROTECT"	then
								local nNpcId = LuaFnCreateMonster(sceneId,  QuestInfo.npc, QuestInfo.place.x, QuestInfo.place.z, QuestInfo.ai.baseai, QuestInfo.ai.scriptai, x207006_g_ScriptId)
								--SetCharacterName(sceneId, nNpcId, ProtectInfo.name)
								-- ����Сʱʱ����10����
								--SetCharacterDieTime(sceneId, nNpcId, 600000)
							end
						end
					end
					-- �������Ҽӵ���������б���
					x207006_g_PROTECTINFO.PlayerNum = 1
					x207006_g_PROTECTINFO.PlayerId[1] = selfId
			
					-- ����һ��������ʱ��,ÿ���3��,�ص�һ��OnScneneTimer����
					x207006_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 207006, "OnScneneTimer", 1)
					x207006_g_PROTECTINFO.Step = 1
					--��ǰʱ��
					x207006_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
				end
				
				-- ���뵽������͵����
				if x207006_g_PROTECTINFO.Step == 2  then
					if x207006_g_PROTECTINFO.PlayerNum > 5  then
						--������
						return
					end
				
					x207006_g_PROTECTINFO.PlayerNum = x207006_g_PROTECTINFO.PlayerNum + 1
					x207006_g_PROTECTINFO.PlayerId[x207006_g_PROTECTINFO.PlayerNum] = selfId
				end
			end
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x207006_g_MissionId, x207006_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x207006_g_MissionId)			--�õ���������к�
	if x207006_g_QuestNum > 8 then
		return
	end
	for j=1,x207006_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,j-1,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x207006_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x207006_OnAbandon( sceneId, selfId )
	x207006_g_QuestOrder(x207006_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x207006_g_MissionId )
    for i, QuestInfo in pairs(x207006_g_Quest) do
		if QuestInfo.type ==  "DELIVERY" then
			if QuestInfo.item > 0 and QuestInfo.num > 0 then
				local deliveryitemnum = LuaFnGetItemCount(sceneId,selfId,QuestInfo.item)
				if deliveryitemnum > 0 then
					DelItem(sceneId,selfId,QuestInfo.item,deliveryitemnum)
				end
			end
			if QuestInfo.comeitem > 0 and QuestInfo.comenum >0 then
				local deliverycomeitemnum = LuaFnGetItemCount(sceneId,selfId,QuestInfo.comeitem)
				if deliverycomeitemnum > 0 then
					DelItem(sceneId,selfId,QuestInfo.comeitem,deliverycomeitemnum)
				end
			end
		end
		if QuestInfo.type ==  "COLLECT_SPECIAL" then
			local collectitemnum = LuaFnGetItemCount(sceneId,selfId,QuestInfo.item)
			if collectitemnum > 0 then
				DelItem(sceneId,selfId,QuestInfo.item,collectitemnum)
			end
		end
		if QuestInfo.type ==  "MONSTER_ITEM" then
			local monsteritemnum = LuaFnGetItemCount(sceneId,selfId,QuestInfo.item)
			if monsteritemnum > 0 then
				DelItem(sceneId,selfId,QuestInfo.item,monsteritemnum)
			end
		end
	end    
end

--**********************************--������ʱ��--**********************************
function x207006_OnScneneTimer(sceneId, selfId)
	x207006_g_QuestOrder(x207006_g_QuestType)
	local bHavePlayer = 0
	-- �ȴ�5�����2
	if x207006_g_PROTECTINFO.Step == 1   then
		-- ֪ͨ�Լ������������ҽ��������
		local nMonsterNum = GetMonsterCount(sceneId)
		local m = 0
		local HeadNPCID = 0
		local bHaveMonster = 0
		for m=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,m)
			if GetName(sceneId, nMonsterId)  == x207006_g_NameHead  then
				HeadNPCID = nMonsterId
				bHaveMonster = 1
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((207006), "OnDefaultEvent", sceneId, PlayerId, HeadNPCID )
			end
		end
		x207006_g_PROTECTINFO.Step = 2
	end
	-- ��ʼ�ȴ���������һ�����������,10����ʱ��
	if x207006_g_PROTECTINFO.Step == 2   then
		if LuaFnGetCurrentTime() - x207006_g_PROTECTINFO.StartTime >= 10   then
			x207006_g_PROTECTINFO.Step = 3
		end
	end
	-- ����ҵ���˿�ʼ����
	if x207006_g_PROTECTINFO.Step == 3   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			for j, ProtectInfo in pairs(x207006_g_PROTECT) do
				if GetName(sceneId, nMonsterId)  ==  ProtectInfo.name then
					bHaveMonster = bHaveMonster + 1
					x207006_g_ProtectNPCID[j] = nMonsterId
				end
			end
		end
		if bHaveMonster == #(x207006_g_PROTECT)  then
			for j, ProtectInfo in pairs(x207006_g_PROTECT) do
				SetPatrolId(sceneId, x207006_g_ProtectNPCID[j], ProtectInfo.patrol)
			end
			x207006_g_PROTECTINFO.Step = 4
		end
	end
	-- ���͹���
	if x207006_g_PROTECTINFO.Step == 4   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0

		local bDone = 0
		for ii=0, nMonsterNum-1   do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			for j, ProtectInfo in pairs(x207006_g_PROTECT) do
				if GetName(sceneId, nMonsterId)  ==  ProtectInfo.name then
					bHaveMonster = bHaveMonster + 1
					x207006_g_ProtectNPCID[j] = nMonsterId
				end
			end
		end
		if bHaveMonster < #(x207006_g_PROTECT)   then
			-- �رռ�ʱ��
			x207006_CloseTimer(sceneId, x207006_g_PROTECTINFO.ScneneTimerIndex)
			return
		end
		for j, NpcID in pairs(x207006_g_ProtectNPCID) do 
			-- ���ProtectNPC �����֮��ľ���
			local targetX, targetZ = GetWorldPos(sceneId, NpcID)
			-- ��������ҵľ����Ѿ��뿪�ĳ���������Ҳ��ڻ��Ͷ���10���ڣ�������ʧ��
			for i=1, x207006_g_PROTECTINFO.PlayerNum  do
				if x207006_g_PROTECTINFO.PlayerId[i] ~= 0  then
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x207006_g_PROTECTINFO.PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					
					if distance1 > 20    then
						--��ʾ����������ʧ��
						BeginEvent(sceneId)
							strText = x207006_g_MissionName.."  ʧ��"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x207006_g_PROTECTINFO.PlayerId[i])
						-- ���б���ɾ��������
						x207006_g_PROTECTINFO.PlayerId[i] = 0
					end
				end
			end
		end	
		for j, ProtectInfo in pairs(x207006_g_PROTECT) do
			for j, NpcID in pairs(x207006_g_ProtectNPCID) do 
				if  GetName(sceneId, NpcID)==ProtectInfo.name  then		
					local targetX, targetZ = GetWorldPos(sceneId, NpcID)
					--local x, z = GetLastPatrolPoint(sceneId, ProtectInfo.patrol)
					local x,z =144,25
					local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
					-- �����յ�
					if distance<=1  then
						for i=1, x207006_g_PROTECTINFO.PlayerNum  do
							if x207006_g_PROTECTINFO.PlayerId[i]~=0   then
								-- �������ǲ������������
								if IsHaveMission(sceneId,x207006_g_PROTECTINFO.PlayerId[i],x207006_g_MissionId) > 0 then
									local misIndex = GetMissionIndexByID(sceneId, x207006_g_PROTECTINFO.PlayerId[i], x207006_g_MissionId)
									for i, QuestInfo in pairs(x207006_g_Quest) do
										if QuestInfo.type == "PROTECT" then
											SetMissionByIndex(sceneId,x207006_g_PROTECTINFO.PlayerId[i],misIndex,QuestInfo.order-1,1)
										end
									end
									BeginEvent(sceneId)
										strText = ProtectInfo.info.."  1/1"
										AddText(sceneId,strText);
									EndEvent(sceneId)
									DispatchMissionTips(sceneId,x207006_g_PROTECTINFO.PlayerId[i])
								end
							end
						end
						RemoveMonster(sceneId, NpcID)
						bDone = bDone + 1
					end								
				end
			end
		end
		if (bDone >= #(x207006_g_PROTECT)) then
			x207006_g_PROTECTINFO.Step = 5
			-- �رռ�ʱ��
			x207006_CloseTimer(sceneId, x207006_g_PROTECTINFO.ScneneTimerIndex)
		end
	end
end

--**********************************
--�رռ�ʱ��
--**********************************
function x207006_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x207006_g_PROTECTINFO.ScneneTimerIndex = -1
	x207006_g_PROTECTINFO.Step = 0
	x207006_g_PROTECTINFO.StartTime = 0
	x207006_g_PROTECTINFO.PlayerNum = 0
	for i =1, #(x207006_g_PROTECTINFO.PlayerId) do
		x207006_g_PROTECTINFO.PlayerId[i]=0
	end
	x207006_g_ProtectNPCID = {}
end

--**********************************
--����
--**********************************
function x207006_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x207006_CheckSubmit( sceneId, selfId )
	x207006_g_QuestOrder(x207006_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x207006_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x207006_g_Quest) do
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
function x207006_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x207006_g_QuestOrder(x207006_g_QuestType)
	if (x207006_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
			if (x207006_g_ItemBonus~=nil) then
				for i, item in pairs(x207006_g_ItemBonus) do
					AddItem( sceneId,item.id, item.num )
				end
			end
			if (x207006_g_RadioItemBonus~=nil) then
				for i, item in pairs(x207006_g_RadioItemBonus) do
					if item.id == selectRadioId then
						AddItem( sceneId,item.id, item.num )
					end
				end
			end
		local giveitem = EndAddItem(sceneId,selfId)		
		if (giveitem<=0) then
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��Ʒ����������������������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			ret = DelMission( sceneId, selfId, x207006_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in pairs(x207006_g_Quest) do
					if QuestInfo.type ==  "DELIVERY" then
						if #(x207006_g_DELIVERY) == 1 and QuestInfo == x207006_g_DELIVERY[1] then
							if QuestInfo.npc == x207006_g_NameEnd and QuestInfo.item > 0 and QuestInfo.num > 0 then
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
				MissionCom( sceneId,selfId, x207006_g_MissionId )
				if (x207006_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x207006_g_ExpBonus(sceneId, selfId, x207006_g_exp))
				end					
				if (x207006_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x207006_g_MoneyBonus(sceneId, selfId, x207006_g_money) );
				end
				if (x207006_g_ItemBonus~=nil)or (x207006_g_RadioItemBonus~=nil) then
					AddItemListToHuman(sceneId,selfId)
				end
				if (x207006_g_ScriptIdNext.ScriptId~=nil) and (x207006_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x207006_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x207006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"���㵽��"..x207006_g_ScriptIdNext.LV.."���������ң��һ��к���Ҫ����Ҫ������ȥ����ǧ���ס�ˣ�")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end
end

--**********************************--ɱ����������--**********************************
function x207006_OnKillObject( sceneId, selfId, objdataId )
	x207006_g_QuestOrder(x207006_g_QuestType)
	local QuestPlace = 0	--�������Ӧ��֮ǰSetMissionByIndex(sceneId,selfId,misIndex,j-1,0)ʱ���ڵ�λ��,==j-1
	for i, QuestInfo in pairs(x207006_g_Quest) do
		if QuestInfo.type ==  "MONSTER_KILL" then	
			 if objdataId == QuestInfo.id then
				  local misIndex = GetMissionIndexByID(sceneId,selfId,x207006_g_MissionId)
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
function x207006_OnEnterArea( sceneId, selfId, areaId )
	x207006_g_QuestOrder(x207006_g_QuestType)
	if IsHaveMission(sceneId,selfId,x207006_g_MissionId) > 0 then
		for i, QuestInfo in pairs(x207006_g_Quest) do
			if QuestInfo.type == "ENTERAREA" then
				if (areaId == QuestInfo.area) and (sceneId == QuestInfo.mapid) then 
					local misIndex = GetMissionIndexByID(sceneId,selfId,x207006_g_MissionId)
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

function x207006_OnTimer( sceneId, selfId )

end

function x207006_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x207006_OnItemChanged( sceneId, selfId, itemdataId )
	x207006_g_QuestOrder(x207006_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x207006_g_MissionId)
	for i, QuestInfo in pairs(x207006_g_Quest) do
		if QuestInfo.type == "COLLECT_SPECIAL" or QuestInfo.type == "COLLECT" or QuestInfo.type == "MONSTER_ITEM" then
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
