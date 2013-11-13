--�ռ�����
--���ʿ�������Ʒ�
--MisDescBegin
--�ű���
x910006_g_ScriptId = 910006

--��һ�������ID
--g_MissionIdPre =

--�����
x910006_g_MissionId = 906

--����Ŀ��npc
x910006_g_Name	="��ľ��" 

--�������
x910006_g_MissionKind = 1

--����ȼ�
x910006_g_MissionLevel = 2

--�Ƿ��Ǿ�Ӣ����
x910006_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x910006_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�ռ�����Ʒ
x910006_g_DemandItem ={{id=30007005,num=1}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x910006_g_MissionName="�ռ��ɹ�������Ƭ"
x910006_g_MissionInfo="Boss1�������ɹ�������Ƭ�������ҿ��Ը��㻻���õ��·���"  --��������
x910006_g_MissionTarget="�����ɹ�������Ƭ"		--����Ŀ��
x910006_g_ContinueInfo="�����ɹ�������Ƭ��"		--δ��������npc�Ի�
x910006_g_MissionComplete="��������·���"					--�������npc˵���Ļ�

--������
x910006_g_MoneyBonus=0
x910006_g_ItemBonus={}
x910006_g_RadioItemBonus={{id=10413006,num=1},{id=10413016,num=1},{id=10413026,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910006_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x910006_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x910006_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910006_g_MissionName)
			AddText(sceneId,x910006_g_ContinueInfo)
			for i, item in pairs(x910006_g_DemandItem) do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x910006_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x910006_g_ScriptId,x910006_g_MissionId,bDone)
	--���������������
	elseif x910006_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910006_g_MissionName)
			AddText(sceneId,x910006_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x910006_g_MissionTarget)
			--AddMoneyBonus( sceneId, x910006_g_MoneyBonus )
			for i, item in pairs(x910006_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in pairs(x910006_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x910006_g_ScriptId,x910006_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x910006_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x910006_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x910006_g_MissionId) > 0 then
		AddNumText(sceneId,x910006_g_ScriptId,x910006_g_MissionName);
    --���������������
    elseif x910006_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x910006_g_ScriptId,x910006_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x910006_CheckAccept( sceneId, selfId )
	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 5 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x910006_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x910006_g_MissionId, x910006_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x910006_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x910006_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x910006_g_MissionId )
end

--**********************************
--����
--**********************************
function x910006_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x910006_g_MissionName)
		AddText(sceneId,x910006_g_MissionComplete)
		--AddMoneyBonus( sceneId, x910006_g_MoneyBonus )
		for i, item in pairs(x910006_g_ItemBonus) do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in pairs(x910006_g_RadioItemBonus) do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910006_g_ScriptId,x910006_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910006_CheckSubmit( sceneId, selfId )
	for i, item in pairs(x910006_g_DemandItem) do
		itemCount = GetItemCount(sceneId,selfId,item.id)
		if itemCount < item.num then
			return 0
		end
	end
	return 1	

	--misIndex = GetMissionIndexByID(sceneId,selfId,x910006_g_MissionId)
    --num = GetMissionParam(sceneId,selfId,misIndex,1)
    --if num == x910006_g_DemandKill[1].num then
    --   return 1
    --end
	--return 0
end

--**********************************
--�ύ
--**********************************
function x910006_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x910006_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in pairs(x910006_g_ItemBonus) do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in pairs(x910006_g_RadioItemBonus) do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
		--	AddMoney(sceneId,selfId,x910006_g_MoneyBonus );
			--�۳�������Ʒ
			for i, item in pairs(x910006_g_DemandItem) do
				DelItem( sceneId, selfId, item.id, item.num )
			end
			ret = DelMission( sceneId, selfId, x910006_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x910006_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				LuaFnAddExp( sceneId, selfId,200)
			end
		else
		--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��Ʒ����������������������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end      
	end
end

--**********************************
--ɱ����������
--**********************************
function x910006_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x910006_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910006_OnItemChanged( sceneId, selfId, itemdataId )
end
