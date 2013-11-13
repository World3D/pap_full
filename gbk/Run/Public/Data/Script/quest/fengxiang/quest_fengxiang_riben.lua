--ɱ������
--�ձ�ʿ��
--MisDescBegin
--�ű���
x910000_g_ScriptId = 910000

--��һ�������ID
--g_MissionIdPre =

--�����,9��ͷ����Ϊ������������ID
x910000_g_MissionId = 900

--����Ŀ��npc
x910000_g_Name	="�ٲ�̨" 

--�������
x910000_g_MissionKind = 1

--����ȼ�
x910000_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x910000_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x910000_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x910000_g_DemandKill ={{id=1000,num=10}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x910000_g_MissionName="�����ձ���"
x910000_g_MissionInfo="��η���֮ս����֪������ð����һЩ�ձ�����������֡����Ҵ��ɹŹ�����ʿ����������Щ���ˣ��Ӿ��ǰȥ����10���ձ��������ҹ�����"  --��������
x910000_g_MissionTarget="ɱ��10���ձ���"		--����Ŀ��
x910000_g_ContinueInfo="���Ѿ�ɱ��10���ձ������𣿿ɲ�������Щ����С�������ɹ���ʿ��"		--δ��������npc�Ի�
x910000_g_MissionComplete="��������֮�ص�С�ձ������ɹŹ�����������������Ǻ����ģ���Щ���������š�"					--�������npc˵���Ļ�

--������
--x910000_g_MoneyBonus=100
--x910000_g_ItemBonus={{id=30001001,num=5}}
x910000_g_RadioItemBonus={{id=30001001,num=5},{id=30002001,num=5}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910000_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5)	--����������ִ�д˽ű�
	
	
	
	
	local Day = GetDayTime()
	local Time = LuaFnGetCurrentTime()
	StartupSystemTimer( sceneId, actId )
	if actId==1 then
	else
		SetSystemTimerTick( sceneId,910000,"OnTimer",actId, 3000 )	
	end	
end

function x910000_OnTimer( sceneId, actId, uTime )
	local Day = GetDayTime()
	local Time = LuaFnGetCurrentTime()
end





--**********************************
--�о��¼�
--**********************************
function x910000_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x910000_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x910000_g_MissionId) > 0 then
		AddNumText(sceneId,x910000_g_ScriptId,x910000_g_MissionName);
    --���������������
    elseif x910000_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x910000_g_ScriptId,x910000_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x910000_CheckAccept( sceneId, selfId )
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
function x910000_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x910000_g_MissionId, x910000_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x910000_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x910000_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x910000_g_MissionId )
end

--**********************************
--����
--**********************************
function x910000_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x910000_g_MissionName)
		AddText(sceneId,x910000_g_MissionComplete)
		--AddMoneyBonus( sceneId, x910000_g_MoneyBonus )
		--for i, item in pairs(x910000_g_ItemBonus) do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		for i, item in pairs(x910000_g_RadioItemBonus) do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910000_g_ScriptId,x910000_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910000_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x910000_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x910000_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x910000_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x910000_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			--for i, item in pairs(x910000_g_ItemBonus) do
			--	AddItem( sceneId,item.id, item.num )
			--end
			for i, item in pairs(x910000_g_RadioItemBonus) do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			--AddMoney(sceneId,selfId,x910000_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in pairs(g_DemandItem) do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x910000_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x910000_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				LuaFnAddExp( sceneId, selfId,25)
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
function x910000_OnKillObject( sceneId, selfId, objdataId )

 if objdataId == x910000_g_DemandKill[1].id then
	  misIndex = GetMissionIndexByID(sceneId,selfId,x910000_g_MissionId)
	  num = GetMissionParam(sceneId,selfId,misIndex,1)
	  if num < x910000_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x910000_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
	    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  	BeginEvent(sceneId)
	  	strText = format("��ɱ���ձ���%d/10", GetMissionParam(sceneId,selfId,misIndex,1) )
	  	AddText(sceneId,strText);
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	  end
 end
 
end

--**********************************
--���������¼�
--**********************************
function x910000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910000_OnItemChanged( sceneId, selfId, itemdataId )
end
