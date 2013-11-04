--��վͨ��

--MisDescBegin
x207002_g_ScriptId = 207002
x207002_g_MissionIdPre =263
x207002_g_MissionId = 264
x207002_g_MissionKind = 18
x207002_g_MissionLevel = 75
x207002_g_ScriptIdNext = {ScriptId = 207003 ,LV = 1 }
x207002_g_Name	="���"
x207002_g_DemandItem ={}
x207002_g_DemandKill ={{id=408,num=15}}

x207002_g_MissionName="�������"
x207002_g_MissionInfo="    ��Ϊ��Ч�����Һ����ң����Ѿ������˳�ʹ�ι���׼����\n \n    ���ǡ������Һܵ��ģ�����������ڼ飬��ʹ�ι������鱻й¶�ˣ�\n \n    "  --��������
x207002_g_MissionInfo2="��һ��#RŮ�湭��#W��ס�˴���վͨ���ι��ıؾ�֮·����ϣ�����ܰ���ɨ��ȥ���ι��ĵ�·��"
x207002_g_MissionTarget="    Ǳ���붫���С·��ȥ���ι��ıؾ�֮·��#G���#W������ȥ��������ǵ�15��#RŮ�湭��#W��"		                                                                                               
x207002_g_MissionComplete="    ��������ǣ��ҾͰ�ȫ�ˡ�"					--�������npc˵���Ļ�
x207002_g_ContinueInfo="    ���ܵ����ҳ�ʹ��ʱ�䣬���㾡�����վͨ����Ů�湭�ָ�����ˡ�"
--������
x207002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207002_g_RadioItemBonus={}

--MisDescEnd
x207002_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207002_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207002_g_MissionId)
		if x207002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207002_g_MissionName)
			AddText(sceneId,x207002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207002_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��Ů�湭��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207002_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207002_g_MissionName)
		     AddText(sceneId,x207002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x207002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207002_g_ScriptId, x207002_g_MissionId)
                end

        elseif x207002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207002_g_MissionName)
                AddText(sceneId,x207002_g_MissionInfo..GetName(sceneId, selfId)..x207002_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207002_g_ScriptId, x207002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207002_g_ScriptId, x207002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207002_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==7) then
		if IsMissionHaveDone(sceneId, selfId, x207002_g_MissionIdPre) > 0 then
					return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207002_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207002_g_MissionId, x207002_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207002_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x207002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207002_g_MissionId)
	for i, item in x207002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207002_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207002_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x207002_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207002_g_MissionId)
		AddExp(sceneId, selfId, x207002_g_ExpBonus)
		AddMoney(sceneId, selfId, x207002_g_MoneyBonus)
		for i, item in x207002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207002_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x207002_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x207002_g_DemandKill[1].id then 
       		    if num < x207002_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��Ů�湭��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x207002_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x207002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207002_OnItemChanged(sceneId, selfId, itemdataId)

end

