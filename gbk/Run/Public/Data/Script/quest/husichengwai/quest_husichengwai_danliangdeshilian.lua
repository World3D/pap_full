--����������

--MisDescBegin
x204007_g_ScriptId = 204007
--x204007_g_MissionIdPre =41
x204007_g_MissionId = 102
x204007_g_MissionKind = 9
x204007_g_MissionLevel = 45
--x204007_g_ScriptIdNext = {ScriptId = 204001 ,LV = 1 }
x204007_g_Name	="�ܱ�" 
x204007_g_DemandItem ={}
x204007_g_DemandKill ={{id=351,num=5},{id=352,num=5},{id=353,num=5}}

x204007_g_MissionName="����������"
x204007_g_MissionInfo="    ���ɵ���Щ������ʿ�ǣ������Ǵ��ԭ����ʿһ��������ǿ�������¡��ý������������������ǣ��Ҿ������˸�����ս��������龰����\n \n    <�ܱ���Զ����ս�𣬲�мһ�˵�˵>�Ǳߵ�������ʿ�������ɵľ��������ǵĹ�������������һ���ĺݶ���������Щ�������ʦ���ڰ�������ʩ����"  --��������
x204007_g_MissionInfo2="������е����������ǵ�����ȡ����"
x204007_g_MissionTarget="    #G�ܱ�#WҪ��ȡ5��#R����������#W��5��#R��������#W��5��#R������ʦ#W��������"		                                                                                               
x204007_g_MissionComplete="    ����¸ң���Ϊ����ˡ�"					--�������npc˵���Ļ�
x204007_g_ContinueInfo="    ��������������"
--������
x204007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204007_g_RadioItemBonus={}

--MisDescEnd
x204007_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x204007_g_MissionId)
		if x204007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204007_g_MissionName)
			AddText(sceneId,x204007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204007_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������������   %d/5\n    ɱ����������   %d/5\n    ɱ��������ʦ   %d/5", GetMissionParam(sceneId,selfId,misIndex,0), GetMissionParam(sceneId,selfId,misIndex,1), GetMissionParam(sceneId,selfId,misIndex,2) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204007_g_MissionName)
		     AddText(sceneId,x204007_g_MissionComplete)
		     AddMoneyBonus(sceneId, x204007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204007_g_ScriptId, x204007_g_MissionId)
                end

        elseif x204007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204007_g_MissionName)
                AddText(sceneId,x204007_g_MissionInfo..GetName(sceneId, selfId)..x204007_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204007_g_ScriptId, x204007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204007_g_ScriptId, x204007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==4) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204007_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x204007_g_MissionId, x204007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x204007_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x204007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204007_g_MissionId)
	for i, item in x204007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x204007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x204007_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == x204007_g_DemandKill[2].num then
			if GetMissionParam(sceneId,selfId,misIndex,2) == x204007_g_DemandKill[3].num then
	        		return 1
	        	end
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204007_g_MissionId)
		AddExp(sceneId, selfId, x204007_g_ExpBonus)
		AddMoney(sceneId, selfId, x204007_g_MoneyBonus)
		for i, item in x204007_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x204007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x204007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204007_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x204007_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 num1 = GetMissionParam(sceneId,selfId,misIndex,1)
	 num2 = GetMissionParam(sceneId,selfId,misIndex,2)
	 	 if objdataId == x204007_g_DemandKill[1].id then 
       		    if num < x204007_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204007_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 if objdataId == x204007_g_DemandKill[2].id then 
       		    if num1 < x204007_g_DemandKill[2].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num1+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x204007_g_DemandKill[2].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 if objdataId == x204007_g_DemandKill[3].id then 
       		    if num2 < x204007_g_DemandKill[3].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,2,num2+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ʦ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,2),x204007_g_DemandKill[3].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x204007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204007_OnItemChanged(sceneId, selfId, itemdataId)

end

