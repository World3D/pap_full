--նɱ�߹����ֵĽ���

--MisDescBegin
x206000_g_ScriptId = 206000
--x206000_g_MissionIdPre =
x206000_g_MissionId = 27
x206000_g_MissionKind = 8
x206000_g_MissionLevel = 40
x206000_g_ScriptIdNext = {ScriptId = 206001 ,LV = 1 }
x206000_g_Name	="�ٲ�̨" 
x206000_g_DemandItem ={}
x206000_g_DemandKill ={{id=405,num=10},{id=406,num=10}}

x206000_g_MissionName="նɱ�߹����ֵĽ���"
x206000_g_MissionInfo="    ��Ҷ����ţ���Ҷ����ţ���Ӣ�۵Ķ��������ǵĴ���䣬�����ڸ���ĺ������������ǵ������Ѿ������Ұ���룬��罫���������ɹ��˼���������ŭ��������������˽���ų������µ�һ���ϵľ�ӹ�ء�\n \n    ��������ľ¿�ϵ����氳�ͺ����������Ƿ������������ɹ��˵ĺ�����Ϊ��ϴ�����Ǽ�����������������֮��Ϊ���������Ŀ���������������Щ��ʿ�ǣ������ǵ��䵶�͹������������ɣ�\n \n    ���ǳ������ָߵ����ˣ������ǰ��ջ���ʿ����ȫ��������ڣ�ȥ�����մ󺹵�ּ�⣬��ս��Ӫ��ȥ����֤�����ǵ������ɣ�"  --��������
x206000_g_MissionTarget="    ��#G�ٲ�̨#Wɱ��10��#RͶ���Ľ��#W��10��#R�������#W"		                                                                                               
x206000_g_MissionComplete="    �������ʿ������һ�����ŵ���ʿ��ֻ����ս��������һ�ε��˲�֪�����Ե����������Ƕ��Լ���ͬ���ײС� ��ϲ�㣬��Ϊ���������ĵ�һ���²��£���������ϣ��ҿ�������ĻԻͣ��㽫�����Ҽ����������͵�Ӣ�ۡ�"					--�������npc˵���Ļ�
x206000_g_ContinueInfo="    ���Ǽ�����Ķ�Թ��ŭ������Ҫս��������й�ģ�"
--������
x206000_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x206000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206000_g_RadioItemBonus={}

--MisDescEnd
x206000_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x206000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206000_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x206000_g_MissionId)
		if x206000_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x206000_g_MissionName)
			AddText(sceneId,x206000_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x206000_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��Ͷ���Ľ��   %d/%d\n    ɱ���������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x206000_g_DemandKill[1].num,GetMissionParam(sceneId,selfId,misIndex,1),x206000_g_DemandKill[2].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x206000_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x206000_g_MissionName)
		     AddText(sceneId,x206000_g_MissionComplete)
		     AddMoneyBonus(sceneId, x206000_g_MoneyBonus)
                     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x206000_g_ScriptId, x206000_g_MissionId)
                end

        elseif x206000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206000_g_MissionName)
                AddText(sceneId,x206000_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206000_g_ScriptId, x206000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206000_g_MissionId) > 0 then
		return 0
	end
	--����ѽӴ�����
	if  x206000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206000_g_ScriptId, x206000_g_MissionName)
	end
	return 0
	
end



--**********************************

--����������

--**********************************

function x206000_CheckAccept(sceneId, selfId, targetId)
	if (GetName(sceneId,targetId)==x206000_g_Name) then
		return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206000_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==6) then
                return 1
        end
	return 0	
end

--**********************************

--����

--**********************************

function x206000_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x206000_g_MissionId, x206000_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x206000_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x206000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206000_g_MissionId)
	for i, item in x206000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206000_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x206000_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x206000_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == x206000_g_DemandKill[2].num then
	        	return 1
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206000_g_MissionId)
		AddExp(sceneId, selfId, x206000_g_ExpBonus)
		AddMoney(sceneId, selfId, x206000_g_MoneyBonus)
		for i, item in x206000_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x206000_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x206000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x206000_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x206000_g_MissionId) >= 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x206000_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0)
	 num2 = GetMissionParam(sceneId,selfId,misIndex,1)  
		 if objdataId == x206000_g_DemandKill[1].id then 
       		    if num < x206000_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��Ͷ���Ľ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x206000_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 if objdataId == x206000_g_DemandKill[2].id then 
       		    if num2 < x206000_g_DemandKill[2].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num2+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,1),x206000_g_DemandKill[2].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x206000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206000_OnItemChanged(sceneId, selfId, itemdataId)

end

