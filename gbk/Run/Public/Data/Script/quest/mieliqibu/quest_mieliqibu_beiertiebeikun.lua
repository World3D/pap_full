--�ö�������

--MisDescBegin
x201002_g_ScriptId = 201002
x201002_g_MissionIdPre =83
x201002_g_MissionId = 84
x201002_g_MissionKind = 2
x201002_g_MissionLevel = 10
--x201002_g_ScriptIdNext = {ScriptId = 205002 ,LV = 1 }
x201002_g_Name	="��ľ��" 
x201002_g_Name2	="������" 
x201002_g_DemandItem ={}
--x201002_g_noDemandKill ={{id=301,num=1}}	

x201002_g_MissionName="�ö�������"
x201002_g_MissionInfo="     ���¸ҵĻ��--�����������ҵ����ö��������Ǳ����ں��Ѻ��¿���Ӫ����ƺ��е��鷳���Һܵ��ģ��㾡���ȥ��#G������#W��ϣ�"  --��������
x201002_g_MissionTarget="    ��#R���Ѻ��¿�#W����Ӫ�غ�#G������#aB{������_1}[226,39]#aE#W��ϡ�"		
x201002_g_MissionComplete="    ̫���ˣ��������ڵȵ������ˣ�"					--�������npc˵���Ļ�
--x201002_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"

--�Զ�Ѱ·�Ķ���
x201002_g_AutoFindPath =  {{sid=1,x=226,z=39,speak=1}}

--������
x201002_g_MoneyBonus = 0
--�̶���Ʒ���������8��
x201002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201002_g_RadioItemBonus={}
--MisDescEnd
x201002_g_ExpBonus = 22
--**********************************

--������ں���

--**********************************

function x201002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201002_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201002_g_MissionName)
		     AddText(sceneId,x201002_g_MissionComplete)
		     --AddMoneyBonus(sceneId, x201001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201002_g_ScriptId, x201002_g_MissionId)
                

        elseif x201002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201002_g_MissionName)
                AddText(sceneId,x201002_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201002_g_MissionTarget) 
		--AddMoneyBonus(sceneId, x201002_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x201002_g_ScriptId, x201002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201002_g_ScriptId, x201002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201002_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==1) then
        	if IsMissionHaveDone(sceneId, selfId, x201002_g_MissionIdPre) > 0 then
	        	if (GetName(sceneId,targetId)==x201002_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x201002_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x201002_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x201002_g_MissionId) > 0 then
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

function x201002_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x201002_g_MissionId, x201002_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x201002_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x201002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201002_g_MissionId)
	for i, item in x201002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201002_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201002_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201002_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x201002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x201002_g_MissionId)
		AddExp(sceneId, selfId, x201002_g_ExpBonus)
		AddMoney(sceneId, selfId, x201002_g_MoneyBonus)
		for i, item in x201002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x201002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x201002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	
	
end



--**********************************

--ɱ����������

--**********************************

function x201002_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x201002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201002_OnItemChanged(sceneId, selfId, itemdataId)

end

