--MisDescBegin
--��ǰ�ű���������
x920001_g_ScriptId = 920001

--��ǰ�����MissionID��������ר�˸�����䣬9��ͷ��Ĭ��Ϊ��Ϊ������������ID
x920001_g_MissionId = 921

--�������
x920001_g_MissionKind = 13
x920001_g_MissionLevel = 10

--������ʼnpc
x920001_g_NameHead	= "��ҩʦ"

--�����ύnpc
x920001_g_NameEnd	= "��ҩʦ"

--�����Ƿ��Ѿ����
x920001_g_IsMissionOkFail = 0		--�����ĵ�0λ

x920001_g_DemandKill ={{id=9123,num=1}}

x920001_g_MissionName="ÿ�ջ����"

--��������(������ʱ��������Ŀ����ɽ�����ʱ)֧�ֶ������
x920001_g_MissionInfo={"�Դ����صĺ������ڵ��ϳ��ֹ��󣬵��Ϸ����˺ܶ�͵���ϵ��ĵ�����������һ���ͺ����˵ĳ����йأ��ͷ���������ȥ�������ǣ���̽�����˵����䡣"} 

x920001_g_MissionTarget="ɱ��1��#aB{72,182,4,�һ���,����}[����]#aE����ɺ��ȥ��#aB{33,180,4,�һ���,��ҩʦ}[��ҩʦ]#aE"	

x920001_g_ContinueInfo={"��û��չ��"}

x920001_g_MissionComplete="ʲô������˵����ʶ�������𣿿����ҵ����˼��������ˣ��������ˣ������ˡ�"

x920001_g_MoneyBonus=10000
x920001_g_ItemBonus={{id=12010003,num=1},{id=12020004,num=1}}
x920001_g_RadioItemBonus={{id=12010005,num=1},{id=12020006,num=1}}



--������ʱ( ��λ:�� )
--x920001_g_MissionLimitTime  = 0

--������
--x920001_g_MissionRound = 0
--MisDescEnd

--****************************************����ɽ������ж�*************************************************************************

--����ƴ���
x920001_g_CanDoCount = 2

--����ɽӵȼ���Χ
x920001_g_MissionMinLevel = 1
x920001_g_MissionMaxLevel = 100

--ǰ�������MissionID,������д���ǰ������
x920001_g_MisIdPre = {}

--��Ҫ���������ڸ����������ֱ�ӵ���������д����Ĳ�����������д��ֻ����дһ����������
--ScriptIdΪ���������ScriptId��LVΪ��������ĵȼ�Ҫ��Ҫ��ScriptId��Ӧ�ű�����ĵȼ�Ҫ��һ��
x920001_g_ScriptIdNext = {}

--****************************************�������ݿ�ʼ*********************************************************************
--�ܵĴ�������Ŀ��������һ�仰����
x920001_g_MissionAim="�ҵ�͵���ϵ��ĵ������������ǲ��Ҵ�̽����������Ϣ��"		

--����Ŀ������(���Զ�����Ŀ��)
--MONSTER_KILL					--ɱ��                        --idΪɱ�����ͣ�nameΪ��������,numΪ��Ӧɱ������
x920001_g_MONSTER_KILL = {{id=9123,name="����",num=1,type="MONSTER_KILL",order=0}}

--MONSTER_ITEM					--��ֵ���                    --idΪɱ�����ͣ�itemΪ���������Ʒ����,nameΪ�������ƣ�perΪ������ʣ�maxΪһ�ε�����Ʒ�ĸ�������,numΪ������߸���
x920001_g_MONSTER_ITEM = {}

--********************************����Ŀ������********************************
--*********************һ�������Ŀ��������ֻ��Ϊ8��,�����Ѿ�������,������*******************************
--********************����Ŀ��Ϊ��СԪ��,����ɱ3�ֹ�,����3������Ŀ�����***********************************

x920001_g_QuestType = {x920001_g_MONSTER_KILL}
x920001_g_Quest = {}
x920001_g_QuestNum = 0
x920001_MP_ISCOMPLETE = 7

--�������ͽ������������x920001_g_Quest����
function  x920001_g_QuestOrder(QuestType)
	local count = 0
	for i, QuestLabel in pairs(QuestType) do
		for j, QuestInfo in pairs(QuestLabel) do
			count = count + 1
			QuestInfo.order = count
			x920001_g_Quest[count] = QuestInfo
		end
	end
	x920001_g_QuestNum = count
end
	
--������(expΪ������ڲ�����moneyΪ��Ǯ���ڲ���)
--���齱��
x920001_g_ExpBonustxt = ""
x920001_g_exp = 1

