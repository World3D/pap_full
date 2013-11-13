--���ִ��ͺ�����
--MisDescBegin
--��ǰ�ű���������
x300304_g_ScriptId = 300304

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x300304_g_MissionId = 410

--������ʼnpc
x300304_g_Name	="������" 

--�������
x300304_g_MissionKind = 1
x300304_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x300304_g_IfMissionElite = 0

--�����Ƿ��Ѿ����
x300304_g_IsMissionOkFail = 0		--�����ĵ�0λ

x300304_g_DemandKill ={{id=417,num=10}}

x300304_g_MissionName="��������"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x300304_g_MissionInfo={"�������ִ���Żʳǵľ����������󺹵ľ��ӱ�ʿ��������֪�����������һЩ���ˣ�һֱ��͵���ǵ���ʳ�������޸���֮�����޷���������������Щ�Ͱ������ˣ������ɱ��1000�������ɣ�"} 

x300304_g_MissionTarget="ɱ1000��������"	

x300304_g_ContinueInfo={"��ûɱ��1000���������Ҿ�ȫָ�����ˣ�"}  

x300304_g_MissionComplete="��л���������ס������֣�"

x300304_g_MoneyBonus=10000
x300304_g_ItemBonus={{id=12010001,num=5},{id=12020001,num=5}}
--x300304_g_RadioItemBonus={{id=12010001,num=5},{id=12020001,num=5}}
--MisDescEnd

--�����ύnpc
x300304_g_NameEnd	= "������"

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x300304_g_MissionMinLevel = 1
x300304_g_MissionMaxLevel = 200



--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
--x300304_g_ScriptIdNext = {ScriptId = 211046 ,LV = 3 }

--****************************************�������ݿ�ʼ*********************************************************************

--����Ŀ������(���Զ�����Ŀ��)
--MONSTER_KILL					--ɱ��                        --idΪɱ�����ͣ�nameΪ��������,numΪ��Ӧɱ������
x300304_g_MONSTER_KILL = {{id=6500,name="��������",num=1,type="MONSTER_KILL",order=0}	}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x300304_g_QuestType = {x300304_g_MONSTER_KILL}
x300304_g_Quest = {}
x300304_g_QuestNum = 0
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x300304_g_ExpBonustxt = "����  100"
x300304_g_exp = 1

--��Ǯ����
x300304_g_MoneyBonustxt = 10000
x300304_g_money = 1


function  x300304_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x300304_g_Quest[count] = QuestInfo
		end
	end
	x300304_g_QuestNum = count
end

function x300304_g_ExpBonus(sceneId, selfId, exp)
	return 5000*x300304_g_exp
end

function x300304_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x300304_g_money
end



--**********************************������ں���**********************************

function x300304_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x300304_g_QuestOrder(x300304_g_QuestType)
    if IsHaveMission(sceneId,selfId,x300304_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x300304_g_NameEnd) then
			local Done = x300304_CheckSubmit( sceneId, selfId )
			BeginEvent(sceneId)
				if Done == 1 then
					x300304_ShowQuestInfo( sceneId, selfId, targetId , 1)
				else
					x300304_ShowQuestInfo( sceneId, selfId, targetId , 2)
				end
			EndEvent( )
			if (Done == 1) then
				DispatchMissionContinueInfo(sceneId,selfId,targetId,x300304_g_ScriptId,x300304_g_MissionId)
			else
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x300304_g_ScriptId,x300304_g_MissionId,0)
			end
		end
    elseif x300304_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x300304_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x300304_g_ScriptId,x300304_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x300304_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x300304_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x300304_g_ContinueInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x300304_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	--AddText(sceneId,x300304_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x300304_g_MissionTarget)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x300304_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x300304_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x300304_g_ItemBonus ~= nil then
			for i, item in pairs(x300304_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
		if x300304_g_RadioItemBonus ~= nil then
			for i, item in pairs(x300304_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		end
	end
end


--**********************************����Ŀ����ʾ**********************************

function	x300304_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x300304_g_QuestOrder(x300304_g_QuestType)
	if x300304_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x300304_g_MissionId)
		for i, QuestInfo in pairs(x300304_g_Quest) do

			if QuestInfo.type == "MONSTER_KILL" or QuestInfo.type == "COLLECT_SPECIAL"  or QuestInfo.type == "MONSTER_ITEM" then
				if Done == 1 then
					Many = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
					if Many == nil then
						Many = 0
					end
				end
				StrTxt = QuestInfo.name.."    "..Many.."/"..QuestInfo.num
				AddText(sceneId,StrTxt)				
			end
		end
	end
end

--**********************************�ж������Ƿ���ʾ**********************************
function x300304_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x300304_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x300304_g_MissionId) > 0 then
   			AddNumText(sceneId,x300304_g_ScriptId,x300304_g_MissionName);
    --���������������
    elseif x300304_CheckAccept(sceneId,selfId ,targetId) > 0 then
				AddNumText(sceneId,x300304_g_ScriptId,x300304_g_MissionName);
    end
