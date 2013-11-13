--���Ĵ�

--MisDescBegin
x212002_g_ScriptId = 212002
x212002_g_MissionIdPre =248
x212002_g_MissionId = 249
x212002_g_MissionKind = 17
x212002_g_MissionLevel = 70
x212002_g_ScriptIdNext = {ScriptId = 212003 ,LV = 1 }
x212002_g_Name	="�ɼ�˼��" 
x212002_g_DemandItem ={}
x212002_g_DemandKill ={{id=422,num=1}}

x212002_g_MissionName="���Ĵ�"
x212002_g_MissionInfo="    ������һ����#R��ɳ#W�Ŀ������������Գ��к���ɽΪӪ�أ�������������Ϊ�󷽣���������Ҿ��������������ɾ���мһ�ˡ�\n \n    ���뿴����˵�����������Ļ�����ˣ��Ƿ����б��¡�\n \n    "  --��������
x212002_g_MissionInfo2="�������ĵĽ�����ɳ����׽����"
x212002_g_MissionTarget="    �����#G���ǵ�#W������#R��ɳ#W������ȥ����#G�ɼ�˼��#W��"		                                                                                               
x212002_g_MissionComplete="    �����ɹž��޵������¡�"					--�������npc˵���Ļ�
x212002_g_ContinueInfo="    ���ĵĽ�����ɳ�أ�"
--������
x212002_g_MoneyBonus = 500
--�̶���Ʒ���������8��
x212002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212002_g_RadioItemBonus={}
--MisDescEnd
x212002_g_ExpBonus = 4000

--**********************************

--������ں���

--**********************************

function x212002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212002_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x212002_g_MissionId)
		if x212002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212002_g_MissionName)
			AddText(sceneId,x212002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x212002_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����ɳ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x212002_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x212002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x212002_g_MissionName)
		     AddText(sceneId,x212002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x212002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x212002_g_ScriptId, x212002_g_MissionId)
                end

        elseif x212002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212002_g_MissionName)
                AddText(sceneId,x212002_g_MissionInfo..GetName(sceneId, selfId)..x212002_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212002_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x212002_g_ScriptId, x212002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212002_g_ScriptId, x212002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212002_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==12) then
		if IsMissionHaveDone(sceneId, selfId, x212002_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x212002_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x212002_g_MissionId, x212002_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x212002_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x212002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212002_g_MissionId)
	for i, item in pairs(x212002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212002_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x212002_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x212002_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x212002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212002_g_MissionId)
		AddExp(sceneId, selfId, x212002_g_ExpBonus)
		AddMoney(sceneId, selfId, x212002_g_MoneyBonus)
		for i, item in pairs(x212002_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x212002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x212002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x212002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x212002_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x212002_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x212002_g_DemandKill[1].id then 
       		    if num < x212002_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����ɳ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x212002_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x212002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212002_OnItemChanged(sceneId, selfId, itemdataId)

end