function x920001_g_ExpBonus( sceneId, selfId, exp )
	local LV = GetLevel( sceneId, selfId )
	local ExpBonus = 41
	return ExpBonus*x920001_g_exp
end

--��Ǯ����
x920001_g_MoneyBonustxt = 10000
x920001_g_money = 1

function x920001_g_MoneyBonus( sceneId, selfId, money )
	local MoneyBonus=10000
	return MoneyBonus*x920001_g_money
end

--�̶���Ʒ���������8��
x920001_g_ItemBonus={{id=12010003,num=1},{id=12020004,num=1}}

--��ѡ��Ʒ���������8��
x920001_g_RadioItemBonus={{id=12010005,num=1},{id=12020006,num=1}}
--**********************************������ں���**********************************

function x920001_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

   --���������������
 	 x920001_g_QuestOrder( x920001_g_QuestType )
 	 
 	 --�Ƿ�����������
   if IsHaveMission( sceneId, selfId, x920001_g_MissionId ) > 0 then
   		
   		local MisIndex = GetMissionIndexByID( sceneId, selfId, x920001_g_MissionId )
   		
		   	 --�ǽ�����NPC�����ж��Ƿ����������ʾ��Ӧ��ʾ��Ϣ
				 if ( GetName( sceneId, targetId ) == x920001_g_NameEnd ) then	
				
					 local Done = 0
					 
					 --ע��------------------------------------------------------------------------------------
					 --�������ʱ�������ﻹ���ж��Ƿ��ڹ涨ʱ������ɣ����������˴�����ʧ�ܣ�����δ�����ʾ	
					 ------------------------------------------------------------------------------------------		 
					 
					 Done = x920001_CheckSubmit( sceneId, selfId )
					 
					 --PrintStr( "�Ƿ����" )
					 --PrintNum( Done )				 

					if Done == 1 then			
						BeginEvent(sceneId)		
						x920001_ShowQuestInfo( sceneId, selfId, targetId , 1)		
						DispatchMissionContinueInfo( sceneId, selfId, targetId,x920001_g_ScriptId, x920001_g_MissionId )	
						EndEvent( )
					else
					  BeginEvent(sceneId)
						x920001_ShowQuestInfo( sceneId, selfId, targetId , 2)
				 		DispatchMissionDemandInfo( sceneId, selfId, targetId, x920001_g_ScriptId, x920001_g_MissionId, 0 )
				 		EndEvent( )
					end					 
					 										
		    end	
		    --if ( GetName( sceneId, targetId ) == x920001_g_NameEnd ) then	
    
  --û�нӹ�������ֱ����ʾ������Ϣ
  else 

    --�����ս�����ʱ���Ƿ���֮ǰ���������Ĵ�������Ҫ����Ϊ0
    x920001_CheckNeedReset( sceneId, selfId )
    
		BeginEvent(sceneId)
			x920001_ShowQuestInfo( sceneId, selfId, targetId ,0 )
		EndEvent()
		DispatchMissionInfo( sceneId, selfId, targetId, x920001_g_ScriptId, x920001_g_MissionId )
		
  end
  --if IsHaveMission( sceneId, selfId, x920001_g_MissionId ) > 0 then
	
end

--�����ս�����ʱ���Ƿ���֮ǰ�������Ĵ�������Ҫ����Ϊ0
function	x920001_CheckNeedReset( sceneId, selfId )

		local lastDone = GetMissionData( sceneId, selfId, MD_HUODONGCESHI_DATE );			
		local today		 = GetTodayDate();		
		
		if( lastDone ~= today ) then
				    
		  local bTodayCanDo = IsTodayMission( x920001_g_MissionId )
		  
			if( bTodayCanDo == 1 ) then
			
					--���û��ɴ���Ϊ0
			  	SetMissionData(  sceneId, selfId, MD_HUODONGCESHU_ROUND, 0 )
			end
			
   end
  