end



--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x300304_CheckAccept( sceneId, selfId ,targetId )

	if (GetName(sceneId,targetId)==x300304_g_Name) then
		if (GetLevel( sceneId, selfId ) >= x300304_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x300304_g_MissionMaxLevel ) then
			return 1
		else
			return 0
		end
	end
	return 0		
end
--**********************************�ж������������****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2����Ҫ���������������м价�ڽ����ж�*****************

function x300304_CheckContinue( sceneId, selfId ,targetId )
	
end
--**********************************��������**********************************
function x300304_OnAccept(sceneId, selfId )		
	x300304_g_QuestOrder(x300304_g_QuestType)
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
	for i, QuestInfo in pairs(x300304_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x300304_g_MissionId, x300304_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x300304_g_MissionId)			--�õ���������к�
	if x300304_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x300304_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,j-1,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x300304_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	NewWorld( sceneId, selfId, 34, 84, 104 )
end

--**********************************
--����
--**********************************
function x300304_OnAbandon( sceneId, selfId )
	x300304_g_QuestOrder(x300304_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x300304_g_MissionId )
end


--**********************************
--����
--**********************************
function x300304_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x300304_CheckSubmit( sceneId, selfId )
	x300304_g_QuestOrder(x300304_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x300304_g_MissionId)
	local bDone = 1

	for i, QuestInfo in pairs(x300304_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL"  then

			local Many = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
			if QuestInfo.num == nil then
				QuestInfo.num = 1
			end
			if Many == nil then

			elseif	Many < QuestInfo.num then
				bDone = 0
				break
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
function x300304_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x300304_g_QuestOrder(x300304_g_QuestType)
	if (x300304_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if (getn(x300304_g_ItemBonus) ==0)  and  (getn(x300304_g_RadioItemBonus) == 0 ) then
			givebonus = 1
		else
			for i, item in pairs(x300304_g_ItemBonus) do
				if item.id>0 and item.num>0 then
					AddItem( sceneId,item.id, item.num )
					giveitem = 1
				end
			end
			for i, item in pairs(x300304_g_RadioItemBonus) do
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
			ret = DelMission( sceneId, selfId, x300304_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x300304_g_MissionId )
				if (x300304_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x300304_g_ExpBonus(sceneId, selfId, x300304_g_exp))
				end					
				if (x300304_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x300304_g_MoneyBonus(sceneId, selfId, x300304_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x300304_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x300304_g_ScriptIdNext.ScriptId~=nil) and (x300304_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x300304_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					
					if (CanNext == 1) then
						CallScriptFunction( x300304_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"���㵽��"..x300304_g_ScriptIdNext.LV.."���������ң��һ��к���Ҫ����Ҫ������ȥ����ǧ���ס�ˣ�")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end
end

--**********************************--ɱ����������--**********************************
function x300304_OnKillObject( sceneId, selfId, objdataId )
	x300304_g_QuestOrder(x300304_g_QuestType)
	local QuestPlace = 0	--�������Ӧ��֮ǰSetMissionByIndex(sceneId,selfId,misIndex,j-1,0)ʱ���ڵ�λ��,==j-1
	for i, QuestInfo in pairs(x300304_g_Quest) do
		if QuestInfo.type ==  "MONSTER_KILL" then	
			 if objdataId == QuestInfo.id then
				  local misIndex = GetMissionIndexByID(sceneId,selfId,x300304_g_MissionId)
				  num = GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1)
				  if num < QuestInfo.num then						
				    SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order-1,num+1)
				    SetMissionByIndex(sceneId,selfId,misIndex,QuestInfo.order,num+1)
				  	BeginEvent(sceneId)
					  	strText = format("��ɱ��  "..QuestInfo.name.."  %d/"..QuestInfo.num, GetMissionParam(sceneId,selfId,misIndex,QuestInfo.order-1) )
					  	AddText(sceneId,strText);
				  	EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				  end
			 end
		end
	end
end

--**********************************--���������¼�--**********************************
function x300304_OnEnterArea( sceneId, selfId, areaId )

end

function x300304_OnTimer( sceneId, selfId )

end

function x300304_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x300304_OnItemChanged( sceneId, selfId, itemdataId )

end
