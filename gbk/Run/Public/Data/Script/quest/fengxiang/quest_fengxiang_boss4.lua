--�ռ�����
--���ʿ�������Ʒ�
--MisDescBegin
--�ű���
x910008_g_ScriptId = 910008

--��һ�������ID
--g_MissionIdPre =

--�����
x910008_g_MissionId = 908

--����Ŀ��npc
x910008_g_Name	="��ľ��" 

--�������
x910008_g_MissionKind = 1

--����ȼ�
x910008_g_MissionLevel = 2

--�Ƿ��Ǿ�Ӣ����
x910008_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x910008_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�ռ�����Ʒ
x910008_g_DemandItem ={{id=30007007,num=1}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x910008_g_MissionName="�ռ��ɹŻ�����Ƭ"
x910008_g_MissionInfo="Boss1�������ɹŻ�����Ƭ�������ҿ��Ը��㻻���õĻ���"  --��������
x910008_g_MissionTarget="�����ɹŻ�����Ƭ"		--����Ŀ��
x910008_g_ContinueInfo="�����ɹŻ�����Ƭ��"		--δ��������npc�Ի�
x910008_g_MissionComplete="�����⸱�õĻ���"					--�������npc˵���Ļ�

--������
x910008_g_MoneyBonus=0
x910008_g_ItemBonus={}
x910008_g_RadioItemBonus={{id=10412006,num=1},{id=10412016,num=1},{id=10412026,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910008_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x910008_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x910008_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910008_g_MissionName)
			AddText(sceneId,x910008_g_ContinueInfo)
			for i, item in x910008_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x910008_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x910008_g_ScriptId,x910008_g_MissionId,bDone)
	--���������������
	elseif x910008_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910008_g_MissionName)
			AddText(sceneId,x910008_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x910008_g_MissionTarget)
			--AddMoneyBonus( sceneId, x910008_g_MoneyBonus )
			for i, item in x910008_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in x910008_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x910008_g_ScriptId,x910008_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x910008_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x910008_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x910008_g_MissionId) > 0 then
		AddNumText(sceneId,x910008_g_ScriptId,x910008_g_MissionName);
    --���������������
    elseif x910008_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x910008_g_ScriptId,x910008_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x910008_CheckAccept( sceneId, selfId )
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
function x910008_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x910008_g_MissionId, x910008_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x910008_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x910008_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x910008_g_MissionId )
end

--**********************************
--����
--**********************************
function x910008_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x910008_g_MissionName)
		AddText(sceneId,x910008_g_MissionComplete)
		--AddMoneyBonus( sceneId, x910008_g_MoneyBonus )
		for i, item in x910008_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in x910008_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910008_g_ScriptId,x910008_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910008_CheckSubmit( sceneId, selfId )
	for i, item in x910008_g_DemandItem do
		itemCount = GetItemCount(sceneId,selfId,item.id)
		if itemCount < item.num then
			return 0
		end
	end
	return 1	

	--misIndex = GetMissionIndexByID(sceneId,selfId,x910008_g_MissionId)
    --num = GetMissionParam(sceneId,selfId,misIndex,1)
    --if num == x910008_g_DemandKill[1].num then
    --   return 1
    --end
	--return 0
end

--**********************************
--�ύ
--**********************************
function x910008_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x910008_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x910008_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in x910008_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
		--	AddMoney(sceneId,selfId,x910008_g_MoneyBonus );
			--�۳�������Ʒ
			for i, item in x910008_g_DemandItem do
				DelItem( sceneId, selfId, item.id, item.num )
			end
			ret = DelMission( sceneId, selfId, x910008_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x910008_g_MissionId )
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
function x910008_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x910008_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910008_OnItemChanged( sceneId, selfId, itemdataId )
end
