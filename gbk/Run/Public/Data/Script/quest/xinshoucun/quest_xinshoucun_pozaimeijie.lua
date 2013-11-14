--���ֲ�������֮  ����ü��
--MisDescBegin
--������Ʒ��δ���
--��ɱ�Ĺ�����δ���
--��ǰ�ű���������
x970015_g_ScriptId = 970015

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x970015_g_MissionId = 985

--�������
x970015_g_MissionKind = 1
x970015_g_MissionLevel = 5

--������ʼnpc
x970015_g_NameHead	= "��¡"

--�����ύnpc
x970015_g_NameEnd	= "��¡"

--�����Ƿ��Ѿ����
x970015_g_IsMissionOkFail = 0		--�����ĵ�0λ

x970015_g_DemandItem ={{id=13010083,num=1}}

x970015_g_MissionName="����ü��"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x970015_g_MissionInfo={"#{quest_pozaimeijie}\n���ܰ����õ�һ������ô��"} 

x970015_g_MissionTarget="����#aB{156,56,3,������,�ϻ�}[�ϻ�]#aE����һ���������ռ������ǡ��õ�֮���ȥ��#aB{64,41,3,������,��¡}[��¡]#aE"	

x970015_g_ContinueInfo={"��¡���ڵ�Ϧ�����󲻵ã����ȥ��ء�"}

x970015_g_MissionComplete={"��ô��ͻ����ˣ����Ȼ�����������츳��"}

x970015_g_MoneyBonus=10000
x970015_g_ItemBonus={id=12010001,num=3}
--MisDescEnd

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x970015_g_MissionMinLevel = 1
x970015_g_MissionMaxLevel = 100

--ǰ�������MissionID,������д���ǰ������
x970015_g_MisIdPre = {984}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x970015_g_ScriptIdNext = {ScriptId = 970016 ,LV = 1 }

--****************************************�������ݿ�ʼ********************************************************************* 
--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x970015_g_UnDoneMissionInfo={"��¡���ڵ�Ϧ�����󲻵ã����ȥ��ء�Ҫ���͸����ˡ�"}
--�ܵĴ�������Ŀ��������һ�仰����
x970015_g_MissionAim="�����ϻ������ϻ������ռ����ǡ�"		

