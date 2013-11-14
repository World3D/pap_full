--��������֮����
--MisDescBegin
--��ǰ�ű���������
x110004_g_ScriptId = 110004

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x110004_g_MissionId = 204

--�������
x110004_g_MissionKind = 1
x110004_g_MissionLevel = 15

--������ʼnpc
x110004_g_NameHead	= "�Ű���"

--�����ύnpc
x110004_g_NameEnd	= "ȫ��"

--�����Ƿ��Ѿ����
x110004_g_IsMissionOkFail = 0		--�����ĵ�0λ

x110004_g_DemandKill ={{id=9123,num=10}}

x110004_g_MissionName="����"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x110004_g_MissionInfo={"ȫʦ�ܺ��񱻵���Χס�ˣ�������ȥ��Ȱ���"} 

x110004_g_MissionTarget="�ҵ�ȫ�𷢣��������������10��#aB{26,102,10,����Ұ��}[����]#aE����ɺ����Ǹ�����#aB{22,103,10,����Ұ��}[ȫ��]#aE����"	

x110004_g_ContinueInfo={"�����ߵĿ���ɳ̲���������Ӳ���ȥ��"}

x110004_g_MissionComplete={"��л��ȣ����߰ɣ�������Σ���ķ���"}

x110004_g_MoneyBonus=10000
--MisDescEnd

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x110004_g_MissionMinLevel = 15
x110004_g_MissionMaxLevel = 100

--ǰ�������MissionID,������д���ǰ������
x110004_g_MisIdPre = {203}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x110004_g_ScriptIdNext = {ScriptId = 999998 ,LV = 100 }

--****************************************�������ݿ�ʼ*********************************************************************
--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x110004_g_UnDoneMissionInfo={"��ȥ�ɡ�ʱ�䲻���˰�~"}
--�ܵĴ�������Ŀ��������һ�仰����
x110004_g_MissionAim="�ҵ�ȫ�𷢣���ɱ��10������"		

--����Ŀ������(���Զ�����Ŀ��)
--MONSTER_KILL					--ɱ��                        --idΪɱ�����ͣ�nameΪ��������,numΪ��Ӧɱ������
x110004_g_MONSTER_KILL = {{id=9123,name="����",num=10,type="MONSTER_KILL",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x110004_g_QuestType = {x110004_g_MONSTER_ITEM,x110004_g_MONSTER_KILL}
x110004_g_Quest = {}
x110004_g_QuestNum = 0
x110004_MP_ISCOMPLETE = 7

function  x110004_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x110004_g_Quest[count] = QuestInfo
		end
	end
	x110004_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x110004_g_ExpBonustxt = ""
x110004_g_exp = 1

function x110004_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =330
	return ExpBonus*x110004_g_exp
end

--��Ǯ����
x110004_g_MoneyBonustxt = 10000
x110004_g_money = 1

function x110004_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x110004_g_money
end

--**********************************������ں���**********************************

function x110004_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x110004_g_QuestOrder(x110004_g_QuestType)
    if IsHaveMission(sceneId,selfId,x110004_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x110004_g_NameEnd) then
			local m = 0
			for i, QuestInfo in pairs(x110004_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					if (#(x110004_g_DELIVERY)==1) and (x110004_g_NameEnd == x110004_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x110004_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x110004_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x110004_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
				BeginEvent(sceneId)
             AddText(sceneId,"#Y"..x110004_g_MissionName)
		         AddText(sceneId,"��л��ȣ����߰ɣ�������Σ���ķ���")
		         AddMoneyBonus(sceneId, 10000)
		    EndEvent()
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x110004_g_ScriptId,x110004_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x110004_g_ScriptId,x110004_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x110004_g_DELIVERY[1].item > 0 and x110004_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x110004_g_DELIVERY[1].item)>=x110004_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x110004_g_MissionId)
					for i, QuestInfo in pairs(x110004_g_Quest) do
						if (QuestInfo.type == "MONSTER_KILL") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,1,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x110004_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x110004_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x110004_g_ScriptId,x110004_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x110004_g_ScriptId,x110004_g_MissionId,0)
				end
			end
		elseif (x110004_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in pairs(x110004_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in pairs(x110004_g_DELIVERY) do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x110004_g_MissionId)
							for i, QuestInfo in pairs(x110004_g_Quest) do
								if QuestInfo.type == "DELIVERY" then
									if (GetName(sceneId,targetId)==QuestInfo.npc)then
										SetMissionByIndex(sceneId,selfId,misIndex,1,1)
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
								AddText(sceneId,x110004_g_NameHead.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x110004_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x110004_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x110004_g_ScriptId,x110004_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x110004_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x110004_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x110004_g_UnDoneMissionInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x110004_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	AddText(sceneId,x110004_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x110004_g_MissionAim)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x110004_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x110004_g_MoneyBonustxt )
end

--**********************************����Ŀ����ʾ**********************************

function	x110004_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x110004_g_QuestOrder(x110004_g_QuestType)
	if x110004_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x110004_g_MissionId)
		for i, QuestInfo in pairs(x110004_g_Quest) do

			if QuestInfo.type == "MONSTER_KILL"  then
				if Done == 1 then
					Many = GetMissionParam(sceneId,selfId,misIndex,1)
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
					Many = GetMissionParam(sceneId,selfId,misIndex,1)
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
function x110004_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x110004_g_MissionId) > 0 then
    return 
    --����ѽӴ�����
    else
    if IsHaveMission(sceneId,selfId,x110004_g_MissionId) > 0 then
		AddNumText(sceneId,x110004_g_ScriptId,x110004_g_MissionName);
    --���������������
    elseif x110004_CheckAccept(sceneId,selfId ,targetId) > 0 then
		AddNumText(sceneId,x110004_g_ScriptId,x110004_g_MissionName);
    end
