--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x910015_g_ScriptId = 910015

--��һ�������ID
--g_MissionIdPre =

--�����,9��ͷ����Ϊ������������ID
x910015_g_MissionId = 905

--����Ŀ��npc
x910015_g_Name	="�ٲ�̨" 

--�������
x910015_g_MissionKind = 1

--����ȼ�
x910015_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x910015_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x910015_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x910015_g_DemandKill ={{id=80,num=10}}		--������1λ

--ѡ�����ɶ�Ӧ��������ť
x910015_g_eventList={910012,910013,910014}	

--�����Ƕ�̬**************************************************************

--�����ı�����
x910015_g_MissionName="ѡ��ְҵ"
x910015_g_ZhiyeName={"սʿ","��ʿ","��ʦ"}


x910015_g_MissionInfo="ɱ��10�����ʿ��"  --��������
x910015_g_MissionTarget="ɱ��10�����ʿ��"		--����Ŀ��
x910015_g_ContinueInfo="���Ѿ�ɱ��10�����ʿ����"		--δ��������npc�Ի�
x910015_g_MissionComplete="�ɵò���"					--�������npc˵���Ļ�

--������
x910015_g_MoneyBonus=100
x910015_g_ItemBonus={{id=30001001,num=5}}
x910015_g_RadioItemBonus={{id=30001002,num=5},{id=30001003,num=5}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910015_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	x910015_UpdateEventList( sceneId, selfId, targetId )
end


function x910015_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"��ѡ����Ҫ��ְҵ")
	for i, eventId in pairs(x910015_g_eventList) do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x910015_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in pairs(x910015_g_eventList) do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x910015_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x910015_g_ScriptId,x910015_g_MissionName);
end

--**********************************
--�о�����
--**********************************
function x910015_OnEnumerateZhiye( sceneId, selfId, targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"����������ְҵ����ѡ����Ҳ������ʱ�����Ҹ���ְҵ��")
	for i, eventId in pairs(x910015_g_eventList) do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--����������
--**********************************
function x910015_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x910015_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x910015_g_MissionId, x910015_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x910015_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x910015_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x910015_g_MissionId )
end

--**********************************
--����
--**********************************
function x910015_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x910015_g_MissionName)
		AddText(sceneId,x910015_g_MissionComplete)
		AddMoneyBonus( sceneId, x910015_g_MoneyBonus )
		for i, item in pairs(x910015_g_ItemBonus) do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in pairs(x910015_g_RadioItemBonus) do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910015_g_ScriptId,x910015_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910015_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x910015_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x910015_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x910015_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x910015_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in pairs(x910015_g_ItemBonus) do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in pairs(x910015_g_RadioItemBonus) do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x910015_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in pairs(g_DemandItem) do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x910015_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x910015_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
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
function x910015_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x910015_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910015_OnItemChanged( sceneId, selfId, itemdataId )
end