end
--**********************************����������ʾ**********************************
function	x920001_ShowQuestInfo( sceneId, selfId, targetId ,Done )

	--��ʾ��������
	AddText( sceneId, "#Y"..x920001_g_MissionName )	
	
	--����δ���
	if Done == 2 then 
		for i, Info in pairs(x920001_g_ContinueInfo) do
			AddText(sceneId,Info)
		end
	--�������
	elseif( Done == 1 ) then
		AddText( sceneId, x920001_g_MissionComplete )
	--������ʱ
	elseif( Done == 0 ) then
		for i, Info in pairs(x920001_g_MissionInfo) do
			AddText(sceneId,Info)
		end
	end
	
	--AddText(sceneId,x920001_g_ExpBonustxt)
	if( Done ~= 1 ) then
		AddText(sceneId,"#Y����Ŀ��:")
		AddText(sceneId,x920001_g_MissionAim) --��ʾ����Ŀ����������
		
		--������Ŀ�����ʾ
		x920001_ShowQuestAim( sceneId, selfId, targetId,Done )	 --��ʾ����Ŀ��������
	end
	
	AddMoneyBonus( sceneId, x920001_g_MoneyBonustxt )			   --��ӽ�Ǯ����
	
	--��ӽ�����Ʒ
	if x920001_g_ItemBonus ~= nil then
		for i, item in pairs(x920001_g_ItemBonus) do
			AddItemBonus( sceneId, item.id, item.num )
		end
	end		
	
	--��ӿ�ѡ��������
	if x920001_g_RadioItemBonus ~= nil then
		for i, item in pairs(x920001_g_RadioItemBonus) do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	end
	
end

function  x920001_CheckAccept( sceneId, selfId, targetId )
 
 if ( GetName( sceneId, targetId ) == x920001_g_NameHead ) then
		--if ( GetLevel( sceneId, selfId ) >= x920001_g_MissionMinLevel ) and (GetLevel( sceneId, selfId ) <= x920001_g_MissionMaxLevel ) then
		if ( MissionCommonCheck( x920001_g_MissionId, sceneId, selfId ) == 1 ) then
			if	x920001_g_MisIdPre == nil then
				return	1
			else
				for i, questpre in pairs(x920001_g_MisIdPre) do
					if IsMissionHaveDone(sceneId,selfId,questpre) == 0 then
						 BeginEvent(sceneId)			
       			--AddText( sceneId, "#Y"..x920001_g_MissionName )
       			AddText( sceneId, "�㲻����������" )       
      			EndEvent()
      			DispatchMissionTips(sceneId,selfId)
						return 0
					end
				end
				return 1
			end		
		else
		  BeginEvent(sceneId)			
       --AddText( sceneId, "#Y"..x920001_g_MissionName )
       AddText( sceneId, "�㲻����������" )       
      EndEvent()
      DispatchMissionTips(sceneId,selfId)
			return 0
		end
	else
		return 0
	end
	
end

--**********************************����Ŀ����ʾ**********************************

function	x920001_ShowQuestAim( sceneId, selfId, targetId, Done )
 
 x920001_g_QuestOrder(x920001_g_QuestType)
	if x920001_g_Quest ==nil then
		print("������û�а�Ŀ��!!!")
	else
		local Many = 0
		misIndex = GetMissionIndexByID(sceneId,selfId,x920001_g_MissionId)
		
		--��ʾÿ��Ŀ���������
		for i, QuestInfo in pairs(x920001_g_Quest) do

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
		--for i, QuestInfo in pairs(x920001_g_Quest) do
	end
	--if x920001_g_Quest ==nil then

end


--**********************************�ж������Ƿ���ʾ**********************************
function x920001_OnEnumerate( sceneId, selfId, targetId )

		AddNumText( sceneId, x920001_g_ScriptId, x920001_g_MissionName );
		
end

--**********************************��������**********************************
function x920001_OnAccept( sceneId, selfId )		

  --�ж��Ƿ��ǻʱ��
  if( IsMissionInTime( x920001_g_MissionId ) == 1 ) then  

 		if( x920001_CheckAccept( sceneId, selfId, targetId ) == 1 ) then
    	 
  	 local nMisValue = GetMissionData( sceneId, selfId, MD_HUODONGCESHU_ROUND )
  	 
     if( nMisValue == x920001_g_CanDoCount ) then --�������������
        BeginEvent(sceneId)			
       	--AddText( sceneId, "#Y"..x920001_g_MissionName )
       	AddText( sceneId, "���ջ���������ꡣ" )       
     		EndEvent()
     		DispatchMissionTips(sceneId,selfId)
     		return
     end      
     
    end
		
	else
		 BeginEvent(sceneId)			
       --AddText( sceneId, "#Y"..x920001_g_MissionName  )
       AddText( sceneId, "���ż������ʱ�仹û����" )       
     EndEvent()
     DispatchMissionTips(sceneId,selfId)
     return
	end
	
			
	--���������������
	x920001_g_QuestOrder( x920001_g_QuestType )
	
	--��ȡ�ѽ��������
	if GetMissionCount( sceneId, selfId ) >= 20 then
		Msg2Player(  sceneId, selfId, "#Y���������־�Ѿ�����", MSG2PLAYER_PARA )
		BeginEvent(sceneId)
			strText = "#Y���������־�Ѿ�����"
			AddText( sceneId, strText );
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	local DoKill, DoArea, DoItem = 0, 0, 0
	for i, QuestInfo in pairs(x920001_g_Quest) do
		if QuestInfo.type == "MONSTER_KILL" then
			DoKill = 1
		elseif (QuestInfo.type == "DELIVERY") then
			DoItem = 1	
			local ret = 1
						
			BeginAddItem(sceneId)
			if QuestInfo.item > 0 and QuestInfo.num > 0 then
				AddItem( sceneId,QuestInfo.item, QuestInfo.num )
			end
			local ret = EndAddItem(sceneId,selfId)
			
			if ret > 0 then
					AddItemListToHuman(sceneId,selfId)
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
	
	AddMission( sceneId,selfId, x920001_g_MissionId, x920001_g_ScriptId, DoKill, DoArea, DoItem )		
	
	--�õ���������к�
	local misIndex = GetMissionIndexByID( sceneId, selfId, x920001_g_MissionId )			
	
	--�������кŰ����������0
	for j=1, x920001_g_QuestNum do
		SetMissionByIndex( sceneId, selfId, misIndex, j-1, 0 )	
	end
		
	BeginEvent(sceneId)
	  	strText = "�����������  "..x920001_g_MissionName
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips( sceneId, selfId )
	
	
end

