--�����ķ�ŭ

--MisDescBegin
x201009_g_ScriptId = 201009
--x201009_g_MissionIdPre =41
x201009_g_MissionId = 91
x201009_g_MissionKind = 2
x201009_g_MissionLevel = 10
x201009_g_ScriptIdNext = {ScriptId = 201008 ,LV = 1 }
x201009_g_Name	="����" 
x201009_g_DemandItem ={}
x201009_g_DemandKill ={{id=474,num=20}}

x201009_g_MissionName="�����ķ�ŭ"
x201009_g_MissionInfo="    ���ǿ��Ҳ�����������ľ�����ҵ����ӣ����������ʮ�ֵķ�ŭ��\n \n    �Ҽ����ö���������һ���ǳ�Ư�������Ů�ˣ���ľ��9���ʱ��������ף�18��Ȣ�����ţ��ҵ���Ƥ���¾������Ƿ����͵ġ�\n \n    ��������͵Ϯ�����ӵĲ��䣬�������ö��������������������������Ҳ����ԭ���������ˡ�\n \n    "  --��������
x201009_g_MissionInfo2="�����Ž����ĺ���������#G���Ѻ��Ͽ�#W����Щ#R��������#W�����ǵ����ʵ�����Ҳ�ϲ����"
x201009_g_MissionTarget="    #G����#W����ȥ����#G���Ѻ��Ͽ�#W��20��#R��������#W��"		                                                                                               
x201009_g_MissionComplete="    ���Ӣ�£��ǲ��ɶ�õ��˲š�"					--�������npc˵���Ļ�
x201009_g_ContinueInfo="    ���Ӻ��������Щ����������"
--������
x201009_g_MoneyBonus = 1

--�̶���Ʒ���������8��
x201009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201009_g_RadioItemBonus={}

--MisDescEnd
x201009_g_ExpBonus = 50
--**********************************

--������ں���

--**********************************

function x201009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201009_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x201009_g_MissionId)
		if x201009_CheckSubmit(sceneId, selfId, targetId) <= 0 then
     	  BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x201009_g_MissionName)
				AddText(sceneId,x201009_g_ContinueInfo)
		  	AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x201009_g_MissionTarget) 
				AddText(sceneId,format("\n    ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x201009_g_DemandKill[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
		end

		if x201009_CheckSubmit(sceneId, selfId, targetId) > 0 then
        BeginEvent(sceneId)
        AddText(sceneId,"#Y"..x201009_g_MissionName)
		    AddText(sceneId,x201009_g_MissionComplete)
		    AddMoneyBonus(sceneId, x201009_g_MoneyBonus)
		    EndEvent()
        DispatchMissionContinueInfo(sceneId, selfId, targetId, x201009_g_ScriptId, x201009_g_MissionId)
    end

  elseif x201009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201009_g_MissionName)
      AddText(sceneId,x201009_g_MissionInfo..GetName(sceneId, selfId)..x201009_g_MissionInfo2) 
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201009_g_MissionTarget) 
			AddMoneyBonus(sceneId, x201009_g_MoneyBonus)
			EndEvent()
			DispatchMissionInfo(sceneId, selfId, targetId, x201009_g_ScriptId, x201009_g_MissionId)
  end
	
end



--**********************************

--�о��¼�

--**********************************

function x201009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201009_g_ScriptId, x201009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201009_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==1) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x201009_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x201009_g_MissionId, x201009_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x201009_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x201009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201009_g_MissionId)
	for i, item in pairs(x201009_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201009_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x201009_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,1) == x201009_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201009_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x201009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x201009_g_MissionId)
		AddExp(sceneId, selfId, x201009_g_ExpBonus)
		AddMoney(sceneId, selfId, x201009_g_MoneyBonus)
		for i, item in pairs(x201009_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x201009_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x201009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x201009_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201009_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x201009_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,1) 
	 	 if objdataId == x201009_g_DemandKill[1].id then 
       		    if num < x201009_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x201009_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    else
		    	SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		    end
		    
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x201009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201009_OnItemChanged(sceneId, selfId, itemdataId)

end

