--��������֮�����һ���
--MisDescBegin
--��ǰ�ű���������
x100027_g_ScriptId = 100027

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x100027_g_MissionId = 127

--�������
x100027_g_MissionKind = 13
x100027_g_MissionLevel = 16

--������ʼnpc
x100027_g_Name	= "������"

--�����ύnpc
x100027_g_NameEnd	= "ɵ��"


--�Ƿ��Ǿ�Ӣ����
x100027_g_IfMissionElite = 0

--�����Ƿ��Ѿ����
x100027_g_IsMissionOkFail = 0		--�����ĵ�0λ

x100027_g_DemandItem ={}

--��������
x100027_g_MissionName="�����һ���"
--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x100027_g_MissionInfo={"�õġ��������ڵ�����Ӧ�û�ʦ�ż���������Ҳ������µ�ն��"} 

x100027_g_MissionTarget="ȥ��#aB{330,265,9,����01,ɵ��}[ɵ��]#aE��"	

--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x100027_g_UnDoneMissionInfo={""}

x100027_g_MissionComplete="������"

x100027_g_MoneyBonus=10000

--MisDescEnd


--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x100027_g_MissionMinLevel = 10
x100027_g_MissionMaxLevel = 100

--ǰ�������MissionID,������д���ǰ������
x100027_g_MisIdPre = {121}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x100027_g_ScriptIdNext = {}

--****************************************�������ݿ�ʼ*********************************************************************

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
--x100027_g_UnDoneMissionInfo={"ȥ�ҳ�����ɡ�"}  
--�ܵĴ�������Ŀ��������һ�仰����
x100027_g_MissionAim="ȥ��ɵ�ðɡ�"		
--����Ŀ������(���Զ�����Ŀ��)


--DELIVERY						--����                        --npcΪҪ���Ÿ��Ķ���,itemΪ�Ƿ���������ƷҪ�����Ŷ���,��item�����񷢲���ֱ�Ӹ������; infoΪ����Ŀ����ʾ
x100027_g_DELIVERY = {{npc = "ɵ��",item = 0,num = 0,comeitem = 0,comenum = 0,info="",dialog="",type="DELIVERY",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x100027_g_QuestType = {x100027_g_DELIVERY}
x100027_g_Quest = {}
x100027_g_QuestNum = 0
x100027_MP_ISCOMPLETE = 7

function  x100027_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x100027_g_Quest[count] = QuestInfo
		end
	end
	x100027_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x100027_g_ExpBonustxt = "����  1000+�ȼ����ȼ�"
x100027_g_exp = 1

function x100027_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =100
	return ExpBonus*x100027_g_exp
end

--��Ǯ����
x100027_g_MoneyBonustxt = 10000
x100027_g_money = 1

function x100027_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x100027_g_money
end

--**********************************������ں���**********************************

function x100027_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x100027_g_QuestOrder(x100027_g_QuestType)
    if IsHaveMission(sceneId,selfId,x100027_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x100027_g_NameEnd) then
			local m = 0
			for i, QuestInfo in pairs(x100027_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					if (getn(x100027_g_DELIVERY)==1) and (x100027_g_NameEnd == x100027_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x100027_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x100027_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x100027_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x100027_g_ScriptId,x100027_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x100027_g_ScriptId,x100027_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x100027_g_DELIVERY[1].item > 0 and x100027_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x100027_g_DELIVERY[1].item)>=x100027_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x100027_g_MissionId)
					for i, QuestInfo in pairs(x100027_g_Quest) do
						if (QuestInfo.type == "DELIVERY") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x100027_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x100027_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
				BeginEvent(sceneId)
				   AddText(sceneId,"#Y"..x100027_g_MissionName)
		       AddText(sceneId,x100027_g_MissionComplete)
		       AddMoneyBonus(sceneId, 10000)
		    EndEvent()
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x100027_g_ScriptId,x100027_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x100027_g_ScriptId,x100027_g_MissionId,0)
				end
			end
		elseif (x100027_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in pairs(x100027_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in pairs(x100027_g_DELIVERY) do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x100027_g_MissionId)
							for i, QuestInfo in pairs(x100027_g_Quest) do
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
								AddText(sceneId,x100027_g_Name.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x100027_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x100027_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x100027_g_ScriptId,x100027_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x100027_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x100027_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x100027_g_ContinueInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x100027_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	--AddText(sceneId,x100027_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x100027_g_MissionTarget)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	--x100027_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x100027_g_MoneyBonustxt )
end


--**********************************����Ŀ����ʾ**********************************

function	x100027_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x100027_g_QuestOrder(x100027_g_QuestType)
	if x100027_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x100027_g_MissionId)
		for i, QuestInfo in pairs(x100027_g_Quest) do

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
function x100027_OnEnumerate( sceneId, selfId, targetId )
	x100027_g_QuestOrder(x100027_g_QuestType) 	
    if IsMissionHaveDone(sceneId,selfId,x100027_g_MissionId) > 0 then
    	return 
    elseif IsHaveMission(sceneId,selfId,x100027_g_MissionId) > 0 then
    	local m = 0
    	for  i, QuestInfo in pairs(x100027_g_Quest) do
    		if QuestInfo.type == "DELIVERY" then
    			m = 1
    		end
    	end

    	if  (m == 1)  then
    		if  (GetName(sceneId,targetId)==x100027_g_NameEnd) then
    			AddNumText(sceneId,x100027_g_ScriptId,x100027_g_MissionName);
    		else
				for i, QuestInfo in pairs(x100027_g_Quest) do
					if QuestInfo.type == "DELIVERY" then
						if (GetName(sceneId,targetId)==QuestInfo.npc)then
					    	if x100027_CheckContinue(sceneId, selfId, targetId) == 1 then
								AddNumText(sceneId,x100027_g_ScriptId,x100027_g_MissionName);	
								break
							end
						end
					end
				end
			end
		elseif  (GetName(sceneId,targetId)==x100027_g_NameEnd) then
			AddNumText(sceneId,x100027_g_ScriptId,x100027_g_MissionName);
		end					
	--��������������ɽ�����,����ʾ�������
    elseif x100027_CheckAccept(sceneId,selfId,targetId) > 0 then
		AddNumText(sceneId,x100027_g_ScriptId,x100027_g_MissionName);
    end
end



--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x100027_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x100027_g_Name) then
		if (GetLevel( sceneId, selfId ) >= x100027_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x100027_g_MissionMaxLevel ) then
			if	x100027_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x100027_g_MisIdPre) do
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

