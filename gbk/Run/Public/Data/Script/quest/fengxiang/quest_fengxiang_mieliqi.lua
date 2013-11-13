--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x910001_g_ScriptId = 910001

--��һ�������ID
x910001_g_MisIdPre = 900

--�����,9��ͷ����Ϊ������������ID
x910001_g_MissionId = 901

--����Ŀ��npc
x910001_g_Name	="�ٲ�̨" 

--�������
x910001_g_MissionKind = 1

--����ȼ�
x910001_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x910001_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x910001_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x910001_g_DemandKill ={{id=1001,num=15}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x910001_g_MissionName="�ַ�������"
x910001_g_MissionInfo="�����������������ҵ��ö���ȥ���ҷ���Ҫ�������������壡"  --��������
x910001_g_MissionTarget="ɱ��15���������"		--����Ŀ��
x910001_g_ContinueInfo="���Ѿ�ɱ��15�����������"		--δ��������npc�Ի�
x910001_g_MissionComplete="�ҷ���Ҫ�������������壡�ҷ��ģ�����"					--�������npc˵���Ļ�

--������
--x910001_g_MoneyBonus=100
x910001_g_ItemBonus={{id=30001001,num=5},{id=30002001,num=5}}
x910001_g_RadioItemBonus={}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910001_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x910001_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x910001_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910001_g_MissionName)
			AddText(sceneId,x910001_g_ContinueInfo)
			--for i, item in pairs(g_DemandItem) do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
		EndEvent( )
		bDone = x910001_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x910001_g_ScriptId,x910001_g_MissionId,bDone)
	--���������������
	elseif x910001_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910001_g_MissionName)
			AddText(sceneId,x910001_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x910001_g_MissionTarget)
			AddMoneyBonus( sceneId, x910001_g_MoneyBonus )
			for i, item in pairs(x910001_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in pairs(x910001_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x910001_g_ScriptId,x910001_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x910001_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x910001_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x910001_g_MissionId) > 0 then
		AddNumText(sceneId,x910001_g_ScriptId,x910001_g_MissionName);
    --���������������
    elseif x910001_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x910001_g_ScriptId,x910001_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x910001_CheckAccept( sceneId, selfId )

	if IsMissionHaveDone(sceneId,selfId,x910001_g_MisIdPre) > 0 then
    	return 1
    else
 	  	return 0	
	end
end

--**********************************
--����
--**********************************
function x910001_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x910001_g_MissionId, x910001_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x910001_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x910001_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x910001_g_MissionId )
end

--**********************************
--����
--**********************************
function x910001_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x910001_g_MissionName)
		AddText(sceneId,x910001_g_MissionComplete)
		AddMoneyBonus( sceneId, x910001_g_MoneyBonus )
		for i, item in pairs(x910001_g_ItemBonus) do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in pairs(x910001_g_RadioItemBonus) do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910001_g_ScriptId,x910001_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910001_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x910001_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x910001_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x910001_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x910001_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in pairs(x910001_g_ItemBonus) do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in pairs(x910001_g_RadioItemBonus) do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x910001_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in pairs(g_DemandItem) do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x910001_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x910001_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				LuaFnAddExp( sceneId, selfId,50)
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
function x910001_OnKillObject( sceneId, selfId, objdataId )

 if objdataId == x910001_g_DemandKill[1].id then
	  misIndex = GetMissionIndexByID(sceneId,selfId,x910001_g_MissionId)
	  num = GetMissionParam(sceneId,selfId,misIndex,1)
	  if num < x910001_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x910001_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
	    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  	BeginEvent(sceneId)
	  	strText = format("��ɱ���������%d/15", GetMissionParam(sceneId,selfId,misIndex,1) )
	  	AddText(sceneId,strText);
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	  end
 end
 
end

--**********************************
--���������¼�
--**********************************
function x910001_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910001_OnItemChanged( sceneId, selfId, itemdataId )
end
