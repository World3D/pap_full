--ֹʹ���

--MisDescBegin
x207005_g_ScriptId = 207005
--x207005_g_MissionIdPre =40
x207005_g_MissionId = 267
x207005_g_MissionKind = 18
x207005_g_MissionLevel = 75
x207005_g_ScriptIdNext = {ScriptId = 207006 ,LV = 1 }
x207005_g_Name	="��³" 
x207005_g_DemandItem ={{id=13010051,num=10}}
x207005_g_noDemandKill ={}	

x207005_g_MissionName="ֹʹ���"
x207005_g_MissionInfo="    ���״��˵�Ψһ��Ը������Ҫ�����˽����\n \n    ��һ����������ʧ������ʹ�ٴ��������£���Ҳ���᳷����\n \n    �ҷǳ���ҪһЩֹʹ�Ĳ�ҩ�����������ҵ������һ�㣡������̨����#c0080C0���#W����ֹʹ������ȥ��ʮ��ɡ�"  --��������
x207005_g_MissionTarget="    #G��³#WҪ��Ϊ��ȥ����̨���ɼ�ʮ��#c0080C0���#W��"		
x207005_g_MissionComplete="    лл��Ϊ�ҽ����ʹ����"					--�������npc˵���Ļ�
x207005_g_ContinueInfo="    ��Ҫ������أ�"
--������
x207005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207005_g_RadioItemBonus={}

--MisDescEnd
x207005_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x207005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207005_g_MissionId) > 0 then
			if x207005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x207005_g_MissionName)
				AddText(sceneId,x207005_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x207005_g_MissionTarget) 
				AddText(sceneId,format("\n    ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x207005_g_DemandItem[1].id),x207005_g_DemandItem[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
	
			     
	                if x207005_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x207005_g_MissionName)
			     AddText(sceneId,x207005_g_MissionComplete)
			     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     	     --for i, item in x207005_g_DemandItem do  
		     	     --AddItemBonus(sceneId, item.id, item.num)
		     	     --end
		     	     AddMoneyBonus(sceneId, x207005_g_MoneyBonus)
		     	     EndEvent()
	                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207005_g_ScriptId, x207005_g_MissionId)
	                end
	     

        elseif x207005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207005_g_MissionName)
                AddText(sceneId,x207005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207005_g_ScriptId, x207005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207005_g_ScriptId, x207005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207005_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==7) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207005_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x207005_g_MissionId, x207005_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x207005_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x207005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207005_g_MissionId)
	for i, item in x207005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207005_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x207005_g_DemandItem[1].id) == x207005_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207005_g_MissionId)
		AddExp(sceneId, selfId, x207005_g_ExpBonus)
		AddMoney(sceneId, selfId, x207005_g_MoneyBonus)
		for i, item in x207005_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207005_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x207005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207005_OnItemChanged(sceneId, selfId, itemdataId)

end

