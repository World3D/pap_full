--��������

--��ľ��2�ܱ�

--MisDescBegin

--�ű���

x910010_g_ScriptId = 910010



--��һ�������ID

--g_MissionIdPre =



--�����

x910010_g_MissionId = 910



--����Ŀ��npc

x910010_g_Name	="��ľ��" 



--�������

x910010_g_MissionKind = 1



--����ȼ�

x910010_g_MissionLevel = 1



--�Ƿ��Ǿ�Ӣ����

x910010_g_IfMissionElite = 0



--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--�����Ƿ��Ѿ����

x910010_g_IsMissionOkFail = 0		--�����ĵ�0λ



--������Ҫɱ���Ĺ�

--x910010_g_DemandKill ={{id=500,num=5}}		--������1λ



--�����Ƕ�̬**************************************************************



--�����ı�����

x910010_g_MissionName="�������ּ��"

x910010_g_MissionInfo="ȥ����ǰ�ߵ��ܱ��ⳡս�ۣ���Ҫ�÷����ؾ�֪�����ɹ���ʿ����Ѫ�����ܱ�����ԭ�ص�����һ�����֮ǰ���������"  --��������

x910010_g_MissionTarget="����ľ���������߷���Ұ����ܱ�"		--����Ŀ��

x910010_g_ContinueInfo="�����������ܱ�ȥ����������ĥ���ˣ���������ή�����㣡"		--δ����������ľ���npc�Ի�

x910010_g_TargetContinueInfo="��������ǰ��ȥɱ�а����ҵĹ��������������У�����ս������"		--���ܱ�ĶԻ�

x910010_g_MissionComplete="��Ȼԭ����ľ������ô��ģ����Ҿ���ԭ�ش��������ˣ�лл������󺹵Ŀ��ţ����ŷ����͸���ɣ�"					--�������ʱ���˵���Ļ�



--������

--x910010_g_MoneyBonus=100

x910010_g_ItemBonus={{id=30501003,num=1}}

--x910010_g_RadioItemBonus={}



--MisDescEnd

--**********************************

--������ں���

--**********************************

function x910010_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��

    --if IsMissionHaveDone(sceneId,selfId,x910010_g_MissionId) > 0 then

	--	return

	--end

	--����ѽӴ�����

	if IsHaveMission(sceneId,selfId,x910010_g_MissionId) > 0 then

		--���������������Ϣ

		BeginEvent(sceneId)

			AddText(sceneId,x910010_g_MissionName)
			if (GetName(sceneId,targetId)==x910010_g_Name) then
				AddText(sceneId,x910010_g_ContinueInfo)
			else
				AddText(sceneId,x910010_g_TargetContinueInfo)
			end
			--for i, item in pairs(g_DemandItem) do

			--	AddItemDemand( sceneId, item.id, item.num )

			--end

		EndEvent( )

		bDone = CallScriptFunction( 900003, "SongxinCheck",sceneId, selfId, targetId )

		DispatchMissionDemandInfo(sceneId,selfId,targetId,x910010_g_ScriptId,x910010_g_MissionId,bDone)

	--���������������

	elseif x910010_CheckAccept(sceneId,selfId) > 0 then

		--�����������ʱ��ʾ����Ϣ

		BeginEvent(sceneId)

			AddText(sceneId,x910010_g_MissionName)

			AddText(sceneId,x910010_g_MissionInfo)

			AddText(sceneId,"#{M_MUBIAO}")

			AddText(sceneId,x910010_g_MissionTarget)

			--AddMoneyBonus( sceneId, x910010_g_MoneyBonus )

			for i, item in pairs(x910010_g_ItemBonus) do

				AddItemBonus( sceneId, item.id, item.num )

			end

			--for i, item in pairs(x910010_g_RadioItemBonus) do

				--AddRadioItemBonus( sceneId, item.id, item.num )

			--end

		EndEvent( )

		DispatchMissionInfo(sceneId,selfId,targetId,x910010_g_ScriptId,x910010_g_MissionId)

	end

end



--**********************************

--�о��¼�

--**********************************

