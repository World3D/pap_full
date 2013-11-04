--����������

--MisDescBegin
x223010_g_ScriptId = 223010
x223010_g_MissionIdPre =301
x223010_g_MissionId = 302
x223010_g_MissionKind = 20
x223010_g_MissionLevel = 100
x223010_g_ScriptIdNext = {ScriptId = 223011 ,LV = 1 }
x223010_g_Name	="�ٲ�̨" 
x223010_g_DemandItem ={}
x223010_g_DemandKill ={{id=449,num=10},{id=448,num=10}}

x223010_g_MissionName="����������"
x223010_g_MissionInfo="     �ò��˶�ã����ǽ��ṥ���ղ��˵ķ�����ɱ�����ǵ�����˳�����"  --��������
x223010_g_MissionInfo2="������Ҫ�������������������Ԯ�������ⵤ֪�Ѷ��ˣ�\n \n    ���Ҳࣨ�������ǵ���ʿ�Ѿ��Ϳⵤ�ľ��ӿ�ս����Ҫǰȥ֧Ԯ������10��#R�ղ�Ͷʯ��ָ�ӹ�#W��10��#R�ղ���ʿ#W��"
x223010_g_MissionTarget="    �����10��#R�ղ�Ͷʯ��ָ�ӹ�#W��10��#R�ղ���ʿ#W���ٻ�����#G�ٲ�̨#W"		                                                                                               
x223010_g_MissionComplete="    �Ҿ�֪�����ⵤ�����С����Ϊ�˰˳������������ǲ����������ɹ��������Žᣡ��������һ������ʿ��"					--�������npc˵���Ļ�
x223010_g_ContinueInfo="    һ��Ҫ�ÿⵤ����Ҵ��ɹŹ���ʵ����"
--������
x223010_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x223010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223010_g_RadioItemBonus={}

--MisDescEnd
x223010_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x223010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x223010_g_MissionId)
		if x223010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223010_g_MissionName)
			AddText(sceneId,x223010_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223010_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���ղ�Ͷʯ��ָ�ӹ�   %d/%d\n    ɱ���ղ���ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223010_g_DemandKill[1].num, GetMissionParam(sceneId,selfId,misIndex,1),x223010_g_DemandKill[2].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x223010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223010_g_MissionName)
		     AddText(sceneId,x223010_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223010_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223010_g_ScriptId, x223010_g_MissionId)
                end

        elseif x223010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223010_g_MissionName)
                AddText(sceneId,x223010_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223010_g_ScriptId, x223010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223010_g_ScriptId, x223010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223010_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==17) then
		if IsMissionHaveDone(sceneId, selfId, x223010_g_MissionIdPre) > 0 then
		    	return 1
		end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x223010_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x223010_g_MissionId, x223010_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x223010_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x223010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223010_g_MissionId)
	for i, item in x223010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223010_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223010_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x223010_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == x223010_g_DemandKill[2].num then
	        	return 1
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x223010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223010_g_MissionId)
		AddExp(sceneId, selfId, x223010_g_ExpBonus)
		AddMoney(sceneId, selfId, x223010_g_MoneyBonus)
		for i, item in x223010_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x223010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x223010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x223010_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x223010_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x223010_g_DemandKill[1].id then 
       		    if num < x223010_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ղ�Ͷʯ��ָ�ӹ�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223010_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
        num2 = GetMissionParam(sceneId,selfId,misIndex,1) 
	 	 if objdataId == x223010_g_DemandKill[2].id then 
       		    if num2 < x223010_g_DemandKill[2].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num2+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ղ���ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x223010_g_DemandKill[2].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
      end  

end



--**********************************

--���������¼�

--**********************************

function x223010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x223010_OnItemChanged(sceneId, selfId, itemdataId)

end

