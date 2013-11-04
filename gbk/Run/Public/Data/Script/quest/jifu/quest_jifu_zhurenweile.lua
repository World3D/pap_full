--����Ϊ��

--MisDescBegin
x225000_g_ScriptId = 225000
--x225000_g_MissionIdPre =41
x225000_g_MissionId = 322
x225000_g_MissionKind = 22
x225000_g_MissionLevel = 110
x225000_g_ScriptIdNext = {ScriptId = 225001 ,LV = 1 }
x225000_g_Name	="�ٲ�̨" 
x225000_g_DemandItem ={}
x225000_g_DemandKill ={{id=435,num=30}}

x225000_g_MissionName="����Ϊ��"
x225000_g_MissionInfo="    ��������Ľ��������Ǿ���#G�����Ǵ����#W�����������﷢����һ���ǳ���Ȥ���¡���Щ�������ܵ���������ȥѰ���������ıӻ�����Խ��Խ�ࡣ������������װ�����ˣ����澪����ֵ�������Ȼϣ���ڽ���ʥ�ظ����ҵ���ȫ֮�أ��ܶ������Ͻ��õ�Χǽ�����ݶ���ȥѰ�ұ��������������ǵ�����̫�࣬�����������������򲻿��ظ���������ѹ�������ӵ���ڽ���������ˡ�\n \n    ��Ȼ��������ô�������ǵ����������ǾͰ�����ǣ�������ֱ��ȥ�����ǵ����ɡ�ȥ����ɱ��30��#RѰ��ӻ���#W��"  --��������
x225000_g_MissionTarget="    #G�ٲ�̨#W���㵽#G�����Ǵ����#W����ɱ��30��#RѰ��ӻ���#W��"		                                                                                               
x225000_g_MissionComplete="    ���ñ���ͽ��ѹ���ˣ����������������Ѿ������ǵ��������ˡ�"					--�������npc˵���Ļ�
x225000_g_ContinueInfo="    �ܰ������Ǽ����Լ��������Һܸ��ˡ���������ϲ������Ϊ�֡�"
--������
x225000_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x225000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x225000_g_RadioItemBonus={}

--MisDescEnd
x225000_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x225000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x225000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x225000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x225000_g_MissionId)
		if x225000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x225000_g_MissionName)
			AddText(sceneId,x225000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x225000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��Ѱ��ӻ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225000_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x225000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x225000_g_MissionName)
		     AddText(sceneId,x225000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x225000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x225000_g_ScriptId, x225000_g_MissionId)
                end

        elseif x225000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x225000_g_MissionName)
                AddText(sceneId,x225000_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x225000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x225000_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x225000_g_ScriptId, x225000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x225000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x225000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x225000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x225000_g_ScriptId, x225000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x225000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x225000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x225000_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==16) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x225000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x225000_g_MissionId, x225000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x225000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x225000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x225000_g_MissionId)
	for i, item in x225000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x225000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x225000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x225000_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x225000_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x225000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x225000_g_MissionId)
		AddExp(sceneId, selfId, x225000_g_ExpBonus)
		AddMoney(sceneId, selfId, x225000_g_MoneyBonus)
		for i, item in x225000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x225000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x225000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x225000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x225000_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x225000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x225000_g_DemandKill[1].id then 
       		    if num < x225000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��Ѱ��ӻ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x225000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x225000_OnItemChanged(sceneId, selfId, itemdataId)

end

