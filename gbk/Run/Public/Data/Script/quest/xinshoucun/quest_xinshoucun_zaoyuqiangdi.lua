--���ֲ�������֮  ����ǿ��
--MisDescBegin
--��ǰ�ű���������
x970019_g_ScriptId = 970019

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x970019_g_MissionId = 989

--�������
x970019_g_MissionKind = 1
x970019_g_MissionLevel = 8

--������ʼnpc
x970019_g_NameHead	= "������"

--�����ύnpc
x970019_g_NameEnd	= "������"

--�����Ƿ��Ѿ����
x970019_g_IsMissionOkFail = 0		--�����ĵ�0λ
x970019_g_IfMissionElite = 0

x970019_g_DemandKill ={{id=9103,num=1}}

x970019_g_MissionName="����ǿ��"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x970019_g_MissionInfo={"��һ����֪����ģ������޴����˰���\n��ʵ�����ú��������İ׶�����,������������˵�����ȴ������ץ������ɵ�ܰ�;�����⿪��ڡ�"} 

x970019_g_MissionTarget="ɱ��#aB{236,39,3,������}[����]#aE,Ȼ���ȥ��#aB{214,37,3,������,������}[������]#aE"	

x970019_g_ContinueInfo={"�����ܶ���Ӯ�����Ȼ���ҹ�������ȥ�ɣ��������׵�������ʧ�����ҵ����硣 "}

x970019_g_MissionComplete={"�����������ӡ���������Щ��Ҳ�����ģ�Ӯ�˲���Ϊ�֡�"}

x970019_g_MoneyBonus=10000
x970019_g_ItemBonus={{id=12010003,num=2},{id=12010004,num=2}}
--MisDescEnd

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x970019_g_MissionMinLevel = 1
x970019_g_MissionMaxLevel = 100

--ǰ�������MissionID,������д���ǰ������
x970019_g_MisIdPre = {988}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
x970019_g_ScriptIdNext = {ScriptId = 211042 ,LV = 1 }


--****************************************�������ݿ�ʼ*********************************************************************
--��������
x970019_g_MissionName="����ǿ��"
--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x970019_g_UnDoneMissionInfo={"�����ܶ���Ӯ�����Ȼ���ҹ�������ȥ�ɣ��������׵�������ʧ�����ҵ����硣 "}
--�ܵĴ�������Ŀ��������һ�仰����
x970019_g_MissionAim="ɱ��#G����#W"		

--����Ŀ������(���Զ�����Ŀ��)
--MONSTER_KILL					--ɱ��                        --idΪɱ�����ͣ�nameΪ��������,numΪ��Ӧɱ������
x970019_g_MONSTER_KILL = {{id=9103,name="����",num=1,type="MONSTER_KILL",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x970019_g_QuestType = {x970019_g_MONSTER_ITEM,x970019_g_MONSTER_KILL}
x970019_g_Quest = {}
x970019_g_QuestNum = 0
x970019_MP_ISCOMPLETE = 7

function  x970019_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x970019_g_Quest[count] = QuestInfo
		end
	end
	x970019_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x970019_g_ExpBonustxt = ""
x970019_g_exp = 1

function x970019_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =35
	return ExpBonus*x970019_g_exp
end

--��Ǯ����
x970019_g_MoneyBonustxt = 10000
x970019_g_money = 1

function x970019_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x970019_g_money
end

--�̶���Ʒ���������8��
x970019_g_ItemBonus={{id=12010003,num=5},{id=12010004,num=5}}

--**********************************������ں���**********************************

function x970019_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x970019_g_QuestOrder(x970019_g_QuestType)
    if IsHaveMission(sceneId,selfId,x970019_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x970019_g_NameEnd) then
			local m = 0
			for i, QuestInfo in pairs(x970019_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					if (getn(x970019_g_DELIVERY)==1) and (x970019_g_NameEnd == x970019_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x970019_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x970019_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x970019_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
							BeginEvent(sceneId)
             AddText(sceneId,"#Y"..x970019_g_MissionName)
		         AddText(sceneId,"�����������ӡ���������Щ��Ҳ�����ģ�Ӯ�˲���Ϊ�֡�")
		         AddMoneyBonus(sceneId, 10000)
		         if x970019_g_ItemBonus ~= nil then
		          	for i, item in pairs(x970019_g_ItemBonus) do
			        	AddItemBonus( sceneId, item.id, item.num )
			          end
		         end
		    EndEvent()
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x970019_g_ScriptId,x970019_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x970019_g_ScriptId,x970019_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x970019_g_DELIVERY[1].item > 0 and x970019_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x970019_g_DELIVERY[1].item)>=x970019_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x970019_g_MissionId)
					for i, QuestInfo in pairs(x970019_g_Quest) do
						if (QuestInfo.type == "MONSTER_KILL") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x970019_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x970019_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x970019_g_ScriptId,x970019_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x970019_g_ScriptId,x970019_g_MissionId,0)
				end
			end
		elseif (x970019_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in pairs(x970019_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in pairs(x970019_g_DELIVERY) do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x970019_g_MissionId)
							for i, QuestInfo in pairs(x970019_g_Quest) do
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
								AddText(sceneId,x970019_g_NameHead.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x970019_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x970019_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x970019_g_ScriptId,x970019_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x970019_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x970019_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x970019_g_UnDoneMissionInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x970019_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	AddText(sceneId,x970019_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x970019_g_MissionAim)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x970019_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x970019_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x970019_g_ItemBonus ~= nil then
			for i, item in pairs(x970019_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
	end
end

--**********************************����Ŀ����ʾ**********************************

function	x970019_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x970019_g_QuestOrder(x970019_g_QuestType)
	if x970019_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x970019_g_MissionId)
		for i, QuestInfo in pairs(x970019_g_Quest) do

			if QuestInfo.type == "MONSTER_KILL"  then
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
function x970019_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x970019_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x970019_g_MissionId) > 0 then
		AddNumText(sceneId,x970019_g_ScriptId,x970019_g_MissionName);
    --���������������
    elseif x970019_CheckAccept(sceneId,selfId ,targetId) > 0 then
		AddNumText(sceneId,x970019_g_ScriptId,x970019_g_MissionName);
    end
end


--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x970019_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x970019_g_NameHead) then
		if (GetLevel( sceneId, selfId ) >= x970019_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x970019_g_MissionMaxLevel ) then
			if	x970019_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x970019_g_MisIdPre) do
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

