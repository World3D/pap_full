--��������֮  �������
--MisDescBegin
--��ǰ�ű���������
x100016_g_ScriptId = 100016

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x100016_g_MissionId = 116

--�������
x100016_g_MissionKind = 13
x100016_g_MissionLevel = 13

--������ʼnpc
x100016_g_NameHead	= "������"

--�����ύnpc
x100016_g_NameEnd	= "������"

--�����Ƿ��Ѿ����
x100016_g_IsMissionOkFail = 0		--�����ĵ�0λ

x100016_g_DemandItem ={{id=10051001,num=1}}

x100016_g_MissionName="�������"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x100016_g_MissionInfo={"�������Ƿǳ�ʱ�ڣ�����Ҫ��ʱС�ĺ����˵�Ϯ����������Ҫ����һЩװ�����Ա���ʱֻ�衣���ܰ�����"} 

x100016_g_MissionTarget="�ռ�һ����ڤ��������Ե�#aB{302,210,9,����01,�������ƹ�}[�������ƹ�]#aE������һ����ڤ������ɺ��#aB{333,275,9,����01,������}[������]#aE������"	

x100016_g_ContinueInfo={"һ��Ҫ�찡���Ա����⡣"}

x100016_g_MissionComplete={"��ô��ͻ����ˣ����Ȼ�����������츳��"}

x100016_g_MoneyBonus=10000
x100016_g_ItemBonus={id=12010002,num=2}
--MisDescEnd

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x100016_g_MissionMinLevel = 10
x100016_g_MissionMaxLevel = 100

--ǰ�������MissionID,������д���ǰ������
x100016_g_MisIdPre = {115}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x100016_g_ScriptIdNext = {ScriptId = 100017 ,LV = 14 }

--****************************************�������ݿ�ʼ********************************************************************* 
--����δ���ʱȥ���������ʾ���� ��֧�ֶ������
x100016_g_UnDoneMissionInfo={"�ҵ��������ˣ�������һ����ڤ��"}
--�ܵĴ�������Ŀ��������һ�仰����
x100016_g_MissionAim="�ҵ��������ˣ�������һ����ڤ��"		

--����Ŀ������(���Զ�����Ŀ��)
--COLLECT						--�ռ���Ʒ                    --itemΪ�ɼ�����Ʒ����,nameΪ��������,numΪ������߸���
x100016_g_COLLECT = {{item=10051001,name="��ڤ��",num=1,type="COLLECT",order=0}}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x100016_g_QuestType = {x100016_g_COLLECT}
x100016_g_Quest = {}
x100016_g_QuestNum = 0
x970012_MP_ISCOMPLETE = 7

function  x100016_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x100016_g_Quest[count] = QuestInfo
		end
	end
	x100016_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x100016_g_ExpBonustxt = ""
x100016_g_exp = 1

function x100016_g_ExpBonus(sceneId, selfId, exp)
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus =90
	return ExpBonus*x100016_g_exp
end

--��Ǯ����
x100016_g_MoneyBonustxt = 10000
x100016_g_money = 1

function x100016_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x100016_g_money
end

--�̶���Ʒ���������8��
x100016_g_ItemBonus={{id=12010003,num=5}}

--**********************************������ں���**********************************

