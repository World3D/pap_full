--����ս����

--MisDescBegin
x203009_g_ScriptId = 203009
--x203009_g_MissionIdPre =72
x203009_g_MissionId = 77
x203009_g_MissionKind = 13
x203009_g_MissionLevel = 50
x203009_g_ScriptIdNext = {ScriptId = 203010 ,LV = 1 }
x203009_g_Name	="�ܱ�" 
x203009_g_Name2	="�ٲ�̨" 
x203009_g_DemandItem ={}
x203009_g_DemandKill ={{id=329,num=10},{id=328,num=10}}

x203009_g_MissionName="����ս����"
x203009_g_MissionInfo="     �ɼ�˼�����˾��ץ����ħڭħ���Һ��ٲ�̨�Ͳ��ûش��ԭ�����ǿ�����Ҫð�����ˡ�\n \n    ��ƥ��������ս���бز����ٵģ�����Ҫ���������֡������ڵ�������������Ǿ��ӵ���ǣ���Ҫȥɱ�����ǵľ���˳·�����Ҳɱ�˰ɣ����Ƕ�����û���ã�Ȼ��ȥ��#G�ٲ�̨#W�������������һ������ô����"  --��������
x203009_g_MissionTarget="    ɱ��10ƥ#R������ģս��#W��10��#R������ģ���#W��Ȼ����#G�ٲ�̨#W��һ����ʲô��"		                                                                                               
x203009_g_MissionComplete="    ��������������޷�����ս�����ˡ�"					--�������npc˵���Ļ�
x203009_g_ContinueInfo="    �ҵ����ǵ��������"
--������
x203009_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203009_g_RadioItemBonus={}

--MisDescEnd
x203009_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203009_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x203009_g_MissionId)
		if x203009_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x203009_g_MissionName)
			AddText(sceneId,x203009_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x203009_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ģս��   %d/%d\n    ɱ��������ģ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203009_g_DemandKill[1].num, GetMissionParam(sceneId,selfId,misIndex,1),x203009_g_DemandKill[2].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x203009_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203009_g_MissionName)
		     AddText(sceneId,x203009_g_MissionComplete)
		     AddMoneyBonus(sceneId, x203009_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203009_g_ScriptId, x203009_g_MissionId)
                end

        elseif x203009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203009_g_MissionName)
                AddText(sceneId,x203009_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203009_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203009_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203009_g_ScriptId, x203009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203009_g_ScriptId, x203009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203009_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==3) then
		if (GetName(sceneId,targetId)==x203009_g_Name) then 
			if IsHaveMission(sceneId,selfId, x203009_g_MissionId) <= 0 then
		    		return 1
		    	end
		end
		if (GetName(sceneId,targetId)==x203009_g_Name2) then 
			if IsHaveMission(sceneId,selfId, x203009_g_MissionId) > 0 then
		    		return 1
		    	end
		end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203009_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x203009_g_MissionId, x203009_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x203009_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x203009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203009_g_MissionId)
	for i, item in x203009_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203009_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203009_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x203009_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == x203009_g_DemandKill[2].num then
	        	return 1
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203009_g_MissionId)
		AddExp(sceneId, selfId, x203009_g_ExpBonus)
		AddMoney(sceneId, selfId, x203009_g_MoneyBonus)
		for i, item in x203009_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x203009_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x203009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203009_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203009_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x203009_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x203009_g_DemandKill[1].id then 
       		    if num < x203009_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ģս��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203009_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
        num2 = GetMissionParam(sceneId,selfId,misIndex,1) 
	 	 if objdataId == x203009_g_DemandKill[2].id then 
       		    if num2 < x203009_g_DemandKill[2].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num2+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ģ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x203009_g_DemandKill[2].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
      end  

end



--**********************************

--���������¼�

--**********************************

function x203009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203009_OnItemChanged(sceneId, selfId, itemdataId)

end

