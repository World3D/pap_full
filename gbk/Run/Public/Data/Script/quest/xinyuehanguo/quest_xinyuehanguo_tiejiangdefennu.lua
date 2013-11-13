--���º�����������֮  �����ķ�ŭ
--MisDescBegin
--��ǰ�ű���������
x211043_g_ScriptId = 211043

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x211043_g_MissionId = 382

--������ʼnpc
x211043_g_Name	="������" 

--�������
x211043_g_MissionKind = 1
x211043_g_MissionLevel = 5

--�Ƿ��Ǿ�Ӣ����
x211043_g_IfMissionElite = 0

--�����Ƿ��Ѿ����
x211043_g_IsMissionOkFail = 0		--�����ĵ�0λ

x211043_g_DemandKill ={{id=416,num=10}}

x211043_g_MissionName="�����ķ�ŭ"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x211043_g_MissionInfo={"ǰ�������ԭ�ϵ�����������������ɱ���ӣ�Ū�ô�����Ļ̻̣������ǰ�����ʱ���ڴ��������ε��������ӿ��ܻ��������ɺ�����ȳ�ж����㣬��ȻҲ�ܱ����´�ҡ�ϣ������ȥ��������Щ��ԭ�Ͽɶ�Ķ�����"} 

x211043_g_MissionTarget="������10������"	

x211043_g_ContinueInfo={"������������Щ����������Ҳ������������ˣ�"}  

x211043_g_MissionComplete="������Щ������ʱ������Ӧ�ò��������������ˡ�"

x211043_g_MoneyBonus=10000
x211043_g_ItemBonus={}
x211043_g_RadioItemBonus={{id=12010001,num=5},{id=12020001,num=5}}
--MisDescEnd

--�����ύnpc
x211043_g_NameEnd	= "������"

--****************************************����ɽ������ж�*************************************************************************
--����ɽӵȼ���Χ
x211043_g_MissionMinLevel = 5
x211043_g_MissionMaxLevel = 200

x211043_g_MisIdPre = {386}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x211043_g_ScriptIdNext = {ScriptId = 211044 ,LV = 7 }

--****************************************�������ݿ�ʼ*********************************************************************

--����Ŀ������(���Զ�����Ŀ��)
--MONSTER_KILL					--ɱ��                        --idΪɱ�����ͣ�nameΪ��������,numΪ��Ӧɱ������
x211043_g_MONSTER_KILL = {{id=416,name="��ԭ����",num=10,type="MONSTER_KILL",order=0}	}

--********************************����Ŀ������********************************
--*�м�*****�м�*****�м�*******************************************************************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************
--*�м�*****�м�*****�м�********************************************************************
x211043_g_QuestType = {x211043_g_MONSTER_KILL}
x211043_g_Quest = {}
x211043_g_QuestNum = 0
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x211043_g_ExpBonustxt = "����  100"
x211043_g_exp = 1

--��Ǯ����
x211043_g_MoneyBonustxt = 10000
x211043_g_money = 1

--�̶���Ʒ���������8��
x211043_g_ItemBonus={{id=12010001,num=5},{id=12020001,num=5}}


--��ѡ��Ʒ���������8��
x211043_g_RadioItemBonus={}




function  x211043_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x211043_g_Quest[count] = QuestInfo
		end
	end
	x211043_g_QuestNum = count
end

function x211043_g_ExpBonus(sceneId, selfId, exp)
	return 9000*x211043_g_exp
end

function x211043_g_MoneyBonus(sceneId, selfId, money)
	local MoneyBonus=10000
	return MoneyBonus*x211043_g_money
end



--**********************************������ں���**********************************

function x211043_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	x211043_g_QuestOrder(x211043_g_QuestType)
    if IsHaveMission(sceneId,selfId,x211043_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x211043_g_NameEnd) then
			local Done = x211043_CheckSubmit( sceneId, selfId )
			BeginEvent(sceneId)
				if Done == 1 then
					x211043_ShowQuestInfo( sceneId, selfId, targetId , 1)
				else
					x211043_ShowQuestInfo( sceneId, selfId, targetId , 2)
				end
			EndEvent( )
			if (Done == 1) then
				DispatchMissionContinueInfo(sceneId,selfId,targetId,x211043_g_ScriptId,x211043_g_MissionId)
			else
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x211043_g_ScriptId,x211043_g_MissionId,0)
			end
		end
    elseif x211043_CheckAccept(sceneId,selfId,targetId) > 0 then
		--��������ɽ���������ʼ��ʾ������������
		BeginEvent(sceneId)
			x211043_ShowQuestInfo( sceneId, selfId, targetId ,0)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x211043_g_ScriptId,x211043_g_MissionId)
    end	