end
end

--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x110004_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x110004_g_NameHead) then
		if (GetLevel( sceneId, selfId ) >= x110004_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x110004_g_MissionMaxLevel ) then
			if	x110004_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x110004_g_MisIdPre) do
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

function x110004_CheckContinue( sceneId, selfId ,targetId )

end
--**********************************��������**********************************
function x110004_OnAccept(sceneId, selfId )		
	x110004_g_QuestOrder(x110004_g_QuestType)
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
	for i, QuestInfo in pairs(x110004_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		elseif (QuestInfo.type == "DELIVERY") then
				DoItem = 1	
				local m = 0
				local ret = 1
				for i, QuestLableInfo in pairs(x110004_g_Quest) do
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
	AddMission( sceneId,selfId, x110004_g_MissionId, x110004_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x110004_g_MissionId)			--�õ���������к�
	if x110004_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x110004_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,j-1,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x110004_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x110004_OnAbandon( sceneId, selfId )
	x110004_g_QuestOrder(x110004_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x110004_g_MissionId )
    for i, QuestInfo in pairs(x110004_g_Quest) do
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
function x110004_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x110004_CheckSubmit( sceneId, selfId )
	x110004_g_QuestOrder(x110004_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x110004_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x110004_g_Quest) do
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
			Many = GetMissionParam(sceneId,selfId,misIndex,1)
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
function x110004_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x110004_g_QuestOrder(x110004_g_QuestType)
	if (x110004_CheckSubmit( sceneId, selfId ) == 1) then
			ret = DelMission( sceneId, selfId, x110004_g_MissionId )
			if ret > 0 then
				for i, QuestInfo in pairs(x110004_g_Quest) do
					if QuestInfo.type ==  "DELIVERY" then
						if #(x110004_g_DELIVERY) == 1 and QuestInfo == x110004_g_DELIVERY[1] then
							if QuestInfo.npc == x110004_g_NameEnd and QuestInfo.item > 0 and QuestInfo.num > 0 then
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
				MissionCom( sceneId,selfId, x110004_g_MissionId )
				if (x110004_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x110004_g_ExpBonus(sceneId, selfId, x110004_g_exp))
				end					
				if (x110004_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x110004_g_MoneyBonus(sceneId, selfId, x110004_g_money) );
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x110004_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x110004_g_ScriptIdNext.ScriptId~=nil) and (x110004_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x110004_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x110004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"����֧��������ϡ�\n                            --By Star")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end
--**********************************--ɱ����������--**********************************
function x110004_OnKillObject( sceneId, selfId, objdataId )
	x110004_g_QuestOrder(x110004_g_QuestType)
	local QuestPlace = 0	
	for i, QuestInfo in pairs(x110004_g_Quest) do
		if QuestInfo.type ==  "MONSTER_KILL" then	
			 if objdataId == QuestInfo.id then
				  local misIndex = GetMissionIndexByID(sceneId,selfId,x110004_g_MissionId)
				  num = GetMissionParam(sceneId,selfId,misIndex,1)
				  if num < QuestInfo.num then						
				    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)

				  	BeginEvent(sceneId)
					  	strText = format("��ɱ��  "..QuestInfo.name.."  %d/"..QuestInfo.num, GetMissionParam(sceneId,selfId,misIndex,1) )
					  	AddText(sceneId,strText);
				  	EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)

					if (num+1) == QuestInfo.num then
						SetMissionByIndex(sceneId,selfId,misIndex,x110004_MP_ISCOMPLETE,1)
					end
				  end
			 end
		end
	end
end

--**********************************--���������¼�--**********************************
function x110004_OnEnterArea( sceneId, selfId, areaId )

end

function x110004_OnTimer( sceneId, selfId )

end

function x110004_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x110004_OnItemChanged( sceneId, selfId, itemdataId )

end