--����Ŀ������(���Զ�����Ŀ��)
--MONSTER_ITEM					--��ֵ���                    --idΪɱ�����ͣ�itemΪ���������Ʒ����,nameΪ�������ƣ�perΪ������ʣ�maxΪһ�ε�����Ʒ�ĸ�������,numΪ������߸���
x970015_g_MONSTER_ITEM = {{id=9111,item=13010083,name="����",per=20,max=1,num=1,type="MONSTER_ITEM",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x970015_g_QuestType = {x970015_g_MONSTER_ITEM,x970015_g_MONSTER_KILL}
x970015_g_Quest = {}
x970015_g_QuestNum = 0
x970012_MP_ISCOMPLETE = 7

function  x970015_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x970015_g_Quest[count] = QuestInfo
		end
	end
	x970015_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x970015_g_ExpBonustxt = ""
x970015_g_exp = 1

function x970015_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =12
	return ExpBonus*x970015_g_exp
end

--��Ǯ����
x970015_g_MoneyBonustxt = 10000
x970015_g_money = 1

function x970015_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x970015_g_money
end

--�̶���Ʒ���������8��
x970015_g_ItemBonus={{id=12010003,num=5}}

--**********************************������ں���**********************************

function x970015_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x970015_g_QuestOrder(x970015_g_QuestType)
    if IsHaveMission(sceneId,selfId,x970015_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x970015_g_NameEnd) then
			local m = 0
			for i, QuestInfo in pairs(x970015_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					if (#(x970015_g_DELIVERY)==1) and (x970015_g_NameEnd == x970015_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x970015_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x970015_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x970015_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
				BeginEvent(sceneId)
             AddText(sceneId,"#Y"..x970015_g_MissionName)
		         AddText(sceneId,"��ô��ͻ����ˣ����Ȼ�����������츳���Ҿ�֪�����˳��������")
		         AddMoneyBonus(sceneId, 10000)
		         if x970015_g_ItemBonus ~= nil then
		          	for i, item in pairs(x970015_g_ItemBonus) do
			        	AddItemBonus( sceneId, item.id, item.num )
			          end
		         end
		    EndEvent()
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x970015_g_ScriptId,x970015_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x970015_g_ScriptId,x970015_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x970015_g_DELIVERY[1].item > 0 and x970015_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x970015_g_DELIVERY[1].item)>=x970015_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x970015_g_MissionId)
					for i, QuestInfo in pairs(x970015_g_Quest) do
						if (QuestInfo.type == "DELIVERY") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,7,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x970015_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x970015_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x970015_g_ScriptId,x970015_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x970015_g_ScriptId,x970015_g_MissionId,0)
				end
			end
		elseif (x970015_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in pairs(x970015_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in pairs(x970015_g_DELIVERY) do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x970015_g_MissionId)
							for i, QuestInfo in pairs(x970015_g_Quest) do
								if QuestInfo.type == "DELIVERY" then
									if (GetName(sceneId,targetId)==QuestInfo.npc)then
										SetMissionByIndex(sceneId,selfId,misIndex,7,1)
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
								AddText(sceneId,x970015_g_NameHead.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x970015_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x970015_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x970015_g_ScriptId,x970015_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x970015_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x970015_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x970015_g_UnDoneMissionInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x970015_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	AddText(sceneId,x970015_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x970015_g_MissionAim)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x970015_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x970015_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x970015_g_ItemBonus ~= nil then
			for i, item in pairs(x970015_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
	end
end

--**********************************����Ŀ����ʾ**********************************

function	x970015_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x970015_g_QuestOrder(x970015_g_QuestType)
	if x970015_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x970015_g_MissionId)
		for i, QuestInfo in pairs(x970015_g_Quest) do

			if QuestInfo.type == "MONSTER_KILL" or QuestInfo.type == "COLLECT_SPECIAL"  or QuestInfo.type == "MONSTER_ITEM" then
				if Done == 1 then
					Many = GetMissionParam(sceneId,selfId,misIndex,7)
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
    end
	end
end
end

--**********************************�ж������Ƿ���ʾ**********************************
function x970015_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x970015_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x970015_g_MissionId) > 0 then
		AddNumText(sceneId,x970015_g_ScriptId,x970015_g_MissionName);
    --���������������
    elseif x970015_CheckAccept(sceneId,selfId ,targetId) > 0 then
		AddNumText(sceneId,x970015_g_ScriptId,x970015_g_MissionName);
    end
end


--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x970015_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x970015_g_NameHead) then
		if (GetLevel( sceneId, selfId ) >= x970015_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x970015_g_MissionMaxLevel ) then
			if	x970015_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x970015_g_MisIdPre) do
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
--**********************************��������**********************************
function x970015_OnAccept(sceneId, selfId )		
	x970015_g_QuestOrder(x970015_g_QuestType)
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
	for i, QuestInfo in pairs(x970015_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		elseif (QuestInfo.type == "DELIVERY") then
				DoItem = 1	
				local m = 0
				local ret = 1
				for i, QuestLableInfo in pairs(x970015_g_Quest) do
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
				elseif QuestInfo.type == "MONSTER_ITEM"	then			--��ֵ���
				DoKill = 1
				DoItem = 1
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x970015_g_MissionId, x970015_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x970015_g_MissionId)			--�õ���������к�
	if x970015_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x970015_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,7,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x970015_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x970015_OnAbandon( sceneId, selfId )
	x970015_g_QuestOrder(x970015_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x970015_g_MissionId )
    for i, QuestInfo in pairs(x970015_g_Quest) do
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

