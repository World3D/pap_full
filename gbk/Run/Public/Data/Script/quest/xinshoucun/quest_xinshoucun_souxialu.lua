--��������֮����¼
--MisDescBegin
--��ǰ�ű���������
x970017_g_ScriptId = 970017

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x970017_g_MissionId = 987

--�������
x970017_g_MissionKind = 13
x970017_g_MissionLevel = 7

--������ʼnpc
x970017_g_Name	= "��¡"

--�����ύnpc
x970017_g_NameEnd	= "��¡"


--�Ƿ��Ǿ�Ӣ����
x970017_g_IfMissionElite = 0

--�����Ƿ��Ѿ����
x970017_g_IsMissionOkFail = 0		--�����ĵ�0λ

x970017_g_DemandItem ={}

--��������
x970017_g_MissionName="����¼"
--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x970017_g_MissionInfo={"#{quest_souxialu}"} 

x970017_g_MissionTarget="���¡����̸��"	

--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x970017_g_UnDoneMissionInfo={"���Ҽ�����̸��"}

x970017_g_MissionComplete="�����˰ɣ�������ðɣ�����������ó̸��Ӿ��ʡ�"

x970017_g_MoneyBonus=10000

--MisDescEnd


--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x970017_g_MissionMinLevel = 1
x970017_g_MissionMaxLevel = 100

--ǰ�������MissionID,������д���ǰ������
x970017_g_MisIdPre = {986}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x970017_g_ScriptIdNext = {ScriptId = 970018 ,LV = 1 }

--****************************************�������ݿ�ʼ*********************************************************************

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
--x970017_g_UnDoneMissionInfo={"��������̸����"}  
--�ܵĴ�������Ŀ��������һ�仰����
x970017_g_MissionAim="���¡����̸��"		
--����Ŀ������(���Զ�����Ŀ��)


