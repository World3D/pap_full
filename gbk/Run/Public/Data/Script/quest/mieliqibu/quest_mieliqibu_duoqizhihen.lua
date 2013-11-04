--����֮��

--MisDescBegin
x201000_g_ScriptId = 201000
--x201000_g_MissionIdPre =41
x201000_g_MissionId = 82
x201000_g_MissionKind = 2
x201000_g_MissionLevel = 10
x201000_g_ScriptIdNext = {ScriptId = 201001 ,LV = 1 }
x201000_g_Name	="��ľ��" 
x201000_g_DemandItem ={}
x201000_g_DemandKill ={{id=337,num=20}}

x201000_g_MissionName="����֮��"
x201000_g_MissionInfo="    ���ǰ�¹�������ǣ��������ˣ��������򲿵������ϣ����ǲ������ˣ���Ҫ������ǣ��������򲿴Ӵ���ʧ�ڲ�ԭ�ϣ��������Ϊ������Զ��������\n \n    ��Щ̤��������ľ����壬�������ӵĵ��ˣ������Ҫ����ѪծѪ����\n \n    ��#G��Ӫ#W����������#R������ʿ��#W��"  --��������
x201000_g_MissionTarget="    ɱ��20��#G��Ӫ#W������#R������ʿ��#B#aB{������ʿ��_1}[39,133]#aE#W��������#G��ľ��#B#aB{��ľ��_2}[79,128]#aE#W������"		                                                                                               
x201000_g_MissionComplete="    ��ʿ����������۾���ĥ�����������׼������һ���ĳ�棡"					--�������npc˵���Ļ�
x201000_g_ContinueInfo="    ������ʿ������������"



--�Զ�Ѱ·�Ķ���
x201000_g_AutoFindPath =  {{sid=1,x=39,z=133,speak=0},{sid=1,x=79,z=128,speak=1}}

--������
x201000_g_MoneyBonus = 1

--�̶���Ʒ���������8��
x201000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201000_g_RadioItemBonus={}

--MisDescEnd
x201000_g_ExpBonus = 50
--**********************************

--������ں���

--**********************************

function x201000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x201000_g_MissionId)
		if x201000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
     	  BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x201000_g_MissionName)
				AddText(sceneId,x201000_g_ContinueInfo)
		  	AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x201000_g_MissionTarget) 
				AddText(sceneId,format("\n    ɱ��������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x201000_g_DemandKill[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
		end

		if x201000_CheckSubmit(sceneId, selfId, targetId) > 0 then
        BeginEvent(sceneId)
        AddText(sceneId,"#Y"..x201000_g_MissionName)
		    AddText(sceneId,x201000_g_MissionComplete)
		    AddMoneyBonus(sceneId, x201000_g_MoneyBonus)
		    EndEvent()
        DispatchMissionContinueInfo(sceneId, selfId, targetId, x201000_g_ScriptId, x201000_g_MissionId)
    end

  elseif x201000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201000_g_MissionName)
      AddText(sceneId,x201000_g_MissionInfo) 
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201000_g_MissionTarget) 
			AddMoneyBonus(sceneId, x201000_g_MoneyBonus)
			EndEvent()
			DispatchMissionInfo(sceneId, selfId, targetId, x201000_g_ScriptId, x201000_g_MissionId)
  end
	
end



--**********************************

--�о��¼�

--**********************************

function x201000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201000_g_ScriptId, x201000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==1) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x201000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x201000_g_MissionId, x201000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x201000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x201000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201000_g_MissionId)
	for i, item in x201000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x201000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,1) == x201000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201000_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x201000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x201000_g_MissionId)
		AddExp(sceneId, selfId, x201000_g_ExpBonus)
		AddMoney(sceneId, selfId, x201000_g_MoneyBonus)
		for i, item in x201000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x201000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x201000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x201000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201000_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x201000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,1) 
	 	 if objdataId == x201000_g_DemandKill[1].id then 
       		    if num < x201000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x201000_g_DemandKill[1].num )) 
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

function x201000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201000_OnItemChanged(sceneId, selfId, itemdataId)

end

