--��������֮  ������ҩ
--MisDescBegin
--��ǰ�ű���������
x100020_g_ScriptId = 100020

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x100020_g_MissionId = 120

--�������
x100020_g_MissionKind = 13
x100020_g_MissionLevel = 15

--������ʼnpc
x100020_g_NameHead	= "������"

--�����ύnpc
x100020_g_NameEnd	= "������"

--�����Ƿ��Ѿ����
x100020_g_IsMissionOkFail = 0		--�����ĵ�0λ

x100020_g_DemandItem ={{id=12020010,num=1}}

x100020_g_MissionName="������ҩ"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x100020_g_MissionInfo={"�������Ƿǳ�ʱ�ڣ�����Ҫ��ʱС�ĺ����˵�Ϯ����������Ҫ����һЩװ�����Ա���ʱֻ�衣���ܰ�����"} 

x100020_g_MissionTarget="�ռ�ʮȫ���衣����Ե�#aB{346,210,9,����01,ҩƷ���ƹ�}[ҩƷ���ƹ�]#aE��������ɺ��#aB{333,275,9,����01,������}[������]#aE������"	

x100020_g_ContinueInfo={"һ��Ҫ�찡���Ա����⡣"}

x100020_g_MissionComplete={"��ô��ͻ����ˣ����Ȼ�����������츳��"}

x100020_g_MoneyBonus=10000
x100020_g_ItemBonus={id=12010001,num=3}
--MisDescEnd

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x100020_g_MissionMinLevel = 10
x100020_g_MissionMaxLevel = 100

--ǰ�������MissionID,������д���ǰ������
x100020_g_MisIdPre = {119}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x100020_g_ScriptIdNext = {ScriptId = 100021 ,LV = 14 }

--****************************************�������ݿ�ʼ********************************************************************* 
--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x100020_g_UnDoneMissionInfo={"�ҵ�ҩ�����ˣ�������ʮȫ����"}
--�ܵĴ�������Ŀ��������һ�仰����
x100020_g_MissionAim="�ҵ�ҩ�����ˣ�������ʮȫ����"		

--����Ŀ������(���Զ�����Ŀ��)
--COLLECT						--�ռ���Ʒ                    --itemΪ�ɼ�����Ʒ����,nameΪ��������,numΪ������߸���
x100020_g_COLLECT = {{item=12020010,name="ʮȫ����",num=1,type="COLLECT",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x100020_g_QuestType = {x100020_g_COLLECT}
x100020_g_Quest = {}
x100020_g_QuestNum = 0
x970012_MP_ISCOMPLETE = 7

function  x100020_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in QuestType do
		for j, QuestInfo in QuestLabel do
			count = count + 1
			QuestInfo.order = count
			x100020_g_Quest[count] = QuestInfo
		end
	end
	x100020_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x100020_g_ExpBonustxt = ""
x100020_g_exp = 1

function x100020_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =90
	return ExpBonus*x100020_g_exp
end

--��Ǯ����
x100020_g_MoneyBonustxt = 10000
x100020_g_money = 1

function x100020_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x100020_g_money
end

--�̶���Ʒ���������8��
x100020_g_ItemBonus={{id=12010003,num=5}}

--**********************************������ں���**********************************

function x100020_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x100020_g_QuestOrder(x100020_g_QuestType)
    if IsHaveMission(sceneId,selfId,x100020_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x100020_g_NameEnd) then
			local m = 0
			for i, QuestInfo in x100020_g_Quest do
				if (QuestInfo.type == "DELIVERY") then
					if (getn(x100020_g_DELIVERY)==1) and (x100020_g_NameEnd == x100020_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x100020_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x100020_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x100020_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
				BeginEvent(sceneId)
             AddText(sceneId,"#Y"..x100020_g_MissionName)
		         AddText(sceneId,"��ô��ͻ����ˣ����Ȼ�����������츳���Ҿ�֪�����˳��������")
		         AddMoneyBonus(sceneId, 10000)
		         if x100020_g_ItemBonus ~= nil then
		          	for i, item in x100020_g_ItemBonus do
			        	AddItemBonus( sceneId, item.id, item.num )
			          end
		         end
		    EndEvent()
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x100020_g_ScriptId,x100020_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x100020_g_ScriptId,x100020_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x100020_g_DELIVERY[1].item > 0 and x100020_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x100020_g_DELIVERY[1].item)>=x100020_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x100020_g_MissionId)
					for i, QuestInfo in x100020_g_Quest do
						if (QuestInfo.type == "DELIVERY") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,7,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x100020_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x100020_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x100020_g_ScriptId,x100020_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x100020_g_ScriptId,x100020_g_MissionId,0)
				end
			end
		elseif (x100020_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in x100020_g_Quest do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in x100020_g_DELIVERY do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x100020_g_MissionId)
							for i, QuestInfo in x100020_g_Quest do
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
								AddText(sceneId,x100020_g_NameHead.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x100020_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x100020_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x100020_g_ScriptId,x100020_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x100020_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x100020_g_MissionName)
	if DoneEX==2 then
		for i, Info in x100020_g_UnDoneMissionInfo do
			AddText(sceneId,Info)
		end
	else
		for i, Info in x100020_g_MissionInfo do
			AddText(sceneId,Info)
		end
	end
	AddText(sceneId,x100020_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x100020_g_MissionAim)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x100020_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x100020_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x100020_g_ItemBonus ~= nil then
			for i, item in x100020_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
	end
