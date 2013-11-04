--ʮ�־�

--MisDescBegin
x226002_g_ScriptId = 226002
x226002_g_MissionIdPre =338
x226002_g_MissionId = 339
x226002_g_MissionKind = 23
x226002_g_MissionLevel = 115
x226002_g_ScriptIdNext = {ScriptId = 226002 ,LV = 1 }
x226002_g_Name	="�����" 
x226002_g_DemandItem ={}
x226002_g_DemandKill ={{id=478,num=30}}

x226002_g_MissionName="ʮ�־�"
x226002_g_MissionInfo="    ���˵Ĳ���������û��ս�����ˣ����ǳ������ϵ�����һ֧������Ȼ�����翹��\n \n    ������ǰ����һ��ʮ�ֱ�־��Ӧ����ʮ�־�����Щ��ս���������ǳ����ȣ����������ǻ�������"  --��������
x226002_g_MissionTarget="    ��#G�����#Wɱ��30����#Rʮ�־�������#W��"		                                                                                               
x226002_g_MissionComplete="    ������ͻϮ���������˿���֮�⣬��Щʮ�־�һ���Ǵ���"					--�������npc˵���Ļ�
x226002_g_ContinueInfo="    �����Ǽ��ϵ�ȥ�ɡ�"
--������
x226002_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x226002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x226002_g_RadioItemBonus={}

--MisDescEnd
x226002_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x226002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x226002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x226002_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x226002_g_MissionId)
		if x226002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x226002_g_MissionName)
			AddText(sceneId,x226002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x226002_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��ʮ�־�������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x226002_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x226002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x226002_g_MissionName)
		     AddText(sceneId,x226002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x226002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x226002_g_ScriptId, x226002_g_MissionId)
                end

        elseif x226002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x226002_g_MissionName)
                AddText(sceneId,x226002_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x226002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x226002_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x226002_g_ScriptId, x226002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x226002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x226002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x226002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x226002_g_ScriptId, x226002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x226002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x226002_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==22) then
		if IsMissionHaveDone(sceneId, selfId, x226002_g_MissionIdPre) > 0 then
        	    	return 1
        end
  end
        return 0
	
end

--**********************************

--����

--**********************************

function x226002_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x226002_g_MissionId, x226002_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x226002_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x226002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x226002_g_MissionId)
	for i, item in x226002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x226002_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x226002_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x226002_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x226002_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x226002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x226002_g_MissionId)
		AddExp(sceneId, selfId, x226002_g_ExpBonus)
		AddMoney(sceneId, selfId, x226002_g_MoneyBonus)
		--CallScriptFunction( x226002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x226002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x226002_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x226002_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x226002_g_DemandKill[1].id then 
       		    if num < x226002_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��ʮ�־�������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x226002_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x226002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x226002_OnItemChanged(sceneId, selfId, itemdataId)

end