--**********************************
--����
--**********************************
function x920001_OnAbandon( sceneId, selfId )

	 --ɾ����������б��ж�Ӧ������
   DelMission( sceneId, selfId, x920001_g_MissionId )
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x920001_CheckSubmit( sceneId, selfId )	
		
	local bDone = 1
		
	x920001_g_QuestOrder( x920001_g_QuestType )
	
	local misIndex = GetMissionIndexByID( sceneId, selfId, x920001_g_MissionId )	

	--���ÿһ�����������Ƿ������
	for i, QuestInfo in pairs(x920001_g_Quest) do		
		--local Many = GetMissionParam( sceneId, selfId, misIndex, QuestInfo.order-1 )
		local Many = GetMissionParam( sceneId, selfId, misIndex, 1 )
		
		if QuestInfo.num == nil then
			QuestInfo.num = 1
		end

		if	Many < QuestInfo.num then
			bDone = 0
			break
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
function x920001_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	x920001_g_QuestOrder( x920001_g_QuestType )
	
	--����������������
	if ( x920001_CheckSubmit( sceneId, selfId ) == 1 ) then
		local givebonus = 0
		local giveitem  = 0
		
		BeginAddItem(sceneId)
		
		--�ж������Ƿ��пռ�Ž�����Ʒ
		if ( getn( x920001_g_ItemBonus ) == 0 ) and ( getn( x920001_g_RadioItemBonus ) == 0 ) then
			givebonus = 1
		else
			for i, item in pairs(x920001_g_ItemBonus) do
				if item.id > 0 and item.num > 0 then
					AddItem( sceneId,item.id, item.num )
					giveitem = 1
				end
			end
			
			for i, item in pairs(x920001_g_RadioItemBonus) do
				if item.id == selectRadioId and item.num > 0 and item.id > 0 then
					AddItem( sceneId,item.id, item.num )
					giveitem = 1
				end
			end
			
			if giveitem == 1 then
				giveitem = EndAddItem( sceneId, selfId )
			end
			
		end		
			
		--������û�мӳɹ�	
		if ( giveitem <= 0 ) and ( givebonus == 0 ) then
	
			BeginEvent(sceneId)
				strText = "��Ʒ����������������������"
				AddText( sceneId, strText );
			EndEvent(sceneId)
			DispatchMissionTips( sceneId, selfId )
			
		else
		 
		  local nMisIndex = GetMissionIndexByID( sceneId, selfId, x920001_g_MissionId )
		  
		  --��¼�����������(�����жϱ��մ�������) 
		  SetTimeParam( MD_HUODONGCESHI_DATE, sceneId, selfId )		  
		  
		  --���ɴ��� + 1
		  local nMisValue = GetMissionData( sceneId, selfId, MD_HUODONGCESHU_ROUND )
		  SetMissionData( sceneId, selfId, MD_HUODONGCESHU_ROUND, nMisValue+1 )
		  
			DelMission( sceneId, selfId, x920001_g_MissionId )	
			
			--��������ֵ
			if ( x920001_g_ExpBonustxt ~= nil )  then
				LuaFnAddExp( sceneId, selfId,x920001_g_ExpBonus( sceneId, selfId, x920001_g_exp ))
			end			
			
			--������Ǯ		
			if ( x920001_g_MoneyBonustxt ~= nil ) then
				AddMoney( sceneId, selfId, x920001_g_MoneyBonus( sceneId, selfId, x920001_g_money ));
			end
			
			--�����пռ�Ž�����Ʒ
			if giveitem == 1 then
				AddItemListToHuman( sceneId, selfId )
			end
			
			BeginEvent(sceneId)
			  	strText = "�����������  "..x920001_g_MissionName
			  	AddText( sceneId, strText );
			EndEvent(sceneId)				
			DispatchMissionTips( sceneId, selfId )
				
		end
		--if ( giveitem == 0 ) and ( givebonus == 0 ) then		
		
	end
	--if ( x920001_CheckSubmit( sceneId, selfId ) == 1 ) then
		
