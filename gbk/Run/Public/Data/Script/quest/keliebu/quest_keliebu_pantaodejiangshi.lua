--���ӵĽ�ʿ

--MisDescBegin
x202010_g_ScriptId = 202010
--x202010_g_MissionIdPre =41
x202010_g_MissionId = 129
x202010_g_MissionKind = 4
x202010_g_MissionLevel = 20
--x202010_g_ScriptIdNext = {ScriptId = 202001 ,LV = 1 }
x202010_g_Name	="ľ����" 
x202010_g_DemandItem ={}
x202010_g_DemandKill ={{id=374,num=1},{id=375,num=1},{id=376,num=1}}

x202010_g_MissionName="���ӵĽ�ʿ"
x202010_g_MissionInfo="    ����̳�ͺ����������̨���˴������ǵ�ţ���������ǵ���ƥ������ҹ�뿪�����ǵ���Ӫ��ȥͶ��������\n \n    ����̫�����ˣ����ߵ�ʱ�򣬻������˸�������ĲƲ���    "  --��������
x202010_g_MissionInfo2="��������ȥ��ѵ�������ˣ������ǳԳԿ࣬������������̫�أ��Ͼ��а���̳����ľ������塣\n \n    ���������˸ո��뿪Ӫ�أ�������Ӫ�����ĸ��´���������ٶȿ죬���ܸϵ������ǡ�"
x202010_g_MissionTarget="    #Gľ����#W����ϵ�Ӫ�ظ����ĸ��£����#R����̳#W��#R�����#W��#R����̨#W��   "		                                                                                               
x202010_g_MissionComplete="    ��úã�������֪������ʹ����ľ������壬��ľ��Ҳ����ƫ˽�ģ�"					--�������npc˵���Ļ�
x202010_g_ContinueInfo="    ����ٶ�һ��Ҫ�죬����Ļ����Ǿ���Զ�ˡ�"
--������
x202010_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x202010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x202010_g_RadioItemBonus={}

--MisDescEnd
x202010_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x202010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x202010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x202010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x202010_g_MissionId)
		if x202010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x202010_g_MissionName)
			AddText(sceneId,x202010_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x202010_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������̳   %d/1\n    ɱ�������   %d/1\n    ɱ������̨   %d/1", GetMissionParam(sceneId,selfId,misIndex,0), GetMissionParam(sceneId,selfId,misIndex,1), GetMissionParam(sceneId,selfId,misIndex,2) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x202010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x202010_g_MissionName)
		     AddText(sceneId,x202010_g_MissionComplete)
		     AddMoneyBonus(sceneId, x202010_g_MoneyBonus)
                     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x202010_g_ScriptId, x202010_g_MissionId)
                end

        elseif x202010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x202010_g_MissionName)
                AddText(sceneId,x202010_g_MissionInfo..GetName(sceneId, selfId)..x202010_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x202010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x202010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x202010_g_ScriptId, x202010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x202010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x202010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x202010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x202010_g_ScriptId, x202010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x202010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x202010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x202010_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==2) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x202010_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x202010_g_MissionId, x202010_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x202010_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x202010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x202010_g_MissionId)
	for i, item in pairs(x202010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x202010_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x202010_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x202010_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == x202010_g_DemandKill[2].num then
			if GetMissionParam(sceneId,selfId,misIndex,2) == x202010_g_DemandKill[3].num then
	        		return 1
			end
		end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x202010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x202010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x202010_g_MissionId)
		AddExp(sceneId, selfId, x202010_g_ExpBonus)
		AddMoney(sceneId, selfId, x202010_g_MoneyBonus)
		for i, item in pairs(x202010_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x202010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x202010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x202010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x202010_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x202010_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 num2 = GetMissionParam(sceneId,selfId,misIndex,1)
	 num3 = GetMissionParam(sceneId,selfId,misIndex,2)
	 	 if objdataId == x202010_g_DemandKill[1].id then 
       		    if num < x202010_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������̳   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 if objdataId == x202010_g_DemandKill[2].id then 
       		    if num2 < x202010_g_DemandKill[2].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,1,num2+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�������   %d/1", GetMissionParam(sceneId,selfId,misIndex,1) )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 if objdataId == x202010_g_DemandKill[3].id then 
       		    if num3 < x202010_g_DemandKill[3].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,2,num3+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ������̨   %d/1", GetMissionParam(sceneId,selfId,misIndex,2) )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x202010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x202010_OnItemChanged(sceneId, selfId, itemdataId)

end

