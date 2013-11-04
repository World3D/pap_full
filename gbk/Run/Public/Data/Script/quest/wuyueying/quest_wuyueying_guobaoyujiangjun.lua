--�����񽫾�

--MisDescBegin
x217008_g_ScriptId = 217008
x217008_g_MissionIdPre =179
x217008_g_MissionId = 180
x217008_g_MissionKind = 6
x217008_g_MissionLevel = 30
x217008_g_ScriptIdNext = {ScriptId = 217009 ,LV = 1 }
x217008_g_Name	="����"
x217008_g_Name2	="������" 
x217008_g_DemandItem ={}
--x217008_g_noDemandKill ={{id=301,num=1}}	

x217008_g_MissionName="�����񽫾�"
x217008_g_MissionInfo="    ��л���ϴ�Ϊ���Ǵݻ������ǵ�Ͷʯ�����ܸ����ټ����㡣\n \n    ���������ص����������ģ�û���˱������Ϥ��е���ĵ��Σ�����Ҫ��Ϊ������һ�����顣\n \n    �ҵ�̽�Ӹ����ң�ͳ����е���Ľ��������һ���ǳ��вŻ����ˣ�����ȴ��������־���Һ�ϣ��������������Ϊ���Ǵ��ɹŹ�Ч����\n \n    Ϊ�˱�ʾ���ǵ���ϣ���Ҫ����Ӣ�µ�սʿȥӭ���������սʿ������Ī������Ҫ��ȫ�İ������Ҵ�������"  --��������
x217008_g_MissionTarget="    ��#G��е��#W�ҵ�#G������#W������"		
x217008_g_MissionComplete="    ����ʲô���飿"					--�������npc˵���Ļ�
--x217008_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x217008_g_MoneyBonus = 200
--�̶���Ʒ���������8��
x217008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217008_g_RadioItemBonus={}

--MisDescEnd
x217008_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x217008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217008_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217008_g_MissionName)
		     AddText(sceneId,x217008_g_MissionComplete)
		     AddMoneyBonus(sceneId, x217008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217008_g_ScriptId, x217008_g_MissionId)
                

        elseif x217008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217008_g_MissionName)
                AddText(sceneId,x217008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217008_g_ScriptId, x217008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217008_g_ScriptId, x217008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217008_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==20) then
        		if (GetName(sceneId,targetId)==x217008_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x217008_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x217008_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x217008_g_MissionId) > 0 then
				    	return 1
	        	            end
	        	end
	end
        return 0
	
end

--**********************************

--����

--**********************************

function x217008_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x217008_g_MissionId, x217008_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x217008_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x217008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217008_g_MissionId)
	for i, item in x217008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217008_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217008_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x217008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217008_g_MissionId)
		AddExp(sceneId, selfId, x217008_g_ExpBonus)
		AddMoney(sceneId, selfId, x217008_g_MoneyBonus)
		for i, item in x217008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x217008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x217008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217008_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x217008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217008_OnItemChanged(sceneId, selfId, itemdataId)

end