end

--**********************************--ɱ����������--**********************************
function x920001_OnKillObject( sceneId, selfId, objdataId )

x920001_g_QuestOrder( x920001_g_QuestType )
	
	local QuestPlace = 0	--�������Ӧ��֮ǰSetMissionByIndex(sceneId,selfId,misIndex,j-1,0)ʱ���ڵ�λ��,==j-1
	
	for i, QuestInfo in pairs(x920001_g_Quest) do
	
		--��Ļ�м���ʾɱ�������֣����ı���������
		if QuestInfo.type ==  "MONSTER_KILL" then	
		
				if objdataId == QuestInfo.id then
	 		
				  local misIndex = GetMissionIndexByID( sceneId, selfId, x920001_g_MissionId )
				  --num = GetMissionParam( sceneId, selfId, misIndex, QuestInfo.order - 1 )
				  num = GetMissionParam( sceneId, selfId, misIndex, 1 )
				  
				  if num < QuestInfo.num then		
				  	--ע�⣬ԭ��ɱ���Ĺ������������1���ڴ�����Ϊ�����͵�order				
				    --SetMissionByIndex( sceneId, selfId, misIndex, QuestInfo.order - 1, num + 1 )
				    SetMissionByIndex( sceneId, selfId, misIndex, 1, num + 1 )
			
				  	BeginEvent(sceneId)
							--strText = format("��ɱ��  "..QuestInfo.name.."  %d/"..QuestInfo.num, GetMissionParam( sceneId, selfId, misIndex, QuestInfo.order - 1 ) )
					  	strText = format("��ɱ��  "..QuestInfo.name.."  %d/"..QuestInfo.num, GetMissionParam( sceneId, selfId, misIndex, 1 ))
					  	AddText(sceneId,strText);
				  	EndEvent(sceneId)
					  DispatchMissionTips(sceneId,selfId)
					  
					  if ( num + 1 ) == QuestInfo.num then
						 SetMissionByIndex( sceneId, selfId, misIndex, x920001_MP_ISCOMPLETE, 1 )
					  end
				  end
				  
			 end
		   --if objdataId == QuestInfo.id then
		   
		end
		--if QuestInfo.type ==  "MONSTER_KILL" then	
		
	end
	--for i, QuestInfo in pairs(x920001_g_Quest) do
	
end
--**********************************--���߸ı�--**********************************
function x920001_OnItemChanged( sceneId, selfId, itemdataId )

	x920001_g_QuestOrder( x920001_g_QuestType )
	
	local misIndex = GetMissionIndexByID( sceneId, selfId, x920001_g_MissionId )
	
	for i, QuestInfo in pairs(x920001_g_Quest) do
	
		if QuestInfo.type == "COLLECT_SPECIAL" or QuestInfo.type == "COLLECT" or QuestInfo.type == "MONSTER_ITEM" then
		
			if ( QuestInfo.item == itemdataId ) then
				local questitemnum = LuaFnGetItemCount( sceneId, selfId, QuestInfo.item )
				
				if ( questitemnum >= 0 ) and ( questitemnum <= QuestInfo.num )then
					SetMissionByIndex( sceneId, selfId, misIndex, QuestInfo.order-1, questitemnum )
					BeginEvent(sceneId)
						strText = format( "�ѻ��  "..QuestInfo.name.."  %d/"..QuestInfo.num, questitemnum )
					 	AddText( sceneId, strText );
				 	EndEvent(sceneId)
					DispatchMissionTips( sceneId, selfId )
				end
				
			end
			--if ( QuestInfo.item == itemdataId ) then
		end
		--if QuestInfo.type == "COLLECT_SPECIAL" or QuestInfo.type == "COLLECT" or ...
	end
	--for i, QuestInfo in pairs(x920001_g_Quest) do
	
end
