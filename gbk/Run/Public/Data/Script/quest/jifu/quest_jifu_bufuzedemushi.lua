--���������ʦ

--MisDescBegin
x225011_g_ScriptId = 225011
--x225011_g_MissionIdPre =41
x225011_g_MissionId = 333
x225011_g_MissionKind = 22
x225011_g_MissionLevel = 110
--x225011_g_ScriptIdNext = {ScriptId = 225001 ,LV = 1 }
x225011_g_Name	="�ζ�" 
x225011_g_DemandItem ={}
x225011_g_DemandKill ={{id=436,num=20}}

x225011_g_MissionName="���������ʦ"
x225011_g_MissionInfo="    ��֪��Ϊʲô��һ����ʦ�뿪�˽��õ��˹��廨԰���棬����̫���������ˡ�\n \n    �������һֱ����ڽ����У������һ�Ź����ǣ���Ȼ������ʺ�С����������������ȫû�л����ˡ���ȥ���廨԰�������Ƕ�ɱ�ˡ�"  --��������
x225011_g_MissionTarget="    #G�ζ�#WҪ��ɱ20��#G���廨԰#W�е�#R������ʦ#W��"		                                                                                               
x225011_g_MissionComplete="    ��ʦ��Ӧ�ô��ڽ��û�����У���Ȼ�����뿪�˽��ã���ô��������ȥ����ɡ�"					--�������npc˵���Ļ�
x225011_g_ContinueInfo="    �ҵ�������ʦ����"
--������
x225011_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x225011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x225011_g_RadioItemBonus={}

--MisDescEnd
x225011_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x225011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x225011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x225011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x225011_g_MissionId)
		if x225011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x225011_g_MissionName)
			AddText(sceneId,x225011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x225011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ʦ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x225011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x225011_g_MissionName)
		     AddText(sceneId,x225011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x225011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x225011_g_ScriptId, x225011_g_MissionId)
                end

        elseif x225011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x225011_g_MissionName)
                AddText(sceneId,x225011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x225011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x225011_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x225011_g_ScriptId, x225011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x225011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x225011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x225011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x225011_g_ScriptId, x225011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x225011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x225011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x225011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==16) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x225011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x225011_g_MissionId, x225011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x225011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x225011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x225011_g_MissionId)
	for i, item in pairs(x225011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x225011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x225011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x225011_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x225011_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x225011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x225011_g_MissionId)
		AddExp(sceneId, selfId, x225011_g_ExpBonus)
		AddMoney(sceneId, selfId, x225011_g_MoneyBonus)
		for i, item in pairs(x225011_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x225011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x225011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x225011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x225011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x225011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x225011_g_DemandKill[1].id then 
       		    if num < x225011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ʦ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x225011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x225011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x225011_OnItemChanged(sceneId, selfId, itemdataId)

end

