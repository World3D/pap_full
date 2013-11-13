--װˮ�ĺ�«

--MisDescBegin
x215006_g_ScriptId = 215006
x215006_g_MissionIdPre =136
x215006_g_MissionId = 137
x215006_g_MissionKind = 14
x215006_g_MissionLevel = 55
--x215006_g_ScriptIdNext = {ScriptId = 204003 ,LV = 1 }
x215006_g_Name	="ľ����С��"
x215006_g_Name2	="����ʦ" 
--x215006_g_DemandItem ={{id=13010003,num=1}}
--x215006_g_noDemandKill ={{id=301,num=1}}	

x215006_g_MissionName="װˮ�ĺ�«"
x215006_g_MissionInfo="�������ʥˮϴ����Щ�����˵����������һ��ֵ��������̾���¡�\n \n    ˮԴ��������кҩ�������е���֣����㵨���ٴ���ˣ�Ҳ���������ӵĽ��·Ŷ������������������ˡ���\n \n    ��˵�����ӣ������Ǹ��ոմӰ��̵���������������ħڭħ�������󣬴�λ������������������̫С���������ô��£�����\n \n    ʱ�䲻���ˣ������Щװ��ˮ�ĺ�«��ȥ������ʦ�ɡ�"  --��������
x215006_g_MissionTarget="    ��װ��ˮ�ĺ�«��ȥ��#G����ʦ#W�ɡ�"		
x215006_g_MissionComplete="    �����ڻ����ˡ��������챣�ӣ����¶�����������������Ϲ�ϵ��"					--�������npc˵���Ļ�
--x215006_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x215006_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215006_g_RadioItemBonus={}

--MisDescEnd
x215006_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215006_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215006_g_MissionName)
		     AddText(sceneId,x215006_g_MissionComplete)
		     AddMoneyBonus(sceneId, x215006_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215006_g_ScriptId, x215006_g_MissionId)
                

        elseif x215006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215006_g_MissionName)
                AddText(sceneId,x215006_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215006_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215006_g_ScriptId, x215006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215006_g_ScriptId, x215006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215006_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==15) then
        	if IsMissionHaveDone(sceneId,selfId, x215006_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x215006_g_Name) then
	         	        if IsHaveMission(sceneId,selfId, x215006_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x215006_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x215006_g_MissionId) > 0 then
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

function x215006_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x215006_g_MissionId, x215006_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x215006_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x215006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215006_g_MissionId)
	for i, item in pairs(x215006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215006_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215006_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215006_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215006_g_MissionId)
		AddExp(sceneId, selfId, x215006_g_ExpBonus)
		AddMoney(sceneId, selfId, x215006_g_MoneyBonus)
		for i, item in pairs(x215006_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x215006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x215006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215006_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x215006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215006_OnItemChanged(sceneId, selfId, itemdataId)

end

