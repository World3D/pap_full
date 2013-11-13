--Ѱ�ұ����

--MisDescBegin
x223012_g_ScriptId = 223012
--x223012_g_MissionIdPre =83
x223012_g_MissionId = 304
x223012_g_MissionKind = 20
x223012_g_MissionLevel = 100
x223012_g_ScriptIdNext = {ScriptId = 223013 ,LV = 1 }
x223012_g_Name	="�ٲ�̨"
x223012_g_Name2	="�����" 
x223012_g_DemandItem ={}
--x223012_g_noDemandKill ={{id=301,num=1}}	

x223012_g_MissionName="Ѱ�ұ����"
x223012_g_MissionInfo="    ���ղ��˷������ȷ��Ѿ��ص���Ӫ�أ�����������������ܲ��ҵ��ǣ����ǵ���Ϊ����ʧ����ս���ϡ�\n \n    ������ֱ�������ң������ᱻ���˷�²����Ȼ���ڰ����ȴ����ǵľ�Ԯ��"  --��������
x223012_g_MissionInfo2="����һ��Ҫ�ҵ���������#G�����#W��"
x223012_g_MissionTarget="    #G�����#Wʧ�������ս���ϣ����п��ܶ���ĳ������Ҫ�ҵ�����"		
x223012_g_MissionComplete="    �㣬�����ٲ�̨��������ʿ��\n \n<һ������Ѫ�յ��˼����㣬���۷�������>  ���ڼ���ϣ���ˣ�����Ϊ�һ����������ط���"					--�������npc˵���Ļ�
--x223012_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x223012_g_MoneyBonus = 200
--�̶���Ʒ���������8��
x223012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223012_g_RadioItemBonus={}

--MisDescEnd
x223012_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x223012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223012_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223012_g_MissionName)
		     AddText(sceneId,x223012_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223012_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223012_g_ScriptId, x223012_g_MissionId)
                

        elseif x223012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223012_g_MissionName)
                AddText(sceneId,x223012_g_MissionInfo..GetName(sceneId, selfId)..x223012_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223012_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223012_g_ScriptId, x223012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223012_g_ScriptId, x223012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223012_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==17) then
        		if (GetName(sceneId,targetId)==x223012_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x223012_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x223012_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x223012_g_MissionId) > 0 then
				    	return 1
	        	            end
	        	end
	end
        return 0
	
end

--**********************************

--����

--**********************************

function x223012_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x223012_g_MissionId, x223012_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x223012_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x223012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223012_g_MissionId)
	for i, item in pairs(x223012_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223012_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223012_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223012_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x223012_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223012_g_MissionId)
		AddExp(sceneId, selfId, x223012_g_ExpBonus)
		AddMoney(sceneId, selfId, x223012_g_MoneyBonus)
		for i, item in pairs(x223012_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x223012_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x223012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223012_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x223012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x223012_OnItemChanged(sceneId, selfId, itemdataId)

end