function x100016_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x100016_g_QuestOrder(x100016_g_QuestType)
    if IsHaveMission(sceneId,selfId,x100016_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x100016_g_NameEnd) then
			local m = 0
			for i, QuestInfo in pairs(x100016_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					if (#(x100016_g_DELIVERY)==1) and (x100016_g_NameEnd == x100016_g_DELIVERY[1].npc) then	
						m = 2
					else
						m = 1
					end
				else
					m = 1
				end
			end
			if m == 1 then
				local Done = x100016_CheckSubmit( sceneId, selfId )
				BeginEvent(sceneId)
					if Done == 1 then
						x100016_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x100016_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
				BeginEvent(sceneId)
             AddText(sceneId,"#Y"..x100016_g_MissionName)
		         AddText(sceneId,"��ô��ͻ����ˣ����Ȼ�����������츳���Ҿ�֪�����˳��������")
		         AddMoneyBonus(sceneId, 10000)
		         if x100016_g_ItemBonus ~= nil then
		          	for i, item in pairs(x100016_g_ItemBonus) do
			        	AddItemBonus( sceneId, item.id, item.num )
			          end
		         end
		    EndEvent()
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x100016_g_ScriptId,x100016_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x100016_g_ScriptId,x100016_g_MissionId,0)
				end
			elseif m == 2 then
				local Done = 0
				if x100016_g_DELIVERY[1].item > 0 and x100016_g_DELIVERY[1].num > 0 then
					if	(LuaFnGetItemCount(sceneId,selfId,x100016_g_DELIVERY[1].item)>=x100016_g_DELIVERY[1].num) then
						Done = 1						
					end
				else
					Done = 1
				end
				if Done == 1 then
					local misIndex = GetMissionIndexByID(sceneId,selfId,x100016_g_MissionId)
					for i, QuestInfo in pairs(x100016_g_Quest) do
						if (QuestInfo.type == "DELIVERY") then
							if (GetName(sceneId,targetId)==QuestInfo.npc)then
								SetMissionByIndex(sceneId,selfId,misIndex,7,1)
							end
						end
					end
				end
				BeginEvent(sceneId)
					if Done == 1 then
						x100016_ShowQuestInfo( sceneId, selfId, targetId , 1)
					else
						x100016_ShowQuestInfo( sceneId, selfId, targetId , 2)
					end
				EndEvent( )
				if (Done == 1) then
					DispatchMissionContinueInfo(sceneId,selfId,targetId,x100016_g_ScriptId,x100016_g_MissionId)
				else
					DispatchMissionDemandInfo(sceneId,selfId,targetId,x100016_g_ScriptId,x100016_g_MissionId,0)
				end
			end
		elseif (x100016_g_DELIVERY ~= nil) then
			local n = 0 
			for i, QuestInfo in pairs(x100016_g_Quest) do
				if (QuestInfo.type == "DELIVERY") then
					n = 1
					break
				end
			end
			if  n == 1 then
				for i, DeliveryInfo in pairs(x100016_g_DELIVERY) do
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
							local misIndex = GetMissionIndexByID(sceneId,selfId,x100016_g_MissionId)
							for i, QuestInfo in pairs(x100016_g_Quest) do
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
								AddText(sceneId,x100016_g_NameHead.."��������ҵĶ��������أ�")
							EndEvent( )	
							DispatchEventList(sceneId,selfId,targetId)
						end
					end
				end
			end
		end
    elseif x100016_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x100016_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x100016_g_ScriptId,x100016_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x100016_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x100016_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x100016_g_UnDoneMissionInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x100016_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	AddText(sceneId,x100016_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x100016_g_MissionAim)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x100016_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x100016_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x100016_g_ItemBonus ~= nil then
			for i, item in pairs(x100016_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
	end
end

--**********************************����Ŀ����ʾ**********************************

function	x100016_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x100016_g_QuestOrder(x100016_g_QuestType)
	if x100016_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x100016_g_MissionId)
		for i, QuestInfo in pairs(x100016_g_Quest) do

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
function x100016_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x100016_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x100016_g_MissionId) > 0 then
		AddNumText(sceneId,x100016_g_ScriptId,x100016_g_MissionName);
    --���������������
    elseif x100016_CheckAccept(sceneId,selfId ,targetId) > 0 then
		AddNumText(sceneId,x100016_g_ScriptId,x100016_g_MissionName);
    end
end


--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x100016_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x100016_g_NameHead) then
		if (GetLevel( sceneId, selfId ) >= x100016_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x100016_g_MissionMaxLevel ) then
			if	x100016_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x100016_g_MisIdPre) do
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
function x100016_OnAccept(sceneId, selfId )		
	x100016_g_QuestOrder(x100016_g_QuestType)
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
	for i, QuestInfo in pairs(x100016_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		elseif QuestInfo.type == "COLLECT"	then			--�ռ���Ʒ
			DoItem = 1
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x100016_g_MissionId, x100016_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x100016_g_MissionId)			--�õ���������к�
	if x100016_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x100016_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,7,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x100016_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x100016_OnAbandon( sceneId, selfId )
	x100016_g_QuestOrder(x100016_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x100016_g_MissionId )
    for i, QuestInfo in pairs(x100016_g_Quest) do
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
function x100016_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x100016_CheckSubmit( sceneId, selfId )
	if LuaFnGetItemCount(sceneId,selfId,x100016_g_DemandItem[1].id) == x100016_g_DemandItem[1].num then
	        return 1
	end
	return 0
end
--**********************************
--�ύ
--**********************************
function x100016_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x100016_g_QuestOrder(x100016_g_QuestType)
	if (x100016_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if #(x100016_g_ItemBonus) ==0 then
			givebonus = 1
		else
			for i, item in pairs(x100016_g_ItemBonus) do
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
			ret = DelMission( sceneId, selfId, x100016_g_MissionId )
			if ret > 0 then
			 for i, QuestInfo in pairs(x100016_g_Quest) do					
				if QuestInfo.type ==  "COLLECT"  or QuestInfo.type ==  "COLLECT_SPECIAL" or QuestInfo.type ==  "MONSTER_ITEM" then
						DelItem(sceneId,selfId,QuestInfo.item,QuestInfo.num)
				end						
		  	end   
				MissionCom( sceneId,selfId, x100016_g_MissionId )
				if (x100016_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x100016_g_ExpBonus(sceneId, selfId, x100016_g_exp))
				end					
				if (x100016_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x100016_g_MoneyBonus(sceneId, selfId, x100016_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x100016_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x100016_g_ScriptIdNext.ScriptId~=nil) and (x100016_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x100016_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x100016_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
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
function x100016_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************--���������¼�--**********************************
function x100016_OnEnterArea( sceneId, selfId, areaId )

end

function x100016_OnTimer( sceneId, selfId )

end

function x100016_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x100016_OnItemChanged( sceneId, selfId, itemdataId )
	x100016_g_QuestOrder(x100016_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x100016_g_MissionId)
	for i, QuestInfo in pairs(x100016_g_Quest) do
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
