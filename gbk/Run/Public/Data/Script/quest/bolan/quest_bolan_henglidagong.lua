--������

--MisDescBegin
x226005_g_ScriptId = 226005
x226005_g_MissionIdPre =340
x226005_g_MissionId = 341
x226005_g_MissionKind = 23
x226005_g_MissionLevel = 115
x226005_g_ScriptIdNext = {ScriptId = 226006 ,LV = 1 }
x226005_g_Name	="����" 
x226005_g_DemandItem ={}
x226005_g_DemandKill ={{id=481,num=1}}

x226005_g_MissionName="������"
x226005_g_MissionInfo="    ������������ָ�Ӿ���#R������#W���̶�ʱ��֮�������ټ��˼���ľ��ӡ�����˲��򵥣������������ˡ�\n \n    ����Χ����ʿ�Ѿ�������ɱ�Ĳ���ˣ���ȥɱ�����ɡ�\n \n    ע�⣬��Ȼ��ָ��ս����һ���׳գ�������˵���Ľ���������ҪС�ġ�"  --��������
x226005_g_MissionTarget="    ɱ��#R������#W����#G����#W������"		                                                                                               
x226005_g_MissionComplete="    ���Ѿ���˵�����Ӣ���¼�����ȡ��Ľ����ɡ���Щ����Ϊ��ʿ׼���ġ�"					--�������npc˵���Ļ�
x226005_g_ContinueInfo="    ɱ�������������ͻ��߽⡣"
--������
x226005_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x226005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x226005_g_RadioItemBonus={}

--MisDescEnd
x226005_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x226005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x226005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x226005_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x226005_g_MissionId)
		if x226005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x226005_g_MissionName)
			AddText(sceneId,x226005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x226005_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x226005_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x226005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x226005_g_MissionName)
		     AddText(sceneId,x226005_g_MissionComplete)
		     AddMoneyBonus(sceneId, x226005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x226005_g_ScriptId, x226005_g_MissionId)
                end

        elseif x226005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x226005_g_MissionName)
                AddText(sceneId,x226005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x226005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x226005_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x226005_g_ScriptId, x226005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x226005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x226005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x226005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x226005_g_ScriptId, x226005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x226005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x226005_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==22) then
		if IsMissionHaveDone(sceneId, selfId, x226005_g_MissionIdPre) > 0 then
        	    	return 1
        end
  end
        return 0
	
end

--**********************************

--����

--**********************************

function x226005_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x226005_g_MissionId, x226005_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x226005_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x226005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x226005_g_MissionId)
	for i, item in pairs(x226005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x226005_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x226005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x226005_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x226005_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x226005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x226005_g_MissionId)
		AddExp(sceneId, selfId, x226005_g_ExpBonus)
		AddMoney(sceneId, selfId, x226005_g_MoneyBonus)
		--CallScriptFunction( x226005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x226005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x226005_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x226005_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x226005_g_DemandKill[1].id then 
       		    if num < x226005_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x226005_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x226005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x226005_OnItemChanged(sceneId, selfId, itemdataId)

end

