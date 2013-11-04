--���겼�Ʒ�

--MisDescBegin
x225006_g_ScriptId = 225006
x225006_g_MissionIdPre =327
x225006_g_MissionId = 328
x225006_g_MissionKind = 22
x225006_g_MissionLevel = 110
--x225006_g_ScriptIdNext = {ScriptId = 225005 ,LV = 1 }
x225006_g_Name	="�ɸ�" 
x225006_g_DemandItem ={}
x225006_g_DemandKill ={{id=438,num=1}}

x225006_g_MissionName="���겼�Ʒ�"
x225006_g_MissionInfo="    ���ȥϮ��#G������#W���м�����ʿ�����ˡ���˵�Ǳ�һ���в��Ʒ�Ĺ�������ɱ���ˡ�\n \n    �Ҳ����������������ٷ��������Ǿ����еľ�����ȥ����ɱ��#R���Ʒ�#W��Ϊ��������ʿ����"  --��������
x225006_g_MissionTarget="    ɱ��#R���Ʒ�#W����#G�ɸ�#W�����±���"		                                                                                               
x225006_g_MissionComplete="    �Ҿ�֪�����˳���������ģ�ѡ����Ľ����ɣ�������Ӧ�õġ�"					--�������npc˵���Ļ�
x225006_g_ContinueInfo="    ����һ���Ѳ��Ķ��֣���ҪС�ģ�"
--������
x225006_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x225006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x225006_g_RadioItemBonus={}

--MisDescEnd
x225006_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x225006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x225006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x225006_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x225006_g_MissionId)
		if x225006_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x225006_g_MissionName)
			AddText(sceneId,x225006_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x225006_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ�����Ʒ�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225006_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x225006_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x225006_g_MissionName)
		     AddText(sceneId,x225006_g_MissionComplete)
		     AddMoneyBonus(sceneId, x225006_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x225006_g_ScriptId, x225006_g_MissionId)
                end

        elseif x225006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x225006_g_MissionName)
                AddText(sceneId,x225006_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x225006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x225006_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x225006_g_ScriptId, x225006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x225006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x225006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x225006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x225006_g_ScriptId, x225006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x225006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x225006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x225006_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==16) then
		if IsMissionHaveDone(sceneId, selfId, x225006_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x225006_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x225006_g_MissionId, x225006_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x225006_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x225006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x225006_g_MissionId)
	for i, item in x225006_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x225006_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x225006_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x225006_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x225006_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x225006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x225006_g_MissionId)
		AddExp(sceneId, selfId, x225006_g_ExpBonus)
		AddMoney(sceneId, selfId, x225006_g_MoneyBonus)
		for i, item in x225006_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x225006_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x225006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x225006_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x225006_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x225006_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x225006_g_DemandKill[1].id then 
       		    if num < x225006_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����Ʒ�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225006_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x225006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x225006_OnItemChanged(sceneId, selfId, itemdataId)

end

