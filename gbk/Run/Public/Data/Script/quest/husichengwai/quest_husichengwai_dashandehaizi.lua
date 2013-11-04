--��ɽ�ĺ���

--MisDescBegin
x204009_g_ScriptId = 204009
--x204009_g_MissionIdPre =41
x204009_g_MissionId = 104
x204009_g_MissionKind = 9
x204009_g_MissionLevel = 45
x204009_g_ScriptIdNext = {ScriptId = 204010 ,LV = 1 }
x204009_g_Name	="������" 
x204009_g_DemandItem ={}
x204009_g_DemandKill ={{id=352,num=10}}

x204009_g_MissionName="��ɽ�ĺ���"
x204009_g_MissionInfo="    ��ɽ�ĺ��ӱ������ɹ���һ��Ӫկ������������Ȼ���࣬���Ǵ�ɽ���ް취��\n \n    "  --��������
x204009_g_MissionInfo2="����ɽ����һ�ι���Ү��ֱ���������������ɹ������ĺ��ӣ�һ��������в�����������ǵĻ��ᡣӪկ������������½ǣ���10��#R��������#W���أ�ɱ�����ǣ��ȳ����ӡ�"
x204009_g_MissionTarget="    �������Ӫկ��10��#R��������#W��#G������#W����ɱ�����ǣ����ܾȳ����ӡ�"		                                                                                               
x204009_g_MissionComplete="    ��ɽ��������˵лл��"					--�������npc˵���Ļ�
x204009_g_ContinueInfo="    ���Ӿȳ�������"
--������
x204009_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204009_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204009_g_RadioItemBonus={}

--MisDescEnd
x204009_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204009_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204009_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204009_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x204009_g_MissionId)
		if x204009_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x204009_g_MissionName)
			AddText(sceneId,x204009_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x204009_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204009_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x204009_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204009_g_MissionName)
		     AddText(sceneId,x204009_g_MissionComplete)
		     AddMoneyBonus(sceneId, x204009_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204009_g_ScriptId, x204009_g_MissionId)
                end

        elseif x204009_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204009_g_MissionName)
                AddText(sceneId,x204009_g_MissionInfo..GetName(sceneId, selfId)..x204009_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204009_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204009_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204009_g_ScriptId, x204009_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204009_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204009_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204009_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204009_g_ScriptId, x204009_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204009_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204009_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204009_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==4) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x204009_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x204009_g_MissionId, x204009_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x204009_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x204009_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204009_g_MissionId)
	for i, item in x204009_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204009_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x204009_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x204009_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204009_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204009_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204009_g_MissionId)
		AddExp(sceneId, selfId, x204009_g_ExpBonus)
		AddMoney(sceneId, selfId, x204009_g_MoneyBonus)
		for i, item in x204009_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x204009_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x204009_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204009_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x204009_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x204009_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x204009_g_DemandKill[1].id then 
       		    if num < x204009_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x204009_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x204009_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204009_OnItemChanged(sceneId, selfId, itemdataId)

end