function x100027_CheckContinue( sceneId, selfId ,targetId )
	x100027_g_QuestOrder(x100027_g_QuestType)
	misIndex = GetMissionIndexByID(sceneId,selfId,x100027_g_MissionId)
	for i, QuestInfo in pairs(x100027_g_Quest) do
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
function x100027_OnAccept(sceneId, selfId )		
	x100027_g_QuestOrder(x100027_g_QuestType)
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
	for i, QuestInfo in pairs(x100027_g_Quest) do
		if (QuestInfo.type == "DELIVERY") then
				DoItem = 1	
				local m = 0
				local ret = 1
				for i, QuestLableInfo in pairs(x100027_g_Quest) do
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
	AddMission( sceneId,selfId, x100027_g_MissionId, x100027_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x100027_g_MissionId)			--�õ���������к�
	if x100027_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x100027_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,7,1)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x100027_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x100027_OnAbandon( sceneId, selfId )
	x100027_g_QuestOrder(x100027_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x100027_g_MissionId )
    for i, QuestInfo in pairs(x100027_g_Quest) do
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
function x100027_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x100027_CheckSubmit( sceneId, selfId )
	x100027_g_QuestOrder(x100027_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x100027_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x100027_g_Quest) do
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
function x100027_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x100027_g_QuestOrder(x100027_g_QuestType)
	if (x100027_CheckSubmit( sceneId, selfId ) == 1) then
			ret = DelMission( sceneId, selfId, x100027_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in pairs(x100027_g_Quest) do
					if QuestInfo.type ==  "DELIVERY" then
						if getn(x100027_g_DELIVERY) == 1 and QuestInfo == x100027_g_DELIVERY[1] then
							if QuestInfo.npc == x100027_g_NameEnd and QuestInfo.item > 0 and QuestInfo.num > 0 then
								DelItem(sceneId,selfId,QuestInfo.item,QuestInfo.num)
							end								
						end
						if QuestInfo.comeitem > 0 and QuestInfo.comenum >0 then
							DelItem(sceneId,selfId,QuestInfo.comeitem,QuestInfo.comenum)
						end
					end					
				end   
				MissionCom( sceneId,selfId, x100027_g_MissionId )
				if (x100027_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x100027_g_ExpBonus(sceneId, selfId, x100027_g_exp))
				end					
				if (x100027_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x100027_g_MoneyBonus(sceneId, selfId, x100027_g_money) );
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x100027_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x100027_g_ScriptIdNext.ScriptId~=nil) and (x100027_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x100027_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x100027_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"���ϻ���һλ�����ֶεĵ��Σ�ȥ���������ɡ�")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end

--**********************************--ɱ����������--**********************************
function x100027_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************--���������¼�--**********************************
function x100027_OnEnterArea( sceneId, selfId, areaId )

end

function x100027_OnTimer( sceneId, selfId )

end

function x100027_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x100027_OnItemChanged( sceneId, selfId, itemdataId )
	x100027_g_QuestOrder(x100027_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x100027_g_MissionId)
	for i, QuestInfo in pairs(x100027_g_Quest) do
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
