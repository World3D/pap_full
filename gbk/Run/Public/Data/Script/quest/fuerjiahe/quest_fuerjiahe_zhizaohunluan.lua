--�������

--MisDescBegin
x223007_g_ScriptId = 223007
--x223007_g_MissionIdPre =41
x223007_g_MissionId = 299
x223007_g_MissionKind = 20
x223007_g_MissionLevel = 100
x223007_g_ScriptIdNext = {ScriptId = 223008 ,LV = 1 }
x223007_g_Name	="�ζ�" 
x223007_g_DemandItem ={}
x223007_g_DemandKill ={{id=444,num=30}}

x223007_g_MissionName="�������"
x223007_g_MissionInfo="    �ղ��˵�����˳����Ѿ����������ڶ����ɽ���У����ǵĲ���Ԯ���Ѿ���������������˲�С��ѹ����\n \n    ��������ȥ������ղ�Ӫ�أ�ɱ��30��#R�ղ�ʿ��#W�����������Щ���ң�����ɸ�İ�Χս��"  --��������
x223007_g_MissionTarget="    #G�ζ�#W���㵽����#G�ղ�Ӫ��#Wɱ��30��#R�ղ�ʿ��#W��"		                                                                                               
x223007_g_MissionComplete="    ������������Һܸ��ˣ����������ԣ����ǵļƻ���û�гɹ�����Щ�ղ�ʿ���ǳ����侲����û�л��ҵļ���"					--�������npc˵���Ļ�
x223007_g_ContinueInfo="    ����Ҫǣ��ס������ղ��ˣ������ɸ����˳���ļ���˳�����"
--������
x223007_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x223007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223007_g_RadioItemBonus={}

--MisDescEnd
x223007_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x223007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x223007_g_MissionId)
		if x223007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223007_g_MissionName)
			AddText(sceneId,x223007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223007_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���ղ�ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223007_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x223007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223007_g_MissionName)
		     AddText(sceneId,x223007_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223007_g_ScriptId, x223007_g_MissionId)
                end

        elseif x223007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223007_g_MissionName)
                AddText(sceneId,x223007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223007_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223007_g_ScriptId, x223007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223007_g_ScriptId, x223007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==17) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x223007_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x223007_g_MissionId, x223007_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x223007_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x223007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223007_g_MissionId)
	for i, item in x223007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x223007_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223007_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x223007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223007_g_MissionId)
		AddExp(sceneId, selfId, x223007_g_ExpBonus)
		AddMoney(sceneId, selfId, x223007_g_MoneyBonus)
		for i, item in x223007_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x223007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x223007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x223007_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x223007_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x223007_g_DemandKill[1].id then 
       		    if num < x223007_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ղ�ʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223007_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x223007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x223007_OnItemChanged(sceneId, selfId, itemdataId)

end

