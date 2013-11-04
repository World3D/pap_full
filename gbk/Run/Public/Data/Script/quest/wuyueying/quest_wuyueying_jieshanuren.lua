--��ɱū��

--MisDescBegin
x217010_g_ScriptId = 217010
x217010_g_MissionIdPre =181
x217010_g_MissionId = 182
x217010_g_MissionKind = 6
x217010_g_MissionLevel = 30
--x217010_g_ScriptIdNext = {ScriptId = 217010 ,LV = 1 }
x217010_g_Name	="����" 
x217010_g_DemandItem ={}
x217010_g_DemandKill ={{id=456,num=20}}

x217010_g_MissionName="��ɱū��"
x217010_g_MissionInfo="    ͶЧ���Ǵ��ɹŹ��Ĺ�������֪���ģ�ͨ�����������ô˴󽫣����˵ÿ���һ�ΰ����磡�ҵö�л�㣡\n \n    ����������ɲ���Ϊ�˲μӰ����磬��������������һ��æ�����Ѿ�ͶЧ���ǣ�����Ϣй¶���˽�����ǧ��ū���������¸������������ϼҡ�\n \n    "  --��������
x217010_g_MissionInfo2="����Ҫ��ֹ����£���С���ֵ�С���ϣ�����������סɱ�ˣ������ù������ļ����ܵ����ˡ�"
x217010_g_MissionTarget="    #G����#W���㵽#GС����#W��С���ϣ���ɱ20��#R����Ӫū��#W��"		                                                                                               
x217010_g_MissionComplete="    ��������Ϣ���ҾͰ����ˣ�һ·�������ˡ�"					--�������npc˵���Ļ�
x217010_g_ContinueInfo="    ��һ��Ҫ����ס��Щū�ˡ�"
--������
x217010_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x217010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217010_g_RadioItemBonus={}

--MisDescEnd
x217010_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x217010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x217010_g_MissionId)
		if x217010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x217010_g_MissionName)
			AddText(sceneId,x217010_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x217010_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������Ӫū��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217010_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x217010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217010_g_MissionName)
		     AddText(sceneId,x217010_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217010_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217010_g_ScriptId, x217010_g_MissionId)
                end

        elseif x217010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217010_g_MissionName)
                AddText(sceneId,x217010_g_MissionInfo..GetName(sceneId, selfId)..x217010_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217010_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217010_g_ScriptId, x217010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217010_g_ScriptId, x217010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217010_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==20) then
		if IsMissionHaveDone(sceneId, selfId, x217010_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217010_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x217010_g_MissionId, x217010_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x217010_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x217010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217010_g_MissionId)
	for i, item in x217010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217010_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217010_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x217010_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217010_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x217010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217010_g_MissionId)
		AddExp(sceneId, selfId, x217010_g_ExpBonus)
		AddMoney(sceneId, selfId, x217010_g_MoneyBonus)
		for i, item in x217010_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x217010_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x217010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217010_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x217010_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x217010_g_DemandKill[1].id then 
       		    if num < x217010_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������Ӫū��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217010_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x217010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217010_OnItemChanged(sceneId, selfId, itemdataId)

end

