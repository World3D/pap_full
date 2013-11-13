--��ɱ

--MisDescBegin
x225008_g_ScriptId = 225008
--x225008_g_MissionIdPre =41
x225008_g_MissionId = 330
x225008_g_MissionKind = 22
x225008_g_MissionLevel = 110
x225008_g_ScriptIdNext = {ScriptId = 225009 ,LV = 1 }
x225008_g_Name	="����" 
x225008_g_DemandItem ={}
x225008_g_DemandKill ={{id=434,num=25}}

x225008_g_MissionName="��ɱ"
x225008_g_MissionInfo="    �ζ����Ұ�֣����������ǳɼ�˼�������ƾʲô������˧�������ֵ�������Ȼ�������������ص�����񽻸������������ɸ磬���ҵ�ֻ��ϴ��ƶ��ߡ�\n \n    ���¶������Լ������ˣ�ϴ��#Gƶ���#W�ܵõ�ʲô�أ���ȥ����ɱ��25��#R������ƶ��#W�ɣ��������������ˡ�"  --��������
x225008_g_MissionTarget="    #G����#W����ȥ#Gƶ���#Wɱ��25��#R������ƶ��#W��"		                                                                                               
x225008_g_MissionComplete="    ���ˣ���֪���ˡ�"					--�������npc˵���Ļ�
x225008_g_ContinueInfo="    ��Щƶ��û�б�ɱ�ɾ���"
--������
x225008_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x225008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x225008_g_RadioItemBonus={}

--MisDescEnd
x225008_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x225008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x225008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x225008_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x225008_g_MissionId)
		if x225008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x225008_g_MissionName)
			AddText(sceneId,x225008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x225008_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ƶ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225008_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x225008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x225008_g_MissionName)
		     AddText(sceneId,x225008_g_MissionComplete)
		     AddMoneyBonus(sceneId, x225008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x225008_g_ScriptId, x225008_g_MissionId)
                end

        elseif x225008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x225008_g_MissionName)
                AddText(sceneId,x225008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x225008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x225008_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x225008_g_ScriptId, x225008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x225008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x225008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x225008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x225008_g_ScriptId, x225008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x225008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x225008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x225008_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==16) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x225008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x225008_g_MissionId, x225008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x225008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x225008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x225008_g_MissionId)
	for i, item in pairs(x225008_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x225008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x225008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x225008_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x225008_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x225008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x225008_g_MissionId)
		AddExp(sceneId, selfId, x225008_g_ExpBonus)
		AddMoney(sceneId, selfId, x225008_g_MoneyBonus)
		for i, item in pairs(x225008_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x225008_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x225008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x225008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x225008_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x225008_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x225008_g_DemandKill[1].id then 
       		    if num < x225008_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ƶ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225008_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x225008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x225008_OnItemChanged(sceneId, selfId, itemdataId)

end

