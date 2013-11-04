--��������

--MisDescBegin
x207008_g_ScriptId = 207008
x207008_g_MissionIdPre =269
x207008_g_MissionId = 270
x207008_g_MissionKind = 18
x207008_g_MissionLevel = 75
x207008_g_ScriptIdNext = {ScriptId = 207009 ,LV = 1 }
x207008_g_Name	="�ٲ�̨" 
x207008_g_Name2	="Ү�ɳ���" 
x207008_g_noDemandItem ={}
--x207008_g_noDemandKill ={{id=301,num=1}}	

x207008_g_MissionName="��������"
x207008_g_MissionInfo="    ���ǵ������Ѿ��������꾩�ĳ��ţ�������Ԫ˧����ɱ��δ�����ߵĽ�����࣬�����������뽵��\n \n    �����ٵ���͢ȥ��#GҮ�ɳ���#W���������������ǣ�"  --��������
x207008_g_MissionTarget="    #G�ٲ�̨#W����Ҫ�㵽��͢��#GҮ�ɳ���#W���������������ǡ�"		
x207008_g_MissionComplete="    ��֪���ˣ�"					--�������npc˵���Ļ�
x207008_g_ContinueInfo="    ����Ү�ɳ�������"
x207008_g_ContinueInfo2="     �ŵ��ٲ�̨����������������ǣ�����ҹ��ȥ��Ȱ�󺹣���֪��������ϵ��ͬ��Ź��꾩�İ��ա�\n \n    �����������̣������ٲ�̨��ֻ�ܴ�������һ�����Ź��������գ������뽵�Ľ��Ԫ˧�����͵���������"
--������
x207008_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207008_g_RadioItemBonus={}

--MisDescEnd
x207008_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x207008_g_MissionId)
	if x207008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207008_g_MissionId) > 0 then
		if x207008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x207008_g_MissionName)
		     	AddText(sceneId,x207008_g_MissionComplete)
		     	AddMoneyBonus(sceneId, x207008_g_MoneyBonus)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207008_g_ScriptId, x207008_g_MissionId)
                end
                if x207008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	if (GetName(sceneId,targetId)==x207008_g_Name) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x207008_g_MissionName)
				AddText(sceneId,x207008_g_ContinueInfo)
				AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x207008_g_MissionTarget) 
				AddText(sceneId,format("\n    ��Ү�ɳ�����������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
			if (GetName(sceneId,targetId)==x207008_g_Name2) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x207008_g_MissionName)
				AddText(sceneId,x207008_g_ContinueInfo2)
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				BeginEvent(sceneId)
				AddText(sceneId,format("��Ү�ɳ�����������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
		     		DispatchMissionTips(sceneId, selfId)
			end
                		
                end

        elseif x207008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207008_g_MissionName)
                AddText(sceneId,x207008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207008_g_ScriptId, x207008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207008_g_ScriptId, x207008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207008_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==7) then
        	if IsMissionHaveDone(sceneId, selfId, x207008_g_MissionIdPre) > 0 then
        	misIndex = GetMissionIndexByID(sceneId,selfId,x207008_g_MissionId)
        		if (GetName(sceneId,targetId)==x207008_g_Name) then
        	            		return 1
        		end
			if (GetName(sceneId,targetId)==x207008_g_Name2) then
			   	 if IsHaveMission(sceneId,selfId, x207008_g_MissionId) > 0 then
			    		if GetMissionParam(sceneId,selfId,misIndex,0) == 0 then
			    			return 1
			    		end
        	           	 end
        		end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207008_OnAccept(sceneId, selfId)

	                                                  
	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207008_g_MissionId, x207008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
	
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x207008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207008_g_MissionId)
	for i, item in x207008_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207008_g_MissionId)
		AddExp(sceneId, selfId, x207008_g_ExpBonus)
		AddMoney(sceneId, selfId, x207008_g_MoneyBonus)
		for i, item in x207008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		CallScriptFunction( x207008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207008_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x207008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207008_OnItemChanged(sceneId, selfId, itemdataId)

end

