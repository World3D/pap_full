--�һ�����������֮  ����1
--MisDescBegin
--��ǰ�ű���������
x960001_g_ScriptId = 960001

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x960001_g_MissionId = 960

--�������
x960001_g_MissionKind = 13
x960001_g_MissionLevel = 10

--������ʼnpc
x960001_g_NameHead	= "��ҩʦ"

--�����ύnpc
x960001_g_NameEnd	= "��ҩʦ"

--�����Ƿ��Ѿ����
x960001_g_IsMissionOkFail = 0		--�����ĵ�0λ

x960001_g_DemandItem ={{id=13010082,num=1}}
x960001_g_DemandKill ={{id=9123,num=2}}

x960001_g_MissionName="����1"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x960001_g_MissionInfo={"�������ҳ�����������,������͵�ߵľ����澭���Ҵ��������Ҿ�������ͽ�ܡ�"} 

x960001_g_MissionTarget="ɱ��2��#aB{72,182,4,�һ���,����}[����]#aE���ûؾ����澭,��ɺ��ȥ��#aB{33,180,4,�һ���,��ҩʦ}[��ҩʦ]#aE"	

x960001_g_ContinueInfo={"��û����ҽ���������������̶ֳ����ǲ�������Ϊͽ��"}

x960001_g_MissionComplete={"���ӿɽ̣��ǺǺǺǡ�"}

x960001_g_MoneyBonus=10000
x960001_g_ItemBonus={{id=12010003,num=3},{id=12020004,num=3}}
x960001_g_RadioItemBonus={{id=12010005,num=3},{id=12020006,num=3}}
--MisDescEnd

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x960001_g_MissionMinLevel = 10
x960001_g_MissionMaxLevel = 100

--ǰ�������MissionID,������д���ǰ������
x960001_g_MisIdPre = {105}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x960001_g_ScriptIdNext = {ScriptId = 960002 ,LV = 1 }

--****************************************�������ݿ�ʼ*********************************************************************
--��������
x960001_g_MissionName="����1"
--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x960001_g_MissionInfo={"�������ҳ���͵���ϵ�������������������͵�ߵľ����澭���Ҵ��������Ҿ�������ͽ�ܡ�"} 
--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x960001_g_UnDoneMissionInfo={"��û����ҽ���������������̶ֳ����ǲ�������Ϊͽ�ģ�"}
--�ܵĴ�������Ŀ��������һ�仰����
x960001_g_MissionAim="����͵���ϵ�������������ȡ�ؾ����澭��"		

--����Ŀ������(���Զ�����Ŀ��)
--MONSTER_KILL					--ɱ��                        --idΪɱ�����ͣ�nameΪ��������,numΪ��Ӧɱ������
x960001_g_MONSTER_KILL = {{id=9123,name="����",num=2,type="MONSTER_KILL",order=0}}

