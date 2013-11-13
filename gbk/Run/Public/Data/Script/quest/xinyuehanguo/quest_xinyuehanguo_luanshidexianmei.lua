--�ýű�������ҽ�����ʱ�Ľ��湹��������������ݶ��塢������Ŀ���Ƕ��
--MisDescBegin
--��ǰ�ű���������
x211047_g_ScriptId = 211047

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x211047_g_MissionId = 386

--������ʼnpc
x211047_g_Name	= "�ٷ�"

--�������
x211047_g_MissionKind = 1
x211047_g_MissionLevel = 4

--�Ƿ��Ǿ�Ӣ����
x211047_g_IfMissionElite = 0

--�����Ƿ��Ѿ����
x211047_g_IsMissionOkFail = 0		--�����ĵ�0λ

x211047_g_DemandKill ={}

--��������
x211047_g_MissionName="����������"
--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x211047_g_MissionInfo={"���ƿ��ּ����Ȼ��������ζ��������һ����Ҳ�Բ��棬�����̵�����Ҳ��ϲ���Լ���ģ�������͵�ȥ����һ���ˣ����ƻ�����һ�ѳ��ֵı����ġ�"} 

x211047_g_MissionTarget="�����ƵĿ��ּ����������"	

x211047_g_ContinueInfo={"���������ʵ����"}  

x211047_g_MissionComplete=""

x211047_g_MoneyBonus=10000

--�̶���Ʒ���������8��
x211047_g_ItemBonus={{id=12010003,num=5},{id=12010004,num=5}}

--��ѡ��Ʒ���������8��
x211047_g_RadioItemBonus={{id=12010005,num=5},{id=12010006,num=5}}

--MisDescEnd

--�����ύnpc
x211047_g_NameEnd	= "������"



--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x211047_g_MissionMinLevel = 4
x211047_g_MissionMaxLevel = 200

--ǰ�������MissionID,������д���ǰ������
x211047_g_MisIdPre = {385}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x211047_g_ScriptIdNext = {ScriptId = 211043 ,LV = 5 }

--****************************************�������ݿ�ʼ*********************************************************************


--����Ŀ������(���Զ�����Ŀ��)

