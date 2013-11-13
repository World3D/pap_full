--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x910003_g_ScriptId = 910003

--��һ�������ID
x910003_g_MisIdPre = 902

--�����,9��ͷ����Ϊ������������ID
x910003_g_MissionId = 903

--����Ŀ��npc
x910003_g_Name	="�ٲ�̨" 

--�������
x910003_g_MissionKind = 1

--����ȼ�
x910003_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x910003_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x910003_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫɱ���Ĺ�
x910003_g_DemandKill ={{id=1003,num=20}}		--������1λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x910003_g_MissionName="�ý������"
x910003_g_MissionInfo="������ɹ������𣬲��������������һǰȥɱ��20�����ʿ���������Ǵ����ﺦ�����ɹŹ���"  --��������
x910003_g_MissionTarget="ɱ��20�����"		--����Ŀ��
x910003_g_ContinueInfo="���Ѿ�ɱ��20�������"		--δ��������npc�Ի�
x910003_g_MissionComplete="���ֻ����ͳһ�ɹţ��ư�����ĵ�һ�����ѡ�"					--�������npc˵���Ļ�

--������
--x910003_g_MoneyBonus=100
x910003_g_ItemBonus={}
x910003_g_RadioItemBonus={}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910003_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x910003_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x910003_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910003_g_MissionName)
			AddText(sceneId,x910003_g_ContinueInfo)
			--for i, item in pairs(g_DemandItem) do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
		EndEvent( )
		bDone = x910003_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x910003_g_ScriptId,x910003_g_MissionId,bDone)
	--���������������
	elseif x910003_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x910003_g_MissionName)
			AddText(sceneId,x910003_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x910003_g_MissionTarget)
			AddMoneyBonus( sceneId, x910003_g_MoneyBonus )
			for i, item in pairs(x910003_g_ItemBonus) do
				AddItemBonus( sceneId, item.id, item.num )
			end
			for i, item in pairs(x910003_g_RadioItemBonus) do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x910003_g_ScriptId,x910003_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x910003_OnEnumerate( sceneId, selfId, targetId )

    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x910003_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x910003_g_MissionId) > 0 then
		AddNumText(sceneId,x910003_g_ScriptId,x910003_g_MissionName);
    --���������������
    elseif x910003_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x910003_g_ScriptId,x910003_g_MissionName);
    end
end

--**********************************
--����������
--**********************************
function x910003_CheckAccept( sceneId, selfId )

	if IsMissionHaveDone(sceneId,selfId,x910003_g_MisIdPre) > 0 then
    	return 1
 	else
   		return 0	
	end
end

--**********************************
--����
--**********************************
function x910003_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x910003_g_MissionId, x910003_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x910003_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
end

--**********************************
--����
--**********************************
function x910003_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x910003_g_MissionId )
end

--**********************************
--����
--**********************************
function x910003_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x910003_g_MissionName)
		AddText(sceneId,x910003_g_MissionComplete)
		AddMoneyBonus( sceneId, x910003_g_MoneyBonus )
		for i, item in pairs(x910003_g_ItemBonus) do
			AddItemBonus( sceneId, item.id, item.num )
		end
		for i, item in pairs(x910003_g_RadioItemBonus) do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910003_g_ScriptId,x910003_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910003_CheckSubmit( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x910003_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x910003_g_DemandKill[1].num then
       return 1
    end
	return 0
end

--**********************************
--�ύ
--**********************************
function x910003_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x910003_CheckSubmit( sceneId, selfId, selectRadioId ) then
    	BeginAddItem(sceneId)
		--	for i, item in pairs(x910003_g_ItemBonus) do
		--		AddItem( sceneId,item.id, item.num )
		--	end
		--	for i, item in pairs(x910003_g_RadioItemBonus) do
		--		if item.id == selectRadioId then
		--			AddItem( sceneId,item.id, item.num )
		--		end
		--	end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			AddMoney(sceneId,selfId,x910003_g_MoneyBonus );
			--�۳�������Ʒ
			--for i, item in pairs(g_DemandItem) do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x910003_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x910003_g_MissionId )
				--AddItemListToHuman(sceneId,selfId)
				LuaFnAddExp( sceneId, selfId,150)
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
function x910003_OnKillObject( sceneId, selfId, objdataId )

 if objdataId == x910003_g_DemandKill[1].id then
	  misIndex = GetMissionIndexByID(sceneId,selfId,x910003_g_MissionId)
	  num = GetMissionParam(sceneId,selfId,misIndex,1)
	  if num < x910003_g_DemandKill[1].num then
		--��������ɱ�־����Ϊ1
		if num == x910003_g_DemandKill[1].num - 1 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		--���ô������+1
	    SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
	  	BeginEvent(sceneId)
	  	strText = format("��ɱ�����%d/20", GetMissionParam(sceneId,selfId,misIndex,1) )
	  	AddText(sceneId,strText);
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	  end
 end
 
end

--**********************************
--���������¼�
--**********************************
function x910003_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910003_OnItemChanged( sceneId, selfId, itemdataId )
end
