--�𶡵ı�Ӧ

--MisDescBegin
x217005_g_ScriptId = 217005
x217005_g_MissionIdPre =176
x217005_g_MissionId = 177
x217005_g_MissionKind = 6
x217005_g_MissionLevel = 30
x217005_g_ScriptIdNext = {ScriptId = 217006 ,LV = 1 }
x217005_g_Name	="������" 
x217005_g_DemandItem ={}
x217005_g_DemandKill ={{id=453,num=10}}

x217005_g_MissionName="�𶡵ı�Ӧ"
x217005_g_MissionInfo="    ���������ǵ������ߣ������Ǵ��ԭ���ж�ÿ���걻��ɱһ�Σ����ֲ����˵����о������Ӧ���ܵ��ͷ���\n \n    <����ŭ�ĺ��ţ�����˫�۱���쳣�ķ��>��������Щ�����õĹ��ޣ����ǲ�Ӧ����Թ�κ��ˣ���Ϊ����û���ʸ񡭡�\n \n    "  --��������
x217005_g_MissionInfo2="����������ǰ������Щ�����#R����ӳ�#W���𣿾�������ɱ��������������Ů�˵�ʱ����������¿��������ԶҲ�������ǣ�ɱ�����ǣ�һ��Ҳ�����������ˣ�"
x217005_g_MissionTarget="    ����#G����#Wһ����10��#R����ӳ�#W������#G������#W������"		                                                                                               
x217005_g_MissionComplete="    ������ģ����Ǵ�����İ���"					--�������npc˵���Ļ�
x217005_g_ContinueInfo="    ��Ҫ�Ź���Щ����ӳ���ɱ�����ǣ��������ҡ�"
--������
x217005_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x217005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217005_g_RadioItemBonus={}

--MisDescEnd
x217005_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x217005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217005_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x217005_g_MissionId)
		if x217005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x217005_g_MissionName)
			AddText(sceneId,x217005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x217005_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������ӳ�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217005_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x217005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217005_g_MissionName)
		     AddText(sceneId,x217005_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217005_g_ScriptId, x217005_g_MissionId)
                end

        elseif x217005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217005_g_MissionName)
                AddText(sceneId,x217005_g_MissionInfo..GetName(sceneId, selfId)..x217005_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217005_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217005_g_ScriptId, x217005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217005_g_ScriptId, x217005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217005_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==20) then
		if IsMissionHaveDone(sceneId, selfId, x217005_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217005_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x217005_g_MissionId, x217005_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x217005_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x217005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217005_g_MissionId)
	for i, item in x217005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217005_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x217005_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217005_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x217005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217005_g_MissionId)
		AddExp(sceneId, selfId, x217005_g_ExpBonus)
		AddMoney(sceneId, selfId, x217005_g_MoneyBonus)
		for i, item in x217005_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x217005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x217005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217005_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x217005_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x217005_g_DemandKill[1].id then 
       		    if num < x217005_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������ӳ�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x217005_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x217005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217005_OnItemChanged(sceneId, selfId, itemdataId)

end

