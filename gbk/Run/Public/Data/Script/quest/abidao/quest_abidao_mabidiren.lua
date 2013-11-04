--��Ե���

--MisDescBegin
x203005_g_ScriptId = 203005
x203005_g_MissionIdPre =72
x203005_g_MissionId = 73
x203005_g_MissionKind = 13
x203005_g_MissionLevel = 50
--x203005_g_ScriptIdNext = {ScriptId = 208009 ,LV = 1 }
x203005_g_Name	="����" 
x203005_g_DemandItem ={}
x203005_g_DemandKill ={{id=325,num=2},{id=326,num=2}}

x203005_g_MissionName="��Ե���"
x203005_g_MissionInfo="     �ҵļƲ߳ɹ��ˣ��ܱ���ٲ�̨��ɱ�����ǵ�ҽ�������ڣ����ǿ�ʼ���ˡ���\n \n    �⼸�죬������к����Խ��Խ�࣬����Ħڭĩ����Ҳ���˰Ͷ��Ķ�����Ϊкҩ��Ե�ʣ��Ѿ����ѵĲ�ʡ���¡�\n \n    �嶯�����������Ӻ���Щִ���Ĵ���Ϊ������Ȩ����ì��Խ��Խ�\n \n    ������Ҫ���������߷�һ�ѻ������������ɱ�����Ѿ��ѻƽ�װ�׸����˻�����ֻҪװ��ɻƽ�����������������#R�׽���������#W��ɱ����Ȼ������ͬ���ķ���ɱ��#R�׽���������#W�� "  --��������
x203005_g_MissionTarget="    �����2��#R�ƽ���������#W��2��#R�׽���������#W���ٻ�����#G����#W"		                                                                                               
x203005_g_MissionComplete="    �ɼ�˼��������ս���Žǻ����������ܾ��˵�ʱ���죡"					--�������npc˵���Ļ�
x203005_g_ContinueInfo="    һ��Ҫ�����ж�����¶����š�"
--������
x203005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203005_g_RadioItemBonus={}

--MisDescEnd
x203005_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203005_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x203005_g_MissionId)
		if x203005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x203005_g_MissionName)
			AddText(sceneId,x203005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x203005_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���ƽ���������   %d/%d\n    ɱ���׽���������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203005_g_DemandKill[1].num, GetMissionParam(sceneId,selfId,misIndex,1),x203005_g_DemandKill[2].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x203005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203005_g_MissionName)
		     AddText(sceneId,x203005_g_MissionComplete)
		     AddMoneyBonus(sceneId, x203005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203005_g_ScriptId, x203005_g_MissionId)
                end

        elseif x203005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203005_g_MissionName)
                AddText(sceneId,x203005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203005_g_ScriptId, x203005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203005_g_ScriptId, x203005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203005_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==3) then
		if IsMissionHaveDone(sceneId, selfId, x203005_g_MissionIdPre) > 0 then
		    	return 1
		end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203005_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x203005_g_MissionId, x203005_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x203005_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x203005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203005_g_MissionId)
	for i, item in x203005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203005_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x203005_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == x203005_g_DemandKill[2].num then
	        	return 1
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203005_g_MissionId)
		AddExp(sceneId, selfId, x203005_g_ExpBonus)
		AddMoney(sceneId, selfId, x203005_g_MoneyBonus)
		for i, item in x203005_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x203005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x203005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203005_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x203005_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x203005_g_DemandKill[1].id then 
       		    if num < x203005_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ƽ���������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203005_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
        num2 = GetMissionParam(sceneId,selfId,misIndex,1) 
	 	 if objdataId == x203005_g_DemandKill[2].id then 
       		    if num2 < x203005_g_DemandKill[2].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num2+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���׽���������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x203005_g_DemandKill[2].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
      end  

end



--**********************************

--���������¼�

--**********************************

function x203005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203005_OnItemChanged(sceneId, selfId, itemdataId)

end