--MONSTER_ITEM					--��ֵ���                    --idΪɱ�����ͣ�itemΪ���������Ʒ����,nameΪ�������ƣ�perΪ������ʣ�maxΪһ�ε�����Ʒ�ĸ�������,numΪ������߸���
x960001_g_MONSTER_ITEM = {{id=9123,item=13010082,name="�����澭",per=100,max=1,num=1,type="MONSTER_ITEM",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x960001_g_QuestType = {x960001_g_MONSTER_ITEM,x960001_g_MONSTER_KILL}
x960001_g_Quest = {}
x960001_g_QuestNum = 0
x960001_MP_ISCOMPLETE = 7

function  x960001_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x960001_g_Quest[count] = QuestInfo
		end
	end
	x960001_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x960001_g_ExpBonustxt = ""
x960001_g_exp = 1

function x960001_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =41
	return ExpBonus*x960001_g_exp
end

--��Ǯ����
x960001_g_MoneyBonustxt = 10000
x960001_g_money = 1

function x960001_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x960001_g_money
end

--�̶���Ʒ���������8��
x960001_g_ItemBonus={{id=12010003,num=3},{id=12020004,num=3}}

--��ѡ��Ʒ���������8��
x960001_g_RadioItemBonus={{id=12010005,num=3},{id=12020006,num=3}}
--**********************************������ں���**********************************

function x960001_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x960001_g_QuestOrder(x960001_g_QuestType)
    if IsHaveMission(sceneId,selfId,x960001_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x960001_g_NameEnd) then
			local m = 0
			for i, QuestInfo in pairs(x960001_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					if (#(x960001_g_DELIVERY)==1) and (x960001_g_NameEnd == x960001_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x960001_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x960001_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x960001_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
				BeginEvent(sceneId)
             AddText(sceneId,"#Y"..x960001_g_MissionName)
		         AddText(sceneId,"���ӿɽ̣��ǺǺǺǡ�")
		         if x960001_g_ItemBonus ~= nil then
		          	for i, item in pairs(x960001_g_ItemBonus) do
			        	AddItemBonus( sceneId, item.id, item.num )
			          end
		         end			
		         if x960001_g_RadioItemBonus ~= nil then
	           		for i, item in pairs(x960001_g_RadioItemBonus) do
			        	AddRadioItemBonus( sceneId, item.id, item.num )
			          end
	         	end
		       EndEvent()
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x960001_g_ScriptId,x960001_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x960001_g_ScriptId,x960001_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x960001_g_DELIVERY[1].item > 0 and x960001_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x960001_g_DELIVERY[1].item)>=x960001_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x960001_g_MissionId)
					for i, QuestInfo in pairs(x960001_g_Quest) do
						if (QuestInfo.type == "DELIVERY") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x960001_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x960001_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
				
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x960001_g_ScriptId,x960001_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x960001_g_ScriptId,x960001_g_MissionId,0)
				end
			end
		elseif (x960001_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in pairs(x960001_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in pairs(x960001_g_DELIVERY) do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x960001_g_MissionId)
							for i, QuestInfo in pairs(x960001_g_Quest) do
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
								AddText(sceneId,x960001_g_NameHead.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x960001_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x960001_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x960001_g_ScriptId,x960001_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x960001_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x960001_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x960001_g_UnDoneMissionInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x960001_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	AddText(sceneId,x960001_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x960001_g_MissionAim)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x960001_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x960001_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x960001_g_ItemBonus ~= nil then
			for i, item in pairs(x960001_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
		if x960001_g_RadioItemBonus ~= nil then
			for i, item in pairs(x960001_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		end
	end
end

--**********************************����Ŀ����ʾ**********************************

function	x960001_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x960001_g_QuestOrder(x960001_g_QuestType)
	if x960001_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x960001_g_MissionId)
		for i, QuestInfo in pairs(x960001_g_Quest) do

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
function x960001_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x960001_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x960001_g_MissionId) > 0 then
		AddNumText(sceneId,x960001_g_ScriptId,x960001_g_MissionName);
    --���������������
    elseif x960001_CheckAccept(sceneId,selfId ,targetId) > 0 then
		AddNumText(sceneId,x960001_g_ScriptId,x960001_g_MissionName);
    end
end


--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x960001_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x960001_g_NameHead) then
		if (GetLevel( sceneId, selfId ) >= x960001_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x960001_g_MissionMaxLevel ) then
			if	x960001_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x960001_g_MisIdPre) do
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
function x960001_OnAccept(sceneId, selfId )		
	x960001_g_QuestOrder(x960001_g_QuestType)
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
	for i, QuestInfo in pairs(x960001_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		elseif (QuestInfo.type == "DELIVERY") then
				DoItem = 1	
				local m = 0
				local ret = 1
				for i, QuestLableInfo in pairs(x960001_g_Quest) do
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
	AddMission( sceneId,selfId, x960001_g_MissionId, x960001_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x960001_g_MissionId)			--�õ���������к�
	if x960001_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x960001_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex7,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x960001_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x960001_OnAbandon( sceneId, selfId )
	x960001_g_QuestOrder(x960001_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x960001_g_MissionId )
    for i, QuestInfo in pairs(x960001_g_Quest) do
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
		if QuestInfo.type ==  "MONSTER_ITEM" then
			local monsteritemnum = LuaFnGetItemCount(sceneId,selfId,QuestInfo.item)
			if monsteritemnum > 0 then
				DelItem(sceneId,selfId,QuestInfo.item,monsteritemnum)
			end
		end
	end    
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x960001_CheckSubmit( sceneId, selfId )
	x960001_g_QuestOrder(x960001_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x960001_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x960001_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" or QuestInfo.type == "MONSTER_ITEM" then
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
function x960001_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x960001_g_QuestOrder(x960001_g_QuestType)
	if (x960001_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if (#(x960001_g_ItemBonus) ==0)  and  (#(x960001_g_RadioItemBonus) == 0 ) then
			givebonus = 1
		else
			for i, item in pairs(x960001_g_ItemBonus) do
				if item.id>0 and item.num>0 then
					AddItem( sceneId,item.id, item.num )
					giveitem = 1
				end
			end
			for i, item in pairs(x960001_g_RadioItemBonus) do
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
			ret = DelMission( sceneId, selfId, x960001_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in pairs(x960001_g_Quest) do						
					if QuestInfo.type == "MONSTER_ITEM" then
						DelItem(sceneId,selfId,QuestInfo.item,QuestInfo.num)
					end						
				end   
				MissionCom( sceneId,selfId, x960001_g_MissionId )
				if (x960001_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x960001_g_ExpBonus(sceneId, selfId, x960001_g_exp))
				end					
				if (x960001_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x960001_g_MoneyBonus(sceneId, selfId, x960001_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x960001_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x960001_g_ScriptIdNext.ScriptId~=nil) and (x960001_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x960001_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x960001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
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
end

--**********************************--ɱ����������--**********************************
function x960001_OnKillObject( sceneId, selfId, objdataId )
	x960001_g_QuestOrder(x960001_g_QuestType)
	local QuestPlace = 0	--�������Ӧ��֮ǰSetMissionByIndex(sceneId,selfId,misIndex,j-1,0)ʱ���ڵ�λ��,==j-1
	for i, QuestInfo in pairs(x960001_g_Quest) do
		if QuestInfo.type ==  "MONSTER_KILL" then	
			 if objdataId == QuestInfo.id then
				  local misIndex = GetMissionIndexByID(sceneId,selfId,x960001_g_MissionId)
				  num = GetMissionParam(sceneId,selfId,misIndex,1)
				  if num < QuestInfo.num then						
				    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
				  	BeginEvent(sceneId)
					  	strText = format("��ɱ��  "..QuestInfo.name.."  %d/"..QuestInfo.num, GetMissionParam(sceneId,selfId,misIndex,1) )
					  	AddText(sceneId,strText);
				  	EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					if (num+1) == QuestInfo.num then
						SetMissionByIndex(sceneId,selfId,misIndex,x960001_MP_ISCOMPLETE,1)
					end
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
--**********************************--���߸ı�--**********************************
function x960001_OnItemChanged( sceneId, selfId, itemdataId )
	x960001_g_QuestOrder(x960001_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x960001_g_MissionId)
	for i, QuestInfo in pairs(x960001_g_Quest) do
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
