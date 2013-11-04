--�Ի�о�

--MisDescBegin
x226000_g_ScriptId = 226000
--x226000_g_MissionIdPre =40
x226000_g_MissionId = 337
x226000_g_MissionKind = 23
x226000_g_MissionLevel = 115
x226000_g_ScriptIdNext = {ScriptId = 226001 ,LV = 1 }
x226000_g_Name	="�����" 
x226000_g_DemandItem ={}
x226000_g_noDemandKill ={}	

x226000_g_MissionName="�Ի�о�"
x226000_g_MissionInfo="    ��������쵰�ϵ��ˣ��������ȫ�����յ����ǵİ�ΧȦ���ˣ������˶����Щŷ��������ͻᱻ���������ˡ�\n \n    Ϊ�˷�ֹ������Щ�������ܣ�������Ҫ��Щ�ֽţ������ǿ��������ͬ����³���\n \n    ��ȥ���Ӱ����ѿݲݶѶ���ȼ��������ס���˲��������ߡ�"  --��������
x226000_g_MissionTarget="    Ϊ#G�����#W��ȼ�Ӱ�����5���ݲݶѡ�"		
x226000_g_MissionComplete="    �ܺã����ڵ��˵Ĳ�������ɵ��һ���嵽���ǵİ�ΧȦ��"					--�������npc˵���Ļ�
x226000_g_ContinueInfo="    ʱ����ȣ�һ��Ҫ�ڵ��˲�������֮ǰ�Ѳ��϶ѵ�ȼ��"
--������
x226000_g_MoneyBonus = 600
--�̶���Ʒ���������8��
x226000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x226000_g_RadioItemBonus={}

--MisDescEnd
x226000_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x226000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x226000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x226000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x226000_g_MissionId)
			if x226000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x226000_g_MissionName)
				AddText(sceneId,x226000_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x226000_g_MissionTarget) 
				AddText(sceneId,format("\n    ��ȼ�ݲݶ�   %d/5", GetMissionParam(sceneId,selfId,misIndex,0) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
	
			     
	                if x226000_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x226000_g_MissionName)
			     AddText(sceneId,x226000_g_MissionComplete)
			     AddMoneyBonus(sceneId, x226000_g_MoneyBonus)
			     EndEvent()
	                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x226000_g_ScriptId, x226000_g_MissionId)
	                end
	     

        elseif x226000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x226000_g_MissionName)
                AddText(sceneId,x226000_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x226000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x226000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x226000_g_ScriptId, x226000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x226000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x226000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x226000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x226000_g_ScriptId, x226000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x226000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x226000_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==22) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x226000_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x226000_g_MissionId, x226000_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x226000_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x226000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x226000_g_MissionId)
	for i, item in x226000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x226000_CheckSubmit( sceneId, selfId, targetId)

	misIndex = GetMissionIndexByID(sceneId,selfId,x226000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 5 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x226000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		DelMission( sceneId, selfId, x226000_g_MissionId ) 
				MissionCom( sceneId,selfId, x226000_g_MissionId )
				AddExp(sceneId, selfId, x226000_g_ExpBonus)   
	      AddMoney(sceneId, selfId, x226000_g_MoneyBonus)
	  CallScriptFunction( x226000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	

	
end



--**********************************

--ɱ����������

--**********************************

function x226000_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x226000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x226000_OnItemChanged(sceneId, selfId, itemdataId)

end

