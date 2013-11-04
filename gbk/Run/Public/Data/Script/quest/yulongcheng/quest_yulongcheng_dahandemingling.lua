--�󺹵�����

--MisDescBegin
x208004_g_ScriptId = 208004
--x208004_g_MissionIdPre =40
x208004_g_MissionId = 58
x208004_g_MissionKind = 12
x208004_g_MissionLevel = 60
x208004_g_ScriptIdNext = {ScriptId = 208005 ,LV = 1 }
x208004_g_Name	="�ܱ�" 
x208004_g_Name2	="�ٲ�̨" 
--x208004_g_DemandItem ={{id=13010003,num=1}}
--x208004_g_noDemandKill ={{id=301,num=1}}	

x208004_g_MissionName="�󺹵�����"
x208004_g_MissionInfo="���ܸ����ٴμ����㣡�ܾ�û�и���һ������⣬��ںȾ��ˣ�\n \n    �����������������һ�ˣ���#G�ٲ�̨#W�����������ţ����������Ϊ��450�����������˱���Ϊ��������Щ�Դ��̰�����ˣ�һ�����ܲ�������ɱ�����л�����ģ���ˣ�\n \n    ��ȥ�ٻأ���׼�������̾Ƶ�����"  --��������
x208004_g_MissionTarget="    ��#G�ٲ�̨#W�����������ţ�Ȼ�������#G�ܱ�#W������"		
x208004_g_MissionComplete="    <�ܱ�����ϵļ��������Լ����󣬼�������������ر����>\n \n    ȥ��Щ���̾�ůů���ӡ�"					--�������npc˵���Ļ�
x208004_g_ContinueInfo="    �����ٲ�̨��������"
x208004_g_ContinueInfo2="    лл����Ҵ��Ÿ���Ϣ�����ô󺹷�����Ҳ����ô����"
--������
x208004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208004_g_RadioItemBonus={}

--MisDescEnd
x208004_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x208004_g_MissionId)
	if x208004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208004_g_MissionId) > 0 then
		if x208004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x208004_g_MissionName)
		     	AddText(sceneId,x208004_g_MissionComplete)
		     	AddMoneyBonus(sceneId, x208004_g_MoneyBonus)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x208004_g_ScriptId, x208004_g_MissionId)
                end
                if x208004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	if (GetName(sceneId,targetId)==x208004_g_Name) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x208004_g_MissionName)
				AddText(sceneId,x208004_g_ContinueInfo)
				AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x208004_g_MissionTarget) 
				AddText(sceneId,format("\n    ���ٲ�̨������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
			if (GetName(sceneId,targetId)==x208004_g_Name2) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x208004_g_MissionName)
				AddText(sceneId,x208004_g_ContinueInfo2)
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				BeginEvent(sceneId)
				AddText(sceneId,format("���ٲ�̨������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
		     		DispatchMissionTips(sceneId, selfId)
			end
                		
                end

        elseif x208004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208004_g_MissionName)
                AddText(sceneId,"    "..GetName(sceneId, selfId)..x208004_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208004_g_ScriptId, x208004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208004_g_ScriptId, x208004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208004_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==8) then
        misIndex = GetMissionIndexByID(sceneId,selfId,x208004_g_MissionId)
        	if (GetName(sceneId,targetId)==x208004_g_Name) then
        	            	return 1
        	end
		if (GetName(sceneId,targetId)==x208004_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x208004_g_MissionId) > 0 then
			    	if GetMissionParam(sceneId,selfId,misIndex,0) == 0 then
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

function x208004_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x208004_g_MissionId, x208004_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x208004_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x208004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208004_g_MissionId)
	for i, item in x208004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208004_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x208004_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208004_g_MissionId)
		AddExp(sceneId, selfId, x208004_g_ExpBonus)
		AddMoney(sceneId, selfId, x208004_g_MoneyBonus)
		for i, item in x208004_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		CallScriptFunction( x208004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208004_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x208004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208004_OnItemChanged(sceneId, selfId, itemdataId)

end