end

--**********************************����������ʾ**********************************
function	x211043_ShowQuestInfo( sceneId, selfId, targetId ,Done)
	local DoneEX = Done
	AddText(sceneId,"#Y"..x211043_g_MissionName)
	if DoneEX==2 then
		for i, Info in pairs(x211043_g_ContinueInfo) do
			AddText(sceneId,Info)
		end
	else
		for i, Info in pairs(x211043_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	--AddText(sceneId,x211043_g_ExpBonustxt)
	AddText(sceneId,"#Y����Ŀ��:")
	AddText(sceneId,x211043_g_MissionTarget)
	--������Ŀ�����ʾ
	if Done >= 1 then
		Done = 1
	end	
	x211043_ShowQuestAim( sceneId, selfId, targetId,Done )	
	AddMoneyBonus( sceneId, x211043_g_MoneyBonustxt )
	if DoneEX == 2 then
	else
		if x211043_g_ItemBonus ~= nil then
			for i, item in pairs(x211043_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
		end			
		if x211043_g_RadioItemBonus ~= nil then
			for i, item in pairs(x211043_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		end
	end
end


--**********************************����Ŀ����ʾ**********************************

function	x211043_ShowQuestAim( sceneId, selfId, targetId ,Done)
	x211043_g_QuestOrder(x211043_g_QuestType)
	if x211043_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x211043_g_MissionId)
		for i, QuestInfo in pairs(x211043_g_Quest) do

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
function x211043_OnEnumerate( sceneId, selfId, targetId )
    x211043_g_QuestOrder(x211043_g_QuestType) 	
    if IsMissionHaveDone(sceneId,selfId,x211043_g_MissionId) > 0 then
    	return 
    elseif IsHaveMission(sceneId,selfId,x211043_g_MissionId) > 0 then
    	local m = 0
    	for  i, QuestInfo in pairs(x211043_g_Quest) do
    		if QuestInfo.type == "DELIVERY" then
    			m = 1
    		end
    	end

    	if  (m == 1)  then
    		if  (GetName(sceneId,targetId)==x211043_g_NameEnd) then
    			AddNumText(sceneId,x211043_g_ScriptId,x211043_g_MissionName);
    		else
				for i, QuestInfo in pairs(x211043_g_Quest) do
					if QuestInfo.type == "DELIVERY" then
						if (GetName(sceneId,targetId)==QuestInfo.npc)then
					    	if x211043_CheckContinue(sceneId, selfId, targetId) == 1 then
								AddNumText(sceneId,x211043_g_ScriptId,x211043_g_MissionName);	
								break
							end
						end
					end
				end
			end
		elseif  (GetName(sceneId,targetId)==x211043_g_NameEnd) then
			AddNumText(sceneId,x211043_g_ScriptId,x211043_g_MissionName);
		end					
	--��������������ɽ�����,����ʾ�������
    elseif x211043_CheckAccept(sceneId,selfId,targetId) > 0 then
		AddNumText(sceneId,x211043_g_ScriptId,x211043_g_MissionName);
    end
end



--**********************************�ж�����ɽ�����****************************************
--**********************************1������ĵ�ǰNPCΪ�������NPC****************************
--**********************************2������ȼ���Χ��������ǰ�������������*****************

function x211043_CheckAccept( sceneId, selfId ,targetId )
	if (GetName(sceneId,targetId)==x211043_g_Name) then
		if (GetLevel( sceneId, selfId ) >= x211043_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x211043_g_MissionMaxLevel ) then
			if	x211043_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x211043_g_MisIdPre) do
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

function x211043_CheckContinue( sceneId, selfId ,targetId )
	
end
--**********************************��������**********************************
function x211043_OnAccept(sceneId, selfId )		
	x211043_g_QuestOrder(x211043_g_QuestType)
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
	for i, QuestInfo in pairs(x211043_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		end
	end	
	--��5��������ʾ�Ƿ�ص�OnKillObject	��6��������ʾ�Ƿ�ص�OnEnterArea	��7��������ʾ�Ƿ�ص�OnItemChange
	AddMission( sceneId,selfId, x211043_g_MissionId, x211043_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x211043_g_MissionId)			--�õ���������к�
	if x211043_g_QuestNum > 8 then
		print("һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������")
		return
	end
	for j=1,x211043_g_QuestNum do
		SetMissionByIndex(sceneId,selfId,misIndex,j-1,0)	--�������кŰ���������ĵ�0λ��0
	end
	BeginEvent(sceneId)
	  	strText = "�����������  "..x211043_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x211043_OnAbandon( sceneId, selfId )
	x211043_g_QuestOrder(x211043_g_QuestType)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x211043_g_MissionId )
end


--**********************************
--����
--**********************************
function x211043_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x211043_CheckSubmit( sceneId, selfId )
	x211043_g_QuestOrder(x211043_g_QuestType)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x211043_g_MissionId)
	local bDone = 1
	for i, QuestInfo in pairs(x211043_g_Quest) do
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
function x211043_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	x211043_g_QuestOrder(x211043_g_QuestType)
	if (x211043_CheckSubmit( sceneId, selfId ) == 1) then
		BeginAddItem(sceneId)
		local givebonus = 0
		local giveitem = 0
		if (getn(x211043_g_ItemBonus) ==0)  and  (getn(x211043_g_RadioItemBonus) == 0 ) then
			givebonus = 1
		else
			for i, item in pairs(x211043_g_ItemBonus) do
				if item.id>0 and item.num>0 then
					AddItem( sceneId,item.id, item.num )
					giveitem = 1
				end
			end
			for i, item in pairs(x211043_g_RadioItemBonus) do
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
			ret = DelMission( sceneId, selfId, x211043_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x211043_g_MissionId )
				if (x211043_g_ExpBonustxt~=nil) then
					LuaFnAddExp( sceneId, selfId,x211043_g_ExpBonus(sceneId, selfId, x211043_g_exp))
				end					
				if (x211043_g_MoneyBonustxt~=nil) then
					AddMoney(sceneId,selfId,x211043_g_MoneyBonus(sceneId, selfId, x211043_g_money) );
				end
				if giveitem > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				BeginEvent(sceneId)
				  	strText = "�����������  "..x211043_g_MissionName
				  	AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				if (x211043_g_ScriptIdNext.ScriptId~=nil) and (x211043_g_ScriptIdNext.ScriptId>0) then
					local CanNext = CallScriptFunction( x211043_g_ScriptIdNext.ScriptId, "CheckAccept",sceneId, selfId, targetId )
					if (CanNext == 1) then
						CallScriptFunction( x211043_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
					else
						BeginEvent(sceneId)
							AddText(sceneId,"���㵽��"..x211043_g_ScriptIdNext.LV.."���������ң��һ��к���Ҫ����Ҫ������ȥ����ǧ���ס�ˣ�")
						EndEvent( )	
						DispatchEventList(sceneId,selfId,targetId)
					end
				end
			end
		end
	end
end

--**********************************--ɱ����������--**********************************
function x211043_OnKillObject( sceneId, selfId, objdataId )
	x211043_g_QuestOrder(x211043_g_QuestType)
	local QuestPlace = 0	--�������Ӧ��֮ǰSetMissionByIndex(sceneId,selfId,misIndex,j-1,0)ʱ���ڵ�λ��,==j-1
	for i, QuestInfo in pairs(x211043_g_Quest) do
		if QuestInfo.type ==  "MONSTER_KILL" then	
			 if objdataId == QuestInfo.id then
				  local misIndex = GetMissionIndexByID(sceneId,selfId,x211043_g_MissionId)
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
function x211043_OnEnterArea( sceneId, selfId, areaId )

end

function x211043_OnTimer( sceneId, selfId )

end

function x211043_OnLeaveArea( sceneId, selfId )

end
--**********************************--���߸ı�--**********************************
function x211043_OnItemChanged( sceneId, selfId, itemdataId )

end