function x970019_CheckContinue( sceneId, selfId ,targetId )
	
end
--**********************************��������**********************************
function x970019_OnAccept(sceneId, selfId )		
	x970019_g_QuestOrder(x970019_g_QuestType)
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
	for i, QuestInfo in pairs(x970019_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		elseif (QuestInfo.type == "DELIVERY") then
				DoItem = 1	
				local m = 0
				local ret = 1
				for i, QuestLableInfo in pairs(x970019_g_Quest) do
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
	AddMission( sceneId,selfId, x970019_g_MissionId, x970019_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x970019_g_MissionId)			--�õ���������к�
	if x970019_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x970019_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,j-1,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x970019_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x970019_OnAbandon( sceneId, selfId )
	x970019_g_QuestOrder(x970019_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x970019_g_MissionId )
    for i, QuestInfo in pairs(x970019_g_Quest) do
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
function x970019_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x970019_CheckSubmit( sceneId, selfId )
	x970019_g_QuestOrder(x970019_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x970019_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x970019_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" or QuestInfo.type == "MONSTER_ITEM" then
			local Many = GetMissionParam(sceneId,selfId,misIndex,1)
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
function x970019_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x970019_g_QuestOrder(x970019_g_QuestType)
	if (x970019_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if getn(x970019_g_ItemBonus) ==0 then
			givebonus = 1
		else
			for i, item in pairs(x970019_g_ItemBonus) do
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
			ret = DelMission( sceneId, selfId, x970019_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in pairs(x970019_g_Quest) do
					if QuestInfo.type ==  "DELIVERY" then
						if getn(x970019_g_DELIVERY) == 1 and QuestInfo == x970019_g_DELIVERY[1] then
							if QuestInfo.npc == x970019_g_NameEnd and QuestInfo.item > 0 and QuestInfo.num > 0 then
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
				MissionCom( sceneId,selfId, x970019_g_MissionId )
				if (x970019_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x970019_g_ExpBonus(sceneId, selfId, x970019_g_exp))
				end					
				if (x970019_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x970019_g_MoneyBonus(sceneId, selfId, x970019_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x970019_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x970019_g_ScriptIdNext.ScriptId~=nil) and (x970019_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x970019_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x970019_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId, "#Y����")
		          AddText(sceneId, "  #{quest_zhenxiang1}")
		          AddText(sceneId, "  #{quest_zhenxiang2}" )
		          AddText(sceneId, "  #{quest_zhenxiang3}")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end
end

--**********************************--ɱ����������--**********************************
function x970019_OnKillObject( sceneId, selfId, objdataId )
	x970019_g_QuestOrder(x970019_g_QuestType)
	local QuestPlace = 0	--�������Ӧ��֮ǰSetMissionByIndex(sceneId,selfId,misIndex,j-1,0)ʱ���ڵ�λ��,==j-1
	for i, QuestInfo in pairs(x970019_g_Quest) do
		if QuestInfo.type ==  "MONSTER_KILL" then	
			 if objdataId == QuestInfo.id then
				  local misIndex = GetMissionIndexByID(sceneId,selfId,x970019_g_MissionId)
				  num = GetMissionParam(sceneId,selfId,misIndex,1)
				  if num < QuestInfo.num then						
				    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
				  	BeginEvent(sceneId)
					  	strText = format("��ɱ��  "..QuestInfo.name.."  %d/"..QuestInfo.num, GetMissionParam(sceneId,selfId,misIndex,1) )
					  	AddText(sceneId,strText);
				  	EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					
					if (num+1) == QuestInfo.num then
						SetMissionByIndex(sceneId,selfId,misIndex,x970019_MP_ISCOMPLETE,1)
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

--**********************************--���������¼�--**********************************
function x970019_OnEnterArea( sceneId, selfId, areaId )

end

function x970019_OnTimer( sceneId, selfId )

end

function x970019_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x970019_OnItemChanged( sceneId, selfId, itemdataId )

end
