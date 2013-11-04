--��������

--MisDescBegin
x215002_g_ScriptId = 215002
x215002_g_MissionIdPre =132
x215002_g_MissionId = 133
x215002_g_MissionKind = 14
x215002_g_MissionLevel = 55
x215002_g_ScriptIdNext = {ScriptId = 215003 ,LV = 1 }
x215002_g_Name	="������"
x215002_g_Name2	="����ʹ" 
x215002_g_DemandItem ={}
x215002_g_noDemandKill ={}	

x215002_g_MissionName="��������"
x215002_g_MissionInfo="    ��Ϊ�Ҵ�����������ϣ�����ҵø����ʲô��Ϊ�ر���������ҵ���������������ɽ����������ɵľ����������������������еĹ�ԣ����һ�����ģ�Ĺ�����\n \n    ������������˵��ûʲô�ô��ˣ������͸���ɣ�������������ʹ������װ�����ʿ������������ĵĸм��ң���Ϊ�����ɣ�"  --��������
x215002_g_MissionTarget="    ������Ϊ�˸�л�㣬�����ľ����������͸��㣬��Ҫ��#G����ʹ#W���ñ�����"		
x215002_g_MissionComplete="    �����Ҽ����㡣"					--�������npc˵���Ļ�
--x215002_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x215002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215002_g_RadioItemBonus={}

--MisDescEnd
x215002_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215002_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215002_g_MissionName)
		     AddText(sceneId,x215002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x215002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215002_g_ScriptId, x215002_g_MissionId)
                

        elseif x215002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215002_g_MissionName)
                AddText(sceneId,x215002_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215002_g_ScriptId, x215002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215002_g_ScriptId, x215002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215002_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==15) then
        	if IsMissionHaveDone(sceneId, selfId, x215002_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x215002_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x215002_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x215002_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x215002_g_MissionId) > 0 then
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

function x215002_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x215002_g_MissionId, x215002_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x215002_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x215002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215002_g_MissionId)
	for i, item in x215002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215002_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215002_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215002_g_MissionId)
		AddExp(sceneId, selfId, x215002_g_ExpBonus)
		AddMoney(sceneId, selfId, x215002_g_MoneyBonus)
		for i, item in x215002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x215002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x215002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215002_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x215002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215002_OnItemChanged(sceneId, selfId, itemdataId)

end

