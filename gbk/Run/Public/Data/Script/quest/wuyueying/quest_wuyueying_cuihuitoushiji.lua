--�ݻ�Ͷʯ��

--MisDescBegin
x217007_g_ScriptId = 217007
--x217007_g_MissionIdPre =41
x217007_g_MissionId = 179
x217007_g_MissionKind = 6
x217007_g_MissionLevel = 30
x217007_g_ScriptIdNext = {ScriptId = 217008 ,LV = 1 }
x217007_g_Name	="����" 
x217007_g_DemandItem ={}
x217007_g_DemandKill ={{id=455,num=10}}

x217007_g_MissionName="�ݻ�Ͷʯ��"
x217007_g_MissionInfo="    ���ǽ���������ĵط������ǵ���������������ƬӪ�أ���������˵�����������Ƿ���ȡʤ�Ĺؼ�ս�ۡ�\n \n    ��������ʧ�����Ӫ�أ����Ǳ߹ص�40�������ȱ�����ݣ���ʹ���վ����ټ�̵ĳǳأ�û�������ݣ����Ǳذܡ�\n \n    ���ǣ�������ģ�ְҵ����Ҫ������Ƭ�ط��������ף��������Щ��������ǵ�Ͷʯ����ֹ�����ǵĽű�������Ҫ��ѡ����ʿ��ȥɨ���ϰ�����֤���Ǵ���Ľ����Ų���\n \n    ���Ƕ������е�����ݻ������Ͷʯ���������ǵ�ʵ��չ�ָ���Щų���Ľ���ˡ�"  --��������
x217007_g_MissionTarget="    �ݻ�10���������#G��е��#W��#R����ӪͶʯ��#W��Ϊ���#G����#Wɨ��������ϰ���"		                                                                                               
x217007_g_MissionComplete="    ���úã��ҵ�սʿ��"					--�������npc˵���Ļ�
x217007_g_ContinueInfo="    ���ǵ�ϣ����������������Щ��������ϣ��벻Ҫ����ʧ�����ó����ǵ�����Ϊ��ս����"
--������
x217007_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x217007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217007_g_RadioItemBonus={}

--MisDescEnd
x217007_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x217007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x217007_g_MissionId)
		if x217007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x217007_g_MissionName)
			AddText(sceneId,x217007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x217007_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������ӪͶʯ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217007_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x217007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217007_g_MissionName)
		     AddText(sceneId,x217007_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217007_g_ScriptId, x217007_g_MissionId)
                end

        elseif x217007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217007_g_MissionName)
                AddText(sceneId,x217007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217007_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217007_g_ScriptId, x217007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217007_g_ScriptId, x217007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==20) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217007_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x217007_g_MissionId, x217007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x217007_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x217007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217007_g_MissionId)
	for i, item in pairs(x217007_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x217007_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217007_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x217007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217007_g_MissionId)
		AddExp(sceneId, selfId, x217007_g_ExpBonus)
		AddMoney(sceneId, selfId, x217007_g_MoneyBonus)
		for i, item in pairs(x217007_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x217007_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x217007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217007_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x217007_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x217007_g_DemandKill[1].id then 
       		    if num < x217007_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������ӪͶʯ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217007_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x217007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217007_OnItemChanged(sceneId, selfId, itemdataId)

end

