--�������

--MisDescBegin
x202005_g_ScriptId = 202005
x202005_g_MissionIdPre =123
x202005_g_MissionId = 124
x202005_g_MissionKind = 4
x202005_g_MissionLevel = 20
x202005_g_ScriptIdNext = {ScriptId = 202006 ,LV = 1 }
x202005_g_Name	="����"
x202005_g_DemandItem ={}
x202005_g_DemandKill ={{id=371,num=10}}

x202005_g_MissionName="�������"
x202005_g_MissionInfo="    ��Ϊ��ԭ����ʿ��������ӻ���սʿ�����Ǵ��������Ĺ�����ɣ���Ŀ��������������飬һ���Ḷ�����ۣ�\n \n    ���ǵ�սʿ��������η�������˶࣬������Ӣ�������Ե�����ս��ģ���ɱ�ɣ��ñ���ĵ��濳�����ǵĹ�ͷ���ù����䴩���ǵ����࣬�����ǵĻ�ǹ�����ǵ�ͷ­��\n \n    "  --��������
x202005_g_MissionInfo2="���������Ѿ��͸��㽡׳������ͽý������֣��������ǻۺ͵��������ڣ�����һ��ɱ������ȥ���ѿ��Ҳ���Щ#Rа�����ʦ#W��ɱ����Ϊ�����·��"
x202005_g_MissionTarget="    �������ŭ�𣬵�����ȥɱ��10��#Rа�����ʦ#W��Ȼ����#G����#W������"		                                                                                               
x202005_g_MissionComplete="    �������ڰ����ˡ�"					--�������npc˵���Ļ�
x202005_g_ContinueInfo="    �뵽����ȥ��������Ҫ�㡣"
--������
x202005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202005_g_RadioItemBonus={}

--MisDescEnd
x202005_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202005_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x202005_g_MissionId)
		if x202005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202005_g_MissionName)
			AddText(sceneId,x202005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202005_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��а�����ʦ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202005_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x202005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202005_g_MissionName)
		     AddText(sceneId,x202005_g_MissionComplete)
		     AddMoneyBonus(sceneId, x202005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202005_g_ScriptId, x202005_g_MissionId)
                end

        elseif x202005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202005_g_MissionName)
                AddText(sceneId,x202005_g_MissionInfo..GetName(sceneId, selfId)..x202005_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202005_g_ScriptId, x202005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202005_g_ScriptId, x202005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202005_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==2) then
		if IsMissionHaveDone(sceneId, selfId, x202005_g_MissionIdPre) > 0 then
					return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202005_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x202005_g_MissionId, x202005_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x202005_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x202005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202005_g_MissionId)
	for i, item in pairs(x202005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202005_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202005_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x202005_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202005_g_MissionId)
		AddExp(sceneId, selfId, x202005_g_ExpBonus)
		AddMoney(sceneId, selfId, x202005_g_MoneyBonus)
		for i, item in pairs(x202005_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x202005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x202005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202005_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x202005_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x202005_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x202005_g_DemandKill[1].id then 
       		    if num < x202005_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��а�����ʦ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x202005_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x202005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202005_OnItemChanged(sceneId, selfId, itemdataId)

end

