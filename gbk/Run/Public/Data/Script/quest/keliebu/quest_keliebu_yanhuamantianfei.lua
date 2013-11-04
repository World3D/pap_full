--�̻������

--MisDescBegin
x202008_g_ScriptId = 202008
--x202008_g_MissionIdPre =40
x202008_g_MissionId = 127
x202008_g_MissionKind = 4
x202008_g_MissionLevel = 20
--x202008_g_ScriptIdNext = {ScriptId = 208005 ,LV = 1 }
x202008_g_Name	="�����" 
x202008_g_noDemandItem ={{id=13010041,num=1}}
--x202008_g_noDemandKill ={{id=301,num=1}}	

x202008_g_MissionName="�̻������"
x202008_g_MissionInfo="�������ˣ���ѡ�˺þã���������˧�����ҳ��ˣ�\n \n    �����ǵģ���Ȼ�ҳ��ǲ�����˧����ʾ������������ǻۣ��Һ��Ѹ�����ͣ�\n \n    ��������һö��Ѷ�ŵ��õ��̻��������Ϸ��Ľ��������������Ҫ�����Ƕദ������Ҫ��Ӯ��һ�ɣ����ۺܴ󡣴��Ѿ��ͽ��̸���ˣ����ǻ��������͵Ϯ���Ҳ���ֻҪ�����ö�̻����õ����µ�������ȼ���������Щ�����ͻ�͵Ϯ���Ҳ���"  --��������
x202008_g_MissionTarget="    ����#c0080C0�������̻�#W�����µ������ʹ�á�"		
x202008_g_MissionComplete="    ����̻������ƣ�����������ʱ�ķ緶��"					--�������npc˵���Ļ�
x202008_g_ContinueInfo="    �㻹û���̻�������ս�����ǿ�ͷ��������"
--������
x202008_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202008_g_RadioItemBonus={}

--MisDescEnd
x202008_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x202008_g_MissionId)
	if x202008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202008_g_MissionId) > 0 then
		if x202008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x202008_g_MissionName)
		     	AddText(sceneId,x202008_g_MissionComplete)
		     	AddMoneyBonus(sceneId, x202008_g_MoneyBonus)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x202008_g_ScriptId, x202008_g_MissionId)
                elseif x202008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202008_g_MissionName)
			AddText(sceneId,x202008_g_ContinueInfo)
			AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202008_g_MissionTarget) 
			AddText(sceneId,format("\n    ��ȼ������̻�   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     	EndEvent()
			DispatchEventList(sceneId, selfId, targetId)	
                end

        elseif x202008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202008_g_MissionName)
                AddText(sceneId,"    "..GetName(sceneId, selfId)..x202008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202008_g_ScriptId, x202008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202008_g_ScriptId, x202008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202008_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==2) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202008_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x202008_g_noDemandItem[1].id, x202008_g_noDemandItem[1].num )             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x202008_g_MissionId, x202008_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x202008_g_MissionName) 
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

function x202008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202008_g_MissionId)
	for i, item in x202008_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202008_g_MissionId)
		AddExp(sceneId, selfId, x202008_g_ExpBonus)
		AddMoney(sceneId, selfId, x202008_g_MoneyBonus)
		for i, item in x202008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		--CallScriptFunction( x202008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202008_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x202008_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202008_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	
end

function x202008_OnLeaveArea(sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x202008_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
end

function x202008_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x202008_OnItemChanged(sceneId, selfId, itemdataId)

end