--DELIVERY						--����                        --npcΪҪ���Ÿ��Ķ���,itemΪ�Ƿ���������ƷҪ�����Ŷ���,��item�����񷢲���ֱ�Ӹ������; infoΪ����Ŀ����ʾ
x970017_g_DELIVERY = {{npc = "��¡",item = 0,num = 0,comeitem = 0,comenum = 0,info="",dialog="",type="DELIVERY",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x970017_g_QuestType = {x970017_g_DELIVERY}
x970017_g_Quest = {}
x970017_g_QuestNum = 0
x970017_MP_ISCOMPLETE = 7

function  x970017_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x970017_g_Quest[count] = QuestInfo
		end
	end
	x970017_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x970017_g_ExpBonustxt = "����  1000+�ȼ����ȼ�"
x970017_g_exp = 1

function x970017_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =18
	return ExpBonus*x970017_g_exp
end

--��Ǯ����
x970017_g_MoneyBonustxt = 10000
x970017_g_money = 1

function x970017_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x970017_g_money
end

--**********************************������ں���**********************************

function x970017_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x970017_g_QuestOrder(x970017_g_QuestType)
    if IsHaveMission(sceneId,selfId,x970017_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x970017_g_NameEnd) then
			local m = 0
			for i, QuestInfo in pairs(x970017_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					if (#(x970017_g_DELIVERY)==1) and (x970017_g_NameEnd == x970017_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x970017_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x970017_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x970017_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x970017_g_ScriptId,x970017_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x970017_g_ScriptId,x970017_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x970017_g_DELIVERY[1].item > 0 and x970017_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x970017_g_DELIVERY[1].item)>=x970017_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x970017_g_MissionId)
					for i, QuestInfo in pairs(x970017_g_Quest) do
						if (QuestInfo.type == "DELIVERY") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x970017_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x970017_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
				BeginEvent(sceneId)
				   AddText(sceneId,"#Y"..x970017_g_MissionName)
		       AddText(sceneId,x970017_g_MissionComplete)
		       AddMoneyBonus(sceneId, 10000)
		    EndEvent()
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x970017_g_ScriptId,x970017_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x970017_g_ScriptId,x970017_g_MissionId,0)
				end
			end
		elseif (x970017_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in pairs(x970017_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in pairs(x970017_g_DELIVERY) do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x970017_g_MissionId)
							for i, QuestInfo in pairs(x970017_g_Quest) do
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
								AddText(sceneId,x970017_g_Name.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x970017_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x970017_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x970017_g_ScriptId,x970017_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x970017_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x970017_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x970017_g_ContinueInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x970017_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	--AddText(sceneId,x970017_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x970017_g_MissionTarget)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	--x970017_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x970017_g_MoneyBonustxt )
end


--**********************************����Ŀ����ʾ**********************************

function	x970017_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x970017_g_QuestOrder(x970017_g_QuestType)
	if x970017_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x970017_g_MissionId)
		for i, QuestInfo in pairs(x970017_g_Quest) do

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
function x970017_OnEnumerate( sceneId, selfId, targetId )
	x970017_g_QuestOrder(x970017_g_QuestType) 	
    if IsMissionHaveDone(sceneId,selfId,x970017_g_MissionId) > 0 then
    	return 
    elseif IsHaveMission(sceneId,selfId,x970017_g_MissionId) > 0 then
    	local m = 0
    	for  i, QuestInfo in pairs(x970017_g_Quest) do
    		if QuestInfo.type == "DELIVERY" then
    			m = 1
    		end
    	end

    	if  (m == 1)  then
    		if  (GetName(sceneId,targetId)==x970017_g_NameEnd) then
    			AddNumText(sceneId,x970017_g_ScriptId,x970017_g_MissionName);
    		else
				for i, QuestInfo in pairs(x970017_g_Quest) do
					if QuestInfo.type == "DELIVERY" then
						if (GetName(sceneId,targetId)==QuestInfo.npc)then
					    	if x970017_CheckContinue(sceneId, selfId, targetId) == 1 then
								AddNumText(sceneId,x970017_g_ScriptId,x970017_g_MissionName);	
								break
							end
						end
					end
				end
			end
		elseif  (GetName(sceneId,targetId)==x970017_g_NameEnd) then
			AddNumText(sceneId,x970017_g_ScriptId,x970017_g_MissionName);
		end					
	--��������������ɽ�����,����ʾ�������
    elseif x970017_CheckAccept(sceneId,selfId,targetId) > 0 then
		AddNumText(sceneId,x970017_g_ScriptId,x970017_g_MissionName);
    end
end



--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x970017_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x970017_g_Name) then
		if (GetLevel( sceneId, selfId ) >= x970017_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x970017_g_MissionMaxLevel ) then
			if	x970017_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x970017_g_MisIdPre) do
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

function x970017_CheckContinue( sceneId, selfId ,targetId )
	x970017_g_QuestOrder(x970017_g_QuestType)
	misIndex = GetMissionIndexByID(sceneId,selfId,x970017_g_MissionId)
	for i, QuestInfo in pairs(x970017_g_Quest) do
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
function x970017_OnAccept(sceneId, selfId )		
	x970017_g_QuestOrder(x970017_g_QuestType)
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
	for i, QuestInfo in pairs(x970017_g_Quest) do
		if (QuestInfo.type == "DELIVERY") then
				DoItem = 1	
				local m = 0
				local ret = 1
				for i, QuestLableInfo in pairs(x970017_g_Quest) do
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
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x970017_g_MissionId, x970017_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x970017_g_MissionId)			--�õ���������к�
	if x970017_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x970017_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,7,1)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x970017_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x970017_OnAbandon( sceneId, selfId )
	x970017_g_QuestOrder(x970017_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x970017_g_MissionId )
    for i, QuestInfo in pairs(x970017_g_Quest) do
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
function x970017_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x970017_CheckSubmit( sceneId, selfId )
	x970017_g_QuestOrder(x970017_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x970017_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x970017_g_Quest) do
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
function x970017_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x970017_g_QuestOrder(x970017_g_QuestType)
	if (x970017_CheckSubmit( sceneId, selfId ) == 1) then
			ret = DelMission( sceneId, selfId, x970017_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in pairs(x970017_g_Quest) do
					if QuestInfo.type ==  "DELIVERY" then
						if #(x970017_g_DELIVERY) == 1 and QuestInfo == x970017_g_DELIVERY[1] then
							if QuestInfo.npc == x970017_g_NameEnd and QuestInfo.item > 0 and QuestInfo.num > 0 then
								DelItem(sceneId,selfId,QuestInfo.item,QuestInfo.num)
							end								
						end
						if QuestInfo.comeitem > 0 and QuestInfo.comenum >0 then
							DelItem(sceneId,selfId,QuestInfo.comeitem,QuestInfo.comenum)
						end
					end					
				end   
				MissionCom( sceneId,selfId, x970017_g_MissionId )
				if (x970017_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x970017_g_ExpBonus(sceneId, selfId, x970017_g_exp))
				end					
				if (x970017_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x970017_g_MoneyBonus(sceneId, selfId, x970017_g_money) );
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x970017_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x970017_g_ScriptIdNext.ScriptId~=nil) and (x970017_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x970017_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x970017_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end

--**********************************--ɱ����������--**********************************
function x970017_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************--���������¼�--**********************************
function x970017_OnEnterArea( sceneId, selfId, areaId )

end

function x970017_OnTimer( sceneId, selfId )

end

function x970017_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x970017_OnItemChanged( sceneId, selfId, itemdataId )
	x970017_g_QuestOrder(x970017_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x970017_g_MissionId)
	for i, QuestInfo in pairs(x970017_g_Quest) do
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
