--�������Ӫ

--MisDescBegin
x212008_g_ScriptId = 212008
x212008_g_MissionIdPre =254
x212008_g_MissionId = 255
x212008_g_MissionKind = 17
x212008_g_MissionLevel = 70
--x212008_g_ScriptIdNext = {ScriptId = 212008 ,LV = 1 }
x212008_g_Name	="�ٲ�̨" 
x212008_g_DemandItem ={}
x212008_g_DemandKill ={{id=428,num=20}}

x212008_g_MissionName="�������Ӫ"
x212008_g_MissionInfo="    ��������������ģ��ʱ�����Ĺ����������������������Ͻ������ɿ��ɴ����\n \n    ���Ѿ�����������ĵ���������������ʧȥ���ѵ�������\n \n    ɱ������#G���ǵ�#W���ߵ�#R�������Ӫʿ��#W���������˶�֪���������ɹ������������޵У�"  --��������
x212008_g_MissionTarget="    ɱ��20������#G���ǵ�#W���ߵ�#R�������Ӫʿ��#W������#G�ٲ�̨#W������"		                                                                                               
x212008_g_MissionComplete="    ���ĺã�������Ụ��ÿһλ��ʿ��"					--�������npc˵���Ļ�
x212008_g_ContinueInfo="    ��Ϊ�ɾ��ľ�Ӣ����һ��Ҫ��������������"
--������
x212008_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x212008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212008_g_RadioItemBonus={}

--MisDescEnd
x212008_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x212008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212008_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x212008_g_MissionId)
		if x212008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212008_g_MissionName)
			AddText(sceneId,x212008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x212008_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���������Ӫʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x212008_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x212008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x212008_g_MissionName)
		     AddText(sceneId,x212008_g_MissionComplete)
		     AddMoneyBonus(sceneId, x212008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x212008_g_ScriptId, x212008_g_MissionId)
                end

        elseif x212008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212008_g_MissionName)
                AddText(sceneId,x212008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212008_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x212008_g_ScriptId, x212008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212008_g_ScriptId, x212008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212008_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==12) then
		if IsMissionHaveDone(sceneId, selfId, x212008_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x212008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x212008_g_MissionId, x212008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x212008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x212008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212008_g_MissionId)
	for i, item in x212008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x212008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x212008_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212008_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x212008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212008_g_MissionId)
		AddExp(sceneId, selfId, x212008_g_ExpBonus)
		AddMoney(sceneId, selfId, x212008_g_MoneyBonus)
		for i, item in x212008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x212008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x212008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x212008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x212008_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x212008_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x212008_g_DemandKill[1].id then 
       		    if num < x212008_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���������Ӫʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x212008_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x212008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212008_OnItemChanged(sceneId, selfId, itemdataId)

end

