--ʥ����ʿ

--MisDescBegin
x213003_g_ScriptId = 213003
--x213003_g_MissionIdPre =41
x213003_g_MissionId = 148
x213003_g_MissionKind = 24
x213003_g_MissionLevel = 125
x213003_g_ScriptIdNext = {ScriptId = 213004 ,LV = 1 }
x213003_g_Name	="�ϵ�" 
x213003_g_DemandItem ={}
x213003_g_DemandKill ={{id=389,num=15}}

x213003_g_MissionName="ʥ����ʿ"
x213003_g_MissionInfo="    ��һ���������������ӭս����������������ʥ����ʿ�š���Ȼ���ǵ�װ����������ʿ��Ӣ�£������Դ�û��ô��ֻ֪����ǰ�塣\n \n    ���������Ѿ������ڱ�����������������������ȫ���Ӳ���������ȥ�������ǰɡ�"  --��������
x213003_g_MissionTarget="    #G�ζ�#W����ɱ��15��#Rʥ����ʿ#W��"		                                                                                               
x213003_g_MissionComplete="    ��ô��Ŀ��ף�������ſ���ˤ����ˮ�����ʲô������Ҳ¾���ֻ��û����ˮ�����������ǰɣ�������"					--�������npc˵���Ļ�
x213003_g_ContinueInfo="    ʥ����ʿ�����ǵľ�������������������ٺò����ˡ�"
--������
x213003_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x213003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x213003_g_RadioItemBonus={}

--MisDescEnd
x213003_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x213003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x213003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x213003_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x213003_g_MissionId)
		if x213003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x213003_g_MissionName)
			AddText(sceneId,x213003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x213003_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��ʥ����ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x213003_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x213003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x213003_g_MissionName)
		     AddText(sceneId,x213003_g_MissionComplete)
		     AddMoneyBonus(sceneId, x213003_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x213003_g_ScriptId, x213003_g_MissionId)
                end

        elseif x213003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x213003_g_MissionName)
                AddText(sceneId,x213003_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x213003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x213003_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x213003_g_ScriptId, x213003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x213003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x213003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x213003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x213003_g_ScriptId, x213003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x213003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x213003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x213003_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==13) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x213003_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x213003_g_MissionId, x213003_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x213003_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x213003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x213003_g_MissionId)
	for i, item in x213003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x213003_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x213003_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x213003_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x213003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x213003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x213003_g_MissionId)
		AddExp(sceneId, selfId, x213003_g_ExpBonus)
		AddMoney(sceneId, selfId, x213003_g_MoneyBonus)
		for i, item in x213003_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x213003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x213003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x213003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x213003_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x213003_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x213003_g_DemandKill[1].id then 
       		    if num < x213003_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��ʥ����ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x213003_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x213003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x213003_OnItemChanged(sceneId, selfId, itemdataId)

end

