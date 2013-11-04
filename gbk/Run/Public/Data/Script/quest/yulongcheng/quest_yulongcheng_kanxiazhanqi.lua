--����ս��

--MisDescBegin
x208001_g_ScriptId = 208001
--x208001_g_MissionIdPre =41
x208001_g_MissionId = 55
x208001_g_MissionKind = 12
x208001_g_MissionLevel = 60
--x208001_g_ScriptIdNext = {ScriptId = 205003 ,LV = 1 }
x208001_g_Name	="�ɼ�˼��" 
x208001_g_Name2	="������ģս��" 
x208001_g_DemandItem ={{id=13010011,num=1}}
--x208001_g_DemandKill ={{id=309,num=20}}

x208001_g_MissionName="����ս��"
x208001_g_MissionInfo="    ������ģ�������Ҵ��ɹŹ���ɱ����ȥ�����ţ����Ҳ�����������ϣ��Ҿ������پ���Ϊ��������ģ���к�������450���������㱨�����������ұ���������һ��֮�������½����������������һս��\n \n    ���ԭ�Ķ����ǣ��ս������е������������ǵĹ�����ι�����ǵ�ս��������ģ����ս�������ǵ�ս����ҿ�������"  --��������
x208001_g_MissionTarget="    �Ѷ���#c0080C0������ģ����ս��#W��196��221�������������û�ȥ��#G�ɼ�˼��#W��"		                                                                                               
x208001_g_MissionComplete="    ���죬���ǿ����Դ��ħڭħ�����ݵĻ�����ģ��ʿһ��������һ�졣"					--�������npc˵���Ļ�
x208001_g_ContinueInfo="    �������ǵ�ս�죬ĥ�����ǵĽ��ݺͿ�����"
--������
x208001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208001_g_RadioItemBonus={}

--MisDescEnd
x208001_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208001_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x208001_g_Name) then 
			if x208001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x208001_g_MissionName)
				AddText(sceneId,x208001_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x208001_g_MissionTarget) 
				AddText(sceneId,format("\n    ������ģ��ս��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x208001_g_DemandItem[1].id),x208001_g_DemandItem[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
	
			     
	                if x208001_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x208001_g_MissionName)
			     AddText(sceneId,x208001_g_MissionComplete)
			     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     	     --for i, item in x208001_g_DemandItem do  
		     	     --AddItemBonus(sceneId, item.id, item.num)
		     	     --end
		     	     AddMoneyBonus(sceneId, x208001_g_MoneyBonus)
		     	     EndEvent()
	                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x208001_g_ScriptId, x208001_g_MissionId)
	                end
	        end
	        

        elseif x208001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208001_g_MissionName)
                AddText(sceneId,x208001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208001_g_ScriptId, x208001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208001_g_ScriptId, x208001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208001_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==8) then
		    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208001_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x208001_g_MissionId, x208001_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x208001_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x208001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208001_g_MissionId)
	for i, item in x208001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208001_CheckSubmit( sceneId, selfId, targetId)
	if LuaFnGetItemCount(sceneId,selfId,x208001_g_DemandItem[1].id) == x208001_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208001_g_MissionId)
		AddExp(sceneId, selfId, x208001_g_ExpBonus)
		AddMoney(sceneId, selfId, x208001_g_MoneyBonus)
		for i, item in x208001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x208001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x208001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208001_OnKillObject(sceneId, selfId, objdataId)
	

end



--**********************************

--���������¼�

--**********************************

function x208001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208001_OnItemChanged(sceneId, selfId, itemdataId)

end

