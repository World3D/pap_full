--ɱ������
--�ձ�ʿ��
--MisDescBegin
--�ű���
x910009_g_ScriptId = 910009

--��һ�������ID
--g_MissionIdPre =

--�����,9��ͷ����Ϊ������������ID
x910009_g_MissionId = 909

--����Ŀ��npc
x910009_g_Name	="��ľ��" 

--�������
x910009_g_MissionKind = 1

--����ȼ�
x910009_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x910009_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x910009_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x910009_g_DemandKill ={{id=2009,num=1}}		--������1λ
x910009_g_DemandItem ={{id=30007001,num=1}}		--������1λ
--�����Ƕ�̬**************************************************************

--�����ı�����
x910009_g_MissionName="����Boss10"
x910009_g_MissionInfo="��սBoss10���û������ϵ��ɹ���ʿ�ռǣ�"  --��������
x910009_g_MissionTarget="ɱ��Boss10"		--����Ŀ��
x910009_g_ContinueInfo="���Ѿ�ɱ��Boss10���������ܰ쵽�ġ�"		--δ��������npc�Ի�
x910009_g_MissionComplete="�������ɹ���ʿ��"					--�������npc˵���Ļ�

--������
--x910009_g_MoneyBonus=100
x910009_g_ItemBonus={}
x910009_g_RadioItemBonus={}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910009_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x910009_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x910009_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910009_g_MissionName)
			AddText(sceneId,x910009_g_ContinueInfo)
			for i, item in pairs(x910009_g_DemandItem) do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x910009_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x910009_g_ScriptId,x910009_g_MissionId,bDone)
	--���������������
	elseif x910009_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910009_g_MissionName)
			AddText(sceneId,x910009_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x910009_g_MissionTarget)
			--AddMoneyBonus( sceneId, x910009_g_MoneyBonus )
			--for i, item in pairs(x910009_g_ItemBonus) do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			for i, item in pairs(x910009_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x910009_g_ScriptId,x910009_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x910009_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x910009_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x910009_g_MissionId) > 0 then
		AddNumText(sceneId,x910009_g_ScriptId,x910009_g_MissionName);
    --���������������
    elseif x910009_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x910009_g_ScriptId,x910009_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x910009_CheckAccept( sceneId, selfId )
	--��Ҫ9�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x910009_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x910009_g_MissionId, x910009_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x910009_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x910009_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x910009_g_MissionId )
end

--**********************************
--����
--**********************************
function x910009_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x910009_g_MissionName)
		AddText(sceneId,x910009_g_MissionComplete)
		--AddMoneyBonus( sceneId, x910009_g_MoneyBonus )
		--for i, item in pairs(x910009_g_ItemBonus) do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		for i, item in pairs(x910009_g_RadioItemBonus) do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910009_g_ScriptId,x910009_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910009_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x910009_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if (num == x910009_g_DemandKill[1].num) then
    	if (GetItemCount(sceneId,selfId,x910009_g_DemandItem[1].id)>=x910009_g_DemandItem[1].num) then
       		return 1
       	end       		
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x910009_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x910009_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			--for i, item in pairs(x910009_g_ItemBonus) do
			--	AddItem( sceneId,item.id, item.num )
			--end
			for i, item in pairs(x910009_g_RadioItemBonus) do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			--AddMoney(sceneId,selfId,x910009_g_MoneyBonus );
			--�۳�������Ʒ
			for i, item in pairs(x910009_g_DemandItem) do
				DelItem( sceneId, selfId, item.id, item.num )
			end
			

			
			ret = DelMission( sceneId, selfId, x910009_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x910009_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				LuaFnAddExp( sceneId, selfId,200)
			end
		else
		--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end      
	end
end

--**********************************
--ɱ����������
--**********************************
function x910009_OnKillObject( sceneId, selfId, objdataId )

 if objdataId == x910009_g_DemandKill[1].id then
	  misIndex = GetMissionIndexByID(sceneId,selfId,x910009_g_MissionId)
	  num = GetMissionParam(sceneId,selfId,misIndex,1)
	  if num < x910009_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
	  	BeginAddItem(sceneId)
	  		AddItem( sceneId,item.id, item.num )
	  	local ret = EndAddItem(sceneId,selfId)
	  	if  ret>0 then
	  		if num == x910009_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			end
			--���ô������+1
		    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
		    
		    
		  	BeginEvent(sceneId)
		  	strText = format("��ɱ��Boss10%d/1", GetMissionParam(sceneId,selfId,misIndex,1) )
	  		
	  		AddItemListToHuman(sceneId,selfId)	 
	  		
	  		AddText(sceneId,strText);
		  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
	  	else
		--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷�����������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end  
	  end
 end
 
end

--**********************************
--���������¼�
--**********************************
function x910009_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910009_OnItemChanged( sceneId, selfId, itemdataId )
end
