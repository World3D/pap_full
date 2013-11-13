--��һ�ΰ���

--MisDescBegin
x215013_g_ScriptId = 215013
x215013_g_MissionIdPre =143
x215013_g_MissionId = 144
x215013_g_MissionKind = 14
x215013_g_MissionLevel = 55
--x215013_g_ScriptIdNext = {ScriptId = 215003 ,LV = 1 }
x215013_g_Name	="������"
x215013_g_Name2	="�ɼ�˼��" 
--x215013_g_DemandItem ={{id=13010003,num=1}}
--x215013_g_noDemandKill ={{id=301,num=1}}	

x215013_g_MissionName="��һ�ΰ���"
x215013_g_MissionInfo="    �ҶԲ���󺹣��󺹷���Ϊ����¹٣�����ϰ����������ƣ����������ȣ�����ȴһʱ����Ҫ��������̣���һ������ʧ���ˣ��������أ�\n \n    ��Ȼ������ƴ��ͻΧ���������ǡ�����Щ����²�Ľ�ʿ�ǣ�һ����������������ľ׮�ϣ��ǲҽ���������һ���Ӷ��޷�������\n \n    ��ֻ��һ���Ĺٵ��ϣ���������\n \n    �Һ�ʹ�࣬���������ɹŴ����һ��ս��ʧ�ܣ������ҵĴ���Ȼ��û������ң�����������ʮ�ֲ�����������Ҫ��������ˣ��ش��ԭȥ����Ӧ�������¡�������Ұ��������ȥ���󺹣������ռ�������"  --��������
x215013_g_MissionTarget="    ���������������Ҫ�ش��ԭȥ�ˣ�����������Ž���#G�ɼ�˼��#W��"		
x215013_g_MissionComplete="    ���ܸ��ܵ����ܵ�ʹ�࣡���²��ܹ��������������˲���������³��ȥ���������֣�������"					--�������npc˵���Ļ�
--x215013_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x215013_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215013_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215013_g_RadioItemBonus={}

--MisDescEnd
x215013_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215013_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215013_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215013_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215013_g_MissionName)
		     AddText(sceneId,x215013_g_MissionComplete)
		     AddMoneyBonus(sceneId, x215013_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215013_g_ScriptId, x215013_g_MissionId)
                

        elseif x215013_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215013_g_MissionName)
                AddText(sceneId,x215013_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215013_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215013_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215013_g_ScriptId, x215013_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215013_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215013_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215013_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215013_g_ScriptId, x215013_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215013_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215013_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215013_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==15) then
        	if IsMissionHaveDone(sceneId, selfId, x215013_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x215013_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x215013_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x215013_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x215013_g_MissionId) > 0 then
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

function x215013_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x215013_g_MissionId, x215013_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x215013_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x215013_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215013_g_MissionId)
	for i, item in pairs(x215013_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215013_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215013_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215013_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215013_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215013_g_MissionId)
		AddExp(sceneId, selfId, x215013_g_ExpBonus)
		AddMoney(sceneId, selfId, x215013_g_MoneyBonus)
		for i, item in pairs(x215013_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x215013_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x215013_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215013_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x215013_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215013_OnItemChanged(sceneId, selfId, itemdataId)

end

