--��������

--MisDescBegin
x207001_g_ScriptId = 207001
--x207001_g_MissionIdPre =124
x207001_g_MissionId = 263
x207001_g_MissionKind = 18
x207001_g_MissionLevel = 75
x207001_g_ScriptIdNext = {ScriptId = 207002 ,LV = 1 }
x207001_g_Name	="����̨" 
x207001_g_Name2	="���" 
x207001_g_DemandItem ={}
--x207001_g_noDemandKill ={{id=301,num=1}}	

x207001_g_MissionName="��������"
x207001_g_MissionInfo="    ���ݳǼ�������Χ�������Ѿ�����Լ���ˣ��ù����£����ò��㡣\n \n    ���Ѿ�������λ���Ϸ����ι����֣�һ�����˽���������������Ϊ���ɹŴ�ʹ����ʹ�ι�Э�̣����������ɹŹ����ι��ʵ۵��ܺ�����������͵���վ������#G���#W��"  --��������
x207001_g_MissionTarget="    ����̨������ź��͵���վ��������ʹ�ι���#G���#W��"		
x207001_g_MissionComplete="    �������ˣ�"					--�������npc˵���Ļ�
--x207001_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x207001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207001_g_RadioItemBonus={}

--MisDescEnd
x207001_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207001_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207001_g_MissionName)
		     AddText(sceneId,x207001_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207001_g_ScriptId, x207001_g_MissionId)
                

        elseif x207001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207001_g_MissionName)
                AddText(sceneId,x207001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207001_g_ScriptId, x207001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207001_g_ScriptId, x207001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207001_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==7) then
        		if (GetName(sceneId,targetId)==x207001_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x207001_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x207001_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x207001_g_MissionId) > 0 then
				    	return 1
	        	            end
	        	end
	end
        return 0
	
end

--**********************************

--����

--**********************************

function x207001_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207001_g_MissionId, x207001_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207001_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x207001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207001_g_MissionId)
	for i, item in x207001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207001_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207001_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207001_g_MissionId)
		AddExp(sceneId, selfId, x207001_g_ExpBonus)
		AddMoney(sceneId, selfId, x207001_g_MoneyBonus)
		for i, item in x207001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207001_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x207001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207001_OnItemChanged(sceneId, selfId, itemdataId)

end

