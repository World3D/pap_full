--ǧ��ū������

--MisDescBegin
x217012_g_ScriptId = 217012
--x217012_g_MissionIdPre =41
x217012_g_MissionId = 184
x217012_g_MissionKind = 6
x217012_g_MissionLevel = 30
--x217012_g_ScriptIdNext = {ScriptId = 217001 ,LV = 1 }
x217012_g_Name	="�ٻ���" 
x217012_g_DemandItem ={}
x217012_g_DemandKill ={{id=458,num=15}}

x217012_g_MissionName="ǧ��ū������"
x217012_g_MissionInfo="    ���Ǿ��ȣ�����ر߹صĽ�����ǧ��ū������һ���ǳ������Ľ�������������ױ�ɽ���ȥ��̽���õ���һЩ�������ܡ�\n \n    ǧ��ū��һ���ǳ�������ˣ���������Ŀ���˶��Ѿ�ȥ�˵�������ʹ��������ǵĻʵۣ�Ҳ�������֡�\n \n    ��������ǣ��������ʿ��������Ұ�ԣ�����Ҫ��һЩ����Ϊ�ҽ��ǧ��ū�Ĺ����֡�\n \n    �������ʿ����ҪС��#Rǧ��ū������#W����Щ�����Ƚ�������רҵ���ָ����������������Ǿ��ڵ��˵�#GС����#W������һ�ж������ˡ�"  --��������
x217012_g_MissionTarget="    ��#G�ٻ���#W����#GС����#W����15��#Rǧ��ū������#W��"		                                                                                               
x217012_g_MissionComplete="    лл������ǽ�����⣬�һ�Ū���ǧ��ū����ˡ�"					--�������npc˵���Ļ�
x217012_g_ContinueInfo="    ֻ�����������ľ���սʿ���ܽ��ǧ��ū�Ĺ����֡�"
--������
x217012_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x217012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217012_g_RadioItemBonus={}

--MisDescEnd
x217012_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x217012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217012_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x217012_g_MissionId)
		if x217012_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x217012_g_MissionName)
			AddText(sceneId,x217012_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x217012_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��ǧ��ū������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217012_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x217012_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217012_g_MissionName)
		     AddText(sceneId,x217012_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217012_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217012_g_ScriptId, x217012_g_MissionId)
                end

        elseif x217012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217012_g_MissionName)
                AddText(sceneId,x217012_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217012_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217012_g_ScriptId, x217012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217012_g_ScriptId, x217012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217012_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==20) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217012_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x217012_g_MissionId, x217012_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x217012_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x217012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217012_g_MissionId)
	for i, item in pairs(x217012_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217012_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217012_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x217012_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217012_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x217012_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217012_g_MissionId)
		AddExp(sceneId, selfId, x217012_g_ExpBonus)
		AddMoney(sceneId, selfId, x217012_g_MoneyBonus)
		for i, item in pairs(x217012_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x217012_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x217012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217012_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217012_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x217012_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x217012_g_DemandKill[1].id then 
       		    if num < x217012_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��ǧ��ū������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217012_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x217012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217012_OnItemChanged(sceneId, selfId, itemdataId)

end