function x910010_OnEnumerate( sceneId, selfId, targetId )
	    --��������ɹ��������
	    if IsMissionHaveDone(sceneId,selfId,x910010_g_MissionId) > 0 then
	    	return 
		end
	    --����ѽӴ�����
	    --else
	    if IsHaveMission(sceneId,selfId,x910010_g_MissionId) > 0 then
			
				AddNumText(sceneId,x910010_g_ScriptId,x910010_g_MissionName);
	
	    --���������������
	
	    elseif x910010_CheckAccept(sceneId,selfId,targetId) > 0 then
	
			AddNumText(sceneId,x910010_g_ScriptId,x910010_g_MissionName);
	
	    end
end



--**********************************

--����������

--**********************************

function x910010_CheckAccept( sceneId, selfId,targetId )

	--��Ҫ1�����ܽ�

	if GetLevel( sceneId, selfId ) >= 1 then
		if (GetName(sceneId,targetId)==x910010_g_Name) then
			return 1
		else
			return 0
		end
	else

		return 0

	end

end



--**********************************

--����

--**********************************

function x910010_OnAccept( sceneId, selfId )

	--������������б�

	AddMission( sceneId,selfId, x910010_g_MissionId, x910010_g_ScriptId, 1, 0, 0 )		--�������

	misIndex = GetMissionIndexByID(sceneId,selfId,x910010_g_MissionId)			--�õ���������к�

	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0

	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0

end



--**********************************

--����

--**********************************

function x910010_OnAbandon( sceneId, selfId )

	--ɾ����������б��ж�Ӧ������

    DelMission( sceneId, selfId, x910010_g_MissionId )

end



--**********************************

--����

--**********************************

function x910010_OnContinue( sceneId, selfId, targetId )

	--�ύ����ʱ��˵����Ϣ

    BeginEvent(sceneId)

		AddText(sceneId,x910010_g_MissionName)

		AddText(sceneId,x910010_g_MissionComplete)

		--AddMoneyBonus( sceneId, x910010_g_MoneyBonus )

		for i, item in pairs(x910010_g_ItemBonus) do

			AddItemBonus( sceneId, item.id, item.num )

		end

		--for i, item in pairs(x910010_g_RadioItemBonus) do

			--AddRadioItemBonus( sceneId, item.id, item.num )

		--end

    EndEvent( )

    DispatchMissionContinueInfo(sceneId,selfId,targetId,x910010_g_ScriptId,x910010_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x910010_CheckSubmit( sceneId, selfId, targetId)
	CallScriptFunction( 900003, "SongxinCheck",sceneId, selfId, targetId )
end



--**********************************

--�ύ

--**********************************

function x910010_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	if CallScriptFunction( 900003, "SongxinCheck",sceneId, selfId, targetId )==1 then

    	BeginAddItem(sceneId)

			for i, item in pairs(x910010_g_ItemBonus) do

				AddItem( sceneId,item.id, item.num )

			end

			--for i, item in pairs(x910010_g_RadioItemBonus) do

				--if item.id == selectRadioId then

					--AddItem( sceneId,item.id, item.num )

				--end

			--end

		ret = EndAddItem(sceneId,selfId)

		--���������

		if ret > 0 then

			--AddMoney(sceneId,selfId,x910010_g_MoneyBonus );

			--�۳�������Ʒ

			--for i, item in pairs(g_DemandItem) do

			--	DelItem( sceneId, selfId, item.id, item.num )

			--end

			ret = DelMission( sceneId, selfId, x910010_g_MissionId )

			if ret > 0 then

				MissionCom( sceneId,selfId, x910010_g_MissionId )

				AddItemListToHuman(sceneId,selfId)
				LuaFnAddExp( sceneId, selfId,10)

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

function x910010_OnKillObject( sceneId, selfId, objdataId )

end



--**********************************

--���������¼�

--**********************************

function x910010_OnEnterArea( sceneId, selfId, zoneId )

end



--**********************************

--���߸ı�

--**********************************

function x910010_OnItemChanged( sceneId, selfId, itemdataId )

end

