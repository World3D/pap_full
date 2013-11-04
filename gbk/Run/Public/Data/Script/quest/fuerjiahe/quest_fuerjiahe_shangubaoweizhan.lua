--ɽ�Ȱ�Χս

--MisDescBegin
x223000_g_ScriptId = 223000
--x223000_g_MissionIdPre =83
x223000_g_MissionId = 292
x223000_g_MissionKind = 20
x223000_g_MissionLevel = 100
--x223000_g_ScriptIdNext = {ScriptId = 205002 ,LV = 1 }
x223000_g_Name	="�ζ�"
x223000_g_Name2	="�ɸ�" 
x223000_g_DemandItem ={}
--x223000_g_noDemandKill ={{id=301,num=1}}	

x223000_g_MissionName="ɽ�Ȱ�Χս"
x223000_g_MissionInfo="    ���ǵ�ʹ�����������������ղ���������������Ӻӳ�Ϊ�Ҵ��ɹŹ������ĺ�����\n \n    ��������ͳ˧����ݣ�����#G�ɸ�#WΪ�����ղ���ȷ棬����������ֶΰ��ղ���ľ��ӷָ��Χ���ղ��˵������˳�������Χ�ڶ����ɽ���У�"  --��������
x223000_g_MissionInfo2="�����������ٶ�ȥ�ɸ����ﱨ������"
x223000_g_MissionTarget="    ��#G�ɸ�#W��������"		
x223000_g_MissionComplete="    ��ʿ������˵���㣬�ҵĸ������׸��ҽ�����Ĺ��£����ѵĻ���������ɱ�����֮��ɡ�Ŀǰ�������濪ս����Ҫ����������������ʿ���������չ�ֽŵ�ʱ��"					--�������npc˵���Ļ�
--x223000_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x223000_g_MoneyBonus = 200
--�̶���Ʒ���������8��
x223000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223000_g_RadioItemBonus={}

--MisDescEnd
x223000_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x223000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223000_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223000_g_MissionName)
		     AddText(sceneId,x223000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223000_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223000_g_ScriptId, x223000_g_MissionId)
                

        elseif x223000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223000_g_MissionName)
                AddText(sceneId,x223000_g_MissionInfo..GetName(sceneId, selfId)..x223000_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223000_g_ScriptId, x223000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223000_g_ScriptId, x223000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223000_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==17) then
        		if (GetName(sceneId,targetId)==x223000_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x223000_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x223000_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x223000_g_MissionId) > 0 then
				    	return 1
	        	            end
	        	end
	end
        return 0
	
end

--**********************************

--����

--**********************************

function x223000_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x223000_g_MissionId, x223000_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x223000_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x223000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223000_g_MissionId)
	for i, item in x223000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223000_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223000_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x223000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223000_g_MissionId)
		AddExp(sceneId, selfId, x223000_g_ExpBonus)
		AddMoney(sceneId, selfId, x223000_g_MoneyBonus)
		for i, item in x223000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x223000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x223000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223000_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x223000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x223000_OnItemChanged(sceneId, selfId, itemdataId)

end