--**********************************
--����
--**********************************
function x970015_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x970015_CheckSubmit( sceneId, selfId )
	x970015_g_QuestOrder(x970015_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x970015_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x970015_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" or QuestInfo.type == "MONSTER_ITEM" then
			local Many = GetMissionParam(sceneId,selfId,misIndex,7)
			if QuestInfo.num == nil then
				QuestInfo.num = 1
			end
			if Many == nil then

			elseif	Many < QuestInfo.num then
				bDone = 0
				break
			end
		elseif QuestInfo.type == "DELIVERY" then
			Many = GetMissionParam(sceneId,selfId,misIndex,7)
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
function x970015_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x970015_g_QuestOrder(x970015_g_QuestType)
	if (x970015_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if #(x970015_g_ItemBonus) ==0 then
			givebonus = 1
		else
			for i, item in pairs(x970015_g_ItemBonus) do
				if item.id>0 and item.num>0 then
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
			ret = DelMission( sceneId, selfId, x970015_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in pairs(x970015_g_Quest) do
					if QuestInfo.type ==  "DELIVERY" then
						if #(x970015_g_DELIVERY) == 1 and QuestInfo == x970015_g_DELIVERY[1] then
							if QuestInfo.npc == x970015_g_NameEnd and QuestInfo.item > 0 and QuestInfo.num > 0 then
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
				MissionCom( sceneId,selfId, x970015_g_MissionId )
				if (x970015_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x970015_g_ExpBonus(sceneId, selfId, x970015_g_exp))
				end					
				if (x970015_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x970015_g_MoneyBonus(sceneId, selfId, x970015_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x970015_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x970015_g_ScriptIdNext.ScriptId~=nil) and (x970015_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x970015_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x970015_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"��ѽ��ѽ�������˿�����")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end
end

--**********************************--ɱ����������--**********************************
function x970015_OnKillObject( sceneId, selfId, objdataId )
	x970015_g_QuestOrder(x970015_g_QuestType)
	local QuestPlace = 0	--�������Ӧ��֮ǰSetMissionByIndex(sceneId,selfId,misIndex,j-1,0)ʱ���ڵ�λ��,==j-1
	for i, QuestInfo in pairs(x970015_g_Quest) do
		if QuestInfo.type ==  "MONSTER_KILL" then	
			 if objdataId == QuestInfo.id then
				  local misIndex = GetMissionIndexByID(sceneId,selfId,x970015_g_MissionId)
				  num = GetMissionParam(sceneId,selfId,misIndex,7)
				  if num < QuestInfo.num then						
				    SetMissionByIndex(sceneId,selfId,misIndex,7,num+1)
				  	BeginEvent(sceneId)
					  	strText = format("��ɱ��  "..QuestInfo.name.."  %d/"..QuestInfo.num, GetMissionParam(sceneId,selfId,misIndex,7) )
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
function x970015_OnEnterArea( sceneId, selfId, areaId )
	x970015_g_QuestOrder(x970015_g_QuestType)
	if IsHaveMission(sceneId,selfId,x970015_g_MissionId) > 0 then
		for i, QuestInfo in pairs(x970015_g_Quest) do
			if QuestInfo.type == "ENTERAREA" then
				if (areaId == QuestInfo.area) and (sceneId == QuestInfo.mapid) then 
					local misIndex = GetMissionIndexByID(sceneId,selfId,x970015_g_MissionId)
					if (GetMissionParam(sceneId,selfId,misIndex,7) == 0) then
						SetMissionByIndex(sceneId,selfId,misIndex,7,1)
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

function x970015_OnTimer( sceneId, selfId )

end

function x970015_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x970015_OnItemChanged( sceneId, selfId, itemdataId )
	x970015_g_QuestOrder(x970015_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x970015_g_MissionId)
	for i, QuestInfo in pairs(x970015_g_Quest) do
		if QuestInfo.type == "COLLECT_SPECIAL" or QuestInfo.type == "COLLECT" or QuestInfo.type == "MONSTER_ITEM" then
			if (QuestInfo.item == itemdataId) then
				local questitemnum = LuaFnGetItemCount(sceneId,selfId,QuestInfo.item)
				if ( questitemnum >= 0 ) and ( questitemnum <= QuestInfo.num )then
					SetMissionByIndex(sceneId,selfId,misIndex,7,questitemnum)
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
