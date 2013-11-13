--�ָ��Χ

--MisDescBegin
x208005_g_ScriptId = 208005
x208005_g_MissionIdPre =58
x208005_g_MissionId = 59
x208005_g_MissionKind = 12
x208005_g_MissionLevel = 60
--x208005_g_ScriptIdNext = {ScriptId = 205003 ,LV = 1 }
x208005_g_Name	="�ܱ�" 
x208005_g_DemandItem ={}
x208005_g_DemandKill ={{id=318,num=20}}

x208005_g_MissionName="�ָ��Χ"
x208005_g_MissionInfo="     �ոմ�����Ϣ�����ǳɹ��İ�������Щ������ɢ����������Ҫ�ָ��Χ���������𣡸����ʱ���ˣ��ʹӣ�183��136������ʼ�ɣ����ս�������������ֻ����ǵ�Ѫծ��"  --��������
x208005_g_MissionTarget="    ɱ��20��#R������ʿ��#W��������#G�ܱ�#W������"		                                                                                               
x208005_g_MissionComplete="    ���ǵ��ɹž�����������ǿ�ľ��ӣ�"					--�������npc˵���Ļ�
x208005_g_ContinueInfo="    �벻Ҫ������Щ������ģ�ˣ�ֻ��ɱ�����ǲ���ƽϢ���ǳ�޵�ŭ��"
--������
x208005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208005_g_RadioItemBonus={}

--MisDescEnd
x208005_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208005_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x208005_g_MissionId)
		if x208005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x208005_g_MissionName)
			AddText(sceneId,x208005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x208005_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�������ǲ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x208005_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x208005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x208005_g_MissionName)
		     AddText(sceneId,x208005_g_MissionComplete)
		     AddMoneyBonus(sceneId, x208005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x208005_g_ScriptId, x208005_g_MissionId)
                end

        elseif x208005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208005_g_MissionName)
                AddText(sceneId,x208005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208005_g_ScriptId, x208005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208005_g_ScriptId, x208005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208005_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==8) then
		if IsMissionHaveDone(sceneId, selfId, x208005_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208005_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x208005_g_MissionId, x208005_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x208005_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x208005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208005_g_MissionId)
	for i, item in pairs(x208005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208005_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x208005_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208005_g_MissionId)
		AddExp(sceneId, selfId, x208005_g_ExpBonus)
		AddMoney(sceneId, selfId, x208005_g_MoneyBonus)
		for i, item in pairs(x208005_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x208005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x208005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x208005_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x208005_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x208005_g_DemandKill[1].id then 
       		    if num < x208005_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�������ǲ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x208005_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x208005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208005_OnItemChanged(sceneId, selfId, itemdataId)

end

