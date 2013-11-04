--�Ѿ����ټ�

--MisDescBegin
x206002_g_ScriptId = 206002
x206002_g_MissionIdPre =28
x206002_g_MissionId = 29
x206002_g_MissionKind = 8
x206002_g_MissionLevel = 40
x206002_g_ScriptIdNext = {ScriptId = 206003 ,LV = 1 }
x206002_g_Name	="ľ����" 
x206002_g_DemandItem ={}
x206002_g_DemandKill ={}	

x206002_g_MissionName="�Ѿ����ټ�"
x206002_g_MissionInfo="    �������С�ӣ���������������ҵĶ�����³��ʮ���꣬���ʹ����Ҷ���ȥС�ǹ���Ů�ˣ������ڻ�û�л�����ƫƫ�����ʱ�򣬴�Ҫ�ٿ�����̨��ᣬ���ȱϯ������Ǵ��"
x206002_g_MissionInfo2="���㲻�����ȥС�ǹ����������׳���ʲô�£�"  --��������
x206002_g_MissionTarget="    #Gľ����#W����ȥС�ǹ��鿴�Ѿ����ټ���"		                                                                                               
x206002_g_MissionComplete="    �����棿��ȷ������������ǻ����˵�ģ��ǿɵ�����֣����˱������ˣ����Ѹ�ͷ�������磡 \n \n    �Ҷ�����³�������ϣ��������������ʲô��"					--�������npc˵���Ļ�
x206002_g_ContinueInfo="    �������С�ӣ��������ֻ��Ů�ˣ�"
--������
x206002_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x206002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206002_g_RadioItemBonus={}

--MisDescEnd
x206002_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x206002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206002_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x206002_g_MissionId)
		if x206002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x206002_g_MissionName)
			AddText(sceneId,x206002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x206002_g_MissionTarget) 
			AddText(sceneId,format("\n    ̽��С�ǹ�   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x206002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x206002_g_MissionName)
		     AddText(sceneId,x206002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x206002_g_MoneyBonus)
                     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x206002_g_ScriptId, x206002_g_MissionId)
                end

        elseif x206002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206002_g_MissionName)
                AddText(sceneId,x206002_g_MissionInfo..LuaFnGetName(sceneId, selfId)..x206002_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206002_g_ScriptId, x206002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x206002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206002_g_ScriptId, x206002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x206002_CheckAccept(sceneId, selfId, targetId)

	if IsHaveMission(sceneId,selfId, x206002_g_MissionId)<= 0 then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206002_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==6) then
		if IsMissionHaveDone(sceneId, selfId, x206002_g_MissionIdPre) > 0 then
                    return 1
        	end
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x206002_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x206002_g_MissionId, x206002_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x206002_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		misIndex = GetMissionIndexByID(sceneId,selfId,x206002_g_MissionId)
		                                              
	     
end



--**********************************

--����

--**********************************

function x206002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206002_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206002_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x206002_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206002_g_MissionId)
		AddExp(sceneId, selfId, x206002_g_ExpBonus)
		AddMoney(sceneId, selfId, x206002_g_MoneyBonus)
		for i, item in x206002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x206002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x206002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x206002_OnKillObject(sceneId, selfId, objdataId)
	
end



--**********************************

--���������¼�

--**********************************

function x206002_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x206002_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 0 then
		if IsHaveMission(sceneId,selfId, x206002_g_MissionId)> 0 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			BeginEvent(sceneId)
			AddText(sceneId,"    ̽��С�ǹ�   1/1") 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			BeginEvent(sceneId)
			AddText(sceneId,"    ԶԶ��ȥ���кܶ��Ѿ���С�ǹ����ᡣ����Ⱥ�з�������³���ټ���������������һ��") 
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end
	end


end

function x206002_OnTimer(sceneId, selfId )

end
function x206002_OnLeaveArea(sceneId, selfId )

end


--**********************************

--���߸ı�

--**********************************

function x206002_OnItemChanged(sceneId, selfId, itemdataId)

end

