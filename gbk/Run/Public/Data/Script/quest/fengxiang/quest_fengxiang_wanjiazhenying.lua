--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x910020_g_ScriptId = 910020

--��һ�������ID
--g_MissionIdPre =

--�����,9��ͷ����Ϊ������������ID
x910020_g_MissionId = 905

--����Ŀ��npc
x910020_g_Name	="�ٲ�̨" 

--�������
x910020_g_MissionKind = 1

--����ȼ�
x910020_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x910020_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x910020_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x910020_g_DemandKill ={{id=80,num=10}}		--������1λ

--ѡ�����ɶ�Ӧ��������ť
x910020_g_eventList={}	

--�����Ƕ�̬**************************************************************

--�����ı�����

x910020_g_MissionName="�任�����Ӫ"
x910020_g_ZhiyeName={"սʿ","��ʿ","��ʦ"}


x910020_g_MissionInfo="ɱ��10�����ʿ��"  --��������
x910020_g_MissionTarget="ɱ��10�����ʿ��"		--����Ŀ��
x910020_g_ContinueInfo="���Ѿ�ɱ��10�����ʿ����"		--δ��������npc�Ի�
x910020_g_MissionComplete="�ɵò���"					--�������npc˵���Ļ�

--������
x910020_g_MoneyBonus=100
x910020_g_ItemBonus={{id=30001001,num=5}}
x910020_g_RadioItemBonus={{id=30001002,num=5},{id=30001003,num=5}}
x910020_g_ZhiYeItemBonus1={{id=12010001,num=20},{id=12040001,num=10},{id=12040002,num=10},{id=12040003,num=10},{id=12040004,num=10},{id=12040005,num=10},{id=12040006,num=10},{id=12040007,num=10}}
x910020_g_ZhiYeItemBonus2={{id=12040008,num=10},{id=12040009,num=10},{id=10010001,num=1},{id=10070001,num=1},{id=10200001,num=1},{id=10210001,num=1},{id=10220001,num=1},{id=10230001,num=1}}
x910020_g_ZhiYeItemBonus3={{id=10240001,num=1},{id=10250001,num=1},{id=10260001,num=1},{id=10270001,num=1},{id=10280001,num=1},{id=10290001,num=1},{id=12050001,num=1},{id=10010002,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910020_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
		
	SetCurCamp(sceneId, selfId, 0)
			
end

--**********************************
--�о��¼�
--**********************************
function x910020_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x910020_g_ScriptId,x910020_g_MissionName);
end

--**********************************
--�о�����
--**********************************
function x910020_OnEnumerateZhiye( sceneId, selfId, targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"����������ְҵ����ѡ����Ҳ������ʱ�����Ҹ���ְҵ��")
	for i, eventId in x910020_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--����������
--**********************************
function x910020_CheckAccept( sceneId, selfId )
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
function x910020_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x910020_g_MissionId, x910020_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x910020_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x910020_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x910020_g_MissionId )
end

--**********************************
--����
--**********************************
function x910020_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x910020_g_MissionName)
		AddText(sceneId,x910020_g_MissionComplete)
		AddMoneyBonus( sceneId, x910020_g_MoneyBonus )
		for i, item in x910020_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in x910020_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910020_g_ScriptId,x910020_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910020_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x910020_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x910020_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x910020_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x910020_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in x910020_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in x910020_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x910020_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x910020_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x910020_g_MissionId )
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
function x910020_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x910020_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910020_OnItemChanged( sceneId, selfId, itemdataId )
end
