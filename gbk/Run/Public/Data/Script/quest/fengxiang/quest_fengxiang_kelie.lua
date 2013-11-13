--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x910002_g_ScriptId = 910002

--��һ�������ID
x910002_g_MisIdPre = 901

--�����,9��ͷ����Ϊ������������ID
x910002_g_MissionId = 902

--����Ŀ��npc
x910002_g_Name	="�ٲ�̨" 

--�������
x910002_g_MissionKind = 1

--����ȼ�
x910002_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x910002_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x910002_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x910002_g_DemandKill ={{id=1002,num=20}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x910002_g_MissionName="�븸������"
x910002_g_MissionInfo="��Ȼ�������ҵĸ����������κ��赲��ͳһ�ɹŵ�ʯͷ���Ҷ�Ҫ��������"  --��������
x910002_g_MissionTarget="ɱ��20�����ұ�"		--����Ŀ��
x910002_g_ContinueInfo="���Ѿ�ɱ��20�����ұ���"		--δ��������npc�Ի�
x910002_g_MissionComplete="Ϊ���ɹ�ͳһ����ʹ����Ը�������Ҳ����������"					--�������npc˵���Ļ�

--������
--x910002_g_MoneyBonus=100
x910002_g_ItemBonus={}
x910002_g_RadioItemBonus={{id=10401001,num=1},{id=10403001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910002_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x910002_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x910002_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910002_g_MissionName)
			AddText(sceneId,x910002_g_ContinueInfo)
			--for i, item in pairs(g_DemandItem) do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
		EndEvent( )
		bDone = x910002_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x910002_g_ScriptId,x910002_g_MissionId,bDone)
	--���������������
	elseif x910002_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910002_g_MissionName)
			AddText(sceneId,x910002_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x910002_g_MissionTarget)
			AddMoneyBonus( sceneId, x910002_g_MoneyBonus )
			for i, item in pairs(x910002_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in pairs(x910002_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x910002_g_ScriptId,x910002_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x910002_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x910002_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x910002_g_MissionId) > 0 then
		AddNumText(sceneId,x910002_g_ScriptId,x910002_g_MissionName);
    --���������������
    elseif x910002_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x910002_g_ScriptId,x910002_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x910002_CheckAccept( sceneId, selfId )

	if IsMissionHaveDone(sceneId,selfId,x910002_g_MisIdPre) > 0 then
	   	return 1
	 else
    	return 0	
	end
end

--**********************************
--����
--**********************************
function x910002_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x910002_g_MissionId, x910002_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x910002_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x910002_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x910002_g_MissionId )
end

--**********************************
--����
--**********************************
function x910002_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x910002_g_MissionName)
		AddText(sceneId,x910002_g_MissionComplete)
		AddMoneyBonus( sceneId, x910002_g_MoneyBonus )
		for i, item in pairs(x910002_g_ItemBonus) do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in pairs(x910002_g_RadioItemBonus) do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910002_g_ScriptId,x910002_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910002_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x910002_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x910002_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x910002_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x910002_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
			for i, item in pairs(x910002_g_ItemBonus) do
				AddItem( sceneId,item.id, item.num )
			end
			for i, item in pairs(x910002_g_RadioItemBonus) do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x910002_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in pairs(g_DemandItem) do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x910002_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x910002_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				LuaFnAddExp( sceneId, selfId,100)
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
function x910002_OnKillObject( sceneId, selfId, objdataId )

 if objdataId == x910002_g_DemandKill[1].id then
	  misIndex = GetMissionIndexByID(sceneId,selfId,x910002_g_MissionId)
	  num = GetMissionParam(sceneId,selfId,misIndex,1)
	  if num < x910002_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x910002_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
	    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  	BeginEvent(sceneId)
	  	strText = format("��ɱ�����ұ�%d/20", GetMissionParam(sceneId,selfId,misIndex,1) )
	  	AddText(sceneId,strText);
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	  end
 end
 
end

--**********************************
--���������¼�
--**********************************
function x910002_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910002_OnItemChanged( sceneId, selfId, itemdataId )
end
