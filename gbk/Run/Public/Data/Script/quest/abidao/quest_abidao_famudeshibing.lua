--��ľ��ʿ��

--MisDescBegin
x203008_g_ScriptId = 203008
--x203008_g_MissionIdPre =41
x203008_g_MissionId = 76
x203008_g_MissionKind = 13
x203008_g_MissionLevel = 50
--x203008_g_ScriptIdNext = {ScriptId = 205003 ,LV = 1 }
x203008_g_Name	="�ܱ�" 
x203008_g_DemandItem ={}
x203008_g_DemandKill ={{id=327,num=15}}

x203008_g_MissionName="��ľ��ʿ��"
x203008_g_MissionInfo="    ����һ·׷�˼�ǧ����ڰ�������ħڭħ����������ϡ��ٲ�̨�����Ѿ����⵺���ΰ�Χ�ˡ���������������׽��������ǲ��ܴ��⣬һ��Ҫ��ս�پ������Բ�����������ʱ���촬�뿪��/n /n    ̽�ӽ��밢�̵�������������Ǵ�����ľ���ѻ��ں�̲�����һ����������촬������"  --��������
x203008_g_MissionInfo2="����һ��Ҫ����ȥ��ֹ���ǡ�"
x203008_g_MissionTarget="    �����ϴ��ĺ�̲ɱ��15��#R������ģ��ľ��#W�����ܱ�����"		                                                                                               
x203008_g_MissionComplete="    ���κο��ܣ��Ҷ����������ٷ�����"					--�������npc˵���Ļ�
x203008_g_ContinueInfo="    ��ɹ���ֹ����������"
--������
x203008_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203008_g_RadioItemBonus={}

--MisDescEnd
x203008_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203008_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x203008_g_MissionId)
		if x203008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x203008_g_MissionName)
			AddText(sceneId,x203008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x203008_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ģ��ľ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203008_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x203008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203008_g_MissionName)
		     AddText(sceneId,x203008_g_MissionComplete)
		     AddMoneyBonus(sceneId, x203008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203008_g_ScriptId, x203008_g_MissionId)
                end

        elseif x203008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203008_g_MissionName)
                AddText(sceneId,x203008_g_MissionInfo..GetName(sceneId, selfId)..x203008_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203008_g_ScriptId, x203008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203008_g_ScriptId, x203008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203008_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==3) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x203008_g_MissionId, x203008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x203008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x203008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203008_g_MissionId)
	for i, item in x203008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x203008_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203008_g_MissionId)
		AddExp(sceneId, selfId, x203008_g_ExpBonus)
		AddMoney(sceneId, selfId, x203008_g_MoneyBonus)
		for i, item in x203008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x203008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x203008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203008_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x203008_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x203008_g_DemandKill[1].id then 
       		    if num < x203008_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ģ��ľ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203008_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x203008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203008_OnItemChanged(sceneId, selfId, itemdataId)

end