--DELIVERY						--����                        --npcΪҪ���Ÿ��Ķ���,itemΪ�Ƿ���������ƷҪ�����Ŷ���,��item�����񷢲���ֱ�Ӹ������; infoΪ����Ŀ����ʾ
x211047_g_DELIVERY = {{npc = "������",item = 12010005,num = 1,comeitem = 0,comenum = 0,info="�����ƵĿ��ּ����������",dialog="���������ʵ����",type="DELIVERY",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x211047_g_QuestType = {x211047_g_DELIVERY}
x211047_g_Quest = {}
x211047_g_QuestNum = 0

function  x211047_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x211047_g_Quest[count] = QuestInfo
		end
	end
	x211047_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x211047_g_ExpBonustxt = "����  1000+�ȼ����ȼ�"
x211047_g_exp = 1

function x211047_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =8000
	return ExpBonus*x211047_g_exp
end

--��Ǯ����
x211047_g_MoneyBonustxt = 10000
x211047_g_money = 1

function x211047_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x211047_g_money
end

--**********************************������ں���**********************************

function x211047_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x211047_g_QuestOrder(x211047_g_QuestType)
    if IsHaveMission(sceneId,selfId,x211047_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x211047_g_NameEnd) then
			local m = 0
			for i, QuestInfo in pairs(x211047_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					if (getn(x211047_g_DELIVERY)==1) and (x211047_g_NameEnd == x211047_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x211047_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x211047_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x211047_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x211047_g_ScriptId,x211047_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x211047_g_ScriptId,x211047_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x211047_g_DELIVERY[1].item > 0 and x211047_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x211047_g_DELIVERY[1].item)>=x211047_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x211047_g_MissionId)
					for i, QuestInfo in pairs(x211047_g_Quest) do
						if (QuestInfo.type == "DELIVERY") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x211047_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x211047_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x211047_g_ScriptId,x211047_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x211047_g_ScriptId,x211047_g_MissionId,0)
				end
			end
		elseif (x211047_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in pairs(x211047_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in pairs(x211047_g_DELIVERY) do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x211047_g_MissionId)
							for i, QuestInfo in pairs(x211047_g_Quest) do
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
								AddText(sceneId,x211047_g_Name.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x211047_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x211047_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211047_g_ScriptId,x211047_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x211047_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x211047_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x211047_g_ContinueInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x211047_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	--AddText(sceneId,x211047_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x211047_g_MissionTarget)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	--x211047_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x211047_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x211047_g_ItemBonus ~= nil then
			for i, item in pairs(x211047_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
		if x211047_g_RadioItemBonus ~= nil then
			for i, item in pairs(x211047_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		end
	end
end


--**********************************����Ŀ����ʾ**********************************

function	x211047_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x211047_g_QuestOrder(x211047_g_QuestType)
	if x211047_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x211047_g_MissionId)
		for i, QuestInfo in pairs(x211047_g_Quest) do

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
function x211047_OnEnumerate( sceneId, selfId, targetId )
	x211047_g_QuestOrder(x211047_g_QuestType) 	
    if IsMissionHaveDone(sceneId,selfId,x211047_g_MissionId) > 0 then
    	return 
    elseif IsHaveMission(sceneId,selfId,x211047_g_MissionId) > 0 then
    	local m = 0
    	for  i, QuestInfo in pairs(x211047_g_Quest) do
    		if QuestInfo.type == "DELIVERY" then
    			m = 1
    		end
    	end

    	if  (m == 1)  then
    		if  (GetName(sceneId,targetId)==x211047_g_NameEnd) then
    			AddNumText(sceneId,x211047_g_ScriptId,x211047_g_MissionName);
    		else
				for i, QuestInfo in pairs(x211047_g_Quest) do
					if QuestInfo.type == "DELIVERY" then
						if (GetName(sceneId,targetId)==QuestInfo.npc)then
					    	if x211047_CheckContinue(sceneId, selfId, targetId) == 1 then
								AddNumText(sceneId,x211047_g_ScriptId,x211047_g_MissionName);	
								break
							end
						end
					end
				end
			end
		elseif  (GetName(sceneId,targetId)==x211047_g_NameEnd) then
			AddNumText(sceneId,x211047_g_ScriptId,x211047_g_MissionName);
		end					
	--��������������ɽ�����,����ʾ�������
    elseif x211047_CheckAccept(sceneId,selfId,targetId) > 0 then
		AddNumText(sceneId,x211047_g_ScriptId,x211047_g_MissionName);
    end
end



--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x211047_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x211047_g_Name) then
		if (GetLevel( sceneId, selfId ) >= x211047_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x211047_g_MissionMaxLevel ) then
			if	x211047_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x211047_g_MisIdPre) do
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

function x211047_CheckContinue( sceneId, selfId ,targetId )
	x211047_g_QuestOrder(x211047_g_QuestType)
	misIndex = GetMissionIndexByID(sceneId,selfId,x211047_g_MissionId)
	for i, QuestInfo in pairs(x211047_g_Quest) do
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
function x211047_OnAccept(sceneId, selfId )		
	x211047_g_QuestOrder(x211047_g_QuestType)
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
	for i, QuestInfo in pairs(x211047_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		elseif (QuestInfo.type == "DELIVERY") then
				DoItem = 1	
				local m = 0
				local ret = 1
				for i, QuestLableInfo in pairs(x211047_g_Quest) do
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
			if (x211047_g_PROTECTINFO == nil) then
				print("�û�������û��������صĶ�ʱ��!!!")
				return
			else
				if x211047_g_PROTECTINFO.Step > 2  then
					BeginEvent(sceneId)
						strText = "#Y���ڲ��ܽ��������"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				end
				
				-- �����ǰ 
				if x211047_g_PROTECTINFO.Step == 0  then
					-- �������;���  
					-- ��ⳡ�����ǲ��������������
					local nMonsterNum = GetMonsterCount(sceneId)
					local ii = 0
					local bHaveMonster = 0
					for ii=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,ii)
						for i, QuestInfo in pairs(x211047_g_Quest) do
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
						for i, QuestInfo in pairs(x211047_g_Quest) do
							if QuestInfo.type == "PROTECT"	then
								local nNpcId = LuaFnCreateMonster(sceneId,  QuestInfo.npc, QuestInfo.place.x, QuestInfo.place.z, QuestInfo.ai.baseai, QuestInfo.ai.scriptai, x211047_g_ScriptId)
								--SetCharacterName(sceneId, nNpcId, ProtectInfo.name)
								-- ����Сʱʱ����10����
								--SetCharacterDieTime(sceneId, nNpcId, 600000)
							end
						end
					end
					-- �������Ҽӵ���������б���
					x211047_g_PROTECTINFO.PlayerNum = 1
					x211047_g_PROTECTINFO.PlayerId[1] = selfId
			
					-- ����һ��������ʱ��,ÿ���3��,�ص�һ��OnScneneTimer����
					x211047_g_PROTECTINFO.ScneneTimerIndex = SetTimer(sceneId, selfId, 211047, "OnScneneTimer", 1)
					x211047_g_PROTECTINFO.Step = 1
					--��ǰʱ��
					x211047_g_PROTECTINFO.StartTime = LuaFnGetCurrentTime()
				end
				
				-- ���뵽������͵����
				if x211047_g_PROTECTINFO.Step == 2  then
					if x211047_g_PROTECTINFO.PlayerNum > 5  then
						--������
						return
					end
				
					x211047_g_PROTECTINFO.PlayerNum = x211047_g_PROTECTINFO.PlayerNum + 1
					x211047_g_PROTECTINFO.PlayerId[x211047_g_PROTECTINFO.PlayerNum] = selfId
				end
			end
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x211047_g_MissionId, x211047_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x211047_g_MissionId)			--�õ���������к�
	if x211047_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x211047_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,j-1,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x211047_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x211047_OnAbandon( sceneId, selfId )
	x211047_g_QuestOrder(x211047_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211047_g_MissionId )
    for i, QuestInfo in pairs(x211047_g_Quest) do
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
	end    
end



--**********************************
--����
--**********************************
function x211047_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211047_CheckSubmit( sceneId, selfId )
	x211047_g_QuestOrder(x211047_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x211047_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x211047_g_Quest) do
		if QuestInfo.type == "DELIVERY" then
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
function x211047_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x211047_g_QuestOrder(x211047_g_QuestType)
	if (x211047_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if (getn(x211047_g_ItemBonus) ==0)  and  (getn(x211047_g_RadioItemBonus) == 0 ) then
			givebonus = 1
		else
			for i, item in pairs(x211047_g_ItemBonus) do
				if item.id>0 and item.num>0 then
					AddItem( sceneId,item.id, item.num )
					giveitem = 1
				end
			end
			for i, item in pairs(x211047_g_RadioItemBonus) do
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
			ret = DelMission( sceneId, selfId, x211047_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in pairs(x211047_g_Quest) do
					if QuestInfo.type ==  "DELIVERY" then
						if getn(x211047_g_DELIVERY) == 1 and QuestInfo == x211047_g_DELIVERY[1] then
							if QuestInfo.npc == x211047_g_NameEnd and QuestInfo.item > 0 and QuestInfo.num > 0 then
								DelItem(sceneId,selfId,QuestInfo.item,QuestInfo.num)
							end								
						end
						if QuestInfo.comeitem > 0 and QuestInfo.comenum >0 then
							DelItem(sceneId,selfId,QuestInfo.comeitem,QuestInfo.comenum)
						end
					end					
				end   
				MissionCom( sceneId,selfId, x211047_g_MissionId )
				if (x211047_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x211047_g_ExpBonus(sceneId, selfId, x211047_g_exp))
				end					
				if (x211047_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x211047_g_MoneyBonus(sceneId, selfId, x211047_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x211047_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x211047_g_ScriptIdNext.ScriptId~=nil) and (x211047_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x211047_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x211047_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"���㵽��"..x211047_g_ScriptIdNext.LV.."���������ң��һ��к���Ҫ����Ҫ������ȥ����ǧ���ס�ˣ�")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end
end

--**********************************--ɱ����������--**********************************
function x211047_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************--���������¼�--**********************************
function x211047_OnEnterArea( sceneId, selfId, areaId )

end

function x211047_OnTimer( sceneId, selfId )

end

function x211047_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x211047_OnItemChanged( sceneId, selfId, itemdataId )
	x211047_g_QuestOrder(x211047_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x211047_g_MissionId)
	for i, QuestInfo in pairs(x211047_g_Quest) do
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
