--�����־�

--MisDescBegin
x223004_g_ScriptId = 223004
x223004_g_MissionIdPre =295
x223004_g_MissionId = 296
x223004_g_MissionKind = 20
x223004_g_MissionLevel = 100
--x223004_g_ScriptIdNext = {ScriptId = 208005 ,LV = 1 }
x223004_g_Name	="�ɸ�" 
x223004_g_Name2	="�ζ�" 
x223004_g_noDemandItem ={{id=13010066,num=1}}
--x223004_g_noDemandKill ={{id=301,num=1}}	

x223004_g_MissionName="�����־�"
x223004_g_MissionInfo="    һʱ������ǻ��������Ͻ���˳����ľ��ӣ������µ�̽���������ⵤ����һ��ӵ���������Ԯ��\n \n    "  --��������
x223004_g_MissionInfo2="�����ǵ�Ԯ���������ˣ�����������·�����������ֻ��Ҫ���Ұ�ըҩ����С·�ľ�ʯ��������������ĵ��˺ܶ࣬��ҪС�ģ�"
x223004_g_MissionTarget="    ��#c0080C0�˳�����ͷ#W�ҵ�#G����ĳǱ�#W�ϣ�Ȼ��������Ϣ����#G�ζ�#W��"		
x223004_g_MissionComplete="    �ɸ��Ѿ������Ӣ�±��ָ������ҡ�����ս���ϣ�����ʤ������������仰��������ϵõ��˺ܺõ�֤������ȡ��Ӧ�õĽ����ɣ�"					--�������npc˵���Ļ�
x223004_g_ContinueInfo="    ս�ֺܽ�����ʲô����Ҫ������"
--������
x223004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x223004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223004_g_RadioItemBonus={}

--MisDescEnd
x223004_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x223004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x223004_g_MissionId)
	if x223004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223004_g_MissionId) > 0 then
		if x223004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x223004_g_MissionName)
		     	AddText(sceneId,x223004_g_MissionComplete)
		     	AddMoneyBonus(sceneId, x223004_g_MoneyBonus)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x223004_g_ScriptId, x223004_g_MissionId)
                elseif x223004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223004_g_MissionName)
			AddText(sceneId,x223004_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223004_g_MissionTarget) 
			AddText(sceneId,format("\n    �Ѱ˳�����ͷ���ڳǱ���   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     	EndEvent()
			DispatchEventList(sceneId, selfId, targetId)	
                end

        elseif x223004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223004_g_MissionName)
                AddText(sceneId,x223004_g_MissionInfo..GetName(sceneId, selfId)..x223004_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223004_g_ScriptId, x223004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223004_g_ScriptId, x223004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223004_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==17) then
        	if IsMissionHaveDone(sceneId, selfId, x223004_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x223004_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x223004_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x223004_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x223004_g_MissionId) > 0 then
				    	return 1
	        	            end
	        	end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x223004_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x223004_g_noDemandItem[1].id, x223004_g_noDemandItem[1].num )             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x223004_g_MissionId, x223004_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x223004_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			AddItemListToHuman(sceneId,selfId) 
	        else                                                             
		     BeginEvent(sceneId)                                      
		     AddText(sceneId,"��Ʒ����������������������")                    
		     EndEvent(sceneId)                                        
		     DispatchMissionTips(sceneId,selfId)                      
	        end           	        	                                    
	     
end



--**********************************

--����

--**********************************

function x223004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223004_g_MissionId)
	for i, item in x223004_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223004_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223004_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x223004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223004_g_MissionId)
		AddExp(sceneId, selfId, x223004_g_ExpBonus)
		AddMoney(sceneId, selfId, x223004_g_MoneyBonus)
		for i, item in x223004_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		--CallScriptFunction( x223004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223004_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x223004_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223004_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	
end

function x223004_OnLeaveArea(sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x223004_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
end

function x223004_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x223004_OnItemChanged(sceneId, selfId, itemdataId)

end

