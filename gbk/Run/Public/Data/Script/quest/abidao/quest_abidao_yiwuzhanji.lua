--����ս��

--MisDescBegin
x203006_g_ScriptId = 203006
--x203006_g_MissionIdPre =40
x203006_g_MissionId = 74
x203006_g_MissionKind = 13
x203006_g_MissionLevel = 50
--x203006_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x203006_g_Name	="����" 
x203006_g_Name2	="��ͩ��" 
x203006_g_DemandItem ={{id=13010020,num=5}}
x203006_g_noDemandKill ={}	

x203006_g_MissionName="����ս��"
x203006_g_MissionInfo="    �Ҽ����Ĵ��ոո��Ұ�ǰ�ߵ�ս���Թ����ˣ��Ǳ߷�����һЩ�£����Ҹе���ϧ��\n \n    ����˵���������ӺͲ��̨�����ڹ��ǵ�ʱ������ì�ܣ��������������ͳһ��Ӱ���˽�ʿ�ǵĶ�־�����������ڳɼ�˼���Ѿ�������������̨ȥǰ����������˧��\n \n     ����̨׼���û�����ǿ��������������ʣ�²����ˡ�����������һƬ��ͩ���������ѿ��������ͣ�"
x203006_g_MissionInfo2="�������Ū����ͩ����������ҪС�ĸ����ĵ��ˡ�"  --��������
x203006_g_MissionTarget="    �ռ�5��#c0080C0��ͩ��#W����������#G����#W��"		
x203006_g_MissionComplete="    ̽����������һ��ʿ����������ͩ�����������浣������£�����������������ڷ����ˡ�"					--�������npc˵���Ļ�
x203006_g_ContinueInfo="    �����ڼ���ʱ��ܽ������Ǽ�����ͩ�ѡ�"
--������
x203006_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203006_g_RadioItemBonus={}

--MisDescEnd
x203006_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203006_g_MissionId) > 0 then
			if x203006_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x203006_g_MissionName)
				AddText(sceneId,x203006_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x203006_g_MissionTarget) 
				AddText(sceneId,format("\n    һ����ͩ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x203006_g_DemandItem[1].id),x203006_g_DemandItem[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
	
			     
	                if x203006_CheckSubmit(sceneId, selfId, targetId) > 0 then
	                     BeginEvent(sceneId)
	                     AddText(sceneId,"#Y"..x203006_g_MissionName)
			     AddText(sceneId,x203006_g_MissionComplete)
			     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     	     --for i, item in pairs(x203006_g_DemandItem) do  
		     	     --AddItemBonus(sceneId, item.id, item.num)
		     	     --end
		     	     AddMoneyBonus(sceneId, x203006_g_MoneyBonus)
		     	     EndEvent()
		     	     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203006_g_ScriptId, x203006_g_MissionId)
	                end
	        
	elseif x203006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203006_g_MissionName)
                AddText(sceneId,x203006_g_MissionInfo..GetName(sceneId, selfId)..x203006_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203006_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203006_g_ScriptId, x203006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203006_g_ScriptId, x203006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203006_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==3) then
        	            	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203006_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x203006_g_MissionId, x203006_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x203006_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x203006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203006_g_MissionId)
	for i, item in pairs(x203006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203006_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x203006_g_DemandItem[1].id) == x203006_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203006_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203006_g_MissionId)
		AddExp(sceneId, selfId, x203006_g_ExpBonus)
		AddMoney(sceneId, selfId, x203006_g_MoneyBonus)
		for i, item in pairs(x203006_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x203006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x203006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203006_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x203006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203006_OnItemChanged(sceneId, selfId, itemdataId)

end

