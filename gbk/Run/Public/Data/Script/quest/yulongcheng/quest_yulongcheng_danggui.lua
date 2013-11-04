--����

--MisDescBegin
x208011_g_ScriptId = 208011
--x208011_g_MissionIdPre =40
x208011_g_MissionId = 65
x208011_g_MissionKind = 12
x208011_g_MissionLevel = 60
--x208011_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x208011_g_Name	="��������" 
x208011_g_DemandItem ={{id=13010013,num=10}}
x208011_g_noDemandKill ={}	

x208011_g_MissionName="����"
x208011_g_MissionInfo="    ��Ϊ��ս�£��Ѿ��˾������⼸������������Щ�������������صİ���˵���⸽����#c0080C0����#W����ȥ���Ҳ�ʮ������"  --��������
x208011_g_MissionTarget="    ��ʮ��#c0080C0����#W���û�����#G��������#W��"		
x208011_g_MissionComplete="    �ɼ����鼫Ϊ���ף�ֻ��СŮ��Ҫ�չ˴󺹣���Щ�¾Ϳ�����"					--�������npc˵���Ļ�
x208011_g_ContinueInfo="    �ܺã��ܼ�ʱ�����˵��飬�Ϳ����������������ˣ���������Ѫ������������á�"
--������
x208011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208011_g_RadioItemBonus={}

--MisDescEnd
x208011_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208011_g_MissionId) > 0 then
			if x208011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x208011_g_MissionName)
				AddText(sceneId,x208011_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x208011_g_MissionTarget) 
				AddText(sceneId,format("\n    ����   %d/%d", LuaFnGetItemCount(sceneId,selfId,x208011_g_DemandItem[1].id),x208011_g_DemandItem[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
	
			     
	                if x208011_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x208011_g_MissionName)
			     AddText(sceneId,x208011_g_MissionComplete)
			     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     	     --for i, item in x208011_g_DemandItem do  
		     	     --AddItemBonus(sceneId, item.id, item.num)
		     	     --end
		     	     AddMoneyBonus(sceneId, x208011_g_MoneyBonus)
		     	     EndEvent()
	                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x208011_g_ScriptId, x208011_g_MissionId)
	                end
	     

        elseif x208011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208011_g_MissionName)
                AddText(sceneId,x208011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208011_g_ScriptId, x208011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208011_g_ScriptId, x208011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208011_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==8) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208011_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x208011_g_MissionId, x208011_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x208011_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x208011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208011_g_MissionId)
	for i, item in x208011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208011_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x208011_g_DemandItem[1].id) == x208011_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208011_g_MissionId)
		AddExp(sceneId, selfId, x208011_g_ExpBonus)
		AddMoney(sceneId, selfId, x208011_g_MoneyBonus)
		for i, item in x208011_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x208011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x208011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208011_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x208011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208011_OnItemChanged(sceneId, selfId, itemdataId)

end

