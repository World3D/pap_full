--��������

--MisDescBegin
x223002_g_ScriptId = 223002
--x223002_g_MissionIdPre =41
x223002_g_MissionId = 294
x223002_g_MissionKind = 20
x223002_g_MissionLevel = 100
x223002_g_ScriptIdNext = {ScriptId = 223003 ,LV = 1 }
x223002_g_Name	="�ɸ�" 
x223002_g_DemandItem ={}
x223002_g_DemandKill ={{id=440,num=20}}

x223002_g_MissionName="��������"
x223002_g_MissionInfo="    �����ˣ��ܸ��˼�������Ϊ��Ч�������Ϊ��ɱ���ȷ�Ķ�Ա֮һ��һ��Ҫ�����ҵļ���ȥ����\n \n    �����ס��������Ҫ�������ǣ������ǻ������ǣ���Ҫ������ԥ��ɱ����ĵ��ˣ�����ȴ���ܶ԰������֡�\n \n    ���ǵ�Ŀ�ģ�����Ҫ��ȡ���������ľ�����ͬʱ�����ǵĶ���������������ö������ںϣ������Ҵ��ɹŹ���\n \n    �κ����ڽ����ղ����ʱ�򣬶�������ٵ����ǵ��鼮�����������˽��������õ������ǻ۵����;����\n \n    �ܿ죬���Ǿ�����Ը�ˣ�"  --��������
x223002_g_MissionInfo2="�������������ղ������˳���ͳ˧�Ļ�������ȥ�������ǣ�Ϊ���ǵ�������ܶ���"
x223002_g_MissionTarget="    ��ɽ����ɱ��20��#R�ղ�б�#W��"		                                                                                               
x223002_g_MissionComplete="    ��ϲ�����������ǵͳ��İ��У�ϲ���ŵ����˵���Ѫζ���������к�ǿ�������С�"					--�������npc˵���Ļ�
x223002_g_ContinueInfo="    ����һ�����������˵�Ļ���ȥ������ʹ���ɣ�������Щ��������"
--������
x223002_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x223002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223002_g_RadioItemBonus={}

--MisDescEnd
x223002_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x223002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223002_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x223002_g_MissionId)
		if x223002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223002_g_MissionName)
			AddText(sceneId,x223002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223002_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���ղ�б�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223002_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x223002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223002_g_MissionName)
		     AddText(sceneId,x223002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223002_g_ScriptId, x223002_g_MissionId)
                end

        elseif x223002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223002_g_MissionName)
                AddText(sceneId,x223002_g_MissionInfo..GetName(sceneId, selfId)..x223002_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223002_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223002_g_ScriptId, x223002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223002_g_ScriptId, x223002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223002_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==17) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x223002_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x223002_g_MissionId, x223002_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x223002_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x223002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223002_g_MissionId)
	for i, item in pairs(x223002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223002_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223002_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x223002_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223002_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x223002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223002_g_MissionId)
		AddExp(sceneId, selfId, x223002_g_ExpBonus)
		AddMoney(sceneId, selfId, x223002_g_MoneyBonus)
		for i, item in pairs(x223002_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x223002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x223002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x223002_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x223002_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x223002_g_DemandKill[1].id then 
       		    if num < x223002_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ղ�б�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223002_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x223002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x223002_OnItemChanged(sceneId, selfId, itemdataId)

end

