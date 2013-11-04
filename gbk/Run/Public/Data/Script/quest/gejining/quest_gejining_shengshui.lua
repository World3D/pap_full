--ʥˮ

--MisDescBegin
x215004_g_ScriptId = 215004
--x215004_g_MissionIdPre =40
x215004_g_MissionId = 135
x215004_g_MissionKind = 14
x215004_g_MissionLevel = 55
x215004_g_ScriptIdNext = {ScriptId = 215005 ,LV = 1 }
x215004_g_Name	="����ʦ" 
x215004_g_noDemandItem ={{id=13010027,num=1}}
--x215004_g_noDemandKill ={{id=301,num=1}}	

x215004_g_MissionName="ʥˮ"
x215004_g_MissionInfo="        ���ŵ���һ��Ѫ�ȵ�ζ��������������ʱ����������������簲��������\n \n    �缲��Ŀǰ�ѱ�ǰ��Ͷ���������ľ���ռ�ݣ�����İ��ճ������ǵķ�й������ЩŮ���ǡ�����\n \n    ������������ԭ�����ǵ�����ɣ�\n \n    ��Щ�˵ļȲ��Ǳ������еİ�ȫ��Ҳ����Ϊ�����˻�����ģ�۹������Ǻ����ɾ�����ɱ��ǰ��Ѱ�ұ��ӵġ�\n \n    ����������������ƿʥˮ�������԰����ǿ���ס�Լ�������㽫�����ڳ������İɣ����ʰ�ɢ�����κ�һ�����䡣"  --��������
x215004_g_MissionTarget="    ʥˮ����ȴ��а�#G����ʦ#WҪ���ʥˮ���ڳ��е��м䡣"		
x215004_g_MissionComplete="    �����ˣ�"					--�������npc˵���Ļ�
x215004_g_ContinueInfo="    ʥ���ʥˮ��һ�������������ѵģ�"
--������
x215004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215004_g_RadioItemBonus={}

--MisDescEnd
x215004_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x215004_g_MissionId)
	if x215004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215004_g_MissionId) > 0 then
		if x215004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x215004_g_MissionName)
		     	AddText(sceneId,x215004_g_MissionComplete)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x215004_g_ScriptId, x215004_g_MissionId)
                elseif x215004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x215004_g_MissionName)
			AddText(sceneId,x215004_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x215004_g_MissionTarget) 
			AddText(sceneId,format("    ����ʥˮ   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     	EndEvent()
			DispatchEventList(sceneId, selfId, targetId)	
                end

        elseif x215004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x215004_g_MissionName)
                AddText(sceneId,x215004_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215004_g_ScriptId, x215004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215004_g_ScriptId, x215004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215004_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==15) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x215004_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x215004_g_noDemandItem[1].id, x215004_g_noDemandItem[1].num )             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x215004_g_MissionId, x215004_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x215004_g_MissionName) 
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

function x215004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215004_g_MissionId)
	for i, item in x215004_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215004_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x215004_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215004_g_MissionId)
		AddExp(sceneId, selfId, x215004_g_ExpBonus)
		AddMoney(sceneId, selfId, x215004_g_MoneyBonus)
		for i, item in x215004_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		CallScriptFunction( x215004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215004_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x215004_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x215004_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	
end

function x215004_OnLeaveArea(sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x215004_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
end

function x215004_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x215004_OnItemChanged(sceneId, selfId, itemdataId)

end

