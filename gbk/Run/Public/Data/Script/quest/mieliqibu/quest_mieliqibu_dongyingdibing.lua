--��Ӫ�б�

--MisDescBegin
x201005_g_ScriptId = 201005
--x201005_g_MissionIdPre =41
x201005_g_MissionId = 87
x201005_g_MissionKind = 2
x201005_g_MissionLevel = 10
x201005_g_ScriptIdNext = {ScriptId = 201006 ,LV = 1 }
x201005_g_Name	="��ľ��" 
x201005_g_DemandItem ={}
x201005_g_DemandKill ={{id=472,num=20}}

x201005_g_MissionName="��Ӫ�б�"
x201005_g_MissionInfo="    ��ľ�����ҵİ���������Сʱ����ų��������ģ����ν�Ϊ�����ֵ�֮�飬�Ⱥ��Ѻӻ�������ϵİ��ƻ��࣡\n \n    ˭Ҫ�Ը���ľ�棬���ǶԸ��ң��������������򾫱��Ѿ���Χ�����������򶫲���\n \n    "  --��������
x201005_g_MissionInfo2="������������#G��Ӫ#W�����������#R��������#W��"
x201005_g_MissionTarget="    #G��ľ��#W���㵽��Ӫȥȥ����20��#R��������#W��ɱ�ˡ�"		                                                                                               
x201005_g_MissionComplete="    ���ǳɹ������������ǵĶ�Ӫ�����������Ҳ����ö�����"					--�������npc˵���Ļ�
x201005_g_ContinueInfo="    ��������������������ǵĶ�Ӫ��"
--������
x201005_g_MoneyBonus = 1
--�̶���Ʒ���������8��
x201005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201005_g_RadioItemBonus={}

--MisDescEnd
x201005_g_ExpBonus = 50
--**********************************

--������ں���

--**********************************

function x201005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	--����г�����
	if x201005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201005_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x201005_g_MissionId)
		if x201005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201005_g_MissionName)
			AddText(sceneId,x201005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201005_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201005_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201005_g_MissionName)
		     AddText(sceneId,x201005_g_MissionComplete)
		     AddMoneyBonus(sceneId, x201005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201005_g_ScriptId, x201005_g_MissionId)
                end

        elseif x201005_CheckAccept(sceneId, selfId, targetId) > 0 then
	 	--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201005_g_MissionName)
                AddText(sceneId,x201005_g_MissionInfo..GetName(sceneId, selfId)..x201005_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201005_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x201005_g_ScriptId, x201005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201005_g_ScriptId, x201005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201005_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==1) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x201005_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x201005_g_MissionId, x201005_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x201005_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x201005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201005_g_MissionId)
	for i, item in x201005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201005_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x201005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x201005_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x201005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x201005_g_MissionId)
		AddExp(sceneId, selfId, x201005_g_ExpBonus)
		AddMoney(sceneId, selfId, x201005_g_MoneyBonus)
		for i, item in x201005_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x201005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x201005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	
end



--**********************************

--ɱ����������

--**********************************

function x201005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201005_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x201005_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x201005_g_DemandKill[1].id then 
       		    if num < x201005_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201005_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x201005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201005_OnItemChanged(sceneId, selfId, itemdataId)

end