end

--**********************************����Ŀ����ʾ**********************************

function	x100020_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x100020_g_QuestOrder(x100020_g_QuestType)
	if x100020_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x100020_g_MissionId)
		for i, QuestInfo in x100020_g_Quest do

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
function x100020_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x100020_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x100020_g_MissionId) > 0 then
		AddNumText(sceneId,x100020_g_ScriptId,x100020_g_MissionName);
    --���������������
    elseif x100020_CheckAccept(sceneId,selfId ,targetId) > 0 then
		AddNumText(sceneId,x100020_g_ScriptId,x100020_g_MissionName);
    end
end


--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x100020_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x100020_g_NameHead) then
		if (GetLevel( sceneId, selfId ) >= x100020_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x100020_g_MissionMaxLevel ) then
			if	x100020_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in x100020_g_MisIdPre do
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
function x100020_OnAccept(sceneId, selfId )		
	x100020_g_QuestOrder(x100020_g_QuestType)
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
	for i, QuestInfo in x100020_g_Quest do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		elseif (QuestInfo.type == "DELIVERY") then
				DoItem = 1	
				local m = 0
				local ret = 1
				for i, QuestLableInfo in x100020_g_Quest do
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
				elseif QuestInfo.type == "COLLECT"	then			--�ռ���Ʒ
				DoItem = 1
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x100020_g_MissionId, x100020_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x100020_g_MissionId)			--�õ���������к�
	if x100020_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x100020_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,j-1,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x100020_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x100020_OnAbandon( sceneId, selfId )
	x100020_g_QuestOrder(x100020_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x100020_g_MissionId )
    for i, QuestInfo in x100020_g_Quest do
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
function x100020_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x100020_CheckSubmit( sceneId, selfId )
	if LuaFnGetItemCount(sceneId,selfId,x100020_g_DemandItem[1].id) == x100020_g_DemandItem[1].num then
	        return 1
	end
	return 0

end
--**********************************
--�ύ
--**********************************
function x100020_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x100020_g_QuestOrder(x100020_g_QuestType)
	if (x100020_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if getn(x100020_g_ItemBonus) ==0 then
			givebonus = 1
		else
			for i, item in x100020_g_ItemBonus do
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
			ret = DelMission( sceneId, selfId, x100020_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in x100020_g_Quest do
					if QuestInfo.type ==  "DELIVERY" then
						if getn(x100020_g_DELIVERY) == 1 and QuestInfo == x100020_g_DELIVERY[1] then
							if QuestInfo.npc == x100020_g_NameEnd and QuestInfo.item > 0 and QuestInfo.num > 0 then
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
				MissionCom( sceneId,selfId, x100020_g_MissionId )
				if (x100020_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x100020_g_ExpBonus(sceneId, selfId, x100020_g_exp))
				end					
				if (x100020_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x100020_g_MoneyBonus(sceneId, selfId, x100020_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x100020_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x100020_g_ScriptIdNext.ScriptId~=nil) and (x100020_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x100020_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x100020_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
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
function x100020_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************--���������¼�--**********************************
function x100020_OnEnterArea( sceneId, selfId, areaId )

end

function x100020_OnTimer( sceneId, selfId )

end

function x100020_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x100020_OnItemChanged( sceneId, selfId, itemdataId )
	x100020_g_QuestOrder(x100020_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x100020_g_MissionId)
	for i, QuestInfo in x100020_g_Quest do
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
